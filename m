Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 453EC71A54
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:20 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id u187so40229088pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3mbdm304W9CMhqjfQWeb1Q3jg6IrL44c6ozeNp2TWIE=;
	b=hnTktumELyg+ihZclXGujPxGJRDA6WQYhpxlSofB0YjF67wh+JhVrSU7gFSTjzDfEF
	gtgDOnfGidX+N6VLK3l0IAfnclKEQtiSIqHlDApsZ6d/37Q6ocZFzuUtuEftgasSq8V1
	owNtbVIIwoCJ61OBzPhK309KVCFB/E8BeQnIfPuUIyUb1alKe7NdDnD5J71bYX0ABUJz
	/PkvrcbL7VIC3zH8sX0WZ7d1A8Ft5PDAdFOm4zIpxv0LWN7A4Zf9oJs4DV3ys1Rt+6PD
	hgRmTo7KZO/IdlyLsddEwkg80dRbebGW5VnhWBETJr+KdfMCVYuzC7us3w8VYRnqRex9
	5GEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3mbdm304W9CMhqjfQWeb1Q3jg6IrL44c6ozeNp2TWIE=;
	b=D6jasbDGZKEe54NPHRS4FiCtQJIAcL9jlMcsCAljnbp8WX4Oe3tFye9B6IQe+GvKZ1
	iT+TbAkg7k9+nKLJ/BBjIafts4Cysa8kTEFGMA36kmCfHajw6yXmm1aKsOfgDKLD2qek
	3jagDKGAoPMIvlWcqeEbQqLmqdTTU+JE54ew1GQ5tGUOBQi6tzO7Dq9BVdGoHs/eeoCO
	AWnOOP9Iz4euY48Ez4d9OwKVdrrLXFSZOOLjtRe8dEUG5wfPviEwR9AQ+VouI5elFo1m
	3hKZ0jm0w7ig18J85XpesnSD2K6VANKRse0nZ4Qa6YMyBAneysUjmMPG6RcQcBXdw5O+
	GB2A==
X-Gm-Message-State: AN3rC/5y/ANnf9W9UZP+oF8ufvwAzyFm1cvAf9rFmbA1mJhuvMKdW+vu
	DVNFcCaV4nZWvg==
X-Received: by 10.84.129.1 with SMTP id 1mr88256260plb.125.1494316642350;
	Tue, 09 May 2017 00:57:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:04 -0700
Message-Id: <20170509075711.1575-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/9] gupnp-dlna: Upgrade to 0.10.5
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
X-List-Received-Date: Tue, 09 May 2017 07:57:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gupnp/files/move_vapigen.patch                 | 102 +++++++++++++++++++++
 .../{gupnp-dlna_0.9.4.bb => gupnp-dlna_0.10.5.bb}  |   8 +-
 2 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-dlna_0.9.4.bb => gupnp-dlna_0.10.5.bb} (69%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch b/meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch
new file mode 100644
index 000000000..9bfc31b8e
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/files/move_vapigen.patch
@@ -0,0 +1,102 @@
+OE-Core's vala class known one type of vapigen.m4 and deletes it since its
+not cross compile friendly, but this is a different case here where its not
+same vapigen.m4 just name is same and it tends to inherit vala bbclass so
+save it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gupnp-dlna-0.10.5/m4/vapigen-custom.m4
+===================================================================
+--- /dev/null
++++ gupnp-dlna-0.10.5/m4/vapigen-custom.m4
+@@ -0,0 +1,43 @@
++
++dnl vala.m4
++dnl
++dnl Copyright 2010 Marc-Andre Lureau
++dnl Copyright 2011 Rodney Dawes <dobey.pwns@gmail.com>
++dnl
++dnl This library is free software; you can redistribute it and/or
++dnl modify it under the terms of the GNU Lesser General Public
++dnl License as published by the Free Software Foundation; either
++dnl version 2.1 of the License, or (at your option) any later version.
++dnl
++dnl This library is distributed in the hope that it will be useful,
++dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
++dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++dnl Lesser General Public License for more details.
++dnl
++dnl You should have received a copy of the GNU Lesser General Public
++dnl License along with this library; if not, write to the Free Software
++dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
++
++dnl dropped everything but VALA_PROG_VAPIGEN - Jens Georg <mail@jensge.org>
++
++# Check whether the Vala API Generator exists in `PATH'. If it is found,
++# the variable VAPIGEN is set. Optionally a minimum release number of the
++# generator can be requested.
++#
++# VALA_PROG_VAPIGEN([MINIMUM-VERSION])
++# ------------------------------------
++AC_DEFUN([GUPNP_PROG_VAPIGEN],
++[AC_PATH_PROG([VAPIGEN], [vapigen], [])
++  AS_IF([test -z "$VAPIGEN"],
++    [AC_MSG_WARN([No Vala API Generator found. You will not be able to generate .vapi files.])],
++    [AS_IF([test -n "$1"],
++        [AC_MSG_CHECKING([$VAPIGEN is at least version $1])
++         am__vapigen_version=`$VAPIGEN --version | sed 's/Vala API Generator  *//'`
++         AS_VERSION_COMPARE([$1], ["$am__vapigen_version"],
++           [AC_MSG_RESULT([yes])],
++           [AC_MSG_RESULT([yes])],
++           [AC_MSG_RESULT([no])
++            AC_MSG_WARN([Vala API Generator $1 not found.])
++            VAPIGEN=""
++           ])])])
++])
+Index: gupnp-dlna-0.10.5/m4/vapigen.m4
+===================================================================
+--- gupnp-dlna-0.10.5.orig/m4/vapigen.m4
++++ /dev/null
+@@ -1,43 +0,0 @@
+-
+-dnl vala.m4
+-dnl
+-dnl Copyright 2010 Marc-Andre Lureau
+-dnl Copyright 2011 Rodney Dawes <dobey.pwns@gmail.com>
+-dnl
+-dnl This library is free software; you can redistribute it and/or
+-dnl modify it under the terms of the GNU Lesser General Public
+-dnl License as published by the Free Software Foundation; either
+-dnl version 2.1 of the License, or (at your option) any later version.
+-dnl
+-dnl This library is distributed in the hope that it will be useful,
+-dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
+-dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-dnl Lesser General Public License for more details.
+-dnl
+-dnl You should have received a copy of the GNU Lesser General Public
+-dnl License along with this library; if not, write to the Free Software
+-dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
+-
+-dnl dropped everything but VALA_PROG_VAPIGEN - Jens Georg <mail@jensge.org>
+-
+-# Check whether the Vala API Generator exists in `PATH'. If it is found,
+-# the variable VAPIGEN is set. Optionally a minimum release number of the
+-# generator can be requested.
+-#
+-# VALA_PROG_VAPIGEN([MINIMUM-VERSION])
+-# ------------------------------------
+-AC_DEFUN([GUPNP_PROG_VAPIGEN],
+-[AC_PATH_PROG([VAPIGEN], [vapigen], [])
+-  AS_IF([test -z "$VAPIGEN"],
+-    [AC_MSG_WARN([No Vala API Generator found. You will not be able to generate .vapi files.])],
+-    [AS_IF([test -n "$1"],
+-        [AC_MSG_CHECKING([$VAPIGEN is at least version $1])
+-         am__vapigen_version=`$VAPIGEN --version | sed 's/Vala API Generator  *//'`
+-         AS_VERSION_COMPARE([$1], ["$am__vapigen_version"],
+-           [AC_MSG_RESULT([yes])],
+-           [AC_MSG_RESULT([yes])],
+-           [AC_MSG_RESULT([no])
+-            AC_MSG_WARN([Vala API Generator $1 not found.])
+-            VAPIGEN=""
+-           ])])])
+-])
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.10.5.bb
similarity index 69%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.10.5.bb
index 053604e12..3cafd6976 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.10.5.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "libxml2 glib-2.0"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f93665e535a512e4d515a86311435cb6"
-SRC_URI[sha256sum] = "69969713f36c0e815fbbbcfdfb3ad9bd447cfd10d0fd86227d82dfd8edb6c807"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz \
+           file://move_vapigen.patch \
+"
+SRC_URI[md5sum] = "2d0dc1e4189d0243ac3838ece1e8fea0"
+SRC_URI[sha256sum] = "123e368227c11d5c17fc1aa76cbdaffa345355eb51d172cd39fc74a5b468ff6a"
 
 inherit autotools pkgconfig gobject-introspection vala
 
-- 
2.12.2


