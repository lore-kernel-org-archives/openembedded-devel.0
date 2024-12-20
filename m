Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658D9E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:38:13 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.154490.1734709084847643954
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WiWxJmv8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241220153802133b7f20100c67d01e-vmylgq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241220153802133b7f20100c67d01e
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=V1/omB3xqFUkCon/JP5VnXNAE53cYTtXXtenoDBA+rI=;
 b=WiWxJmv8nqMcMsK51HtCsMqBUAm7U4L7tkHwVUQKY0UEWwukrvlXTzIazKJsNwapQUtWiK
 +zT3pDp6vES029j/cyGjsdFHBFxA32tpEWgf+cLJJyfmP0wkuO+W9fsLRZ8Ta6kbsGw/4HNN
 qpPTGLOeEV+nwkZF9VNY87TtbFpP6BbJxQeVmHLKyGHmkOjY/8WbW8BV3EChgF368vnkzCyg
 zbSgzf71imwW0vAaPkp9QV6w1zAkTqAWK+iG1PVafDGMiJrgSrRrlzogqzzJeoS/ouSGcXSJ
 QUTYnJZNinHiVAul3Og+2f85maj2BengIepKjcGlEwk16p2NcianSZAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 11/11] weechat: upgrade 4.0.4 -> 4.5.0
Date: Fri, 20 Dec 2024 16:36:29 +0100
Message-Id: <20241220153629.2499631-12-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114447

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-46613

Update dependencies:
- remove openssl and icu
- add cjson and gettext-native

Remove patch to find gcrypt which is no longer needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...01-use-pkg-config-for-gcrypt-instead.patch | 37 -------------------
 .../{weechat_4.0.4.bb => weechat_4.5.0.bb}    |  8 ++--
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.4.bb => weechat_4.5.0.bb} (79%)

diff --git a/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch b/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
deleted file mode 100644
index 4a33dd7204..0000000000
--- a/meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dc6b11f4cc6035b4701e1d7f7c91b2f45757e7a2 Mon Sep 17 00:00:00 2001
-From: Alejandro Enedino Hernandez Samaniego
- <alejandro@enedino.org>
-Date: Wed, 26 Feb 2020 13:55:16 -0800
-Subject: [PATCH] use pkg-config for gcrypt instead
-
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
-
-Upstream-Status: Inappropriate [oe-specific]
-
----
- cmake/FindGCRYPT.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: weechat-2.7.1/cmake/FindGCRYPT.cmake
-===================================================================
---- weechat-2.7.1.orig/cmake/FindGCRYPT.cmake
-+++ weechat-2.7.1/cmake/FindGCRYPT.cmake
-@@ -27,15 +27,15 @@
- #  GCRYPT_LDFLAGS = ldflags to use to compile
- #
- 
--find_program(LIBGCRYPT_CONFIG_EXECUTABLE NAMES libgcrypt-config)
-+find_program(LIBGCRYPT_CONFIG_EXECUTABLE NAMES pkg-config)
- 
- set(GCRYPT_LDFLAGS)
- set(GCRYPT_CFLAGS)
- 
- if(LIBGCRYPT_CONFIG_EXECUTABLE)
- 
--  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} --libs RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
--  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} --cflags RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
-+  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} libgcrypt --libs RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
-+  execute_process(COMMAND ${LIBGCRYPT_CONFIG_EXECUTABLE} libgcrypt --cflags RESULT_VARIABLE _return_VALUE OUTPUT_VARIABLE GCRYPT_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
-
-   if(NOT DEFINED ${GCRYPT_CFLAGS})
-     set(GCRYPT_CFLAGS " ")
diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb b/meta-networking/recipes-irc/weechat/weechat_4.5.0.bb
similarity index 79%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.5.0.bb
index d13764e4c7..cca2bf4ecc 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.5.0.bb
@@ -4,13 +4,11 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-DEPENDS = "openssl zlib icu libgcrypt gnutls curl aspell zstd"
+DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
-SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
-           file://0001-use-pkg-config-for-gcrypt-instead.patch \
-           "
+SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ae5f4979b5ada0339b84e741d5f7e481ee91e3fecd40a09907b64751829eb6f6"
+SRC_URI[sha256sum] = "b85e800af0f7c9f2d60d72c0f7e56abbaa60274a4d47be17407907292da30398"
 
 inherit cmake pkgconfig
 
-- 
2.30.2


