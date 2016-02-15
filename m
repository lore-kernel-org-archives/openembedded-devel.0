Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 811A870034
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:05:26 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e61so9842225qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hmZmvibj8dEZm1QigmvaOVHdDgjGn7I+pxIGyFv72fk=;
	b=V3wKylV2Px8kseooUr4wg8I8NcKTyASSFSsQlphZxxaSzJMtIsguAE193/1e8RKKOe
	hDESuvHW/iGqC9Aq7knbdmqCAHvQGjge1jw9/NgoLTB4kyixF4wrMEmiYbXPW/3yb2In
	y2QOvncvnFpidVtXOax0HgFcvXz8vE1wo56NKjbuS5aLIDs6Ma3mkiR8tg4+iQCo3jC8
	dQj7BUTBLDJq6oaV8UtAEf19z2rP0sglcFvb2e5ViGz7xEfB6uDN48xAt+vjdjOSAn5W
	rrOclDYdlfg/AHMfgfASfOxFAZa/Cm+hoYjYBR4hpqKJFUkXP1G55/9JUSxxgSZjNQa1
	D3Dw==
X-Gm-Message-State: AG10YOTbkFkTpH8t1DYiSj3CoNXIGX6GaWFfAA/04d70YCFxOg0jyCjHrJjkjjr00Nf1LQ==
X-Received: by 10.140.134.144 with SMTP id 138mr5286721qhg.63.1455509127350;
	Sun, 14 Feb 2016 20:05:27 -0800 (PST)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s64sm10387543qgd.28.2016.02.14.20.05.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 20:05:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 23:05:15 -0500
Message-Id: <1455509118-16863-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 1/4] Update pypi classes to avoid setuptools inherit to be more flexible
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
X-List-Received-Date: Mon, 15 Feb 2016 04:05:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi-common.bbclass | 21 ---------------------
 meta-python/classes/pypi.bbclass        | 24 +++++++++++++++++++++++-
 meta-python/classes/pypi3.bbclass       |  1 -
 3 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/classes/pypi-common.bbclass
 delete mode 100644 meta-python/classes/pypi3.bbclass

diff --git a/meta-python/classes/pypi-common.bbclass b/meta-python/classes/pypi-common.bbclass
deleted file mode 100644
index 365002e..0000000
--- a/meta-python/classes/pypi-common.bbclass
+++ /dev/null
@@ -1,21 +0,0 @@
-def pypi_package(d):
-    bpn = d.getVar('BPN', True)
-    if bpn.startswith('python-'):
-        return bpn[7:]
-    elif bpn.startswith('python3-'):
-        return bpn[8:]
-    return bpn
-
-PYPI_PACKAGE ?= "${@pypi_package(d)}"
-
-def pypi_src_uri(d):
-    package = d.getVar('PYPI_PACKAGE', True)
-    pv = d.getVar('PV', True)
-    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.tar.gz' % (package[0], package, package, pv)
-
-PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
-
-HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
-S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 8d8350a..659e1c0 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -1 +1,23 @@
-inherit pypi-common setuptools
+def pypi_package(d):
+    bpn = d.getVar('BPN', True)
+    if bpn.startswith('python-'):
+        return bpn[7:]
+    elif bpn.startswith('python3-'):
+        return bpn[8:]
+    return bpn
+
+PYPI_PACKAGE ?= "${@pypi_package(d)}"
+PYPI_PACKAGE_EXT ?= "tar.gz"
+
+def pypi_src_uri(d):
+    package = d.getVar('PYPI_PACKAGE', True)
+    package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
+    pv = d.getVar('PV', True)
+    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+
+PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
+
+HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+SECTION = "devel/python"
+SRC_URI += "${PYPI_SRC_URI}"
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
diff --git a/meta-python/classes/pypi3.bbclass b/meta-python/classes/pypi3.bbclass
deleted file mode 100644
index e0f7bb3..0000000
--- a/meta-python/classes/pypi3.bbclass
+++ /dev/null
@@ -1 +0,0 @@
-inherit pypi-common setuptools3
-- 
1.9.1


