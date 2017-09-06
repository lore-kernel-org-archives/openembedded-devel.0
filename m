Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5FED77D81
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTgI8027105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:42 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:10 -0500
Message-ID: <1504725809-12825-13-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/31] python-networkmanager: Move to networking, requires networkmanager
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:41 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python-networkmanager/python-networkmanager_2.0.1.bb    | 13 +++++++++++++
 .../python-networkmanager/python-networkmanager_2.0.1.bb    | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
 delete mode 100644 meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb

diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
new file mode 100644
index 0000000..4e41aa5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Easy communication with NetworkManager from Python"
+HOMEPAGE = "https://github.com/seveas/python-networkmanager"
+LICENSE = "Zlib"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
+
+SRC_URI[md5sum] = "5fc644a65463031295c6b7dd51a0f1bd"
+SRC_URI[sha256sum] = "bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515a0a517"
+
+PYPI_PACKAGE = "python-networkmanager"
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "networkmanager python-dbus python-six"
diff --git a/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb b/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
deleted file mode 100644
index 4e41aa5..0000000
--- a/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Easy communication with NetworkManager from Python"
-HOMEPAGE = "https://github.com/seveas/python-networkmanager"
-LICENSE = "Zlib"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
-
-SRC_URI[md5sum] = "5fc644a65463031295c6b7dd51a0f1bd"
-SRC_URI[sha256sum] = "bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515a0a517"
-
-PYPI_PACKAGE = "python-networkmanager"
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "networkmanager python-dbus python-six"
-- 
1.8.3.1


