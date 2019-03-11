Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 968 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Mar 2019 15:57:53 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id C46087CF3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 15:57:53 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x2BFfjtU027796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 16:41:45 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.88])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x2BFfi1u012513;
	Mon, 11 Mar 2019 16:41:44 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A271D10D4B00;
	Mon, 11 Mar 2019 16:41:44 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Mar 2019 16:41:39 +0100
Message-Id: <20190311154139.21064-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] squid: upgrade 3.5.27 -> 3.5.28
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
X-List-Received-Date: Mon, 11 Mar 2019 15:57:54 -0000

Copyright year has changed in COPYRIGHTS file, thus the hash change.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-daemons/squid/{squid_3.5.27.bb => squid_3.5.28.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_3.5.27.bb => squid_3.5.28.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.27.bb b/meta-networking/recipes-daemons/squid/squid_3.5.28.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_3.5.27.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.28.bb
index 1557c4b2d..e33c1b7cc 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.28.bb
@@ -29,11 +29,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "c17a3ed3a40cd59c23f48b8539dafcd8"
-SRC_URI[sha256sum] = "467da134eaf0f7962ba5881793d106772fb05fefa4aea7d9569eec0412c52433"
+SRC_URI[md5sum] = "4ae3f6277b3aa6386cb5ad2d954179c2"
+SRC_URI[sha256sum] = "11971bfe3c13f438e42569ea551206caf68ecaa968305c30f7b422b556ebc7ac"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-                    file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
+                    file://errors/COPYRIGHT;md5=1c0781e2ecd3051c765d525572defbc7 \
                    "
 DEPENDS = "libtool krb5 openldap db cyrus-sasl openssl expat libxml2"
 
-- 
2.11.0


