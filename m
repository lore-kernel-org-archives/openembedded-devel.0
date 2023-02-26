Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5792AC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 15:39:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.67744.1677425987071524047
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 07:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=pEUBWAAI;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:6068:4901:47d8:e8b6:b177:90cd] (unknown [IPv6:2001:a61:6068:4901:47d8:e8b6:b177:90cd])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ABFC282A55;
	Sun, 26 Feb 2023 16:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1677425984;
	bh=Im/26WnU9r25xzApQcqHG7y48cBhIVcsMqSDMDnW4ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pEUBWAAIgSOSXFVln5ImsnV+aODZpP5f6Vx9RxVyreEpo90rTLinn2YD6KGNk4nVD
	 mIjTj7Q9p2vswcpyU1KljYDPr76JUcq6ehkFYMEyM23p2O6jntRncDk6PFNcjQjrpQ
	 hcdrUSteNTHg5s/qGrCeuMyAPaYwVHRY/q8qFRYskPoICufH7vi5pA1NCT7PgXp1W6
	 rLWXy1o0aUZAJL33LxQ1du5XJ+afP1jusMK7MpqNaZQSeoBZxqXOIM5klX0aRqojmX
	 Cna1yUoMUnCNi63p4FtHJhkPXJAvJ/+j7oeJETOXodhN+m/E9aieK4IFUpHR9CfDiD
	 BDvy/svbCBa5g==
Message-ID: <02b30985-8149-c1a2-e74a-b774628b8d4f@denx.de>
Date: Sun, 26 Feb 2023 16:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [PATCH v3] zchunk: upgrade to 1.2.4
To: Ross Burton <ross.burton@arm.com>,
 openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
References: <20230223123239.1727935-1-ross.burton@arm.com>
Content-Language: en-US
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <20230223123239.1727935-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 15:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101257

Hi Ross,

Jonathan released a new version of zchunk 1.3.0, that fixes some huge 
memory consumption on embedded system. What about to skip 1.2.4 and just 
upgrade to 1.3.0 ? Or do you prefer I send a patch after you merged 1.2.4 ?

Best regards,
Stefano

On 23.02.23 13:32, Ross Burton wrote:
> Add a patch submitted upstream to fix the argp detection with clang.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../recipes-support/zchunk/files/clang.patch  | 35 +++++++++++++++++++
>   .../recipes-support/zchunk/zchunk_1.2.0.bb    | 22 ------------
>   .../recipes-support/zchunk/zchunk_1.2.4.bb    | 25 +++++++++++++
>   3 files changed, 60 insertions(+), 22 deletions(-)
>   create mode 100644 meta-oe/recipes-support/zchunk/files/clang.patch
>   delete mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
>   create mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> 
> diff --git a/meta-oe/recipes-support/zchunk/files/clang.patch b/meta-oe/recipes-support/zchunk/files/clang.patch
> new file mode 100644
> index 0000000000..86faf4aac7
> --- /dev/null
> +++ b/meta-oe/recipes-support/zchunk/files/clang.patch
> @@ -0,0 +1,35 @@
> +From e69d907c3fe8765ce50ce1258648ebc8283ef8a7 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 22 Feb 2023 14:55:07 -0800
> +Subject: [PATCH] meson: Use global function in argp check
> +
> +clang is optimizing away parse_opt() since its marked static and not
> +used in main(), make life a bit harder for clang :)
> +removing static now emits the global symbols to be resolved during link
> +and when libargp is missing the error is thrown rightly
> +
> +riscv64-yoe-linux-musl-ld: /tmp/a-5ba039.o: in function `.Lpcrel_hi0':
> +a.c:(.text+0x44): undefined reference to `argp_state_help'
> +clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/92/]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3b92d58..ab54abd 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -57,7 +57,7 @@ if host_machine.system() == 'windows'
> + endif
> +
> + # argp-standalone dependency (if required)
> +-if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
> ++if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nerror_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
> +     argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
> +     if not argplib.found()
> +         argplib = dependency('argp-standalone')
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> deleted file mode 100644
> index 0baea5032a..0000000000
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "A file format designed for highly efficient deltas while maintaining good compression"
> -AUTHOR = "Jonathan Dieter"
> -
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
> -
> -SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
> -
> -SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
> -S = "${WORKDIR}/git"
> -
> -DEPENDS = "\
> -    curl \
> -    zstd \
> -    "
> -
> -DEPENDS:append:libc-musl = " argp-standalone"
> -LDFLAGS:append:libc-musl = " -largp"
> -
> -inherit meson pkgconfig
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> new file mode 100644
> index 0000000000..b4fd027603
> --- /dev/null
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "A file format designed for highly efficient deltas while maintaining good compression"
> +AUTHOR = "Jonathan Dieter"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
> +
> +SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main \
> +           file://clang.patch"
> +
> +SRCREV = "0bed8496262a71beadccd4e562bdac093ef6e06f"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "zstd"
> +DEPENDS:append:libc-musl = " argp-standalone"
> +
> +inherit meson pkgconfig lib_package
> +
> +PACKAGECONFIG ??= "openssl zckdl"
> +
> +# zckdl gets packaged into zchunk-bin
> +PACKAGECONFIG[zckdl] = "-Dwith-curl=enabled,-Dwith-curl=disabled,curl"
> +# Use OpenSSL primitives for SHA
> +PACKAGECONFIG[openssl] = "-Dwith-openssl=enabled,-Dwith-openssl=disabled,openssl"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101223): https://lists.openembedded.org/g/openembedded-devel/message/101223
> Mute This Topic: https://lists.openembedded.org/mt/97181425/3618551
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sbabic@denx.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
=====================================================================
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich,   Office: Kirchenstr.5, 82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

