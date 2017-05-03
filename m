Return-Path: <JOFR@foss.dk>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 14:23:12 UTC
Received: from mail.foss.dk (mail.foss.dk [193.182.166.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7149871BD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 14:23:12 +0000 (UTC)
Received: from [127.0.1.1] (172.20.20.88) by FOSS47.foss.net (172.17.48.47)
	with Microsoft SMTP Server id 14.3.301.0; Wed, 3 May 2017 16:17:48 +0200
From: Johann Fridriksson <jofr@foss.dk>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 May 2017 14:16:35 +0000
Message-ID: <1493820995-9072-1-git-send-email-ntlm-jofr@foss.dk>
X-Mailer: git-send-email-ntlm 0.0.1
MIME-Version: 1.0
X-Originating-IP: [172.20.20.88]
X-TM-AS-Product-Ver: SMEX-10.2.0.1135-8.000.1202-23046.007
X-TM-AS-Result: No--6.695000-8.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Subject: [meta-python][PATCH] python-networkmanager: Recipe for python-networkmanager
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
X-List-Received-Date: Wed, 03 May 2017 14:23:13 -0000
Content-Type: text/plain

Created a new recipe for python-networkmanager 2.0.1. Depends on
python-dbus, python-six and networkmanager.
---
 .../python-networkmanager/python-networkmanager_2.0.1.bb    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb

diff --git a/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb b/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
new file mode 100644
index 0000000..4e41aa5
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
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
-- 
2.7.4


