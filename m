Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 601FD700F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:19:20 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t69so8304962wmt.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ua2wJC0BIuIgZg20SLb/JDZea/qlKttKzJHzdRNmL2A=;
	b=J+G31Vz1ZAlKhUeydS1teseJCndzwENdox50xWzXm9qWWolOmRAF9hW4fJC0ZBuF9E
	GBPtp9KS1j4DOiDxDgWSmkd70zm5COvXr5QEZ9ZYk0j1CryT9GSu/HLjjZSvfSBKooP8
	2F10VWXcyNW83KX3oNANJpOfJmiL8bZPYjMLKgmGDINb4wDlh+73WnyiBSjXuZEWMirJ
	RvSaE0KurwPGKdHNO0UT3YSu5712LNbBqOXjenQvJeQfCtVyo9jXrCkW4GNU3c9Sh9c7
	FMVKJVfUW23XYuH5C3kE5EUboUWLjHL5tfcIwrUl+qK2G1r8wae/TGyA+BaBiImCERKo
	NpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ua2wJC0BIuIgZg20SLb/JDZea/qlKttKzJHzdRNmL2A=;
	b=HUa9vj6kgThf2rOwyTrv2b/ZzldHu+uRVp8OkGgOnnE8xinD2l5KcPPBJyBQeYwYw3
	1ACqEtvfTDGL5bcTThirleR0YIjfWkC14MKETBsBQNomOWd0B+zJOSWcNPPwhBrJcJkE
	gujlChphFA12KmjfuUTl9+ManwmX2YquV/sruO1zpItiA1bVuhAo6k3fuKdLE60lG6lq
	oFa57GW56JObVblmaRlNtZesnLNA6tLL0smQyviwouPYo6Nn/OxPjQNE2DEfDDEYB7yk
	rHw88bJYMy5/ln3UufBXfvX/GYbZFIM4FgKDe0H0nEc5Ty/EJWlwPyarPfG05MHDgT8F
	Uf2g==
X-Gm-Message-State: AMCzsaUdVX521OvoPgSFN/x9Qxr1yvb8Hx8mW3vFrJPLRpzYTRIXLnn0
	dohkjsr7Culcu1KcK8lgOn8PKnlRdLr/CkL1tU2Vwg==
X-Google-Smtp-Source: AOwi7QBU2tTDSqdvkTjREq6GLltuwTLatDQS6HYlZAczK5EV1ONyYL1dhA1htiixTWByjntiNIJDWN6N9YQxpFfu9lI=
X-Received: by 10.28.131.13 with SMTP id f13mr192121wmd.157.1507756760860;
	Wed, 11 Oct 2017 14:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.137.212 with HTTP; Wed, 11 Oct 2017 14:19:20 -0700 (PDT)
From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 11 Oct 2017 23:19:20 +0200
Message-ID: <CAAfyv36LqzXbtQk8R0uEyJAP0tbYJPePaLdp0MZTbeyQ7sZ5oA@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: python3-daemon problem
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
X-List-Received-Date: Wed, 11 Oct 2017 21:19:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I need to use python3 version for python daemon. I reworked it
(inspired by other packages), but problem is that is cannot compile:

python3-daemon-2.1.2-r0 do_compile: Traceback (most recent call last):
  File "setup.py", line 21, in <module>
    from setuptools import (setup, find_packages)
ImportError: No module named 'setuptools'

Any ideas? python-daemon should support python2 & 3 versions.
Patch:

From f09095cea3d425b9dc9a35721c78ef6cb6b4e3bb Mon Sep 17 00:00:00 2001
From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Wed, 11 Oct 2017 23:15:58 +0200
Subject: [PATCH] Add python3 version for python-daemon

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 .../recipes-devtools/python/python-daemon.inc      | 31 ++++++++++++++++++++++
 .../recipes-devtools/python/python-daemon_2.1.2.bb | 29 ++------------------
 .../0001-Workaround-for-issue-2-1.patch            | 31 ++++++++++++++++++++++
 .../python/python3-daemon_2.1.2.bb                 |  2 ++
 4 files changed, 66 insertions(+), 27 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-daemon.inc
 create mode 100644
meta-python/recipes-devtools/python/python3-daemon/0001-Workaround-for-issue-2-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-daemon_2.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-daemon.inc
b/meta-python/recipes-devtools/python/python-daemon.inc
new file mode 100644
index 0000000..5845f0b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-daemon.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
+HOMEPAGE = "https://pagure.io/python-daemon/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+inherit pypi
+
+SRC_URI[md5sum] = "9c57343d81f2a96c51cffeab982b04d2"
+SRC_URI[sha256sum] =
"261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73"
+
+# Fix for build error in Yocto:
+#     i = p.rfind('/') + 1
+# AttributeError: 'NoneType' object has no attribute 'rfind'
+#S = "${WORKDIR}/python-daemon"
+SRC_URI_append = " \
+                  file://0001-Workaround-for-issue-2-1.patch \
+"
+
+
+
+DEPENDS = "${PYTHON_PN}-docutils"
+RDEPENDS_${PN} = "${PYTHON_PN}-docutils \
+                  ${PYTHON_PN}-lockfile (>= 0.10) \
+                  ${PYTHON_PN}-resource \
+"
+
+PYPI_PACKAGE = "python-daemon"
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
index 4c18e2b..e66080a 100644
--- a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -1,27 +1,2 @@
-DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
-HOMEPAGE = "https://pagure.io/python-daemon/"
-SECTION = "devel/python"
-
-DEPENDS = "python-docutils"
-RDEPENDS_${PN} = "python-docutils \
-                  python-lockfile (>= 0.10) \
-                  python-resource \
-"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "9c57343d81f2a96c51cffeab982b04d2"
-SRC_URI[sha256sum] =
"261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73"
-
-# Fix for build error in Yocto:
-#     i = p.rfind('/') + 1
-# AttributeError: 'NoneType' object has no attribute 'rfind'
-#S = "${WORKDIR}/python-daemon"
-SRC_URI_append = " \
-                  file://0001-Workaround-for-issue-2-1.patch \
-"
-
-PYPI_PACKAGE = "python-daemon"
+inherit setuptools
+require python-daemon.inc
diff --git a/meta-python/recipes-devtools/python/python3-daemon/0001-Workaround-for-issue-2-1.patch
b/meta-python/recipes-devtools/python/python3-daemon/0001-Workaround-for-issue-2-1.patch
new file mode 100644
index 0000000..dbb8407
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-daemon/0001-Workaround-for-issue-2-1.patch
@@ -0,0 +1,31 @@
+From 0981eee9f0198c2045dc0eaa78a005d06fc7bfe4 Mon Sep 17 00:00:00 2001
+From: Carlos Eduardo Moreira dos Santos <cems@cemshost.com.br>
+Date: Tue, 28 Mar 2017 18:23:44 -0300
+Subject: [PATCH] Workaround for issue 2 [1]
+
+[1] https://pagure.io/python-daemon/issue/2
+---
+ version.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/version.py b/version.py
+index d58422a377ee..293e2d64c2b7 100644
+--- a/version.py
++++ b/version.py
+@@ -648,9 +648,10 @@ class
ChangelogAwareDistribution(distutils.dist.Distribution, object):
+
+     @lru_cache(maxsize=128)
+     def get_version_info(self):
+-        changelog_path = get_changelog_path(self)
+-        version_info = generate_version_info_from_changelog(changelog_path)
+-        return version_info
++        return {
++            'version': '2.1.2',
++            'maintainer': 'Ben Finney'
++        }
+
+     def get_version(self):
+         version_info = self.get_version_info()
+--
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-daemon_2.1.2.bb
b/meta-python/recipes-devtools/python/python3-daemon_2.1.2.bb
new file mode 100644
index 0000000..7bb5324
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-daemon_2.1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-daemon.inc
-- 
2.7.4

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

