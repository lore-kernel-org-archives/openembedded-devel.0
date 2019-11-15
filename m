Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 653 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Nov 2019 12:36:04 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E79E07E265
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 12:36:03 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xAFCPCFM032079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 13:25:12 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.57.126])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id xAFCPAd0024193;
	Fri, 15 Nov 2019 13:25:10 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 417D79504F1;
	Fri, 15 Nov 2019 13:25:06 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 13:24:47 +0100
Message-Id: <20191115122447.31571-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Martin Balik <martin.balik@siemens.com>
Subject: [meta-networking][PATCH] squid: upgrade 4.6 -> 4.9
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
X-List-Received-Date: Fri, 15 Nov 2019 12:36:05 -0000

From: Martin Balik <martin.balik@siemens.com>

Signed-off-by: Martin Balik <martin.balik@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-networking/recipes-daemons/squid/{squid_4.6.bb => squid_4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.6.bb => squid_4.9.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.6.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_4.6.bb
rename to meta-networking/recipes-daemons/squid/squid_4.9.bb
index ca4927dda..6f202cf40 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.6.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "6fb9f2be772b9bcaf2b3322d9e16ee1e"
-SRC_URI[sha256sum] = "73c1970467618db194057f6c43c80019a4dc47847579fc404796ff2dcd215f05"
+SRC_URI[md5sum] = "b315d0dce37627dfe61eec7f5304baaf"
+SRC_URI[sha256sum] = "0f5829d878002147e7c4d9b8901c2c3c051693465e82e45cef9ab0e226e3e729"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=19cc4dd146f397e72f3ff6f9f58fbfbe \
-- 
2.11.0


