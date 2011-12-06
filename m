Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RXp9l-00070N-Ls
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 08:09:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB672oMv008693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2011 23:02:50 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 5 Dec 2011 23:02:50 -0800
Message-ID: <8428e48877ddd9d2fa00e905dba1540982663424.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323141676.git.xiaofeng.yan@windriver.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 15:14:28 +0800
Date: Tue, 6 Dec 2011 14:58:24 +0800
To: <openembedded-devel@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH 09/10] task-core-gtk-directfb.bb: Add task list to run gtk over directfb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 07:09:38 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add task-core-gtk-directfb.bb to OE core for running gtk over directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../tasks/task-core-gtk-directfb.bb                |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/tasks/task-core-gtk-directfb.bb

diff --git a/meta/recipes-graphics/tasks/task-core-gtk-directfb.bb b/meta/recipes-graphics/tasks/task-core-gtk-directfb.bb
new file mode 100644
index 0000000..239e0c1
--- /dev/null
+++ b/meta/recipes-graphics/tasks/task-core-gtk-directfb.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "gkt+ over directfb without x11"
+PR = "r0"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+PACKAGES += " \
+	${PN}-base \
+"
+
+RDEPENDS_${PN}-base = " \
+		directfb \
+		directfb-examples \
+		pango \
+		pango-modules \
+		fontconfig \
+		gtk+ \
+		gtk-demo \
+		dropbear \
+		${TOUCH} \
+"
-- 
1.7.0.4



