Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 705F87874E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w637Lnis027588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:49 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:48 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:25 +0800
Message-ID: <1530602486-4522-7-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 7/8] NetworkManager: upgrade 1.10.6 -> 1.10.10
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:48 -0000
Content-Type: text/plain

License-Update: update GTK-Doc from 1.27 to 1.28 to generate license.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{networkmanager_1.10.6.bb => networkmanager_1.10.10.bb}      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.10.6.bb => networkmanager_1.10.10.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb
index 605d371..682c896 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.10.bb
@@ -5,7 +5,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=77b9e362690c149da196aefe7712db30 \
+                    file://docs/api/html/license.html;md5=ac20f1edc24f72480a1106871e9fbe9a \
 "
 
 DEPENDS = " \
@@ -38,8 +38,11 @@ SRC_URI = " \
     file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
     file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
 "
-SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
-SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
+SRC_URI[md5sum] = "8c67fc286150ed357b6c833b9e015330"
+SRC_URI[sha256sum] = "244e29c0d1a57492df9aaf2d8c31e4a1b76bdfa8e862ae106239862e1c78c3ca"
+
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.10/"
+UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.7.4


