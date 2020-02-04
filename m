Return-Path: <Yongxin.Liu@windriver.com>
X-Greylist: delayed 7115 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 08:00:00 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 822E661166
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 08:00:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01461PaI015794
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 3 Feb 2020 22:01:25 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 3 Feb 2020 22:01:17 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 4 Feb 2020 13:49:22 +0800
Message-ID: <20200204054922.6504-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fio: Add support for PMDK engines
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
X-List-Received-Date: Tue, 04 Feb 2020 08:00:02 -0000
Content-Type: text/plain

"pmemblk", "dev-dax" and "libpmem" engines are used for persistent memory.
In order to enable them, add "pmem" to MACHINE_FEATURES in BSP conf.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.17.bb b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
index 5a9cc8334..482928c31 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.17.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
@@ -11,6 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libaio zlib coreutils-native"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'pmem', 'pmdk', '', d)}"
 RDEPENDS_${PN} = "python3-core bash"
 
 PACKAGECONFIG_NUMA = "numa"
-- 
2.14.4


