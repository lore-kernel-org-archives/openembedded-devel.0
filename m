Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E212371985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 08:27:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAA8R6iZ011084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 00:27:06 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 10 Nov 2016 00:27:05 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Nov 2016 16:26:09 +0800
Message-ID: <20161110082609.8513-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openjpeg: rename the download file
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
X-List-Received-Date: Thu, 10 Nov 2016 08:27:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Rename the download file to avoid collisions in DL_DIR.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
index d767adc..fa4f796 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.openjpeg.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
-SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[md5sum] = "0cc4b2aee0a9b6e9e21b7abcd201a3ec"
 SRC_URI[sha256sum] = "82c27f47fc7219e2ed5537ac69545bf15ed8c6ba8e6e1e529f89f7356506dbaa"
 
-- 
1.9.1


