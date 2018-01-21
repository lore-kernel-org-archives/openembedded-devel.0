Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC4978745
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:25 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z11so15151713qtm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZwA2G9igCanPZtwJyUsGxwDvgqskvwJeXZ/+wFMkRX4=;
	b=XVMMDh7FMxldSR46A27+YGJsSqZC3keE0UWptPrgtGFSAcHeSw3vHwubY25vzP82ud
	D9fhMh5Pt3IPcT9ZpaAgtXC6JEvxe/ROi46WitgBNBnyQF6gXqKI3sa/HgBaa9cx4eV9
	dYXRgpltJnb6Aq/RkNacsnb5Ll6N7dunRn/nFkFC0er/hG3HWH1Y8nUFf4eRDY0zOgVT
	WdGg3iRdPHobNzYfNdX4RBBbNi2ngR/Ax3iW47MqPBVv6rh4jwdj61104fOHpo3ktySr
	kgnHGJAU8OTceRo9Upf+quBU8vbjYv5Kgw5HuOyjQGDkBUfY4JfZNwMODH1WJBpH2F1t
	ZPFg==
X-Gm-Message-State: AKwxytd0j0kRIixE0hdwvLrbuNEYSkFXcsOOJc7/hHxrnO1JXUgkMHrL
	joE5cUw38mVHVqrBmh3tHgepl0e0
X-Google-Smtp-Source: AH8x224Oq7CIJUnuRM12pfqrdLE0uqYPDng7hzVWpMEkrOpmUQ4i18m8tupqrgxTaVW8yQww3GwQLg==
X-Received: by 10.55.26.195 with SMTP id l64mr6078840qkh.150.1516551686663;
	Sun, 21 Jan 2018 08:21:26 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:34 -0500
Message-Id: <1516551637-32255-8-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 07/10] Remove deprecated python3-lang from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:25 -0000

The python3-lang package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jinja2.inc             | 2 +-
 meta-python/recipes-devtools/python/python-jinja2_2.10.bb         | 2 +-
 meta-python/recipes-devtools/python/python-jsonschema.inc         | 1 -
 meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb    | 1 +
 meta-python/recipes-devtools/python/python-pyasn1.inc             | 1 -
 meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb        | 4 ++++
 meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb | 4 ----
 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb      | 6 ------
 meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb     | 2 --
 9 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 72562fb..510765b 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea0
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-textutils \
-    ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
+    ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
     ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
 CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
index 19b2bfa..0607521 100644
--- a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
@@ -1,4 +1,4 @@
 inherit pypi setuptools
 require python-jinja2.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-re"
+RDEPENDS_${PN} += "${PYTHON_PN}-lang ${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index b602b27..748ef6e 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -11,7 +11,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
-    ${PYTHON_PN}-lang \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
index 55cbb20..c118f2d 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
@@ -5,5 +5,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-functools32 \
+    ${PYTHON_PN}-lang \
     ${PYTHON_PN}-re \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 2539101..f3c32e0 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] = "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-lang \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-math \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
index 4461918..a13c74d 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-pyasn1.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-lang \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
index f807042..f64e51d 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
@@ -4,7 +4,3 @@ require python-cryptography.inc
 SRC_URI += " \
     file://run-ptest \
 "
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-lang \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
index 0292555..a62d944 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -1,8 +1,2 @@
 require python-pyudev.inc
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-lang \
-"
-
 inherit pypi setuptools3
-
diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
index d7533d8..dfb9d4a 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
@@ -1,8 +1,6 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-RDEPENDS_${PN}-core += "python3-lang"
-
 FILES_${PN}-core_append += " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
-- 
2.7.4


