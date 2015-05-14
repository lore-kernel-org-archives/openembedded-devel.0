Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f196.google.com (mail-pd0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A49B46013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 20:53:30 +0000 (UTC)
Received: by pdjp10 with SMTP id p10so13458142pdj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=ewKTSJV8JxYywQKtIV5jyGuGO+Vn0WcLTl6kIXAOXI8=;
	b=Y5ermHmpvI+9SbEK1Www2QVUybtQLEGIbP52dsGaKjSID4vrtJoQEuhkEfzWOuefIa
	Gc0/N2TXnrtsieL6dMNhAQpICHtxclVDbQSBuQhiMToYo8YZkXx+mozUigUgs6jU+mON
	EO78fMRtOVcN74Mu+zaXrr+1Duk2sVDGMygYQlkbuy1+vnxapK20XVEaw3qmYxyAaxWU
	4L4k2jWilvX4GjyD8XsL2eM2n+EmytuPMPgHUavZU19GAHDdy/bBEKAJgQR5JZcIQgUU
	/xkvj6oFhBful4Fu4hxAXEEQvjineuUAh09J4VCnU09S/esZifcx/SygGQ8nltyIsolv
	HtMQ==
X-Received: by 10.70.89.138 with SMTP id bo10mr11859838pdb.146.1431636811566; 
	Thu, 14 May 2015 13:53:31 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id t9sm97927pas.3.2015.05.14.13.53.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 May 2015 13:53:30 -0700 (PDT)
Message-ID: <55550B48.6050505@gmail.com>
Date: Thu, 14 May 2015 13:53:28 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: eduardo@monkey.io
References: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>
In-Reply-To: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-ruby] problems building Gem that contains C code
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
X-List-Received-Date: Thu, 14 May 2015 20:53:30 -0000
X-Groupsio-MsgNum: 55515
Content-Type: multipart/mixed; boundary="------------040804070806050709050109"

--------------040804070806050709050109
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Eduardo,

I think one issue is --sysroot is using the host path that might be 
contributing to the Arch mismatch message. I have a patch that I have 
not submitted, yet.

Regarding the .debug, you might need to add

FILE_${PN}-dbg += 
"/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug"


It you could try the patch I have attached and let me know if it helps.

regards,
Armin

On 05/14/2015 06:25 AM, Eduardo Silva wrote:
> Hi,
>
> I am packaging a Ruby gem that also contains C code:
>
>    http://github.com/msgpack/msgpack-ruby
>
> but when building it raise many QA issues about linking to 64 bits version,
> my target is "i586-poky-linux":
>
> ERROR: QA Issue: Architecture did not match (3 to 62) on
> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack.so
> [arch]
> ERROR: QA Issue: non debug package contains .debug directory: ruby-msgpack
> path
> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpack/.debug/msgpack.so
> [debug-files]
> ERROR: QA Issue: Architecture did not match (3 to 62) on
> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
> [arch]
> WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit),
> libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
> libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no providers in its
> RDEPENDS [file-rdeps]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/temp/log.do_package_qa.7603
> ERROR: Task 9
> (/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
> ruby-msgpack_git.bb, do_package_qa) failed with exit code '1'
>
> would you please advice if some specific flag/setup is required to build
> Ruby gems that contains C code ?
>
> thanks,
>

--------------040804070806050709050109
Content-Type: text/x-patch;
 name="0001-ruby-fix-sysroot-issue.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ruby-fix-sysroot-issue.patch"

From 7c2ccc0218c08751b143b5167ab83a83b985d034 Mon Sep 17 00:00:00 2001
From: Armin Kuster <akuster808@gmail.com>
Date: Thu, 14 May 2015 13:02:35 -0700
Subject: [PATCH] ruby: fix  sysroot issue

The --sysroot=/ is set to the host path, when using ruby on a target
machine.

This only becomes a problem with compiling native support using gems.

thanks to Robert Bevan

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
index 78c943c..2bf0a00 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -31,6 +31,12 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
+do_install_append () {
+if [ "${PN}" != "ruby-native" ]; then
+    sed -i "s/sysroot=[0-9a-z\/\-]*/sysroot=\//g" ${D}/usr/lib/ruby/*/*/rbconfig.rb
+fi
+}
+
 FILES_${PN} += "${datadir}/rubygems \
                 ${datadir}/ri"
 
-- 
2.3.5


--------------040804070806050709050109--
