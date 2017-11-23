Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1CD7884B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANC9exC014618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:09:40 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:10 -0500
Message-ID: <ff4f87d20f9fe76c9bb4bb4208c3eff7a9b2f8d5.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/15] meta-installer: add recipe packagegroup-installer-x11-anaconda
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:40 -0000
Content-Type: text/plain

It provides desktop X11 applications to support anaconda.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../packagegroup-installer-x11-anaconda.bb         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-installer/recipes-installer/packagegroups/packagegroup-installer-x11-anaconda.bb

diff --git a/meta-installer/recipes-installer/packagegroups/packagegroup-installer-x11-anaconda.bb b/meta-installer/recipes-installer/packagegroups/packagegroup-installer-x11-anaconda.bb
new file mode 100644
index 0000000..5255b3a
--- /dev/null
+++ b/meta-installer/recipes-installer/packagegroups/packagegroup-installer-x11-anaconda.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Tasks for desktop X11 applications to support anaconda"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
+XSERVER ??= ""
+
+RDEPENDS_packagegroup-installer-x11-anaconda = "\
+    dbus \
+    xinput-calibrator \
+    xserver-nodm-init \
+    ${XSERVER} \
+    liberation-fonts \
+    xauth \
+    xhost \
+    xset \
+    settings-daemon \
+    xrandr \
+    libsdl \
+    metacity \
+    gnome-themes \
+    adwaita-icon-theme \
+    pango \
+    pango-modules \
+    createrepo-c"
+
-- 
2.8.1


