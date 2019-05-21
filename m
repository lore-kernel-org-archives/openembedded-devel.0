Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id AD54D7E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:01 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id y11so8290899pfm.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q6bPnqThJS1t8hR3bY572UgSEgDi/h0uL+KgBk8L2TI=;
	b=cTnCdwEwr1001tUl2L6Y3KKt9FAUXOgpF2+0Wey8f5llt/XCUoKp9HZvyDK5qUvBGX
	T90tAyHqCqwS8pArq7pqXbhDitWRQI0pvA/QjbQSNBrZFVwx+A0xtWe7N/DGTlVZyjE1
	lK1gNDjSebrawzqSTbe0tQk3imSAsvuDSsSLNy4D/vguJMVl+YC+UFAzoOCnivBg3Wgp
	9eaimag3s5oPQWlxqO/lOlDd1sD8+RD8u/eh1Ol1ninK1imPjJvzFOwr+hsZ0HGX0X94
	7kVPj29xXC/IDQbGk4f0DXPegMNeSSOIVISEtQ0LfiioM0vv8elmB2yZYJM67hOLmKrR
	npAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q6bPnqThJS1t8hR3bY572UgSEgDi/h0uL+KgBk8L2TI=;
	b=QgaJTh3jG/KjuCl9oxm+65ZRo0W4SW/I1hlaoLKZ5BRmdRFHXv67Vi8pZJfvCMvJ/Q
	fCtI62D56o2Wdyp6CDB3IZe64GOQOSaHFpZMgyGjl6FMLK+fr7qr8zLmz/xQU0WoY7qr
	ldmZnRXPyymfl2T0G9ypdxmtNq3PHXweP0cd8ELcHyC8/stTnggnHnhV26Pp142imjJr
	BeRwupQZlv99L8EEn8VQfAYR4G9kOz2ALCFkIA3c/LRlXdCy15QxxGoW/6GYfIaIMrcQ
	sJPD6Jlr3HPi07TvetlAVkoLaBdBw7nnz4PFF6DC65QKfmKV0AQhpLdP2Y40MMVKF0nz
	u42g==
X-Gm-Message-State: APjAAAVTr70hJRmgjI8RC893TP0hPYw0EkwX4hUwqs9v4lYYRY/6W7Qi
	ZYPD6rUSnXIHwbgYeV+HOVEE+Ak5
X-Google-Smtp-Source: APXvYqyP34D/mCqsMYtPQDAoTE3qzwkvhU4hZ1D8YMQC+DaGpnEsTU+r78RZ3kXEwnAVEvrWl6Sk6g==
X-Received: by 2002:aa7:9a95:: with SMTP id w21mr64859533pfi.248.1558411022412;
	Mon, 20 May 2019 20:57:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:30 -0700
Message-Id: <92366536656c414df42cead02b1a8104f2a3bcbe.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 30/34] samba: update to 4.8.11
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
X-List-Received-Date: Tue, 21 May 2019 03:57:01 -0000

From: Johannes Pointner <johannes.pointner@br-automation.com>

* This includes security fixes that adresses the following defects:
CVE-2018-14629 (Unprivileged adding of CNAME record causing loop in AD
Internal DNS server)
CVE-2018-16841 (Double-free in Samba AD DC KDC with PKINIT)
CVE-2018-16851 (NULL pointer de-reference in Samba AD DC LDAP server)
CVE-2018-16853 (Samba AD DC S4U2Self crash in experimental MIT Kerberos
configuration (unsupported))
CVE-2019-3880 (Save registry file outside share as unprivileged user)

* Upstreamed patch removed:
0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch

* Extended PACKAGECONFIG ad-dc to be able to build MIT Kerberos
see https://bugzilla.samba.org/show_bug.cgi?id=13678

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...to-build-Samba-against-a-newer-minor-vers.patch | 86 ----------------------
 .../samba/{samba_4.8.4.bb => samba_4.8.11.bb}      |  7 +-
 2 files changed, 3 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.4.bb => samba_4.8.11.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch b/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
deleted file mode 100644
index 4c94831..0000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 0bc8bc4143a58f91f6d7ce228b6763f377fdf45a Mon Sep 17 00:00:00 2001
-From: Andrew Bartlett <abartlet@samba.org>
-Date: Thu, 12 Jul 2018 12:34:56 +1200
-Subject: [PATCH] ldb: Refuse to build Samba against a newer minor version of
- ldb
-
-Samba is not compatible with new versions of ldb (except release versions)
-
-Other users would not notice the breakages, but Samba makes many
-more assuptions about the LDB internals than any other package.
-
-(Specifically, LDB 1.2 and 1.4 broke builds against released
-Samba versions)
-
-BUG: https://bugzilla.samba.org/show_bug.cgi?id=13519
-
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-Reviewed-by: Gary Lockyer <gary@catalyst.net.nz>
-(cherry picked from commit 52efa796538ae004ca62ea32fc8c833472991be6)
----
- lib/ldb/wscript | 32 ++++++++++++++++++++++----------
- 1 file changed, 22 insertions(+), 10 deletions(-)
-
-diff --git a/lib/ldb/wscript b/lib/ldb/wscript
-index d94086b..2bb0832 100644
---- a/lib/ldb/wscript
-+++ b/lib/ldb/wscript
-@@ -62,23 +62,33 @@ def configure(conf):
-     conf.env.standalone_ldb = conf.IN_LAUNCH_DIR()
- 
-     if not conf.env.standalone_ldb:
-+        max_ldb_version = [int(x) for x in VERSION.split(".")]
-+        max_ldb_version[2] = 999
-+        max_ldb_version_dots = "%d.%d.%d" % tuple(max_ldb_version)
-+
-         if conf.env.disable_python:
--            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
--                                         onlyif='talloc tdb tevent',
--                                         implied_deps='replace talloc tdb tevent'):
-+            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
-+                                             minversion=VERSION,
-+                                             maxversion=max_ldb_version_dots,
-+                                             onlyif='talloc tdb tevent',
-+                                             implied_deps='replace talloc tdb tevent'):
-                 conf.define('USING_SYSTEM_LDB', 1)
-         else:
-             using_system_pyldb_util = True
--            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util', minversion=VERSION,
--                                             onlyif='talloc tdb tevent',
--                                             implied_deps='replace talloc tdb tevent ldb'):
-+            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util',
-+                                                 minversion=VERSION,
-+                                                 maxversion=max_ldb_version_dots,
-+                                                 onlyif='talloc tdb tevent',
-+                                                 implied_deps='replace talloc tdb tevent ldb'):
-                 using_system_pyldb_util = False
- 
-             # We need to get a pyldb-util for all the python versions
-             # we are building for
-             if conf.env['EXTRA_PYTHON']:
-                 name = 'pyldb-util' + conf.all_envs['extrapython']['PYTHON_SO_ABI_FLAG']
--                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name, minversion=VERSION,
-+                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name,
-+                                                     minversion=VERSION,
-+                                                     maxversion=max_ldb_version_dots,
-                                                      onlyif='talloc tdb tevent',
-                                                      implied_deps='replace talloc tdb tevent ldb'):
-                     using_system_pyldb_util = False
-@@ -86,9 +96,11 @@ def configure(conf):
-             if using_system_pyldb_util:
-                 conf.define('USING_SYSTEM_PYLDB_UTIL', 1)
- 
--            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
--                                         onlyif='talloc tdb tevent pyldb-util',
--                                         implied_deps='replace talloc tdb tevent'):
-+            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
-+                                             minversion=VERSION,
-+                                             maxversion=max_ldb_version_dots,
-+                                             onlyif='talloc tdb tevent pyldb-util',
-+                                             implied_deps='replace talloc tdb tevent'):
-                 conf.define('USING_SYSTEM_LDB', 1)
- 
-     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
--- 
-2.18.0
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
index 2a785bd..8b29d9b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
@@ -23,7 +23,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://dnsserver-4.7.0.patch \
            file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
-           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
@@ -31,8 +30,8 @@ SRC_URI_append_libc-musl = " \
            file://cmocka-uintptr_t.patch \
           "
 
-SRC_URI[md5sum] = "ca5bfbebd8d9eb95506e16594b2bbee2"
-SRC_URI[sha256sum] = "f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd1fd771453b9a5406"
+SRC_URI[md5sum] = "de61611075e97ea98140a42d9189d9a5"
+SRC_URI[sha256sum] = "d294a8d7455d7d252d7bafc9c474855ea6e0ebe559c3babcd303a5c24e58710a"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
 
@@ -92,7 +91,7 @@ PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
 # We are now at 4.7.0, so take the above with a grain of salt. We do not need to know where
 # krb5kdc is unless ad-dc is enabled, but we tell configure anyhow.
 #
-PACKAGECONFIG[ad-dc] = ",--without-ad-dc,,"
+PACKAGECONFIG[ad-dc] = "--with-experimental-mit-ad-dc,--without-ad-dc,,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5 --with-system-mitkdc=/usr/sbin/krb5kdc,,krb5,"
 
-- 
2.7.4


