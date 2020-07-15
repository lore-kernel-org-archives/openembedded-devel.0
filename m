Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.614.1594835021585741181
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 10:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06FHheXU029944
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2020 10:43:40 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Jul 2020
 10:43:39 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 6D89420468;
 Wed, 15 Jul 2020 13:43:39 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] net-snmp, openjpeg: add proper CVE tags to patches
Date: Wed, 15 Jul 2020 13:43:39 -0400
Message-ID: <20200715174339.20901-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 .../recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch  | 4 +++-
 .../recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch    | 4 ++++
 .../recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch    | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
index 3e2637eaa..ec1b6de8f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
@@ -8,9 +8,11 @@ This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.

 Upstream-Status: Backport
 [ak: fixup for 5.8 context, changes to library/snmpusm.h]
-CVE:CVE-2019-20892
+
+CVE: CVE-2019-20892

 Signed-off-by: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>

 ---
  snmplib/snmp_client.c | 22 +++----------
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
index 9f2fc901f..1e14149c8 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
@@ -4,6 +4,10 @@ Date: Sat, 11 Jan 2020 01:51:19 +0100
 Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
  coordinates are beyond INT_MAX (fixes #1228)

+CVE: CVE-2020-6851
+
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+
 ---
  src/lib/openjp2/j2k.c | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
index cb250530e..6158601af 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
@@ -6,6 +6,10 @@ Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
 That could lead to later assertion failures.

 Fixes #1231 / CVE-2020-8112
+
+CVE: CVE-2020-8112
+
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
 ---
  src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
  1 file changed, 18 insertions(+), 2 deletions(-)
--
2.27.0
