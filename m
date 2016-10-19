Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7B171AAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9J53j9m011820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:03:45 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 18 Oct 2016 22:03:44 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Oct 2016 13:03:43 +0800
Message-ID: <1476853423-129811-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libndp: 1.5 -> 1.6
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
X-List-Received-Date: Wed, 19 Oct 2016 05:03:52 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb | 10 ----------
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
deleted file mode 100644
index 8f1d1ff..0000000
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "beb82e8d75d8382d1b7c0bb0f68be429"
-SRC_URI[sha256sum] = "faf116ab70ce9514ec4e8573556025debea08f606e7f38b616de1f26e120c795"
-
-inherit autotools
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
new file mode 100644
index 0000000..a35dff8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
+SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+
+inherit autotools
-- 
2.7.4


