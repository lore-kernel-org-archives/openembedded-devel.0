Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7C26CEEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:17:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR8Gpj5018553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:17:02 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:41 +0800
Message-ID: <06c999075401a84060246dec7e65b3d3b6fdc189.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 07/12] efibootmgr: 0.16 -> 17
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
X-List-Received-Date: Tue, 27 Nov 2018 08:17:26 -0000
Content-Type: text/plain

- Correct version number format, remove `0.'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/efibootmgr/{efibootmgr_0.16.bb => efibootmgr_17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/efibootmgr/{efibootmgr_0.16.bb => efibootmgr_17.bb} (93%)

diff --git a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
similarity index 93%
rename from meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb
rename to meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 6497e09..8fdfedb 100644
--- a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_0.16.bb
+++ b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -10,7 +10,7 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "a5103251a11663adddc85c86e0b8d3d3b73cbb4a"
+SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.7.4


