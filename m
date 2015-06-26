Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16B6875666
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 07:05:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q75iHp004210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 00:05:44 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 26 Jun 2015 00:05:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 15:05:38 +0800
Message-ID: <27f5d83a5566a5f28a636e6885d255a0f7801b8f.1435302128.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435302128.git.yi.zhao@windriver.com>
References: <cover.1435302128.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/1] fingerterm: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 26 Jun 2015 07:05:43 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
index 155d282..167d141 100644
--- a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -17,27 +17,27 @@ SRC_URI = " \
 SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
 SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 FILES_${PN} = " \
-    ${bindir}/${PN} \
-    ${datadir}/applications/${PN}.desktop \
-    ${datadir}/pixmaps/${PN}.png \
+    ${bindir}/${BPN} \
+    ${datadir}/applications/${BPN}.desktop \
+    ${datadir}/pixmaps/${BPN}.png \
 "
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${S}/${PN} ${D}${bindir}
+    install -m 0755 ${S}/${BPN} ${D}${bindir}
 
     sed -i -e '/Exec.*/d' fingerterm.desktop
     sed -i -e '/Icon.*/d' fingerterm.desktop
 
-    echo 'Exec=${bindir}/${PN}' >> fingerterm.desktop
-    echo 'Icon=${PN}' >> fingerterm.desktop
+    echo 'Exec=${bindir}/${BPN}' >> fingerterm.desktop
+    echo 'Icon=${BPN}' >> fingerterm.desktop
 
     install -d ${D}${datadir}/applications
-    install -m 0644 ${S}/${PN}.desktop ${D}${datadir}/applications
+    install -m 0644 ${S}/${BPN}.desktop ${D}${datadir}/applications
 
     install -d ${D}${datadir}/pixmaps
-    install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps
+    install -m 0644 ${S}/${BPN}.png ${D}${datadir}/pixmaps
 }
-- 
1.7.9.5


