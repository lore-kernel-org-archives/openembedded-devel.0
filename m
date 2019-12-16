Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E59957F870
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 05:46:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBG5kjVc023568
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 21:46:45 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 15 Dec 2019 21:46:44 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Dec 2019 13:46:43 +0800
Message-ID: <1576475203-260422-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce-dusk-gtk3: correct invalid SRC_URI
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
X-List-Received-Date: Mon, 16 Dec 2019 05:46:44 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

original SRC_URI is invalid now, and current upstream address
is such a long address(see below), and this package has not been
updated since 2011, so use http://sources.openembedded.org/.

https://dllb2.pling.com/api/files/download/id/1460766718/s/938c137c59bf7f1a6a6cc100c940feafd6904dc6478d5f96d09f3a631f9708e559055433db9e97654b196881fecbae445f094347befba0a5e477e961a73a7434/t/1576230019/c/a3f98e1fd43cfd072d46d7bedf6646191f5a020476297e0da678723a0078b9b8d284736bb34c4e876389b4e518777dc6a23c8666bb6bd42ceb1b893c9c264cce/lt/download/141404-xfce_dusk_gtk3-1_3.tar.gz

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
index b05c748..89dab49 100644
--- a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 inherit allarch
 
-SRC_URI = "http://xfce-look.org/CONTENT/content-files/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "http://sources.openembedded.org/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
 SRC_URI[md5sum] = "b3ad37ad8173b14ec090e60a80e65d8f"
 SRC_URI[sha256sum] = "bfa8a88607d1a1da5bd0b9e4e075767c54400a3c5a0fae88b619ed71532f30b4"
 
-- 
2.7.4


