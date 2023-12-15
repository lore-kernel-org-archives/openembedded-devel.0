Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF35C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:18:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.45972.1702599492346368357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="122742654"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="122742654"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:18:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86F5BD9DAD
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:18:07 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C291D972A
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:18:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A4682FC6B7C;
	Fri, 15 Dec 2023 09:18:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastnumbers: upgrade 5.0.1 -> 5.1.0
Date: Fri, 15 Dec 2023 08:17:38 +0800
Message-Id: <1702599458-1577-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--3.510300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrWfgivgcUPZOqiYlNpOMcxen7
	ya/+V5vjMzTo2qNcI5YSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8mQ6dytbMjseXcgUVP3Cp+vfOd2ImQcUyEqW9uo0jkc6EjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly4z2ub0DoaSG6lYAy49xEpzdkW
	zqqo4grpsPMqvY2j7hJcDNMKOq4LhP0xO54upHTzIVxngeYy+qppQS6Q00H7SQdz7bE4pcu/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107470

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Added the denoise option to convert floats to int without numerical noise
-Support for Python 3.12
-The changelog now only explictly exists in the repository

License-Update: Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-fastnumbers_5.0.1.bb                | 10 ----------
 .../python/python3-fastnumbers_5.1.0.bb                | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
deleted file mode 100644
index 7494c45f0..000000000
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Super-fast and clean conversions to numbers."
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
-
-PYPI_PACKAGE = "fastnumbers"
-
-SRC_URI[sha256sum] = "9e4fd92cdf263a8e0865af19c40ae9df45a9bc0eb5e22fefea871140e7e0262f"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb
new file mode 100644
index 000000000..01aa8b3b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Super-fast and clean conversions to numbers."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
+
+PYPI_PACKAGE = "fastnumbers"
+
+SRC_URI[sha256sum] = "e092d33f8b95c3171a2fb34e579efe0c54b0290dd7f96ffaa2762437601d90a7"
+
+inherit pypi setuptools3
-- 
2.34.1


