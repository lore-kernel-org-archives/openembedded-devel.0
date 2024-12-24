Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67C8C02196
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zy7TWLlm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032443; x=1766568443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WJ89YWSoNOH+TDQSTFfrbln57k6v7zVHOmrwJvZPuZg=;
  b=Zy7TWLlmLIzwjz4YPz9daGI3ju2E+hLAnCF+e5eLg5aPnJsqxNCbyElE
   VWRw2Cch6nb4TGDfLgldz/qx73MXd71+4kotKJ1V5rR/K60e/d33ycWhu
   ndIOjnhxWxJLDbY6UWY0+Hbmuv0uVWfljyQA0Ok7J6p+xFd8S5Hgexn7F
   OAA+BqQk0lskEHH0OnclUwTXFDopgnvfLrpXTf69S2uOxn5O2luGWs0hZ
   0nA2rKE/Hn6uaT1cELfUzfmOTGPq+wOrVNZaHTC6mkJaF4qLqegmpgoPD
   2533paO1evf8wyvJzJ9p57b6T+j8g/m4Ok6MPRXyvokA7xv12MYSTOCxf
   w==;
X-CSE-ConnectionGUID: OX0IchfOT0m116bbF5jFbA==
X-CSE-MsgGUID: Tuj2k3V5RGe5dxypWHxa2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776095"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776095"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3753AD69D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E32ED3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9356B6BCDF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 59A011A0071;
	Tue, 24 Dec 2024 17:27:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/67] python3-geojson: upgrade 3.1.0 -> 3.2.0
Date: Tue, 24 Dec 2024 17:26:20 +0800
Message-Id: <1735032421-13513-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--10.470400-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jHv3
	EJJrdBuxhfBWuauGeCMSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9PioIsi7Sa0goguwQ+J4gZhR7G
	A0OjF0lpEsEXq5+FHE3Wr/U/lZr6PEE0j2ROR/IL0dPFETpBAH0MQw+++ihy8sTMNBTJAZWUOJt
	N/1fvkOcR1V73Vwn9xJZkeK2S8vHfBDkn6SWzqK031Nfxfj2zPzndiJkHFMhFtRKarSV80bo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtYZNMrzb+MvKnnb5ZkDtBnrh5dKcnlPiF9W4mIZ+pCv0Ty6H
	eBkBjRQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114496

From: Wang Mingyu <wangmy@fujitsu.com>

py3.13.patch
removed since it's included in 3.2.0

Changelog:
==========
- Add support for Python 3.13
- Code modernization
- RtD bugfix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-geojson/py3.13.patch       | 38 -------------------
 ...json_3.1.0.bb => python3-geojson_3.2.0.bb} |  7 +---
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-geojson/py3.13.patch
 rename meta-python/recipes-devtools/python/{python3-geojson_3.1.0.bb => python3-geojson_3.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch b/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch
deleted file mode 100644
index 45618fa6dd..0000000000
--- a/meta-python/recipes-devtools/python/python3-geojson/py3.13.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c13afff339e6b78f442785cc95f0eb66ddab3e7b Mon Sep 17 00:00:00 2001
-From: Bas Couwenberg <sebastic@xs4all.nl>
-Date: Fri, 4 Oct 2024 16:18:34 +0200
-Subject: [PATCH] Don't fail with Python 3.13. (#228)
-
-Upstream-Status: Backport [https://github.com/jazzband/geojson/commit/c13afff339e6b78f442785cc95f0eb66ddab3e7b]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- .github/workflows/test.yml | 2 +-
- README.rst                 | 2 +-
- setup.py                   | 5 +++--
- tox.ini                    | 2 +-
- 4 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 95b2823..004d3eb 100644
---- a/setup.py
-+++ b/setup.py
-@@ -17,8 +17,8 @@
- 
- 
- major_version, minor_version = sys.version_info[:2]
--if not (major_version == 3 and 7 <= minor_version <= 12):
--    sys.stderr.write("Sorry, only Python 3.7 - 3.12 are "
-+if not (major_version == 3 and 7 <= minor_version <= 13):
-+    sys.stderr.write("Sorry, only Python 3.7 - 3.13 are "
-                      "supported at this time.\n")
-     exit(1)
- 
-@@ -53,6 +53,7 @@
-         "Programming Language :: Python :: 3.10",
-         "Programming Language :: Python :: 3.11",
-         "Programming Language :: Python :: 3.12",
-+        "Programming Language :: Python :: 3.13",
-         "Topic :: Scientific/Engineering :: GIS",
-     ]
- )
-
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
index 36f5fa09ec..c7bf433d42 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
@@ -3,14 +3,11 @@ HOMEPAGE = "https://pypi.org/project/geojson/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
 
-SRC_URI[sha256sum] = "58a7fa40727ea058efc28b0e9ff0099eadf6d0965e04690830208d3ef571adac"
+SRC_URI[sha256sum] = "b860baba1e8c6f71f8f5f6e3949a694daccf40820fa8f138b3f712bd85804903"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += " \
-	file://run-ptest \
-        file://py3.13.patch \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-- 
2.43.0


