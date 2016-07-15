Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8B57731A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:05:59 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p126so1743751qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IU3jlbazl4baWU0Cyp0mm82AHHF7hW0FJbQPvt1IEaA=;
	b=Y5j4eosLa7EFkZasCfcOdLPYGqwqTa1HUunCEtR7YpBQBHhnxZRmH+2P4qBhUUJMc/
	zy32FmaMoszn/hAAL8U38gDGLNu2F8UGHRO20mh14TmePiDN5SPAnGeN/vqw35NGNWCA
	hGOE+g7R0fLBr7pNSmqID9DdT1oIDNl0voWhTUEPWRlm62EwpnFDa1DBSQIMUYboFIPu
	T4qhCLNjXy4PpI1KCcDDNF4QJ6z345+Lhme30YHVYUflgpwFLNQWWq/OgHw1XkGFD4e5
	Pf/CD8b6JObr2bybxS4lW2xzIS9meajuxG+341pK/qAnDaSVslE7FKBrwcV7lVwKImdm
	Mgfw==
X-Gm-Message-State: ALyK8tJXrzJjFgLOgnYQRbrpu94uRDB7t/FCaiPgO3FWpMqa/oyjes8kVnGalLq148KlyA==
X-Received: by 10.55.190.199 with SMTP id o190mr5050941qkf.192.1468609559849; 
	Fri, 15 Jul 2016 12:05:59 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	l32sm1825718qta.23.2016.07.15.12.05.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 12:05:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:05:50 -0400
Message-Id: <1468609550-20910-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-dbusmock: update to version 0.16.6 and update required RDEPENDS
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
X-List-Received-Date: Fri, 15 Jul 2016 19:06:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n-dbusmock_0.10.1.bb => python-dbusmock_0.16.6.bb} | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbusmock_0.10.1.bb => python-dbusmock_0.16.6.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
rename to meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb
index 2520bfc..4b3d201 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb
@@ -2,20 +2,25 @@
 
 SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
 AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
-SECTION = "devel/python"
 
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-DEPENDS += "python-pygobject python-dbus"
-
-SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
-SRC_URI[md5sum] = "7370d325c4a75494dd71885ca65b79e8"
-SRC_URI[sha256sum] = "03aadc93bdc26ea18d4d78fcff7b6cb34f4e18623bc5cc41cf9539d663cee11e"
+SRC_URI[md5sum] = "6af369964653098f2cd5e7c4e060a533"
+SRC_URI[sha256sum] = "87c551030369005a6c818d9f27e931090bff837e70af060b65281e9ea77108cf"
 
 SRC_URI += " \
     file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
     file://0002-Add-possibility-to-import-templates-from-packages.patch \
 "
 
-inherit setuptools
+PYPI_PACKAGE = "python-dbusmock"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dbus \
+    ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-xml \
+    "
-- 
1.9.1


