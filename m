Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C0AEC1E91
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:05:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17397.1770285904015772329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G+aA4xSO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770285904; x=1801821904;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F27NVSItHQ3yg4Zo6HE+Ei00Y8H4B2tahokO/8cG3A8=;
  b=G+aA4xSOLiz1z8w363DgphOTJxV6AhEIJLpx904kUR/VK2Le3XFAeSAw
   FK9H/RFw4L5NnDvKax6B/3k3kzG2GsBhCwSIDdIphHoJfcfPVPqSCANJN
   iDEpqtOmzbVP0fYDg6aJrv1xrn7Pi6/i5ULgQqYOrkPiqURaf3/+aN2Hq
   R1u5K4AcdZTqeDjYxgUcp6+9QyvifUaQiayLrT+Is4GEZfLvuhdHXnPzm
   OW+YWJkY6SgyzGRDsSxef/i+pmH6+1FECi5pc4UZu6BM4OFmRHxg0QkVP
   bGpbzZmKY747csq6/rvbJEyT75IMKvVSSyXl8+TDbZ9Otqi+KgOZ2HFWv
   Q==;
X-CSE-ConnectionGUID: NzDE1JaLQzyt7ELITmFpFw==
X-CSE-MsgGUID: d9Prwtz0SYmVzEudNN5KLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228047793"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228047793"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:05:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 3F5F71C0018C
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 10:05:02 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E570E1809AF5
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 10:05:01 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9B224829EFE
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 10:04:59 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pyrad: upgrade 2.4-> 2.5.2
Date: Thu,  5 Feb 2026 18:04:54 +0800
Message-ID: <20260205100455.3625-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 10:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124205

1.ChangeLog
  Fix readthedocs

2.Remove following patches as they were merged upstream
  use-poetry-core.patch
  208.patch

3.Change license checksum as position of License Info has changed in PKG-INFO file.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-pyrad/208.patch            | 51 -------------------
 .../python3-pyrad/use-poetry-core.patch       | 26 ----------
 ...n3-pyrad_2.4.bb => python3-pyrad_2.5.2.bb} |  8 +--
 3 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad/208.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad/use-poetry-core.patch
 rename meta-python/recipes-devtools/python/{python3-pyrad_2.4.bb => python3-pyrad_2.5.2.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad/208.patch b/meta-python/recipes-devtools/python/python3-pyrad/208.patch
deleted file mode 100644
index b08f183583..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyrad/208.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d17438da2008f48aa13cc95a626c990bf645799a Mon Sep 17 00:00:00 2001
-From: Luca Barbieri <lucabarb@gmail.com>
-Date: Wed, 8 Jan 2025 10:35:22 +0100
-Subject: [PATCH 1/2] Fix pyproject.toml format
-
-Fix pyproject format to correctly build with poetry-core 2.0.0
-Upstream-Status: Submitted [https://github.com/pyradius/pyrad/pull/208]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -2,16 +2,16 @@
- requires = ["poetry-core>=1.0.0"]
- build-backend = "poetry.core.masonry.api"
- 
--[tool.poetry]
-+[project]
- name = "pyrad"
- version= "2.4"
- readme = "README.rst"
- license = "BSD-3-Clause"
- description="RADIUS tools"
- authors = [
--  "Istvan Ruzman <istvan@ruzman.eu>",
--  "Christian Giese <developer@gicnet.de>",
--]
-+  { name = "Istvan Ruzman", email = "istvan@ruzman.eu" },
-+  { name = "Christian Giese", email = "developer@gicnet.de" },
-+ ]
- keywords = ["AAA", "accounting", "authentication", "authorization", "RADIUS"]
- classifiers = [
-     "Development Status :: 6 - Mature",
-@@ -28,7 +28,7 @@ include = [
-   "example/*"
- ]
- 
--[tool.poetry.urls]
-+[project.urls]
- repository = "https://github.com/pyradius/pyrad"
- 
- [tool.poetry.dependencies]
-@@ -36,5 +36,5 @@ python = "^2.7 || ^3.6"
- six = "^1.15.0"
- netaddr = "^0.8"
- 
--[tool.poetry.dev-dependencies]
-+[tool.poetry.group.dev.dependencies]
- nose = "^0.10.0b1"
diff --git a/meta-python/recipes-devtools/python/python3-pyrad/use-poetry-core.patch b/meta-python/recipes-devtools/python/python3-pyrad/use-poetry-core.patch
deleted file mode 100644
index 43a177da0a..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyrad/use-poetry-core.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Backport [https://github.com/pyradius/pyrad/commit/ffe182a44909e8f8278fb3e2ea052ddc097b48b9]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a4b70067dd6269e14a2f9530d820390a8a454231 Mon Sep 17 00:00:00 2001
-From: Martin Weinelt <hexa@darmstadt.ccc.de>
-Date: Thu, 14 Apr 2022 22:07:37 +0200
-Subject: [PATCH] Use poetry-core for pyproject based builds
-
-https://github.com/python-poetry/poetry-core#why-is-this-required
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 87b1df3..711c52f 100755
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
--requires = ["poetry>=1.0"]
--build-backend = "poetry.masonry.api"
-+requires = ["poetry-core>=1.0.0"]
-+build-backend = "poetry.core.masonry.api"
- 
- [tool.poetry]
- name = "pyrad"
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
rename to meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb
index e8cfffc9cc..415a8a8212 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb
@@ -1,14 +1,10 @@
 SUMMARY = "RADIUS tools"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 PYPI_PACKAGE = "pyrad"
-SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
-
-SRC_URI += "file://use-poetry-core.patch \
-            file://208.patch \
-            "
+SRC_URI[sha256sum] = "368e8d3cb7b9e2ca9e4357b343787238bf135edd3f3598cf26ccd65d32506ff9"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


