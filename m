Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 925587588F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:23:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97782681"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 16:27:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q8M1Lg009265
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:22:01 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 16:23:39 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 16:23:30 +0800
Message-ID: <1435307010-34957-9-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435307010-34957-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1435307010-34957-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH 8/8] cim-schema_2.40.0.bb: delete
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
X-List-Received-Date: Fri, 26 Jun 2015 08:23:40 -0000
Content-Type: text/plain

Cim-schema_2.40.0.bb has been renamed to cim-schema-final_2.40.0.bb,so,delete.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../cim-schema/cim-schema_2.40.0.bb                | 31 ----------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
deleted file mode 100644
index ff6c29d..0000000
--- a/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require cim-schema.inc
-
-LICENSE = "DMTF"
-
-SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-MOFs.zip \
-           file://LICENSE \
-          "
-SRC_URI[md5sum] = "a9bdf17c7374e3b5b7adeaac4842c4ad"
-SRC_URI[sha256sum] = "dbfa3064ea427acd71a4bebbc172ca2dc44b0b09a6d83b0945b9ffa988a9058a"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
-
-do_unpack() {
-        unzip -q ${DL_DIR}/cim_schema_${PV}Final-MOFs.zip -d ${S}
-        cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
-}
-
-do_install() {
-        install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
-        install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-        install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
-
-        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
-        for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
-                sed -i -e 's/\r//g' $i
-        done
-        ln -s cimv${PV} ${D}${datadir}/mof/cim-current
-        ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
-}
-
-FILES_${PN} = "${datadir}/mof/* ${datadir}/doc/*"
-FILES_${PN}-doc = ""
-- 
1.8.4.2


