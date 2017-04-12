Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5233977C81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:52:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3CAqZ19016529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:52:36 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 03:52:34 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Apr 2017 18:52:00 +0800
Message-ID: <1491994320-28617-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] autoconf-archive: Upgrade to 2016.09.16
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
X-List-Received-Date: Wed, 12 Apr 2017 10:52:35 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../recipes-devtools/autoconf-archive/autoconf-archive.inc  |  2 +-
 .../autoconf-archive/autoconf-archive_2012.04.07.bb         | 13 -------------
 .../autoconf-archive/autoconf-archive_2016.09.16.bb         | 13 +++++++++++++
 3 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
 create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
index 9399363..779115a 100644
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -10,6 +10,6 @@ RDEPENDS_${PN} = "m4 gnu-config"
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
 inherit autotools
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
deleted file mode 100644
index 5baaecc..0000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require autoconf-archive.inc
-
-
-PARALLEL_MAKE = ""
-
-LICENSE = "GPLv2 & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
-SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
-
-EXTRA_OECONF += "ac_cv_path_M4=m4"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
new file mode 100644
index 0000000..0a1a771
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -0,0 +1,13 @@
+require autoconf-archive.inc
+
+
+PARALLEL_MAKE = ""
+
+LICENSE = "GPLv2 & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
+SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
+
+EXTRA_OECONF += "ac_cv_path_M4=m4"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


