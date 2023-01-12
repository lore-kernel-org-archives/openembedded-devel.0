Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6B7C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 14:56:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.57259.1673535373379732462
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jan 2023 06:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=f0gGzrS3;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0aKsGl9tBEhG/Rk6r4iWKe3Ywfj1mogu2YyF1lxsrco=; b=f0gGzrS3fhVT28J6BVHKnL1OfZ
	TQYBZR9NNqMmCXb8oBd0GxV79y/aWvPSgocAIdwJC1ASRcFEu4JsnD8u4AwL6DDAN6KsGB8X5QXia
	l86v0RLn/AXkWgVx+15iRZh6/y90FeyUEbspgy1b2hstdvlVbiY+S4e/F/x+MOAcmzYqG5CPAVYZX
	DUk0Q/6FdO3hWb3x/y7JL4PARf1w6Vv06D8P4LK7zzl967ANyRxUmVSmsgCHLqP+KIDtI7SP3qbq3
	IjRo4ZJObCmdNOAUUDRBjmq5KLYCQDweE64tn/6BvPV32P3OV+ZKeFBdKwfWdax/gTLY9dxWvsmQB
	Yfsz8wpw==;
Received: from lan.nucleusys.com ([92.247.61.126]:39574 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFz07-0000Eh-IY;
	Thu, 12 Jan 2023 16:56:12 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-astroid: Upgrade 2.12.13 -> 2.13.2
Date: Thu, 12 Jan 2023 16:55:57 +0200
Message-Id: <20230112145557.1780277-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jan 2023 14:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100560

Upgrade to release 2.13.2:

- Removed version conditions on typing_extensions dependency.
- Removed typing_extensions from our tests requirements as it was
  preventing issues to appear in our continuous integration.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-Replace-with.patch    | 27 +++++++++++++++++++
 ...d_2.12.13.bb => python3-astroid_2.13.2.bb} | 13 ++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.13.bb => python3-astroid_2.13.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch b/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
new file mode 100644
index 000000000..3e1a17be9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astroid/0001-pyproject.toml-Replace-with.patch
@@ -0,0 +1,27 @@
+From 517f361ba4a6ae430acfe3b83986d32b4f811b58 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Wed, 11 Jan 2023 13:56:24 +0200
+Subject: [PATCH] pyproject.toml: Replace ~= with >=
+
+Replace ~= with >= to avoid errors if the version is not exactly
+the same.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 537bca9a..a01e0d45 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools~=62.6", "wheel~=0.37.1"]
++requires = ["setuptools>=62.6", "wheel>=0.37.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
index ca87ff013..fa22080d3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.13.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.13.2.bb
@@ -4,11 +4,18 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1493fe8bd3dfd73dc35bd53c9d5b6e49ead98497c47b2307662556a5692d29d7"
+SRC_URI[sha256sum] = "3bc7834720e1a24ca797fd785d77efb14f7a28ee8e635ef040b6e2d80ccb3303"
 
-inherit pypi setuptools3
+SRC_URI += " \
+    file://0001-pyproject.toml-Replace-with.patch \
+"
+
+inherit pypi python_setuptools_build_meta
 
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+DEPENDS += "\
+    ${PYTHON_PN}-pytest-runner-native \
+    ${PYTHON_PN}-wheel-native \
+"
 
 PACKAGES =+ "${PN}-tests"
 
-- 
2.30.2


