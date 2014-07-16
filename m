Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6FA06ACBA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:27:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6G5R5a3004299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 22:27:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 22:27:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 13:27:04 +0800
Message-ID: <1405488425-25526-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] liblognorm: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jul 2014 05:27:06 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

liblognorm is a tool to normalize log data.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-extended/liblognorm/liblognorm.inc    |   17 +++++++++++++++++
 .../recipes-extended/liblognorm/liblognorm_1.0.1.bb   |    5 +++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm.inc
 create mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm.inc b/meta-oe/recipes-extended/liblognorm/liblognorm.inc
new file mode 100644
index 0000000..dc8abb9
--- /dev/null
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Fast samples-based log normalization library"
+DESCRIPTION = "Briefly described, liblognorm is a tool to normalize log data."
+
+HOMEPAGE = "http://www.liblognorm.com"
+SECTION = "base"
+
+LICENSE = "LGPL-2.1+"
+
+SRC_URI = "http://www.liblognorm.com/files/download/${BPN}-${PV}.tar.gz\
+"
+
+inherit autotools pkgconfig
+
+DEPENDS += "libee libestr json-c"
+
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
+PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,sphinx,"
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb
new file mode 100644
index 0000000..5d89e35
--- /dev/null
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "7b9a826542af9686127110deab09d7a1"
+SRC_URI[sha256sum] = "1f6cdfd901a8f6a97a3cb74bc6107c6746b3e9381f7889e4cd866a488e0c59a5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
-- 
1.7.10.4


