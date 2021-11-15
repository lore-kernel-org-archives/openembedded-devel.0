Return-Path: <cbing@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BE2C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:25:25 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.22039.1636982724815201115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=tsRZHECa;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66,
 mailfrom: btv1==953fcf95f32==cbing@cybernetics.com)
X-ASG-Debug-ID: 1636982722-0fb3b00bc4389600001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with
 ESMTP id BwqprzLHSBsiQHrA for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 08:25:22 -0500 (EST)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cybernetics.com; s=mail;
	bh=pOeex0nbmEfRBaWe6jObJH4c7WjIh0dI4tq5MGD7BUo=;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=tsRZHECay2nd6mp8s3
	COQlAC5+wYuXtNoY1OGdPZQ6ugQGNqg2cFL/BZr6de1+UdG0Gyihtkk38KTgTxZY0TLvTio12kMZf
	LhoH7sAyHSqORldPzZayvKTsyxN5ZTIzpJQTgPQsptWwIJmBwqkbfL/t9HRTUE2pReEmRtRYQN+k=
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11336828 for openembedded-devel@lists.openembedded.org;
 Mon, 15 Nov 2021 08:25:22 -0500
Subject: Re: [oe] [meta-oe][PATCH 2/2] php: Build minilua for build host
X-Barracuda-RBL-Trusted-Forwarder: 10.157.1.18
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] [meta-oe][PATCH 2/2] php: Build minilua for build
 host
References: <20211114010709.2504225-1-raj.khem@gmail.com>
 <20211114010709.2504225-2-raj.khem@gmail.com>
From: Claude Bing <cbing@cybernetics.com>
Message-ID: <b930cb5c-2dba-72fc-6e7e-e991c693da13@cybernetics.com>
Date: Mon, 15 Nov 2021 08:25:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211114010709.2504225-2-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1636982722
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 6242
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 13:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93951

> Our solution is to convert the $(CC) to $(HOSTCC) which is then passed
via environment.

Essentially that is the same as having the php-native package build
minilua, correct?  We are still working on your suggestion to compile
minilua in a style similar to
meta-oe/recipes-support/espeak/espeak_1.48.04.bb, but first we are
upgrading our environment to the honister branch (override syntax changes).

On 11/13/21 8:07 PM, Khem Raj wrote:
> see https://bugs.php.net/bug.php?id=80717&edit=1
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...1-opcache-jit-use-minilua-in-sysroot.patch | 29 -------------------
>  ...10-Fix-opcache-jit-minilua-compiling.patch | 20 +++++++++++++
>  meta-oe/recipes-devtools/php/php_8.0.12.bb    |  8 ++---
>  3 files changed, 22 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch
> 
> diff --git a/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch b/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
> deleted file mode 100644
> index 2ba0f2b771..0000000000
> --- a/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From aaa6a81cfb20f9b3c25aa22e5a472c0f2867f72c Mon Sep 17 00:00:00 2001
> -From: Claude Bing <cbing@cybernetics.com>
> -Date: Tue, 9 Nov 2021 13:11:42 -0500
> -Subject: [PATCH 11/11] opcache/jit: use minilua in sysroot
> -
> -Signed-off-by: Claude Bing <cbing@cybernetics.com>
> ----
> - ext/opcache/jit/Makefile.frag | 7 ++-----
> - 1 file changed, 2 insertions(+), 5 deletions(-)
> -
> -diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
> -index b3af5b290a..f2e737e463 100644
> ---- a/ext/opcache/jit/Makefile.frag
> -+++ b/ext/opcache/jit/Makefile.frag
> -@@ -1,9 +1,6 @@
> - 
> --$(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
> --	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
> --
> --$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
> --	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
> -+$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua
> -+	@minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
> - 
> - $(builddir)/jit/zend_jit.lo: \
> - 	$(builddir)/jit/zend_jit_x86.c \
> --- 
> -2.25.1
> -
> diff --git a/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch b/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch
> new file mode 100644
> index 0000000000..6f134fabb8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch
> @@ -0,0 +1,20 @@
> +From 73ea1d44c1e6b063bfa02e12919ec8a9de3709d8 Mon Sep 17 00:00:00 2001
> +From: Michael Heimpold <mhei@heimpold.de>
> +Date: Wed, 3 Feb 2021 22:51:34 +0100
> +Subject: [PATCH] Fix opcache jit minilua compiling
> +
> +Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> +---
> + ext/opcache/jit/Makefile.frag | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/ext/opcache/jit/Makefile.frag
> ++++ b/ext/opcache/jit/Makefile.frag
> +@@ -1,6 +1,6 @@
> + 
> + $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
> +-	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
> ++	$(HOSTCC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
> + 
> + $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
> + 	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
> index 300499de5c..8d24c187ef 100644
> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
> @@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
>              file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
>              file://0007-sapi-cli-config.m4-fix-build-directory.patch \
>              file://0008-ext-imap-config.m4-fix-include-paths.patch \
> -            file://0011-opcache-jit-use-minilua-in-sysroot.patch \
> +            file://1010-Fix-opcache-jit-minilua-compiling.patch \
>              file://php-fpm.conf \
>              file://php-fpm-apache.conf \
>              file://70_mod_php${PHP_MAJOR_VERSION}.conf \
> @@ -108,6 +108,7 @@ PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valg
>  PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
>  PACKAGECONFIG[mbstring] = "--enable-mbstring,,"
>  
> +export HOSTCC = "${BUILD_CC}"
>  export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
>  export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
>  CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
> @@ -258,13 +259,8 @@ RCONFLICTS:${PN}-modphp = "${MODPHP_OLDPACKAGE}"
>  do_install:append:class-native() {
>      create_wrapper ${D}${bindir}/php \
>          PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
> -
> -    if [ "$MACHINE_ARCH" == "x86" || "$MACHINE_ARCH" == "x86-64" ]; then
> -        install -m 0755 ${WORKDIR}/build/ext/opcache/minilua ${D}${bindir}/
> -    fi
>  }
>  
> -
>  # Fails to build with thumb-1 (qemuarm)
>  # | {standard input}: Assembler messages:
>  # | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93940): https://lists.openembedded.org/g/openembedded-devel/message/93940
> Mute This Topic: https://lists.openembedded.org/mt/87039648/4618432
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [cbing@cybernetics.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

