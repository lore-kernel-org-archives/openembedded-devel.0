Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 772AA786EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:27 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s39so15157281qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YuK3OQlo5U+1gwcGkQA56hf7fl7es9EyBPtBM+7+tjU=;
	b=gvCgGlnMaxCfTEMUDhE2yctIMpUacSJzpHY3K7xGou2rb+q+3nIrzpbiUkzaT+ZL21
	JRwxTvaY6gbz7EBrBChme6SWq3hVmU3wn6v2hnBRrHS9VJqxjIuihj8b3sNC6iMRe+Kf
	VbyadjRXTkvNP0YN6TRgWOrqRAvd2oFmNszQNbWNH/AnCFLCJuKnQBJrjgjk3We6yzKJ
	wpblXiY9oLsEjFvsx2fts7pW/yADL8Z0FA7Aqbwpp26P4RIblV7H8iNy75JMOVzta7Ah
	zcmaJAgleGcl9XNN0qR7Z69/jmvAZeWY0GQwMlfHEIabpfjE9ouX60M0QW6/qF0hOtwI
	vCGg==
X-Gm-Message-State: AKwxytfuJbAvYgZBy7V1gQfZqvc50d1GOkVFzVgLc8iXw1MebUpOW9Y7
	73Xlzcjtb+E0ZedNIaDdrvMaZR8r
X-Google-Smtp-Source: AH8x224yiN+so1gDxOUkvJwAx9gvvbNcgTHAP7eh1V3zN0EZSCgpiOBP+qMjt42y/2FrAV4CCrCFMA==
X-Received: by 10.55.105.194 with SMTP id e185mr1474366qkc.350.1516551688298; 
	Sun, 21 Jan 2018 08:21:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:37 -0500
Message-Id: <1516551637-32255-11-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 10/10] Remove deprecated python3-subprocess from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:27 -0000

The python3-subprocess package was merged into core as part of the
json manifest migration

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb      | 1 -
 meta-python/recipes-devtools/python/python-asn1crypto.inc        | 1 -
 meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb  | 1 +
 meta-python/recipes-devtools/python/python-astroid.inc           | 1 -
 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb      | 1 +
 meta-python/recipes-devtools/python/python-attrs.inc             | 1 -
 meta-python/recipes-devtools/python/python-attrs_17.4.0.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-babel.inc             | 1 -
 meta-python/recipes-devtools/python/python-babel_2.5.3.bb        | 4 ++++
 meta-python/recipes-devtools/python/python-bcrypt.inc            | 1 -
 meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-can.inc               | 1 -
 meta-python/recipes-devtools/python/python-can_2.0.0.bb          | 1 +
 meta-python/recipes-devtools/python/python-cffi.inc              | 1 -
 meta-python/recipes-devtools/python/python-cffi_1.11.4.bb        | 4 ++++
 meta-python/recipes-devtools/python/python-cryptography.inc      | 1 -
 meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb | 1 +
 meta-python/recipes-devtools/python/python-cython.inc            | 1 -
 meta-python/recipes-devtools/python/python-cython_0.27.3.bb      | 3 ++-
 meta-python/recipes-devtools/python/python-django.inc            | 1 -
 meta-python/recipes-devtools/python/python-django_1.11.9.bb      | 6 +++++-
 meta-python/recipes-devtools/python/python-jsonschema.inc        | 1 -
 meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb   | 1 +
 meta-python/recipes-devtools/python/python-paho-mqtt.inc         | 9 ++++-----
 meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb    | 3 +++
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc    | 1 -
 .../recipes-devtools/python/python-prompt-toolkit_1.0.15.bb      | 4 ++++
 meta-python/recipes-devtools/python/python-psutil.inc            | 1 -
 meta-python/recipes-devtools/python/python-psutil_5.4.3.bb       | 4 ++++
 meta-python/recipes-devtools/python/python-pycparser.inc         | 1 -
 meta-python/recipes-devtools/python/python-pycparser_2.18.bb     | 4 ++++
 meta-python/recipes-devtools/python/python-pyinotify.inc         | 1 -
 meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb    | 4 ++++
 meta-python/recipes-devtools/python/python-pyperclip.inc         | 1 -
 meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb    | 5 ++++-
 meta-python/recipes-devtools/python/python-pyroute2.inc          | 1 -
 meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb    | 4 ++++
 meta-python/recipes-devtools/python/python-pyudev.inc            | 1 -
 meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb      | 1 +
 meta-python/recipes-devtools/python/python-tornado.inc           | 2 +-
 meta-python/recipes-devtools/python/python-tornado_4.5.3.bb      | 7 ++++++-
 meta-python/recipes-devtools/python/python-werkzeug.inc          | 1 -
 meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb    | 5 ++++-
 meta-python/recipes-devtools/python/python-whoosh.inc            | 1 -
 meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb       | 4 ++++
 meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb     | 1 -
 .../recipes-devtools/python/python3-vcversioner_2.16.0.0.bb      | 4 ----
 meta-python/recipes-extended/python-pyparted/python-pyparted.inc | 1 -
 .../recipes-extended/python-pyparted/python-pyparted_3.11.1.bb   | 2 +-
 49 files changed, 76 insertions(+), 39 deletions(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 9b7a381..30d41a1 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -39,7 +39,6 @@ RDEPENDS_${PN}-bin = " \
     python3-pickle \
     python3-shell \
     python3-stringold \
-    python3-subprocess \
     python3-threading \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 2777c21..5c37995 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -18,7 +18,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-subprocess \
 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
index 1218519..46aace2 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
@@ -2,5 +2,6 @@ inherit setuptools
 require python-asn1crypto.inc
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-textutils \ 
 "
diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index a71762c..213dde5 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -20,7 +20,6 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-lazy-object-proxy \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-wrapt \
     ${PYTHON_PN}-setuptools \
 "
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
index fd98630..687394d 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
@@ -6,4 +6,5 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-backports-functools-lru-cache \
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-singledispatch \
+    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index ea8d3bf..12410bf 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -10,5 +10,4 @@ inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-subprocess \
 "    
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb b/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
index a6fdf15..e3bec0f 100644
--- a/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-attrs.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index b1e8cc1..4dcb255 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -21,6 +21,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-pytz \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python-babel_2.5.3.bb b/meta-python/recipes-devtools/python/python-babel_2.5.3.bb
index e0eadcd..f7c166e 100644
--- a/meta-python/recipes-devtools/python/python-babel_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python-babel_2.5.3.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-babel.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
index 3e6fa7a..4490969 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt.inc
+++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
@@ -14,5 +14,4 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
index 2433354..b136aa4 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-bcrypt.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 2b15af4..70cde19 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -13,6 +13,5 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-sqlite3 \
 "
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0.bb b/meta-python/recipes-devtools/python/python-can_2.0.0.bb
index fcfde2f..f0edb64 100644
--- a/meta-python/recipes-devtools/python/python-can_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-can_2.0.0.bb
@@ -3,5 +3,6 @@ inherit pypi setuptools
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-zlib \
 "    
diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 9c934b2..39ab19f 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -11,7 +11,6 @@ RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-subprocess \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
index 3cd62d1..bc667b8 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
@@ -1,2 +1,6 @@
 require python-cffi.inc
 inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 80d6b0a..4be7907 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -28,7 +28,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-pycparser \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
index f5b1e0b..9c2f884 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
@@ -18,4 +18,5 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-ipaddress \
     ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 8d8f27c..6e424a9 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -14,7 +14,6 @@ inherit pypi
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-shell \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.3.bb b/meta-python/recipes-devtools/python/python-cython_0.27.3.bb
index bdf9490..d803a6e 100644
--- a/meta-python/recipes-devtools/python/python-cython_0.27.3.bb
+++ b/meta-python/recipes-devtools/python/python-cython_0.27.3.bb
@@ -5,5 +5,6 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Cython/"
 UPSTREAM_CHECK_REGEX = "/Cython/(?P<pver>(\d+[\.\-_]*)+)"
 
 RDEPENDS_${PN} += "\
-    python-distribute \
+    ${PYTHON_PN}-distribute \
+    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 3602a74..ac0808e 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -25,7 +25,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.9.bb b/meta-python/recipes-devtools/python/python-django_1.11.9.bb
index db48ffd..d2347cc 100644
--- a/meta-python/recipes-devtools/python/python-django_1.11.9.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.11.9.bb
@@ -1,4 +1,8 @@
 require python-django.inc
 inherit setuptools
 
-RDEPENDS_${PN} += "${PYTHON_PN}-argparse ${PYTHON_PN}-zlib"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-zlib \
+"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 8413692..6fdc024 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -18,7 +18,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-strict-rfc3339 \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-unittest \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
index 7407616..b677c64 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
@@ -7,5 +7,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-functools32 \
     ${PYTHON_PN}-lang \
     ${PYTHON_PN}-re \
+    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-textutils \ 
 "
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 6459e68..2316916 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -13,9 +13,8 @@ SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
 RDEPENDS_${PN} = "\
-               ${PYTHON_PN}-math \
-               ${PYTHON_PN}-io \
-               ${PYTHON_PN}-netclient \
-               ${PYTHON_PN}-threading \
-               ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
index f369b2e..a103117 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
@@ -1,3 +1,6 @@
 inherit setuptools
 require python-paho-mqtt.inc
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index f5ed349..cc409a4 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -10,7 +10,6 @@ PYPI_PACKAGE = "prompt_toolkit"
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-terminal \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-wcwidth \
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
index 76e8410..527c905 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-prompt-toolkit.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index b96d54f..5d8e61f 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -15,7 +15,6 @@ FILES_${PN}-tests += " \
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-xml \
 "
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
index bf402aa..9aabfb2 100644
--- a/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-psutil.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index f445a20..d112d9f 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -11,7 +11,6 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-ply \
     ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-subprocess \
     cpp \
     cpp-symlinks \
     "
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.18.bb b/meta-python/recipes-devtools/python/python-pycparser_2.18.bb
index adbc1a8..9874273 100644
--- a/meta-python/recipes-devtools/python/python-pycparser_2.18.bb
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.18.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-pycparser.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
index 7fcbb18..975f11c 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-io \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
index d1f84c3..0c9a2c7 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -1,2 +1,6 @@
 inherit setuptools
 require python-pyinotify.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
index c712fdd..e05de67 100644
--- a/meta-python/recipes-devtools/python/python-pyperclip.inc
+++ b/meta-python/recipes-devtools/python/python-pyperclip.inc
@@ -9,5 +9,4 @@ inherit pypi
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
index 6e93b81..6c9fcbd 100644
--- a/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
@@ -1,4 +1,7 @@
 inherit setuptools
 require python-pyperclip.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index 24e3555..f7b57d9 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -19,6 +19,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-unixadmin \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
index 7b9c8e0..f25f1b4 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
@@ -1,2 +1,6 @@
 require python-pyroute2.inc
 inherit setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
index ab4c5fd..cb906c9 100644
--- a/meta-python/recipes-devtools/python/python-pyudev.inc
+++ b/meta-python/recipes-devtools/python/python-pyudev.inc
@@ -14,6 +14,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
index 32573b7..a3e1501 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -2,6 +2,7 @@ require python-pyudev.inc
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-subprocess \
 "
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index c8d1417..052b76a 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=5ab7571a79ad62d0c
 SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
 SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email ${PYTHON_PN}-subprocess \
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
                    ${PYTHON_PN}-ctypes"
 
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
index 5d11475..193a4db 100644
--- a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
+++ b/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
@@ -1,3 +1,8 @@
 inherit pypi setuptools
 require python-tornado.inc
-RDEPENDS_${PN} += "${PYTHON_PN}-backports-ssl ${PYTHON_PN}-backports-abc ${PYTHON_PN}-singledispatch"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-backports-abc \
+    ${PYTHON_PN}-backports-ssl \
+    ${PYTHON_PN}-singledispatch \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index 5e6003f..c04a4e0 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -37,7 +37,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
 "
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
index 3892f13..db41161 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
@@ -1,4 +1,7 @@
 inherit pypi setuptools
 require python-werkzeug.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-zlib \
+"
diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
index f43d8c1..a4ca5dc 100644
--- a/meta-python/recipes-devtools/python/python-whoosh.inc
+++ b/meta-python/recipes-devtools/python/python-whoosh.inc
@@ -21,5 +21,4 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
index 48df360..3b4291f 100644
--- a/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python-whoosh_2.7.4.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-whoosh.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
index e6e9726..415ca9f 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb
@@ -4,5 +4,4 @@ require python-pymongo.inc
 # Requires _pydecimal which is in misc
 RDEPENDS_${PYTHON_PN}-bson += " \
     ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-subprocess \
 "
diff --git a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
index 189a65a..f6372c8 100644
--- a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
@@ -17,8 +17,4 @@ do_install_append() {
     install -m 0644 ${S}/vcversioner*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
 }
 
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-subprocess \
-    "
-
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
index c82909d..a0ec028 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
@@ -18,6 +18,5 @@ S = "${WORKDIR}/git"
 
 RDEPENDS_${PN}_class-target += " \
     parted (>= 2.3) \
-    ${PYTHON_PN}-subprocess \
 "
 RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
index 81d61c6..7d00fd7 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
@@ -4,7 +4,7 @@ PV = "3.10.7+git${SRCPV}"
 
 inherit distutils
 
-RDEPENDS_${PN} += "python-stringold python-codecs python-math"
+RDEPENDS_${PN} += "python-stringold python-codecs python-math python-subprocess"
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


