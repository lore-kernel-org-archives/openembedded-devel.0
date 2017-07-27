Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 547A2782CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:44:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6R8icgN028265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 27 Jul 2017 01:44:38 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 01:44:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jul 2017 04:44:26 -0400
Message-ID: <bcb6604a65b59843ab3dd94a3d116c8df2c7d0ce.1501142861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] python3-blivetgui: add recipe 2.1.5
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
X-List-Received-Date: Thu, 27 Jul 2017 08:44:37 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python-blivet/python3-blivetgui_2.1.5.bb       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
new file mode 100644
index 0000000..ac507ca
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "GUI tool for storage configuration using blivet library"
+HOMEPAGE = "https://github.com/rhinstaller/blivet-gui"
+LICENSE = "GPLv2+"
+SECTION = "devel/python"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "52ae8c000843c05abd1d8749f44bbe2e5d891d3d"
+SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
+"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit setuptools3 python3native
+
+RDEPENDS_${PN} = "python3-pygobject python3 \
+                  python3-blivet gtk+3  \
+                  python3-pid libreport \
+"
+
+FILES_${PN} += " \
+    ${datadir}/* \
+    "
-- 
2.8.1


