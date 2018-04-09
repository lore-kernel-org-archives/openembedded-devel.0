Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 949DF74B7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 09:43:18 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s9so8523672qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 02:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cE+9zfiLbyC8PT4seA/FFMIT04wUFcmELfsBEfEnL3s=;
	b=jPeMGP6oJ3imjRFNWnOBkPPZG38+jmZIuOEIrTVUpcseJYWor49OWFm5EfS9l33Dzi
	ZymP0B4hStD2T5YnuYrfBzvbFMpi4oV+FwKe8e9Tw1h8zENNjd2UnejuYedWTBkaFg/t
	ABBxLFR98FrPXi4bdB9fznTlgK1aUvEyRQn/vG0Vj9EXkz6++PfUejo4cctI+7ERcYwv
	++t6G3dZgOvH2aM3SLDHDP7liME7UsH9XcwJzJn10+PcUnos12J7J8fd7hndNtc6+P8S
	y3G3fkKTbHEZ7vP3NxuzGuMv//4dpT8V/CLO4ttzlFvs7DF5I/AF1N9EjJhYwktzsj+u
	3knQ==
X-Gm-Message-State: ALQs6tDSaLHJCfOH9nShd+NPbLgjB1AZI90Ceu9PqclrYq69vHMpXUdp
	a2xhXyUWsWuy3isPr7PSdZlfqltu
X-Google-Smtp-Source: AIpwx48RUlj5VpGBzeyUAnBehfefBQXijRFv+ypP7WdzPdi8c1lJYZ/zzA6gW26QXT0IRuPvFEvO0w==
X-Received: by 10.55.100.139 with SMTP id y133mr48425936qkb.225.1523266998893; 
	Mon, 09 Apr 2018 02:43:18 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o4sm13017097qkl.69.2018.04.09.02.43.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 02:43:16 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2018 10:43:14 +0100
Message-Id: <20180409094314.13203-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python-pybluez: add python3 version
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
X-List-Received-Date: Mon, 09 Apr 2018 09:43:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

* The python3 version was missing
* This also depends on 'fcntl'

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v2:
* also add missing dependency (fcntl)
---
 .../recipes-devtools/python/python-pybluez.inc      | 21 +++++++++++++++++++++
 .../recipes-devtools/python/python-pybluez_0.22.bb  | 19 ++-----------------
 .../recipes-devtools/python/python3-pybluez_0.22.bb |  2 ++
 3 files changed, 25 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pybluez.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pybluez_0.22.bb

diff --git a/meta-python/recipes-devtools/python/python-pybluez.inc b/meta-python/recipes-devtools/python/python-pybluez.inc
new file mode 100644
index 000000000..399fe579f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pybluez.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Bluetooth Python extension module"
+HOMEPAGE = "http://karulis.github.io/pybluez/"
+SECTION = "devel/python"
+
+DEPENDS = "bluez5"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
+
+inherit pypi
+
+SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
+SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
+SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
+
+S = "${WORKDIR}/PyBluez-${PV}"
+
+RDEPENDS_${PN} += "\
+    bluez5 \
+    ${PYTHON_PN}-fcntl \
+"
diff --git a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
index eab9c5420..3158f4b64 100644
--- a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Bluetooth Python extension module"
-HOMEPAGE = "http://karulis.github.io/pybluez/"
-SECTION = "devel/python"
-
-RDEPENDS_${PN} = "bluez5"
-DEPENDS = "bluez5"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
-
-inherit pypi setuptools
-
-SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
-SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
-SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
-
-S = "${WORKDIR}/PyBluez-${PV}"
+require python-pybluez.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
new file mode 100644
index 000000000..9712a7608
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
@@ -0,0 +1,2 @@
+require python-pybluez.inc
+inherit setuptools3
-- 
2.16.2


