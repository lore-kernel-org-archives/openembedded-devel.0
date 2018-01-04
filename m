Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99DFD784DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 07:19:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w047Jttg016949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Jan 2018 23:19:56 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 23:19:54 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jan 2018 14:58:46 +0800
Message-ID: <20180104065846.20541-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180104065846.20541-1-kai.kang@windriver.com>
References: <20180104065846.20541-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] cfengine: 3.9.0 -> 3.10.2
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
X-List-Received-Date: Thu, 04 Jan 2018 07:19:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade cfengine from 3.9.0 to lastest lts version 3.10.2.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../cfengine/{cfengine_3.9.0.bb => cfengine_3.10.2.bb}      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.9.0.bb => cfengine_3.10.2.bb} (82%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
similarity index 82%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
index 4aa8dedc4..b86b0a1f1 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
@@ -1,5 +1,5 @@
 #
-# Copyright (C) 2014 - 2016 Wind River Systems, Inc.
+# Copyright (C) 2014 - 2017 Wind River Systems, Inc.
 #
 SUMMARY = "CFEngine is an IT infrastructure automation framework"
 
@@ -11,7 +11,7 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cd59c3650c8b7ff36bab1cc6587b097a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f8b34828ab373d6b1bb4b0fc60a78494"
 
 DEPENDS = "attr tokyocabinet"
 
@@ -20,14 +20,17 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz
            file://set-path-of-default-config-file.patch \
 "
 
-SRC_URI[md5sum] = "63da39655cfca30ca885fcc4a1bf8aa4"
-SRC_URI[sha256sum] = "32a38aedf1199c2361e1335e0d4a1d98f9efa7cd591bcb647f35c7395bb66f2d"
+SRC_URI[md5sum] = "c16baf08189a1af6fcf2e2ff61102992"
+SRC_URI[sha256sum] = "d4fa9ac7276dba7b85d6757aab2f0929ab8d3b115cb0e7b0cf984760347429d7"
 
 inherit autotools systemd
 
 export EXPLICIT_VERSION="${PV}"
 
-SYSTEMD_SERVICE_${PN} = "cfengine3.service cfengine3-web.service"
+SYSTEMD_SERVICE_${PN} = "cfengine3.service cf-apache.service cf-hub.service cf-postgres.service \
+                         cf-runalerts.service cf-consumer.service cf-execd.service \
+                         cf-monitord.service  cf-redis-server.service  cf-serverd.service \
+"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 PACKAGECONFIG ??= "libpcre openssl \
-- 
2.14.1


