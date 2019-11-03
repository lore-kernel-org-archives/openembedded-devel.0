Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 25E437F781
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2019 00:37:56 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 3so9627351pfb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Nov 2019 17:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LEc0aK5UTeu9RqQkMPcy4qSs7z3KNQ75ukiswco9qvc=;
	b=jpY10xFDe24xczdCxwC9pDyLvun6vWsKpRQPPvu+rLjVNKAyt519F60cZzS8IW/KUI
	hOwC9LESNiIylrO8V0b8/mkDkGXc4ZmNR4f1PBqAwZ1TpyKyfyBKz+anT0ITr8hAlhuf
	bU3yKGYWabqH+/VQsnO2JUYkFQ1pkUg/XrDsR2wzqakQc9kYsTvjUCJt1aejGZ4zZ/tW
	2L6eJ3j/wrcXBeLICgHZLO+ML9/B2AlLbYpWofJL7GkiQaT5GCUBw4tK3Un0SqjJTKEE
	Yz612twp9mZK5GFQI6JYTbLYnHq+Xyg3iq9BQbfTK/kHMNxFZ50FD/uDF9ElDpIa5CiA
	2EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LEc0aK5UTeu9RqQkMPcy4qSs7z3KNQ75ukiswco9qvc=;
	b=Vv4M0OnBIpCeARVS3sw6J2pLN45CceHy1cAQ2y+KGVI75rh2K7mguGnTxobWopl2fx
	ziyagLKrVh+BkYvKzN8k1zhHhYc2ZZ9ygez/lEKBdZak6/FZynu0wUZ9P4mj9o+gItz0
	+OiDo3DrMZk6/c60yIJOHs6kJ6sTtBumfvEKXGA4BT1YG+dmdN9ZZLlR/uWsaxyypB5y
	VcbiSk/9N6DUhsIuoD8YsFWrsn083p0rJKHBxi5K17NlekwwSoLbrDSrnyArdBoYL13f
	wuzXNaq90N1OcYHgWnk9MmCKVnmIxsDjha6c3aZ4NXaEnK47iSafvR/15kzkk120cpHX
	kJSg==
X-Gm-Message-State: APjAAAVT6Cn8uyDXaLyWlRZAczTkO63xqKklpyGJgLv0SJmdfbn+Dqyt
	7hDh5GksS8nKww4fu/nbbKZMuDQFvPY=
X-Google-Smtp-Source: APXvYqxyHYjS3F0I4gx3cD500qvD7Z4zUP7OSEfVEyYuiY9z3CRy4P+xx0wsUsBNQ15aPvfbqXv75g==
X-Received: by 2002:a63:2057:: with SMTP id r23mr23459992pgm.274.1572741476336;
	Sat, 02 Nov 2019 17:37:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	129sm11256685pfg.38.2019.11.02.17.37.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 02 Nov 2019 17:37:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Nov 2019 17:37:41 -0700
Message-Id: <20191103003742.1595-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-docutils: Upgrade to 0.15.2
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
X-List-Received-Date: Sun, 03 Nov 2019 00:37:56 -0000
Content-Transfer-Encoding: 8bit

- License-Update: Formatting changes due to change in SRC_URI
- This is reflected as latest release on PyPI
- Add python3 variant
- Add python3 variant to meta-python packagegroup

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb  |  2 +-
 .../python/python-docutils_0.14rc2.bb          | 18 ------------------
 .../python/python-docutils_0.15.2.bb           | 15 +++++++++++++++
 .../python/python3-docutils_0.15.2.bb          | 15 +++++++++++++++
 4 files changed, 31 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 42f416346d..bb05de1f55 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -77,7 +77,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
     python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
     python3-flask-script python3-cassandra-driver python3-cython python3-ujson python3-aws-iot-device-sdk-python \
-    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
+    python3-pytest-runner python3-pyiface python3-docutils python3-flask-login python3-markupsafe python3-setuptools-scm \
     python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
     python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
     python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
diff --git a/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb b/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
deleted file mode 100644
index 68436a1a54..0000000000
--- a/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=35a23d42b615470583563132872c97d6"
-
-DEPENDS = "python"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "2f4bee6451958252f7bec71f18b05be3"
-SRC_URI[sha256sum] = "3caee0bcb2a49fdf24fcfa70849a60abb7a181aa68b030f7cb7494096181830c"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
new file mode 100644
index 0000000000..d26e81908b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-docutils_0.15.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Text processing system for documentation"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+
+inherit pypi setuptools
+
+PYPI_PACKAGE = "docutils"
+
+SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
+SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
new file mode 100644
index 0000000000..321f55572f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Text processing system for documentation"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "docutils"
+
+SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
+SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
+
+BBCLASSEXTEND = "native"
+
-- 
2.23.0


