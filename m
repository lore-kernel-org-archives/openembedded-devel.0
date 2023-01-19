Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6291CC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:26:32 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.51577.1674149188635251702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=AQAhUn1h;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OGsN08MTp3NsKmE5WjhLorKCDlU2trkpycsCC5ROmMg=; b=AQAhUn1hjAJw0Ryyjq9wwbAOnR
	Myvegiwa7jU5IfchMVzWGMxTRoKuBzor8ctCOoDGh5IysxLnzOx2vtKcuwW8uZvEKwiXW//cClUJz
	4CkMy+4w7k0jkJ7RuWn7286GtLODUbOh9IErHEY1b0CHzwWTGBAGKGIPNg7Bcnd+tlCuxljZ8p2pC
	Wf639ceQKgodRlNOAvcj3OOthxuMGb0H+1p/FkSnyy52Rxf6gbfHxFeF7F2KvOub0VdEZ6hdSlW93
	+v9IHBwQ6F5TnuwV0crB5j0M2efrJNxKpS9gSmgrdWJuK3vddzqWz93HuDiuMzmzS6YzG2b6C4aAC
	V0r74QPQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:54990 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pIYgu-000AnE-0x;
	Thu, 19 Jan 2023 19:26:28 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-configobj: Upgrade 5.0.6 -> 5.0.8
Date: Thu, 19 Jan 2023 19:26:15 +0200
Message-Id: <20230119172615.1882394-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119172615.1882394-1-leon.anavi@konsulko.com>
References: <20230119172615.1882394-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 17:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100665

Upgrade to release 5.0.8:

- fixing/test for a regression introduced in 5.0.7 that prevented
  import validate from working
- update testing to validate against python version 2.7 & 3.5-3.11
- update broken links / non-existent services and references

License-Update: Use file LICENSE, no change of the license

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...h-from-using-distutils-to-setuptools.patch | 28 -------------------
 .../python/python3-configobj_5.0.6.bb         | 11 --------
 .../python/python3-configobj_5.0.8.bb         | 13 +++++++++
 3 files changed, 13 insertions(+), 39 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch
deleted file mode 100644
index ed6ceca8e..000000000
--- a/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ad9024e50a9df4a2b8a1a019e07bb133c3df31bf Mon Sep 17 00:00:00 2001
-From: Daniel Watkins <daniel@daniel-watkins.co.uk>
-Date: Thu, 28 Aug 2014 18:49:04 +0200
-Subject: [PATCH] Switch from using distutils to setuptools.
-
-Upstream-Status: Backport
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c6d57a6..6755ab4 100644
---- a/setup.py
-+++ b/setup.py
-@@ -12,7 +12,7 @@
- # http://opensource.org/licenses/BSD-3-Clause
- import os
- import sys
--from distutils.core import setup
-+from setuptools import setup
- # a simple import wouldn't work if we moved towards a package with __init__
- from _version import __version__
- 
--- 
-2.30.2
-
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
deleted file mode 100644
index 1125a6389..000000000
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Config file reading, writing and validation."
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
-
-PYPI_PACKAGE = "configobj"
-SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
-
-SRC_URI += "file://0001-Switch-from-using-distutils-to-setuptools.patch"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
new file mode 100644
index 000000000..b8b5e6f89
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Config file reading, writing and validation."
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6f99b84d9a94610c62e48fa2e59e72"
+
+PYPI_PACKAGE = "configobj"
+SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-six \
+"
-- 
2.30.2


