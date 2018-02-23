Return-Path: <tomasz.meresinski@comarch.pl>
Received: from odzwierny3.comarch.com (odzwierny3.comarch.com [217.74.69.18])
	by mail.openembedded.org (Postfix) with ESMTP id BDC8178848
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 10:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny3.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1epB4g-0003cN-Hz; Fri, 23 Feb 2018 11:59:34 +0100
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Feb 2018 11:59:28 +0100
Message-Id: <1519383568-24625-1-git-send-email-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.7.4
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny3.comarch.com
X-CA-Is-Spam: No
Cc: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Subject: [meta-python][PATCH] python-systemd: fix dependencies
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
X-List-Received-Date: Fri, 23 Feb 2018 10:59:35 -0000

Python-systemd depends on python-syslog and python-logging (systemd/journal.py L28-29).
---
 meta-python/recipes-devtools/python/python-systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
index 808af82..5be5de0 100644
--- a/meta-python/recipes-devtools/python/python-systemd.inc
+++ b/meta-python/recipes-devtools/python/python-systemd.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 PYPI_PACKAGE = "systemd-python"
 DEPENDS += "systemd (<=234)"
-RDEPENDS_${PN} += "systemd"
+RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
 REQUIRED_DISTRO_FEATURES = "systemd"
 inherit pypi distro_features_check
 
-- 
2.7.4


