Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8154.1794465920432620676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gnwJCcLw;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e795af1d4so470924eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465920; x=1795070720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/vHccQHlNP2yOPGQQKwzWc77UAGfCpX6Xe/2vYbfbA=;
        b=gnwJCcLw+pN28qc1HYz9F0aHyEh9FhtP3Zkmf+gODl/AUWixMJK8hM+LijJiRhQ5iE
         dYCzsIbfMbPgYR6/oWuV1RC0cCit87w3irvZU1eRuRnwTUtwWbI8HDO5HG103vO8pXcU
         7w9Tj/EbrXcyNxO/gpua59XBYQh4J7IYdW1i8+KvYSqNLSbRHcP8R8kRzFcppR83qD5O
         4KAQbwuvhkc4HOuRbOFRO4CN2BV9azBIpEVnB1LYTh8c0f2WqU/jG3rt2ZRgfcceZ2zy
         Fnvy+GFyy48xer3nhS0s5O9XO5HpM0sYhuJ2ZqAxsEWgl9LxxHzVNBnBcbJZWlDLLT8p
         OMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465920; x=1795070720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/vHccQHlNP2yOPGQQKwzWc77UAGfCpX6Xe/2vYbfbA=;
        b=WTjKz3uEwa8dL3mB95FZqtH1wtKoIqaI7PAV0IlvhN9ZIbfdaN4yfGP9mj1fPq4GvR
         R3nsojvNttnt4i0JQ0NFLB3jfOcarj7R4xvgy6lCOtfFXb1t83G0knx9ZOpuoN7aJNwO
         KFrYX7R8XmCGFqOKEAaDS38OiNivdaKKiYk9836cnOooN2i3S3DfxHViY+62OspzWbcH
         yCtIr0juIIlYAtrZHwpBHm9yi3r9BmrmCTWMxW3LHkwHWuUuyNmsDzm27bNDHydBAVbE
         qWdxFTH7KH9gPMRz7GqHf3aFRkxR262hS7o015VvZN6vw6ZLfuh2SpyBaAGgLuI2ngLq
         1eyg==
X-Gm-Message-State: APuU4Z+okxxM4QRSJyJxIqIp+rAsNQkwFTTQMSjAt3xtdYdphdsl2Bs7
	Uc6jdyNwG4yXUYpwmw0k4PpkCT8zjHjHlX/KIGNF+ThYrdDhuMhd9Ur3LDxX3sr4Toc=
X-Gm-Gg: AYBFou3Bm+ocybv0iXkmuAoZegw+Uu5WZUPJuF2bKPSqc5cjK79qkS/hS7nBeJBXWjy
	8hF7l+TbJ36srMny37KuZ4M6LUZld+bK+9q+1Uzjw1A2XyxSFp6rjV2tr7my1iTiey+I4Pf6UtF
	bEcVaagt1ap+jt+tqL+J7q/gyRDtDOQnU4jxTSeFLBL62bcHwwtP0njm0uSQAVz8qg0rrkwKW1U
	IBQM3jfdeOOcBycpt4CosTkcYJaAf5FuYcKh0+UdI5MFRhRHwj7eGjpTJiqEa60NOTPCXFwkUSx
	Y+TlOCRhrwhlhtnVlzmvNa2k1TIX02RaYLXjj1QQTqfTRdlK7xoiM+56W9Xz09hS62rC7r4Q9jN
	HFJRYEhpKji8aDwoptRh1BR/7YKVXdHzYqhFqlysIFEdY6QCcG+HZmn0GWlXrb6HHzzLUotnKA+
	TgVSZV/5nabkPZ5lq5RaZRff0uM6jQybZ7AuuhvwDXE2TifzW93NxTxvhL2zJ5CO13eKtVxPHhQ
	5YO/JN9k35t31SEEw/MxDGSa5mQ4fMLdx9gjbJpjanUC2cUJ7HTKRHiRnCK1BSuYl6gZXtRFABR
	o0iexjSn0SseXRbd4YC+C72QT393xymYTN/PEYIjakSZyPtPUnC1pkhYzvhYqRQYFZO6AqLwS2G
	hg0lKrNLfSUDPRnzlZKHjHTWWJF9x2sl0nGiw3hAI2gvt4EV5AkLx2euzpq1cWEgstKQo1qYcXN
	l2nu2iJ8e4cxkj5UsNnEHFWiM2aVxbqhRS754zE/CuLkQTA7VEsohB6IJ2v1d+ug1+0/K1wCmmo
	zrFZHW9sTR2kULUmaEbauSgn1sEbd/8WZt9tWsj6Sfmlvu+qay+lUze63YXpC7zcsTlDnkqhdSh
	emZG
X-Received: by 2002:a05:7300:c395:b0:36d:6a77:960a with SMTP id 5a478bee46e88-377deaea7camr1762722eec.1.1794465919618;
        Wed, 11 Nov 2026 22:45:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm21055001eec.3.2026.11.11.22.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:45:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/5] postfix: Remove unused patches
Date: Wed, 11 Nov 2026 22:45:11 -0800
Message-ID: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132194
Content-Type: text/plain; charset="utf-8"

These were dropped from SRC_URI in ad0f53d2bb (postfix: upgrade 3.10.9 -> 3.11.2) but the files were left behind:

  0001-makedefs-Account-for-linux-7.x-version.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 -------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
deleted file mode 100644
index 4bc59ace7d..0000000000
--- a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 11 May 2026 18:16:07 +0000
-Subject: [PATCH] makedefs: Account for linux 7.x version
-
-Major version has bumped to 7, update the scripts
-
-Upstream-Status: Backport [The latest stable version 3.11 already fixed]
-
-Refer:
-https://www.ftp.saix.net/MTA/postfix/index.html
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- makedefs            | 2 +-
- src/util/sys_defs.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/makedefs b/makedefs
-index 74b103d..fe8c618 100644
---- a/makedefs
-+++ b/makedefs
-@@ -625,7 +625,7 @@ EOF
- 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
- 		: ${PLUGIN_LD="${CC-gcc} -shared"}
- 		;;
--    Linux.[3456].*)
-+    Linux.[34567].*)
- 		SYSTYPE=LINUX$RELEASE_MAJOR
- 		case "$CCARGS" in
- 		 *-DNO_DB*) ;;
-diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
-index 70aab23..c5472eb 100644
---- a/src/util/sys_defs.h
-+++ b/src/util/sys_defs.h
-@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
-   * LINUX.
-   */
- #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
--	|| defined(LINUX6)
-+	|| defined(LINUX6) || defined(LINUX7)
- #define SUPPORTED
- #define UINT32_TYPE	unsigned int
- #define UINT16_TYPE	unsigned short
---
-2.53.0
-
