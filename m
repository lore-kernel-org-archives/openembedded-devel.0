Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5956081A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:42:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t487gpAr021162
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:42:51 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:42:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:20 +0800
Message-ID: <1431070955-7100-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 05/20] takao-fonts: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 08 May 2015 07:42:50 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../takao-fonts/takao-fonts_003.02.01.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
index 0a0f6d1..ed875fa 100644
--- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
+++ b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://launchpad.net/takao-fonts/003.02/${PV}/+download/takao-fonts-t
 SRC_URI[md5sum] = "ca480e5edb9f26d871bf6df6cb910306"
 SRC_URI[sha256sum] = "2f526a16c7931958f560697d494d8304949b3ce0aef246fb0c727fbbcc39089e"
 
-S = "${WORKDIR}/${PN}-ttf-${PV}"
+S = "${WORKDIR}/${BPN}-ttf-${PV}"
 
 do_install() {
     install -m 0755 -d ${D}/${datadir}/fonts
-- 
1.7.9.5


