Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id ECBA678493
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:23 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s3so15131367qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NlDDi6BBP4Ww8r2KaVrNDLcPcMuA1iPurOItqJ5pg/U=;
	b=uSLLqN94pd7Vgdz5gOuaeNykPWEET6l92SAraVj2rk68Y80XJ47VHdVunG2/AEg0tA
	3EOlDUvxLPo43YPZ2Za4cqHGOSrHGBQ8W0KVkBtdF+3zbts5bzA2tVsUiuCXZO2v/Y+p
	/ZMpOSoDmKJqwVqpNhfLp4+mNGP1mpK+rMNBLlWJoazEsMFH+5BIN7TQwdIb4bVP09DE
	8Ish9umG2bly4S0jDF4x/OPLY8UHqTq4kKFDVF8xFLVSRM2RrSH2I8mDmovHnT4+U+Ez
	B7rFEjip1/m3QRprao/SjnZHHUfdHwtdLWf8f216OdGfedfVE/MupY8t5v2DD7CrBmaI
	KMbA==
X-Gm-Message-State: AKwxytfHaNqmpUHweCydEPW8Pn5IR/b6zrlsMzQZuCqpybK/7IpFEiR8
	OjN7Y1Oodg5VvH4Len7qEV3bfUbN
X-Google-Smtp-Source: AH8x2266HGNyFW9s566d9/QOReXotedbhhK81nj7fe/Ey4vNxU5fx/97QQyeASoNMbOQxkNVNTo5+A==
X-Received: by 10.55.24.138 with SMTP id 10mr6415697qky.358.1516551684687;
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:31 -0500
Message-Id: <1516551637-32255-5-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 04/10] Remove deprecated python3-argparse from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:24 -0000

The python3-argparse package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb         | 1 -
 meta-python/recipes-devtools/python/python-can.inc                  | 1 -
 meta-python/recipes-devtools/python/python-can_2.0.0.bb             | 1 +
 meta-python/recipes-devtools/python/python-chardet.inc              | 1 -
 meta-python/recipes-devtools/python/python-chardet_3.0.4.bb         | 2 ++
 meta-python/recipes-devtools/python/python-django.inc               | 1 -
 meta-python/recipes-devtools/python/python-django_1.11.9.bb         | 2 +-
 meta-python/recipes-devtools/python/python-pyserial.inc             | 1 -
 meta-python/recipes-devtools/python/python-pyserial_3.4.bb          | 2 +-
 meta-python/recipes-devtools/python/python-pytest-runner.inc        | 2 +-
 meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python-pytest.inc               | 1 -
 meta-python/recipes-devtools/python/python-pytest_3.3.2.bb          | 1 +
 meta-python/recipes-devtools/python/python-setuptools-scm.inc       | 2 +-
 meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb | 2 ++
 meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb     | 1 -
 16 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 976aafb..ff08361 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -30,7 +30,6 @@ EXTRA_OECONF = "--disable-integration-tests"
 
 FILES_${PN}-bin = "${bindir}"
 RDEPENDS_${PN}-bin = " \
-    python3-argparse \
     python3-compression \
     python3-core \
     python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 802098a..8cdd4d3 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "da89e94fa234d4ebe7f43a26d4b06a5d14ea767fbd2c4767732e4d9644
 PYPI_PACKAGE="python-can"
 
 RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-logging \
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0.bb b/meta-python/recipes-devtools/python/python-can_2.0.0.bb
index a698ad3..fcfde2f 100644
--- a/meta-python/recipes-devtools/python/python-can_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-can_2.0.0.bb
@@ -2,5 +2,6 @@ require python-can.inc
 inherit pypi setuptools
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-zlib \
 "    
diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 246a65a..6305299 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -19,6 +19,5 @@ FILES_${PN}-cli += " \
 "
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-logging \
 "
diff --git a/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
index b7a46e9..3b6feee 100644
--- a/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-chardet.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 8fff75d..9287715 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -14,7 +14,6 @@ FILES_${PN} += "${datadir}/django"
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.9.bb b/meta-python/recipes-devtools/python/python-django_1.11.9.bb
index ed92c9b..db48ffd 100644
--- a/meta-python/recipes-devtools/python/python-django_1.11.9.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.11.9.bb
@@ -1,4 +1,4 @@
 require python-django.inc
 inherit setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse ${PYTHON_PN}-zlib"
diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 8fe3f2c..52a7e05 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -31,7 +31,6 @@ FILES_${PN}-win32 = " \
 "
 
 RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
index 91a0f26..0497087 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
@@ -1,4 +1,4 @@
 inherit setuptools
 require python-pyserial.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-importlib"
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse ${PYTHON_PN}-importlib"
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index 262448d..7546743 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -10,7 +10,7 @@ inherit pypi
 DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-argparse ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
+RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
                   ${PYTHON_PN}-io"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb b/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
index 0a5055c..1765a73 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
+++ b/meta-python/recipes-devtools/python/python-pytest-runner_3.0.bb
@@ -2,4 +2,4 @@ inherit setuptools
 require python-pytest-runner.inc
 
 # Dependency only exists for python2
-RDEPENDS_${PN} += "python-compiler"
+RDEPENDS_${PN} += "python-argparse python-compiler"
diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 17d8233..c997da9 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -10,7 +10,6 @@ SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools
                    file://pytest_version_fix.patch "
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb b/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
index d7bd0a4..201ab05 100644
--- a/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_3.3.2.bb
@@ -2,6 +2,7 @@ inherit pypi setuptools
 require python-pytest.inc
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-compiler \
     ${PYTHON_PN}-funcsigs \
 "
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index 7a58f14..eb66580 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "e163e8a12d2121f77575773cfc2b5988275dc1f1d2541fdf780127c29d
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
 
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-argparse ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
+RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
 RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
index 5f9bb0b..64b36e3 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-setuptools-scm.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-argparse"
diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
index 436a664..0ca58c7 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb
@@ -22,7 +22,6 @@ DISTUTILS_INSTALL_ARGS = "--prefix=${D}/${prefix} \
 FILES_${PN} += "${datadir}/*"
 
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-logging \
-- 
2.7.4


