Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5712676A98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 123so468499wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D/uv30VdVVIky5F95DzqHVP8DbEfMNGW7mIGlQIzFrU=;
	b=DTYAF18xjJoxOmz7FbY/0EiDzBPyMoYMJhkbd5jpaiUDBfScFNu8r5S+5x/ym2SEYJ
	WGvbUNs3EvQa0BwkIvCeIIET3W69f6tSEHceQYqDKPTDNoS1d/2ipHFxoDOC+sat3u2v
	2+0zbCeIZG238LHfoveyz8cvBP+3crHCy+k/D8glGbm30ZJ1D5HetlnURfRxwwhvPK8o
	JxZXDJ2IqqEyLBGfnfvoALNCFDfkRw9kDRXr8NspZQ8DsbQkc08zHONyBsse1DwgoA8u
	s2OrVWbBg/N9Gn/7yulZQBn81XSoWKnBJ2lVdpFc6Zh5vlsi/m0oT+w9L01UWJZN2HiZ
	ciMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=D/uv30VdVVIky5F95DzqHVP8DbEfMNGW7mIGlQIzFrU=;
	b=YxwByAtZdK7cljau0B7j7r31VYG3iCrOhFrmADS5ZXo8+Fl117d8kT5uDQgJud+vmg
	/EnojhxF9EqKns/0rqfoc+Npi9tu2H5E3PdbnWFoZ2cYiai9QPSDQPhHRpucxTg3x7yS
	pElvgQpbmEYWbGJn9TgVJX+SS92yinmzEFaEpKmmjWCLcy4BAoI7PySWdXQS6ip4Ia37
	Kq9R5tR+V+ZfsNM+CJEoF2MN0Rg6urjDKe9kcUJa6r5gvpClpCAEV7Q4OxLdvXBDfAt5
	bioSG9jp5JYRwaAF6+ZN5aJrn0+5XhSHYoDE7KBeXUS8I/nun8hNAKdFeKyIRmofmQDg
	B7qA==
X-Gm-Message-State: AG10YOTp5PHH9b/CjDPNPSm5pyvojdtKt6d1U7MY1MIpJ+09zMY1jdiLcdT7ks8Y7NCqhQ==
X-Received: by 10.28.179.84 with SMTP id c81mr6218024wmf.30.1453505447511;
	Fri, 22 Jan 2016 15:30:47 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:46 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:05 +0100
Message-Id: <5b243ef2e63155b7d527d7d4c326be866c8e5f41.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 03/21] add pypi3 bbclass to make python3 recipe creation easier as well
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:47 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/classes/pypi-common.bbclass | 21 +++++++++++++++++++++
 meta-python/classes/pypi.bbclass        | 22 +---------------------
 meta-python/classes/pypi3.bbclass       |  1 +
 3 files changed, 23 insertions(+), 21 deletions(-)
 create mode 100644 meta-python/classes/pypi-common.bbclass
 create mode 100644 meta-python/classes/pypi3.bbclass

diff --git a/meta-python/classes/pypi-common.bbclass b/meta-python/classes/pypi-common.bbclass
new file mode 100644
index 0000000..365002e
--- /dev/null
+++ b/meta-python/classes/pypi-common.bbclass
@@ -0,0 +1,21 @@
+def pypi_package(d):
+    bpn = d.getVar('BPN', True)
+    if bpn.startswith('python-'):
+        return bpn[7:]
+    elif bpn.startswith('python3-'):
+        return bpn[8:]
+    return bpn
+
+PYPI_PACKAGE ?= "${@pypi_package(d)}"
+
+def pypi_src_uri(d):
+    package = d.getVar('PYPI_PACKAGE', True)
+    pv = d.getVar('PV', True)
+    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.tar.gz' % (package[0], package, package, pv)
+
+PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
+
+HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+SECTION = "devel/python"
+SRC_URI += "${PYPI_SRC_URI}"
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 41a70e2..8d8350a 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -1,21 +1 @@
-def pypi_package(d):
-    bpn = d.getVar('BPN', True)
-    if bpn.startswith('python-'):
-        return bpn[7:]
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
-
-inherit setuptools
+inherit pypi-common setuptools
diff --git a/meta-python/classes/pypi3.bbclass b/meta-python/classes/pypi3.bbclass
new file mode 100644
index 0000000..e0f7bb3
--- /dev/null
+++ b/meta-python/classes/pypi3.bbclass
@@ -0,0 +1 @@
+inherit pypi-common setuptools3
-- 
1.9.1


