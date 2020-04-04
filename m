Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.3074.1586024489525004918
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 11:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id g23so10949411otq.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 11:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Np2khW6GebaXmvczG8M7ywUuo/RaMy6xZhL8eWUtVKU=;
        b=UrYdGmos6KhEF2LN0mfMmWonO5T+bp8pIjFdHnPLssA5D6ZbsV+vE5Kcqpgw2cmdml
         LHua1g+a1qtNd+eO9zDInYLyyRKqNN3YnoLqrVox48bJ2cgAW8pYd+o30ccMb4SBl0Vf
         g/NOHlQzFIsZBnvGwKyENxB7lm3YCSs3QjfZ4Lahg/EX5Swap0lqi6WZy7PzkKOWtmvx
         8lEZ/j5x/Ek8LC4XP0cFYae7QaTftKy8bLX3ei6CA8CnLjC+MUw0fbabCrZp0GJjaEki
         PniSLITiFsTnBbU5yGSX0NB2oCtaShX5VBLxOn+RRGFZrKFz7hemGdK3QKUkI/rukBNs
         Nttg==
X-Gm-Message-State: AGi0PuYpn2OCti7XhrCtZ0Fo8JUPWvcm7YUpFjbz5h92wR0/1sZYEoFR
	zVb00qs657r5CHP0qNLxGsI+Nsz6wy8=
X-Google-Smtp-Source: APiQypJQ+oAPVt0lZo73gHuUhIqZ3j30QvP3gaaoI0NLZgYUuXy+rM8tbx0BMTIYULdVbHOuHiAong==
X-Received: by 2002:a4a:df05:: with SMTP id i5mr11818754oou.9.1586024488471;
        Sat, 04 Apr 2020 11:21:28 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id j23sm3162059oib.32.2020.04.04.11.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:21:27 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 12/12] python-pytest: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 14:21:04 -0400
Message-Id: <20200404182104.21027-12-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404182104.21027-1-derek@asterius.io>
References: <20200404182104.21027-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pytest.inc | 41 -------------------
 ...he-setup_requires-for-setuptools-scm.patch |  0
 .../python/python3-pytest_5.3.5.bb            | 40 ++++++++++++++++--
 3 files changed, 37 insertions(+), 44 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest.inc
 rename meta-python/recipes-devtools/python/{python-pytest => python3-pytest}/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
deleted file mode 100644
index 40ca9c2f13..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Simple powerful testing with python"
-HOMEPAGE = "http://pytest.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
-
-SRC_URI[md5sum] = "d5ef453f723be46d93e0795f3be86c88"
-SRC_URI[sha256sum] = "0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d"
-
-SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
-                   "
-
-inherit update-alternatives
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pluggy \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-atomicwrites \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-pathlib2 \
-    ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-more-itertools \
-    ${PYTHON_PN}-packaging \
-"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pytest:"
-
-ALTERNATIVE_${PN} += "py.test pytest"
-
-NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
-ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
-
-ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
-ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
rename to meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb b/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
index eba6632a27..8dad13a9e1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
@@ -1,4 +1,38 @@
-inherit pypi setuptools3
-require python-pytest.inc
+SUMMARY = "Simple powerful testing with python"
+HOMEPAGE = "http://pytest.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-ALTERNATIVE_PRIORITY = "100"
+SRC_URI[md5sum] = "d5ef453f723be46d93e0795f3be86c88"
+SRC_URI[sha256sum] = "0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d"
+
+SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
+
+inherit update-alternatives pypi setuptools3
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pluggy \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-atomicwrites \
+    ${PYTHON_PN}-importlib-metadata \
+    ${PYTHON_PN}-pathlib2 \
+    ${PYTHON_PN}-wcwidth \
+    ${PYTHON_PN}-more-itertools \
+    ${PYTHON_PN}-packaging \
+"
+
+ALTERNATIVE_${PN} += "py.test pytest"
+
+NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
+ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
+
+ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
+ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

