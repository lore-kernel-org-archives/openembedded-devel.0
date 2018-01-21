Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 010C97842F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:22 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a27so1980812qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0wjvYdepDojRI2q9a2LfCrZDk8o+l0GEKIcjd9BlFh0=;
	b=GCwTC/H6RSyLmqaZDf2q/20QGx/QN+kYhO528Drsb9yEQR1L97Y39Vw7JIs/smKiNb
	H586UyOqWCqkIE3ngdykfe4dP/ZzMgmipenyYgDXy1uSINznt+4xJEUZFL49nrH3v/UT
	C6SytX1zy59yOe7yfFPPPrw6DfPSxlPLNAAui/zlCV8VvwKD4rd03ti3prbyMuSo8vzK
	hKTVkiW+8Jf6E/1W6p4AOlB27OC9R6y/4tQd//7VwYrSlocXt7ZC+n466WOCsUP8y1F4
	BoE67jabaiwjtsn8FS6dZO7fNV6KzsX7ZlHuOK5nBTG3+dvaRF+/Z+dXdniov9dG0Bav
	zbnQ==
X-Gm-Message-State: AKwxytdc7fP2yr074P1ewXKTE7GxEmNinY7em4etQ2K8uBwNUglYSQv/
	4PIqkpK64Xa+TeRan+L8kEJyNMCP
X-Google-Smtp-Source: AH8x225G8gtlMO+jnbpt+4cT70JPIOTfcysbzKZpCMt19oZ26xAGpvs2Fu2IdWdX/riPIAwd7a2aHQ==
X-Received: by 10.55.109.194 with SMTP id i185mr4562439qkc.79.1516551683505;
	Sun, 21 Jan 2018 08:21:23 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:29 -0500
Message-Id: <1516551637-32255-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 02/10] Remove deprecated python3-re from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:23 -0000

The python3-re package was removed as part of the migration to the
json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc          | 1 -
 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb     | 1 +
 meta-python/recipes-devtools/python/python-gevent.inc           | 1 -
 meta-python/recipes-devtools/python/python-gevent_1.2.2.bb      | 1 +
 meta-python/recipes-devtools/python/python-jinja2.inc           | 2 +-
 meta-python/recipes-devtools/python/python-jinja2_2.10.bb       | 2 ++
 meta-python/recipes-devtools/python/python-jsonpatch.inc        | 2 +-
 meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb    | 2 ++
 meta-python/recipes-devtools/python/python-jsonpointer.inc      | 1 -
 meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb  | 2 ++
 meta-python/recipes-devtools/python/python-jsonschema.inc       | 1 -
 meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb  | 1 +
 meta-python/recipes-devtools/python/python-markupsafe.inc       | 2 +-
 meta-python/recipes-devtools/python/python-markupsafe_1.0.bb    | 2 ++
 meta-python/recipes-devtools/python/python-simplejson.inc       | 1 -
 meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb | 2 ++
 16 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 971aaf4..a71762c 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -22,7 +22,6 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-wrapt \
-    ${PYTHON_PN}-re \
     ${PYTHON_PN}-setuptools \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
index 3ced19a..42208bc 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
@@ -5,5 +5,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-backports-functools-lru-cache \
     ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-re \
     ${PYTHON_PN}-singledispatch \
 "
diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
index 8889cfb..13513f2 100644
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ b/meta-python/recipes-devtools/python/python-gevent.inc
@@ -11,7 +11,6 @@ DEPENDS += "${PYTHON_PN}-greenlet"
 RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-mime \
 		  ${PYTHON_PN}-pprint \
-		  ${PYTHON_PN}-re \
 		 "
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
index f357c95..f13bfd7 100644
--- a/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
@@ -1,3 +1,4 @@
 require python-gevent.inc
 inherit setuptools
 
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index cd50d93..72562fb 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -8,7 +8,7 @@ SRC_URI[md5sum] = "61ef1117f945486472850819b8d1eb3d"
 SRC_URI[sha256sum] = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-textutils \
     ${PYTHON_PN}-lang ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
     ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
index ec8e7ed..19b2bfa 100644
--- a/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools
 require python-jinja2.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
index 838dbe3..e559fb1 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -8,5 +8,5 @@ inherit pypi
 SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
 SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8caad7f34724cb1ea26b27547fd974f1a2153"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
+RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
index e45699a..90cd318 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-jsonpatch.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
index e678198..5381fbe 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -10,5 +10,4 @@ SRC_URI[sha256sum] = "c681af823545c731b7b38aedd5d4eee4c5eff87bc0f25e0ff25444a418
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
-    ${PYTHON_PN}-re \
 "
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
index 064bd6c..e13a776 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-jsonpointer.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index db57c69..b602b27 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -16,7 +16,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-re \
     ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-strict-rfc3339 \
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
index 3bb5220..55cbb20 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-jsonschema_2.6.0.bb
@@ -5,4 +5,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-functools32 \
+    ${PYTHON_PN}-re \
 "
diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index e50f8ce..927f844 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad491
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-re ${PYTHON_PN}-stringold"
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
diff --git a/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb b/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
index 5c9884b..05bbe8a 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
+++ b/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
@@ -1,4 +1,6 @@
 inherit setuptools
 require python-markupsafe.inc
 
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 95df3f3..e28d518 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] = "4c4ecf20e054716cc1e5a81cadc44d3f4027108d8dd0861d8b1e3bd7a3
 inherit pypi
 
 RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-re \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
index e33edfe..24ad9a9 100644
--- a/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-simplejson.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-re"
-- 
2.7.4


