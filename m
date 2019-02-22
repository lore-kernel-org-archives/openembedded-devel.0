Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8173E7CBE1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:56:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1M6uUeM026951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 22:56:40 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Thu, 21 Feb 2019 22:56:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Feb 2019 14:56:16 +0800
Message-ID: <1550818577-425600-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550818577-425600-1-git-send-email-changqing.li@windriver.com>
References: <1550818577-425600-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] cim-schema-docs: remove do_unpack
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
X-List-Received-Date: Fri, 22 Feb 2019 06:56:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Use subdir=${BP}, rather than write do_unpack manually.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/cim-schema/cim-schema-docs_2.40.0.bb           | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
index 31875ea..4ecaabd 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
@@ -4,18 +4,13 @@ SECTION = "doc"
 
 LICENSE = "DMTF"
 
-SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-Doc.zip \
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-Doc.zip;subdir=${BP} \
            file://LICENSE \
           "
 SRC_URI[md5sum] = "3d01940bc1085c6c42184c25fb61f739"
 SRC_URI[sha256sum] = "3174cf0f8657b19d80dc59e184778d8e553da424728cb2966fe9d5428dd84267"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
-do_unpack() {
-        unzip -q ${DL_DIR}/cim_schema_${PV}Final-Doc.zip -d ${S}
-        cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
-}
-
 do_install() {
         install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
         cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
-- 
2.7.4


