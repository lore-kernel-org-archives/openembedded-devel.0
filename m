Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB49D7CBD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:56:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1M6uf49017824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 22:56:42 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Thu, 21 Feb 2019 22:56:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Feb 2019 14:56:17 +0800
Message-ID: <1550818577-425600-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550818577-425600-1-git-send-email-changqing.li@windriver.com>
References: <1550818577-425600-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] cim-schema-final: remove do_unpack
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
X-List-Received-Date: Fri, 22 Feb 2019 06:56:40 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Use subdir=${BP} rather than write do_unpack manually.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb          | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index a14de46..67d1db2 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -4,18 +4,13 @@ LICENSE = "DMTF"
 
 RCONFLICTS_${PN} = "cim-schema-exper"
 
-SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-MOFs.zip \
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-MOFs.zip;subdir=${BP} \
     file://LICENSE \
 "
 SRC_URI[md5sum] = "a9bdf17c7374e3b5b7adeaac4842c4ad"
 SRC_URI[sha256sum] = "dbfa3064ea427acd71a4bebbc172ca2dc44b0b09a6d83b0945b9ffa988a9058a"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
-do_unpack() {
-    unzip -q ${DL_DIR}/cim_schema_${PV}Final-MOFs.zip -d ${S}
-    cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
-}
-
 do_install() {
     install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
     install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-- 
2.7.4


