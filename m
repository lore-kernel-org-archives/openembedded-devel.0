Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49E4065D27
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:30:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t052UGce015194
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Jan 2015 18:30:16 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 Jan 2015 18:30:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:30:12 -0800
Message-ID: <1420425013-19013-4-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [V2 PATCH 4/5] smem: use BPN in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 02:30:18 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/smem/smem_1.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
index 8d195d4..8768c48 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -9,7 +9,7 @@ SECTION = "Applications/System"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://www.selenic.com/smem/download/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.selenic.com/${BPN}/download/${BP}.tar.gz"
 SRC_URI[md5sum] = "fe79435c3930389bfdb560255c802162"
 SRC_URI[sha256sum] = "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
 
-- 
1.7.9.5


