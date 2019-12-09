Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4277F642
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 07:48:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB97mvip000227
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Dec 2019 23:48:57 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 8 Dec 2019 23:48:45 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Dec 2019 15:48:42 +0800
Message-ID: <20191209074842.19401-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][Patch] blueman: disable appindicator support
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
X-List-Received-Date: Mon, 09 Dec 2019 07:48:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libappindicator is a library to allow applications to export a menu into
the Unity Menu bar. Unity is not supported in openembedded, so disable
appindicator support for blueman.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
index 96c8bb26c..0ea7f6de9 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
 SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
 
 EXTRA_OECONF = " \
+    --disable-appindicator \
     --disable-runtime-deps-check \
     --disable-schemas-compile \
 "
-- 
2.17.1


