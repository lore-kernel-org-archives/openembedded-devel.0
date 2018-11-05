Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DCA8B79E38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 05:59:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA55xLKC020086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Nov 2018 21:59:21 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 4 Nov 2018 21:59:20 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Nov 2018 00:59:15 -0500
Message-ID: <20181105055915.148218-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH] libunique: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Mon, 05 Nov 2018 05:59:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libunique shows installed-vs-shipped QA issue if configure option
'--disable-introspection' is set by:
1) in gobject-introspection*.bbclass that the 'qemu-usermode' is not
   supported by bsp and then not set in MACHINE_FEATURES
or:
2) set in local.conf directly:
   EXTRA_OECONF_append_pn-libunique = " --disable-introspection"

Remove empty directory to fix the QA issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
index 49ed07ad9..a6475cef6 100644
--- a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
+++ b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
@@ -28,3 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 inherit autotools pkgconfig gobject-introspection distro_features_check gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
+
+do_install_append () {
+    rmdir --ignore-fail-on-non-empty ${D}${datadir}
+}
-- 
2.19.0.rc2


