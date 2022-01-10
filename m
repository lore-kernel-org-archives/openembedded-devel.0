Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08956C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 12:21:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.30765.1641817306346051940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=uXh0CJwG;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ePhjTtaUre7FXOYvkhGGWssGytCAN9SGAMnwZ+gPP6c=; b=uXh0CJwGY9Bllk/d1vspkakgF7
	H/w10gyAGRc2U78/DfISgAikca98GmeyX4C/AZgOpYLNvTQ/tAJE85hqIiSP8ZNq42xwujMOgzTie
	vcp3391vCfTFbzwMckA1yrJJ+KZZMYr067n4r8db2CaAgePXf0G+JqQIbSbtOEKMrWY2u8wAME5Vf
	pni2vCtZifoMnk13X7vVG8gmWOJFachZkAC52VmCsrvIGbVSucGl6G2ZDLCp2s3w6prHp3Ubp5vcD
	8yzFdnx+10IRMaxa++KXahqWUQUAExRr08fs+9EpNyW3Z5T6rR1LjljQyRGq4F08YJwJiDwAVZQab
	y87qjgvg==;
Received: from lan.nucleusys.com ([92.247.61.126]:49174 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n6ti0-0002R2-BP; Mon, 10 Jan 2022 14:21:44 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-ujson: Upgrade 5.0.0 -> 5.1.0
Date: Mon, 10 Jan 2022 14:21:34 +0200
Message-Id: <20220110122134.3754857-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 12:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94713

Upgrade to release 5.1.0:

- Strip debugging symbols from Linux binaries

Add a patch in setup.py to disable striping debugging symbols for
Linux to avoid already-stripped build errors.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...up.py-Do-not-strip-debugging-symbols.patch | 29 +++++++++++++++++++
 ...-ujson_5.0.0.bb => python3-ujson_5.1.0.bb} |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
 rename meta-python/recipes-devtools/python/{python3-ujson_5.0.0.bb => python3-ujson_5.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
new file mode 100644
index 000000000..47da2b8cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
@@ -0,0 +1,29 @@
+From aec3b64b0aaea0178b44ea65a204d76696e6a45e Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 10 Jan 2022 14:04:28 +0200
+Subject: [PATCH] setup.py: Do not strip debugging symbols
+
+Do not strip debugging symbols from Linux binaries to avoid
+bitbake build errors related to already-stripped.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 453dc31..962c507 100644
+--- a/setup.py
++++ b/setup.py
+@@ -6,7 +6,7 @@ from setuptools import Extension, setup
+ dconv_source_files = glob("./deps/double-conversion/double-conversion/*.cc")
+ dconv_source_files.append("./lib/dconv_wrapper.cc")
+ 
+-strip_flags = ["-Wl,--strip-all"] if platform.system() == "Linux" else []
++strip_flags = []
+ 
+ module1 = Extension(
+     "ujson",
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
index fb1bcd761..6c1bf7e82 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
@@ -4,12 +4,13 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "3ff7242816b1d22c08c04c4c6db0f6ba7c16cd624ce38534c1025defa011e50e"
+SRC_URI[sha256sum] = "a88944d2f99db71a3ca0c63d81f37e55b660edde0b07216fb65a3e46403ef004"
 
 inherit pypi ptest setuptools3
 
 SRC_URI += " \
     file://run-ptest \
+    file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
 "
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-- 
2.30.2


