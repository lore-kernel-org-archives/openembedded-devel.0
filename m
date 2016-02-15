Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A84B70034
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:05:27 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e61so9842245qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KZYuILkqWEhNAjm3YK9QvhLA3OBnZsHi7vKrXmtLbpw=;
	b=ZJ1eDAC3+ala28Dz43W4A1cFnjtM7pu0IBvNLiLShcvCuBEkHKst32WopouEUlmmu5
	RYbn8Zpnb5G+ewI1JJbsbLkSJs8DQErcQHgAXUQNb+MLh80z1uVFuraJ0XOYvekuFbWc
	W6LrqRoAqUbYHzXj1Yp2H0WwzLLTiNUGeng/HKtiJHrV+LKYfnmGj5qYUjbPZ/uBgvKa
	eb8WS5Sa+IK26SHjLtd/to4mNM/FPzJmnApJlIYCrYdLSMeufVnNEta2HSENpaio1KYZ
	Dofcrdc5m8A8W11pKM8PJ8rNmAmZikFed0WT4pifbd2SANDqoy63poCDuAGBs/k9ozhd
	9dRQ==
X-Gm-Message-State: AG10YOT67YdWI8XDk2SEi31MOAUVwSrHoVnrDqer4RrvhVvQPk7ggrHSKF4arK6RGCMizQ==
X-Received: by 10.141.4.135 with SMTP id g129mr2328004qhd.31.1455509128718;
	Sun, 14 Feb 2016 20:05:28 -0800 (PST)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s64sm10387543qgd.28.2016.02.14.20.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 20:05:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 23:05:17 -0500
Message-Id: <1455509118-16863-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455509118-16863-1-git-send-email-derek@asterius.io>
References: <1455509118-16863-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 3/4] Update python recipes to use the updated pypi class
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
X-List-Received-Date: Mon, 15 Feb 2016 04:05:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb | 2 +-
 meta-python/recipes-devtools/python/python-cffi_1.3.1.bb           | 2 +-
 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python-cryptography_1.1.bb     | 4 ++--
 meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python-enum34_1.0.4.bb         | 2 +-
 meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb   | 2 +-
 meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python-flask_0.10.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb       | 2 +-
 meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb    | 2 +-
 meta-python/recipes-devtools/python/python-jinja2_2.8.bb           | 2 +-
 meta-python/recipes-devtools/python/python-monotonic_0.4.bb        | 2 +-
 meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb        | 2 +-
 meta-python/recipes-devtools/python/python-passlib_1.6.5.bb        | 4 ++--
 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb        | 2 +-
 meta-python/recipes-devtools/python/python-psutil_2.2.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python-py_1.4.26.bb            | 2 +-
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb       | 2 +-
 meta-python/recipes-devtools/python/python-pymongo_3.2.bb          | 2 +-
 meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb      | 2 +-
 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb         | 2 +-
 meta-python/recipes-devtools/python/python-redis_2.10.5.bb         | 2 +-
 meta-python/recipes-devtools/python/python-requests_2.9.1.bb       | 4 ++--
 meta-python/recipes-devtools/python/python-six_1.10.0.bb           | 2 +-
 meta-python/recipes-devtools/python/python-tornado_4.3.bb          | 2 +-
 meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb      | 2 +-
 meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb         | 2 +-
 meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb           | 2 +-
 29 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
index ce121d6..adfe623 100644
--- a/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
+++ b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-certifi.inc
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
index f3cdbd9..867b292 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
@@ -6,6 +6,6 @@ DEPENDS = "libffi python-pycparser"
 SRC_URI[md5sum] = "deeba7c1fd32a66f1db587988d760c11"
 SRC_URI[sha256sum] = "d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220"
 
-inherit pypi
+inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
index 25326aa..dfc979b 100644
--- a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
 SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index b3eee03..16806fb 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
 SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                   python-pyasn1\
@@ -50,4 +50,4 @@ do_install_ptest() {
 
 FILES_${PN}-dbg += " \
     ${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
-    "
\ No newline at end of file
+    "
diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
index 2c6a8c8..1d3ba09 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13e982bf1b7b164b9d6d1665dac83873"
 SRCNAME = "daemonize"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                python-fcntl \
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
index 2ef5df1..3227c10 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
 SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
 SRC_URI[sha256sum] = "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
index c6dce37..510cedf 100644
--- a/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-flask-login.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
index 8daab00..d41d023 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-flask-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python-flask_0.10.1.bb
index 7ec8123..a0a28ab 100644
--- a/meta-python/recipes-devtools/python/python-flask_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask_0.10.1.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-flask.inc
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
index 227de54..f7e30cf 100644
--- a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
 SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
 SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
index 350925d..0e156be 100644
--- a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
+++ b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-itsdangerous.inc
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python-jinja2_2.8.bb
index 712c796..ec8e7ed 100644
--- a/meta-python/recipes-devtools/python/python-jinja2_2.8.bb
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.8.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-jinja2.inc
diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
index c97ed48..875dee2 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
 SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
index faadcec..b8f5f3f 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
@@ -3,7 +3,7 @@ LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
 SRCNAME = "paho-mqtt"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                python-math \
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
index 73ace94..11c598a 100644
--- a/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
@@ -1,2 +1,2 @@
-inherit pypi
-require python-passlib.inc
\ No newline at end of file
+inherit pypi setuptools
+require python-passlib.inc
diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
index 44b584e..ddc7b62 100644
--- a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
 SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
 SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
index 326d668..1d643eb 100644
--- a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
@@ -9,4 +9,4 @@ RDEPENDS_${PN} += " \
     python-subprocess \
     "
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.26.bb b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
index e606ed9..bb20a41 100644
--- a/meta-python/recipes-devtools/python/python-py_1.4.26.bb
+++ b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
 SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
index fbb6486..3ff2412 100644
--- a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d29d3ce07825100c58ca57eea171ab65"
 SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
 SRC_URI[sha256sum] = "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
 
-inherit pypi
+inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python-pymongo_3.2.bb
index 4038898..b1778b2 100644
--- a/meta-python/recipes-devtools/python/python-pymongo_3.2.bb
+++ b/meta-python/recipes-devtools/python/python-pymongo_3.2.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
index 3fc5142..092accd 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "aed742a7dbe55eb7f02dbb26719f554b9e92198c4b3c7ac501ad03bbb6
 
 SRC_URI += "file://import-simplejson-as-json.patch"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "\
   python-distutils \
diff --git a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
index 14dc85b..91b58af 100644
--- a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d04
 
 RDEPENDS_${PN} = "python-py"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python-redis_2.10.5.bb
index 6cb5288..6c3ca85 100644
--- a/meta-python/recipes-devtools/python/python-redis_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python-redis_2.10.5.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-redis.inc
diff --git a/meta-python/recipes-devtools/python/python-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python-requests_2.9.1.bb
index acc8c16..627bc95 100644
--- a/meta-python/recipes-devtools/python/python-requests_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python-requests_2.9.1.bb
@@ -1,4 +1,4 @@
-inherit pypi
+inherit pypi setuptools
 require python-requests.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
\ No newline at end of file
+RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
diff --git a/meta-python/recipes-devtools/python/python-six_1.10.0.bb b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
index 839a0e6..9075745 100644
--- a/meta-python/recipes-devtools/python/python-six_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-six.inc
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
index 5bbad50..55a48b8 100644
--- a/meta-python/recipes-devtools/python/python-tornado_4.3.bb
+++ b/meta-python/recipes-devtools/python/python-tornado_4.3.bb
@@ -1,3 +1,3 @@
-inherit pypi
+inherit pypi setuptools
 require python-tornado.inc
 RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl"
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
index 2e1d9e2..dd14608 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
+++ b/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-werkzeug.inc
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
index 79d097c..48df360 100644
--- a/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-whoosh.inc
diff --git a/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
index 16eeac3..3a4d709 100644
--- a/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
+++ b/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
@@ -1,2 +1,2 @@
-inherit pypi
+inherit pypi setuptools
 require python-xlrd.inc
-- 
1.9.1


