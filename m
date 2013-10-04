Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2934760EA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 08:10:13 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so1213349wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 01:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bqrTRfY7MveULHZ1tbFiGL17vLn9USyW2sphQD2A+60=;
	b=TngyNlpVq1pBMgEXRfwxBOZVBL51BV6htlgZHH9GTXszr3WfTJ1O6N3xiJdTKdSDp4
	CGQf6M7be6oC4kdmhe0NRfvRLKitslszQ/WR6qQ1K4ZPvsaqerohsGFazD67crFnEMC2
	xHVsaEYgczAQXpu64T03V2ytaHxoPZIKTsuOTMFIHAe1wfQD5Tfa7o9q34qoiFyggagl
	gMeYi5ILX8uVWZ24tRAp6Vna36zuOvTvupmL5N1N2nkxUpHzIZL3xLjKERDrJ3Ur2vos
	T4aTM4PgcSTPe1RFVU9HE8k5dZUUU5/EtHe7LcAEM3nNz8v0/c3EAWILUJskzWMORs4z
	p2yA==
X-Gm-Message-State: ALoCoQkiGMBV5Gp++3N/0oyNULMsFLZNdVUdqHrizewpoQbw6XhcfYR7oWAXMo5JO0VCGWDV/qt7
X-Received: by 10.194.20.170 with SMTP id o10mr10975514wje.4.1380874214058;
	Fri, 04 Oct 2013 01:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.74.46 with HTTP; Fri, 4 Oct 2013 01:09:53 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Oct 2013 10:09:53 +0200
Message-ID: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <Martin.Jansa@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: ruby-native problem (on dylan)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2013 08:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi,

we got some build failures in our autobuilders last night, which
seemed to be related to ruby-native. We use dylan, but I believe the
same problem is there in master/dora too.

The exact build error was in qtwebkit do_compile:

ruby /mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_clo=
ud/machines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-gn=
ueabi/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScriptCo=
re/offlineasm/generate_offset_extractor.rb
/mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_cloud/ma=
chines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-gnueabi=
/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScriptCore/ll=
int/LowLevelInterpreter.asm
LLIntDesiredOffsets.h

<internal:gem_prelude>:1:in `require': cannot load such file --
rubygems.rb (LoadError)
from <internal:gem_prelude>:1:in `<compiled>'

Yesterday I had 'moved' our BUILDDIR location. However for every build, we:
 - delete the TMPDIR completely
 - reuse our sstate

The problem seems to be that 'ruby' has hard coded paths in the
binary. This is discussed in [1] or more at length in [2], and easy to
check:

$ strings tmp/sysroots/x86_64-linux/usr/bin/ruby | grep project
/work/project/build/tmp/sysroots/x86_64-linux/usr
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby/x86_64=
-linux
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby/x86_=
64-linux
/work/project/build/tmp/sysroots/x86_64-linux/usr/share/rubygems
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby
/work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/x86_64-linux

So, the 'ruby' binary which was in the sstate, knew about the *old*
paths. When building today, ruby was pulled from sstate, but TMPDIR
has changed now, and the hardcoded paths no longer exists, leading to
the build failure.

I verified that the following 'solved' the build issue:
$ bitbake -c cleansstate ruby-native
$ bitbake ruby-native
$ bitbake qtwebkit

There seems to be a configure option, --enable-load-relative, after
using this option in ruby build, still ruby fails to start for the
same reason. I might have done something wrong, but i wanted to bring
it on the list, to see if anyone has a better solution, as it seems
like a big issue.

thanks

nicolas


[1] http://stackoverflow.com/questions/10221387/moving-ruby-installation-ca=
uses-it-to-not-function-how-to-get-around-this
[2] http://yehudakatz.com/2012/06/

