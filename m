Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 359B86C108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8H93n012702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:09 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:17:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:42 +0800
Message-ID: <32984cda6756969c935dfaa6f5fd67cea4ee08ed.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/12] libbytesize: 1.3 -> 1.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:08 -0000
Content-Type: text/plain

Remove redundant PV assignment

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libbytesize/{libbytesize_1.3.bb => libbytesize_1.4.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_1.3.bb => libbytesize_1.4.bb} (91%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
similarity index 91%
rename from meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
index caf84de..863ce42 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "b0dcf6f457d700127b43c0e0a198253c266b78ae"
-PV = "1.3+git${SRCPV}"
+SRCREV = "ebbda2217d177d2a17f917d7a3e3d132a26db791"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master \
 "
 
-- 
2.7.4


