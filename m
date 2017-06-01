Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CCAD677D1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:06 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n23so31978449pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZpPQV/0K55q8ec1Zs07rih49/3absHerraommC7VAfk=;
	b=ioEFj4MMxGkMj89YchWYxgbVh9GGSdXuAZsa6aQG4/h/k3GkeCeK770mqgXzfmX6Nv
	Tvz0Ll5VJMb8/MBIprg0Pwm5/ZL+ylLmCr6Kkg3QzFXk3BXnKFtrxO7C0nZpVQ/XMT4b
	bRIbBTvYF/PnP0Ajq+9jekIchQTNofjN56weQs6DMUBCfdGsHt5WWQZQEYvjWhgy0YXb
	iTx0qF6KSHUEAPPZ+XEbMWpD/v55WGTslX7fCnbPZr6U4SCgy1YRvrWPSVjVMDYqDzk+
	ujdxz15vFT9P6MrmUY8Li5xJ1Up6dPW9muBUXBc3OR7lKPu84dD2XOzHalH+/Z9Zd3HL
	P9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZpPQV/0K55q8ec1Zs07rih49/3absHerraommC7VAfk=;
	b=kxjb1wY/5el8EnYbuiKo2iCsDVGqqcZKWQyzuk8bdFNT+HcuPHDWaNnBW7LQwErPSF
	KxIpZo4VixbfwSJs/wfriMXgaFsVFq7JPd+CBiXXZ1hiQ489UbD6ggrRdLwSm+VUt/7n
	4NycKAMiorXC9/iQOarF0tEjJjyAFLVuyu9ncAdA74SWP03WkvpwC5oR+hYyVsjqxOcP
	KeU+cAAZxiBbGOYZpsAz9ZOnLcULXYkl7kDGvEhZlwwHjUWjOeZssIJoQOignQV8hlj1
	KaIMXyHXvQ1eeqcBcMugAj2pSxwxbPACYckpprO6f4uwxhPSl2ecJoKMU6yctn0C8hEF
	k2Tw==
X-Gm-Message-State: AODbwcC9+Z5p9MAY9LtDKnV/d5Q1e8RXmmiT6mQpw59DOkIGsmQrRJB3
	ok30EJ6tSTDN0Qruixm35w==
X-Received: by 10.99.127.26 with SMTP id a26mr1897355pgd.75.1496335387503;
	Thu, 01 Jun 2017 09:43:07 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:06 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:47 -0700
Message-Id: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 1/8] python-pyudev: Add possibility to build python3-pyudev
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:07 -0000

Extend recipe to support python3 as well.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../recipes-devtools/python/python-pyudev.inc      | 22 ++++++++++++++++++++
 .../python/python-pyudev_0.21.0.bb                 | 24 ++--------------------
 .../python/python3-pyudev_0.21.0.bb                |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyudev.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
new file mode 100644
index 0000000..7103e1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyudev.inc
@@ -0,0 +1,22 @@
+SUMMARY = "A libudev binding"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
+SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
+
+inherit pypi
+
+do_configure_prepend() {
+    sed -i "/import pyudev/d" ${S}/setup.py
+    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
+}
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
index 7253f88..1ce7c44 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -1,22 +1,2 @@
-SUMMARY = "A libudev binding"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
-
-inherit pypi setuptools
-
-do_configure_prepend() {
-    sed -i "/import pyudev/d" ${S}/setup.py
-    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
-}
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-threading \
-"
+require python-pyudev.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
new file mode 100644
index 0000000..1474ffa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -0,0 +1,2 @@
+require python-pyudev.inc
+inherit setuptools3
-- 
2.7.4


