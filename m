Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 581F660053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 06:12:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS6CVw9012255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2015 22:12:31 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 27 Dec 2015 22:12:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Dec 2015 14:12:45 +0800
Message-ID: <1451283165-30360-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-7: fix the incorrect URIs and checksums
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
X-List-Received-Date: Mon, 28 Dec 2015 06:12:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The error in do_configure is like:
openjdk.tar.bz2: FAILED
/usr/bin/sha256sum: WARNING: 1 of 1 computed checksum did NOT match

That's because the URIs and checksums do not match the ones defined
in Makefile.am, then the configure will fail the test and download
again from ICEDTEA_DROP_URL.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-7-common.inc     | 33 ++++++++++++-------------
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb | 35 +++++++++++----------------
 2 files changed, 30 insertions(+), 38 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 718fc1a..bb399b1 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -324,30 +324,29 @@ ARM_INSTRUCTION_SET_armv4t = "ARM"
 
 ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
 
-ICEDTEA_PREFIX = "icedtea7-forest-2.6"
-ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
+ICEDTEA_MAJOR = "icedtea7"
+ICEDTEA_DROP_URL = "http://icedtea.classpath.org/download/drops/${ICEDTEA_MAJOR}/${ICEDTEA_VERSION}"
 
-OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+OPENJDK_FILE = "openjdk.tar.bz2"
+OPENJDK_URI = "${ICEDTEA_DROP_URL}/${OPENJDK_FILE};name=openjdk;unpack=false"
 
-HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
-#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_FILE = "hotspot.tar.bz2"
+HOTSPOT_URI = "${ICEDTEA_DROP_URL}/${HOTSPOT_FILE};name=hotspot;unpack=false"
 
-CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
-CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+CORBA_FILE = "corba.tar.bz2"
+CORBA_URI = "${ICEDTEA_DROP_URL}/${CORBA_FILE};name=corba;unpack=false"
 
-JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
-JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+JAXP_FILE = "jaxp.tar.bz2"
+JAXP_URI = "${ICEDTEA_DROP_URL}/${JAXP_FILE};name=jaxp;unpack=false"
 
-JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
-JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+JAXWS_FILE = "jaxws.tar.bz2"
+JAXWS_URI = "${ICEDTEA_DROP_URL}/${JAXWS_FILE};name=jaxws;unpack=false"
 
-JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
-JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+JDK_FILE = "jdk.tar.bz2"
+JDK_URI = "${ICEDTEA_DROP_URL}/${JDK_FILE};name=jdk;unpack=false"
 
-LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
-LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+LANGTOOLS_FILE = "langtools.tar.bz2"
+LANGTOOLS_URI = "${ICEDTEA_DROP_URL}/${LANGTOOLS_FILE};name=langtools;unpack=false"
 
 require openjdk-postinst.inc
 
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index 047aac4..b2b01c7 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -13,34 +13,27 @@ PR = "${INC_PR}.1"
 SRC_URI[iced.md5sum] = "a16b3e800030db9d9b35f80dfd11883a"
 SRC_URI[iced.sha256sum] = "c19eafacd23c81179934acab123511c424cd07c094739fa33778bf7cc80e14d0"
 
-CORBA_CHANGESET = "a4d55c5cec23"
-SRC_URI[corba.md5sum] = "e673f3df063c54d0dda32963e4980605"
-SRC_URI[corba.sha256sum] = "0b3bfa11c912c44b83248f5bb9c630c292409c6137951cd249f8f24c344ec4ad"
+SRC_URI[corba.md5sum] = "500547dc50acde20fad18d0645be89c4"
+SRC_URI[corba.sha256sum] = "92fa1e73dc0eb463bccd9ce3636643f492b8935cb7a23b91c5d855f4641382af"
 
-JAXP_CHANGESET = "f1202fb27695"
-SRC_URI[jaxp.md5sum] = "2088e60c6893b1ecf127be3c2bcd4dd8"
-SRC_URI[jaxp.sha256sum] = "53de0b094e2bcc173153f5d2fcd3886e8bd9feedec6510474e27ab38472088fc"
+SRC_URI[jaxp.md5sum] = "793fb78b5f51323e31785bb89292182f"
+SRC_URI[jaxp.sha256sum] = "94cda3ba29ab3cd36d50f2e6c98a5e250eb6372379e171288b3022b978136fc0"
 
-JAXWS_CHANGESET = "14c411b1183c"
-SRC_URI[jaxws.md5sum] = "d2474c78e7e300b1b8ebb767209df587"
-SRC_URI[jaxws.sha256sum] = "2c176962cab52263d3b819a303fa0ac29216a3edcddf75b39595e073da13580f"
+SRC_URI[jaxws.md5sum] = "131e2f619455e37cea74ca710e6ada6d"
+SRC_URI[jaxws.sha256sum] = "14467736097197a199b483f24f8111e9c76252a2ad2a5f166c97585c0a3930d4"
 
-JDK_CHANGESET = "db69ae53157a"
-SRC_URI[jdk.md5sum] = "5de142350438baf9e4afee021966681a"
-SRC_URI[jdk.sha256sum] = "782c8636475eef9f130718006c20be55974055a8505e241768816f6afd431666"
+SRC_URI[jdk.md5sum] = "6e8061b2b7c22163ab149fb66553eda8"
+SRC_URI[jdk.sha256sum] = "7ad801d5f6b61818c78f2f39931df24d8c6f6a1c821180c998975ac884eb8af1"
 
-LANGTOOLS_CHANGESET = "73356b81c5c7"
-SRC_URI[langtools.md5sum] = "f607b5d230c96afb33da25d9f9968b30"
-SRC_URI[langtools.sha256sum] = "eac950fb11b55ecae9a3fec6127cfe48595d02c10a8cad0525b64160463eedf2"
+SRC_URI[langtools.md5sum] = "1cebffc6b56e9efdbe08eff018801cb1"
+SRC_URI[langtools.sha256sum] = "a53fe8912b8190d82615778cf8bfb77202a55adcdc5bacc56ce7738b6a654335"
 
-OPENJDK_CHANGESET = "601ca7147b8c"
-SRC_URI[openjdk.md5sum] = "d5c5a54d79e0cf9456c370e578aadbd1"
-SRC_URI[openjdk.sha256sum] = "c1e6924bddff0ddec318364c60f4e0843c1186a0aa9911ce6cf2fd81164cd6a7"
+SRC_URI[openjdk.md5sum] = "d63c5b401aaa9ef76d1dbd87943aa387"
+SRC_URI[openjdk.sha256sum] = "4911adb6d7877b014777b6db6d90f1d1626314bd0c6a2c9cf9911d1e11eb4b49"
 
 # hotspot changeset taken from hotspot/tags
-HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
-SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
-SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
+SRC_URI[hotspot.md5sum] = "5ffb731931226fbff870b80a377f6258"
+SRC_URI[hotspot.sha256sum] = "984918bcb571fecebd490160935bb282c60eb9e17b4fc8fc77733d8da164c33a"
 
 ###############################################################################
 # PATCHES - split up to allow overriding them separately
-- 
2.3.5


