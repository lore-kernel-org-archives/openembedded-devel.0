Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A61A66067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU8seTM027269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 00:54:40 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 30 Dec 2015 00:54:39 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Dec 2015 16:54:37 +0800
Message-ID: <798a2bf84dd3fc2bce39f8576e6ee35925d8209a.1451465023.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451465023.git.yi.zhao@windriver.com>
References: <cover.1451465023.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 1/2] polkit-gnome: remove unrecognized configure options
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
X-List-Received-Date: Wed, 30 Dec 2015 08:54:42 -0000
Content-Type: text/plain

Fix QA warning:
WARNING: QA Issue: polkit-gnome: configure was passed unrecognised options:
--disable-examples --disable-introspection [unknown-configure-option]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/polkit/polkit-gnome_0.105.bb  |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
index be33908..8e99731 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
@@ -13,11 +13,7 @@ SRC_URI = "https://download.gnome.org/sources/polkit-gnome/${PV}/polkit-gnome-${
 SRC_URI[md5sum] = "50ecad37c8342fb4a52f590db7530621"
 SRC_URI[sha256sum] = "1784494963b8bf9a00eedc6cd3a2868fb123b8a5e516e66c5eda48df17ab9369"
 
-#PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
-
 EXTRA_OECONF = "\
-    --disable-examples \
-    --disable-introspection \
     --disable-static \
 "
 
-- 
1.7.9.5


