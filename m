Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94069798B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 02:26:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9B2QJJ9013938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 19:26:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 19:26:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Oct 2018 10:26:08 +0800
Message-ID: <1539224768-92209-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] freeradius: fix radiusd.service startup failed problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 02:26:39 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

during radiud start up, it will sereval CVE of libssl,
if allow_vulnerable_openssl set to no and one of CVE is matched,
radiusd will not startup.

in tls.c, two CVEs's version number is wrong, and after upgrade openssl
to 1.1.1, one CVE matched, so startup failed. correct the version numner
to make radiusd startup success.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...s-correct-version-number-of-libssl-defect.patch | 43 ++++++++++++++++++++++
 .../freeradius/freeradius_3.0.17.bb                |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch
new file mode 100644
index 0000000..0a961d1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch
@@ -0,0 +1,43 @@
+From fecf974b63f72eeb12d3b43522e948ca2bc704d4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Oct 2018 09:45:52 +0800
+Subject: [PATCH] freeradius: correct version number of libssl defect
+
+Upstream-Status: Backport
+
+upstream have refactored this part code into
+src/lib/tls/base.c, and problem also have fixed
+by commit ad039347beca
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/main/tls.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index acbfe79..d9c91f1 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -72,15 +72,15 @@ typedef struct libssl_defect {
+ static libssl_defect_t libssl_defects[] =
+ {
+ 	{
+-		.low		= 0x01010101f,		/* 1.1.0a */
+-		.high		= 0x01010101f,		/* 1.1.0a */
++		.low		= 0x01010001f,		/* 1.1.0a */
++		.high		= 0x01010001f,		/* 1.1.0a */
+ 		.id		= "CVE-2016-6309",
+ 		.name		= "OCSP status request extension",
+ 		.comment	= "For more information see https://www.openssl.org/news/secadv/20160926.txt"
+ 	},
+ 	{
+-		.low		= 0x01010100f,		/* 1.1.0  */
+-		.high		= 0x01010100f,		/* 1.1.0  */
++		.low		= 0x010100000f,		/* 1.1.0  */
++		.high		= 0x01010000f,		/* 1.1.0  */
+ 		.id		= "CVE-2016-6304",
+ 		.name		= "OCSP status request extension",
+ 		.comment	= "For more information see https://www.openssl.org/news/secadv/20160922.txt"
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index 1b45e78..c17d56d 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
+    file://0001-freeradius-correct-version-number-of-libssl-defect.patch \
 "
 SRC_URI[md5sum] = "1f4ad38f32101a7d50d818afa6f17339"
 SRC_URI[sha256sum] = "3f03404b6e4a4f410e1f15ea2ababfec7f8a7ae8a49836d8a0c137436d913b96"
-- 
2.7.4


