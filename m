Return-Path: <eduardo@monkey.io>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2986013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 13:25:36 +0000 (UTC)
Received: by iepk2 with SMTP id k2so58695525iep.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 06:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=1k7iFYQe3VfzQmBWH0yYjPFHnkFdfB3Nl2qgCi6jqNw=;
	b=cCejWIn9k8A37clMPHAdERN2RXQ+rzzTARUBlatXfKk659WCvfBM/pW9p7sKVSsw4g
	oZ+M3bbCYfI3vNFX6X/a8HBSTXriqXr7me+m726OjcTKjNW1sE+spiERcqYjqtzxtw0E
	TI9sp9DQjJjowelIh3SGcDBe7tn/8k6YPdhtExNHpRTbEByC/LvCQrS+u3aR9IyUTfye
	Lv/hWRhX+9VEaOxRU+qCoYXiH8Py5MdpLKNCpPmUtIGERUGFInrYCj1SHTI/yq3rJGCk
	TfIu0LZOL9/cxCFVui+HOfa5mVw2oi/UHM7/TV0H2JGZ1hPum8YGS9+rq+VPe71v5mWp
	69yQ==
X-Gm-Message-State: ALoCoQk3eWi4Jfy4KN/xncgfOSnKhoUFfP2Qr+BEJgXFE/aQB4wYZubme/Wu2xhmWmeI1YQ+W0bv
MIME-Version: 1.0
X-Received: by 10.107.12.93 with SMTP id w90mr5489011ioi.10.1431609937997;
	Thu, 14 May 2015 06:25:37 -0700 (PDT)
Received: by 10.107.36.204 with HTTP; Thu, 14 May 2015 06:25:37 -0700 (PDT)
Date: Thu, 14 May 2015 07:25:37 -0600
Message-ID: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-ruby] problems building Gem that contains C code
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
X-List-Received-Date: Thu, 14 May 2015 13:25:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am packaging a Ruby gem that also contains C code:

  http://github.com/msgpack/msgpack-ruby

but when building it raise many QA issues about linking to 64 bits version,
my target is "i586-poky-linux":

ERROR: QA Issue: Architecture did not match (3 to 62) on
/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack.so
[arch]
ERROR: QA Issue: non debug package contains .debug directory: ruby-msgpack
path
/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpack/.debug/msgpack.so
[debug-files]
ERROR: QA Issue: Architecture did not match (3 to 62) on
/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
[arch]
WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit),
libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no providers in its
RDEPENDS [file-rdeps]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/temp/log.do_package_qa.7603
ERROR: Task 9
(/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
ruby-msgpack_git.bb, do_package_qa) failed with exit code '1'

would you please advice if some specific flag/setup is required to build
Ruby gems that contains C code ?

thanks,

-- 
Eduardo Silva
Monkey Software

