Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A21F7545B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 07:42:50 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3-v6so5537156pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MUhUKjUfl6OAjaMrqsHqBmkY7A4Nll5qYsp33Sf+A7A=;
	b=EdB5K38xX/kLBJ4Jm8jMOBooIkSG7c7a+pBFcPzkltzk0Erb9EbqT36eM1LBknZukD
	AcnHgcgfVKvdb1/J5j/a1DSsI3hT7v7lZtAGt3LTnCziYLAgrXJl5EES8PbK1+l2wxe9
	e9K3uAyKLj9HpvcUsYwUs5enH6VVaGxqU6HbOckkjHMFtm9tCHu8bdDo9Onyv/U08jtZ
	38f/HH85POvLmwAY4MjZetHjMV/Q7O4bqPKkEPfHz1jXgWaTDycKR3EsXuBuIfpdwOz5
	T5pN8Xr454sH8sOMm6nfOYr9OXOCsX9tq4iS/sItYc4uZjJQ3ekp7a2L2N0Bw9wrpLWz
	eA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MUhUKjUfl6OAjaMrqsHqBmkY7A4Nll5qYsp33Sf+A7A=;
	b=s8yO6TIWuSHlU5KeC4vzn2JOwE+865KAbv80IQg8plLpZn3qGSKciTR1AxYVCFK6yA
	1leeIHdxcDV7/G7E1JpbfZHCh46uYD3i8SeprFSQM12d8K/GaeMicllOAP7xs2jrnuY3
	jb8lYaUwXvkiknRBCBhnwn+LKrXt0L81lKzKwtvJaqC09OYnO1vzB6BVt6fwyogj9g+P
	ZBKB5SimAobif+qcipDfWX9Wjoz0wJkiXqeuFFeLgm5gdo9mjxKkdBtW2bZX3i0XkIhW
	24CMCUUG9oD3yrVKieXHTQ03A7IpI4oq6gyIed7y1WO2B1K9+kTUGSVRW6tIOt8EvwPv
	bY9Q==
X-Gm-Message-State: AOUpUlGOfORtfdOa5E0vdRs54kJuaPvwa9Q5Z2WDYdmgzt0H4pEub9d4
	avAs2rLEzB5lcHAe0kQnMlxoG7yG
X-Google-Smtp-Source: AAOMgpe8nSzO9SkGfI/xyASVdF72JtjjbYlUPe0azC9SdheK1grB2+aFsllAaOEQjMdqkT3pQxmpiQ==
X-Received: by 2002:a63:a745:: with SMTP id
	w5-v6mr12399841pgo.374.1532850170672; 
	Sun, 29 Jul 2018 00:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	i13-v6sm13056613pgo.75.2018.07.29.00.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jul 2018 00:42:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jul 2018 00:42:41 -0700
Message-Id: <20180729074241.17191-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-networking][PATCH] samba: Update to 4.8.3
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
X-List-Received-Date: Sun, 29 Jul 2018 07:42:50 -0000

LDB 1.4.0 breaks Samba < 4.9 therefore use internal version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ild-Samba-against-a-newer-minor-vers.patch |  86 ++++++
 ...timeout-for-nmbd-if-started-offline-.patch |  32 ---
 ...void-using-colon-in-the-checking-msg.patch |  32 ---
 .../samba/samba-4.3.9-remove-getpwent_r.patch |  36 ++-
 .../samba/samba/samba-pam.patch               |  21 +-
 .../recipes-connectivity/samba/samba/smb.conf | 254 ++++++++++++++++++
 .../samba/samba/smb_conf-4.7.0.patch          |  17 +-
 .../samba/{samba_4.7.8.bb => samba_4.8.3.bb}  |  21 +-
 8 files changed, 401 insertions(+), 98 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/smb.conf
 rename meta-networking/recipes-connectivity/samba/{samba_4.7.8.bb => samba_4.8.3.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch b/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
new file mode 100644
index 0000000000..4c94831d7f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
@@ -0,0 +1,86 @@
+From 0bc8bc4143a58f91f6d7ce228b6763f377fdf45a Mon Sep 17 00:00:00 2001
+From: Andrew Bartlett <abartlet@samba.org>
+Date: Thu, 12 Jul 2018 12:34:56 +1200
+Subject: [PATCH] ldb: Refuse to build Samba against a newer minor version of
+ ldb
+
+Samba is not compatible with new versions of ldb (except release versions)
+
+Other users would not notice the breakages, but Samba makes many
+more assuptions about the LDB internals than any other package.
+
+(Specifically, LDB 1.2 and 1.4 broke builds against released
+Samba versions)
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=13519
+
+Signed-off-by: Andrew Bartlett <abartlet@samba.org>
+Reviewed-by: Gary Lockyer <gary@catalyst.net.nz>
+(cherry picked from commit 52efa796538ae004ca62ea32fc8c833472991be6)
+---
+ lib/ldb/wscript | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/lib/ldb/wscript b/lib/ldb/wscript
+index d94086b..2bb0832 100644
+--- a/lib/ldb/wscript
++++ b/lib/ldb/wscript
+@@ -62,23 +62,33 @@ def configure(conf):
+     conf.env.standalone_ldb = conf.IN_LAUNCH_DIR()
+ 
+     if not conf.env.standalone_ldb:
++        max_ldb_version = [int(x) for x in VERSION.split(".")]
++        max_ldb_version[2] = 999
++        max_ldb_version_dots = "%d.%d.%d" % tuple(max_ldb_version)
++
+         if conf.env.disable_python:
+-            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
+-                                         onlyif='talloc tdb tevent',
+-                                         implied_deps='replace talloc tdb tevent'):
++            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
++                                             minversion=VERSION,
++                                             maxversion=max_ldb_version_dots,
++                                             onlyif='talloc tdb tevent',
++                                             implied_deps='replace talloc tdb tevent'):
+                 conf.define('USING_SYSTEM_LDB', 1)
+         else:
+             using_system_pyldb_util = True
+-            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util', minversion=VERSION,
+-                                             onlyif='talloc tdb tevent',
+-                                             implied_deps='replace talloc tdb tevent ldb'):
++            if not conf.CHECK_BUNDLED_SYSTEM_PKG('pyldb-util',
++                                                 minversion=VERSION,
++                                                 maxversion=max_ldb_version_dots,
++                                                 onlyif='talloc tdb tevent',
++                                                 implied_deps='replace talloc tdb tevent ldb'):
+                 using_system_pyldb_util = False
+ 
+             # We need to get a pyldb-util for all the python versions
+             # we are building for
+             if conf.env['EXTRA_PYTHON']:
+                 name = 'pyldb-util' + conf.all_envs['extrapython']['PYTHON_SO_ABI_FLAG']
+-                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name, minversion=VERSION,
++                if not conf.CHECK_BUNDLED_SYSTEM_PKG(name,
++                                                     minversion=VERSION,
++                                                     maxversion=max_ldb_version_dots,
+                                                      onlyif='talloc tdb tevent',
+                                                      implied_deps='replace talloc tdb tevent ldb'):
+                     using_system_pyldb_util = False
+@@ -86,9 +96,11 @@ def configure(conf):
+             if using_system_pyldb_util:
+                 conf.define('USING_SYSTEM_PYLDB_UTIL', 1)
+ 
+-            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb', minversion=VERSION,
+-                                         onlyif='talloc tdb tevent pyldb-util',
+-                                         implied_deps='replace talloc tdb tevent'):
++            if conf.CHECK_BUNDLED_SYSTEM_PKG('ldb',
++                                             minversion=VERSION,
++                                             maxversion=max_ldb_version_dots,
++                                             onlyif='talloc tdb tevent pyldb-util',
++                                             implied_deps='replace talloc tdb tevent'):
+                 conf.define('USING_SYSTEM_LDB', 1)
+ 
+     if conf.CONFIG_SET('USING_SYSTEM_LDB'):
+-- 
+2.18.0
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch b/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
deleted file mode 100644
index 0e89a9be01..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted [https://github.com/samba-team/samba/pull/70]
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-From 50eac4fd30944e5e1d83060757633fe0ed572723 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Wed, 30 Nov 2016 16:25:06 +0100
-Subject: [PATCH] packaging: Avoid timeout for nmbd if started offline with
- systemd
-
-If no network connection appears within DefaultTimeoutStartSec
-(~ 90s) after startup, nmbd fails to notify systemd and will
-therefore get killed.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
----
- packaging/systemd/nmb.service | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/packaging/systemd/nmb.service b/packaging/systemd/nmb.service
-index 71c93d6..f3d2fc2 100644
---- a/packaging/systemd/nmb.service
-+++ b/packaging/systemd/nmb.service
-@@ -10,6 +10,7 @@ EnvironmentFile=-/etc/sysconfig/samba
- ExecStart=/usr/sbin/nmbd --foreground --no-process-group $NMBDOPTIONS
- ExecReload=/usr/bin/kill -HUP $MAINPID
- LimitCORE=infinity
-+TimeoutStartSec=0
- 
- [Install]
- WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch b/meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch
deleted file mode 100644
index cdf7a38c18..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0006-avoid-using-colon-in-the-checking-msg.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5413f97290d3126262eb309ecbcf7769509f2a11 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 10 Nov 2015 00:48:35 -0500
-Subject: [PATCH 6/7] avoid using colon in the checking msg
-
-Upstream-Status: Pending
-
-colon is used as the separator when parse from
-a answers file, the colon here makes it never
-get the right answer.
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- wscript_configure_system_mitkrb5 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript_configure_system_mitkrb5 b/wscript_configure_system_mitkrb5
-index a62d00b..a2d89f0 100644
---- a/wscript_configure_system_mitkrb5
-+++ b/wscript_configure_system_mitkrb5
-@@ -240,7 +240,7 @@ conf.CHECK_CODE('''
-        ''',
-     'HAVE_WRFILE_KEYTAB',
-     headers='krb5.h', lib='krb5', execute=True,
--    msg="Checking whether the WRFILE:-keytab is supported");
-+    msg="Checking whether the WRFILE -keytab is supported");
- # Check for KRB5_DEPRECATED handling
- conf.CHECK_CODE('''#define KRB5_DEPRECATED 1
-        #include <krb5.h>''',
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
index 71db99c5d2..a75ac2bbae 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
@@ -1,15 +1,23 @@
-Musl does not have _r versions of getent() and getpwent() APIs
+From 02e0b14d8fa025a5db410d60a7c0dfebd536aaeb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 23:40:54 -0800
+Subject: [PATCH] Musl does not have _r versions of getent() and getpwent()
+ APIs
 
 Taken from gentoo
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_r.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: samba-4.4.5/source4/torture/local/nss_tests.c
-===================================================================
---- samba-4.4.5.orig/source4/torture/local/nss_tests.c
-+++ samba-4.4.5/source4/torture/local/nss_tests.c
-@@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct tortu
+---
+ source4/torture/local/nss_tests.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/source4/torture/local/nss_tests.c b/source4/torture/local/nss_tests.c
+index 2cd6122..04f13c6 100644
+--- a/source4/torture/local/nss_tests.c
++++ b/source4/torture/local/nss_tests.c
+@@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct torture_context *tctx,
  	return true;
  }
  
@@ -17,7 +25,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  static bool test_getgrgid(struct torture_context *tctx,
  			  gid_t gid,
  			  struct group *grp_p)
-@@ -333,6 +332,7 @@ static bool test_enum_passwd(struct tort
+@@ -333,6 +332,7 @@ static bool test_enum_passwd(struct torture_context *tctx,
  	return true;
  }
  
@@ -25,7 +33,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  static bool test_enum_r_passwd(struct torture_context *tctx,
  			       struct passwd **pwd_array_p,
  			       size_t *num_pwd_p)
-@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct to
+@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct torture_context *tctx,
  
  	return true;
  }
@@ -33,7 +41,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  
  static bool torture_assert_passwd_equal(struct torture_context *tctx,
  					const struct passwd *p1,
-@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture
+@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture_context *tctx)
  	struct passwd *pwd, pwd1, pwd2;
  	size_t num_pwd;
  
@@ -42,7 +50,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  						"failed to enumerate passwd");
  
  	for (i=0; i < num_pwd; i++) {
-@@ -460,7 +461,7 @@ static bool test_passwd_r_cross(struct t
+@@ -460,7 +461,7 @@ static bool test_passwd_r_cross(struct torture_context *tctx)
  	struct passwd *pwd, pwd1, pwd2, pwd3, pwd4;
  	size_t num_pwd;
  
@@ -51,7 +59,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  						"failed to enumerate passwd");
  
  	for (i=0; i < num_pwd; i++) {
-@@ -531,6 +532,7 @@ static bool test_enum_group(struct tortu
+@@ -531,6 +532,7 @@ static bool test_enum_group(struct torture_context *tctx,
  	return true;
  }
  
@@ -59,7 +67,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  static bool test_enum_r_group(struct torture_context *tctx,
  			      struct group **grp_array_p,
  			      size_t *num_grp_p)
-@@ -579,6 +581,7 @@ static bool test_enum_r_group(struct tor
+@@ -579,6 +581,7 @@ static bool test_enum_r_group(struct torture_context *tctx,
  
  	return true;
  }
@@ -67,7 +75,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  
  static bool torture_assert_group_equal(struct torture_context *tctx,
  				       const struct group *g1,
-@@ -635,7 +638,7 @@ static bool test_group_r(struct torture_
+@@ -635,7 +638,7 @@ static bool test_group_r(struct torture_context *tctx)
  	struct group *grp, grp1, grp2;
  	size_t num_grp;
  
@@ -76,7 +84,7 @@ Index: samba-4.4.5/source4/torture/local/nss_tests.c
  					       "failed to enumerate group");
  
  	for (i=0; i < num_grp; i++) {
-@@ -663,7 +666,7 @@ static bool test_group_r_cross(struct to
+@@ -663,7 +666,7 @@ static bool test_group_r_cross(struct torture_context *tctx)
  	struct group *grp, grp1, grp2, grp3, grp4;
  	size_t num_grp;
  
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
index 0cbacb6c0e..27b40f2152 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
@@ -1,14 +1,21 @@
-Lifted from gentoo and ported to 4.4.5
+From 54a5279cb33abd23ef7c094d51f16078ece2da0c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 23:40:54 -0800
+Subject: [PATCH] Lifted from gentoo and ported to 4.4.5
 
 http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: samba-4.7.0/source3/wscript
-===================================================================
---- samba-4.7.0.orig/source3/wscript
-+++ samba-4.7.0/source3/wscript
-@@ -875,7 +875,7 @@ msg.msg_accrightslen = sizeof(fd);
+---
+ source3/wscript | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/source3/wscript b/source3/wscript
+index 5436db2..864f614 100644
+--- a/source3/wscript
++++ b/source3/wscript
+@@ -879,7 +879,7 @@ msg.msg_accrightslen = sizeof(fd);
          if conf.env.with_iconv:
              conf.DEFINE('HAVE_ICONV', 1)
  
@@ -17,7 +24,7 @@ Index: samba-4.7.0/source3/wscript
          use_pam=True
          conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
          if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
-@@ -952,6 +952,17 @@ int i; i = PAM_RADIO_TYPE;
+@@ -956,6 +956,17 @@ int i; i = PAM_RADIO_TYPE;
                         "or headers not found. Use --without-pam to disable "
                         "PAM support.");
  
diff --git a/meta-networking/recipes-connectivity/samba/samba/smb.conf b/meta-networking/recipes-connectivity/samba/samba/smb.conf
new file mode 100644
index 0000000000..a0b87c3735
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/smb.conf
@@ -0,0 +1,254 @@
+#
+# Sample configuration file for the Samba suite for Debian GNU/Linux.
+#
+#
+# This is the main Samba configuration file. You should read the
+# smb.conf(5) manual page in order to understand the options listed
+# here. Samba has a huge number of configurable options most of which 
+# are not shown in this example
+#
+# Some options that are often worth tuning have been included as
+# commented-out examples in this file.
+#  - When such options are commented with ";", the proposed setting
+#    differs from the default Samba behaviour
+#  - When commented with "#", the proposed setting is the default
+#    behaviour of Samba but the option is considered important
+#    enough to be mentioned here
+#
+# NOTE: Whenever you modify this file you should run the command
+# "testparm" to check that you have not made any basic syntactic 
+# errors. 
+
+#======================= Global Settings =======================
+
+[global]
+
+## Browsing/Identification ###
+
+# Change this to the workgroup/NT-domain name your Samba server will part of
+   workgroup = WORKGROUP
+
+# Windows Internet Name Serving Support Section:
+# WINS Support - Tells the NMBD component of Samba to enable its WINS Server
+#   wins support = no
+
+# WINS Server - Tells the NMBD components of Samba to be a WINS Client
+# Note: Samba can be either a WINS Server, or a WINS Client, but NOT both
+;   wins server = w.x.y.z
+
+# This will prevent nmbd to search for NetBIOS names through DNS.
+   dns proxy = no
+
+#### Networking ####
+
+# The specific set of interfaces / networks to bind to
+# This can be either the interface name or an IP address/netmask;
+# interface names are normally preferred
+;   interfaces = 127.0.0.0/8 eth0
+
+# Only bind to the named interfaces and/or networks; you must use the
+# 'interfaces' option above to use this.
+# It is recommended that you enable this feature if your Samba machine is
+# not protected by a firewall or is a firewall itself.  However, this
+# option cannot handle dynamic or non-broadcast interfaces correctly.
+;   bind interfaces only = yes
+
+
+
+#### Debugging/Accounting ####
+
+# This tells Samba to use a separate log file for each machine
+# that connects
+   log file = /var/log/samba/log.%m
+
+# Cap the size of the individual log files (in KiB).
+   max log size = 1000
+
+# If you want Samba to only log through syslog then set the following
+# parameter to 'yes'.
+#   syslog only = no
+
+# We want Samba to log a minimum amount of information to syslog. Everything
+# should go to /var/log/samba/log.{smbd,nmbd} instead. If you want to log
+# through syslog you should set the following parameter to something higher.
+   syslog = 0
+
+# Do something sensible when Samba crashes: mail the admin a backtrace
+   panic action = /usr/share/samba/panic-action %d
+
+
+####### Authentication #######
+
+# Server role. Defines in which mode Samba will operate. Possible
+# values are "standalone server", "member server", "classic primary
+# domain controller", "classic backup domain controller", "active
+# directory domain controller". 
+#
+# Most people will want "standalone server" or "member server".
+# Running as "active directory domain controller" will require first
+# running "samba-tool domain provision" to wipe databases and create a
+# new domain.
+   server role = standalone server
+
+# If you are using encrypted passwords, Samba will need to know what
+# password database type you are using.  
+   passdb backend = tdbsam
+
+   obey pam restrictions = yes
+
+# This boolean parameter controls whether Samba attempts to sync the Unix
+# password with the SMB password when the encrypted SMB password in the
+# passdb is changed.
+   unix password sync = yes
+
+# For Unix password sync to work on a Debian GNU/Linux system, the following
+# parameters must be set (thanks to Ian Kahan <<kahan@informatik.tu-muenchen.de> for
+# sending the correct chat script for the passwd program in Debian Sarge).
+   passwd program = /usr/bin/passwd %u
+   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
+
+# This boolean controls whether PAM will be used for password changes
+# when requested by an SMB client instead of the program listed in
+# 'passwd program'. The default is 'no'.
+   pam password change = yes
+
+# This option controls how unsuccessful authentication attempts are mapped
+# to anonymous connections
+   map to guest = bad user
+
+########## Domains ###########
+
+#
+# The following settings only takes effect if 'server role = primary
+# classic domain controller', 'server role = backup domain controller'
+# or 'domain logons' is set 
+#
+
+# It specifies the location of the user's
+# profile directory from the client point of view) The following
+# required a [profiles] share to be setup on the samba server (see
+# below)
+;   logon path = \\%N\profiles\%U
+# Another common choice is storing the profile in the user's home directory
+# (this is Samba's default)
+#   logon path = \\%N\%U\profile
+
+# The following setting only takes effect if 'domain logons' is set
+# It specifies the location of a user's home directory (from the client
+# point of view)
+;   logon drive = H:
+#   logon home = \\%N\%U
+
+# The following setting only takes effect if 'domain logons' is set
+# It specifies the script to run during logon. The script must be stored
+# in the [netlogon] share
+# NOTE: Must be store in 'DOS' file format convention
+;   logon script = logon.cmd
+
+# This allows Unix users to be created on the domain controller via the SAMR
+# RPC pipe.  The example command creates a user account with a disabled Unix
+# password; please adapt to your needs
+; add user script = /usr/sbin/adduser --quiet --disabled-password --gecos "" %u
+
+# This allows machine accounts to be created on the domain controller via the 
+# SAMR RPC pipe.  
+# The following assumes a "machines" group exists on the system
+; add machine script  = /usr/sbin/useradd -g machines -c "%u machine account" -d /var/lib/samba -s /bin/false %u
+
+# This allows Unix groups to be created on the domain controller via the SAMR
+# RPC pipe.  
+; add group script = /usr/sbin/addgroup --force-badname %g
+
+############ Misc ############
+
+# Using the following line enables you to customise your configuration
+# on a per machine basis. The %m gets replaced with the netbios name
+# of the machine that is connecting
+;   include = /home/samba/etc/smb.conf.%m
+
+# Some defaults for winbind (make sure you're not using the ranges
+# for something else.)
+;   idmap uid = 10000-20000
+;   idmap gid = 10000-20000
+;   template shell = /bin/bash
+
+# Setup usershare options to enable non-root users to share folders
+# with the net usershare command.
+
+# Maximum number of usershare. 0 (default) means that usershare is disabled.
+;   usershare max shares = 100
+
+# Allow users who've been granted usershare privileges to create
+# public shares, not just authenticated ones
+   usershare allow guests = yes
+
+#======================= Share Definitions =======================
+
+[homes]
+   comment = Home Directories
+   browseable = no
+
+# By default, the home directories are exported read-only. Change the
+# next parameter to 'no' if you want to be able to write to them.
+   read only = yes
+
+# File creation mask is set to 0700 for security reasons. If you want to
+# create files with group=rw permissions, set next parameter to 0775.
+   create mask = 0700
+
+# Directory creation mask is set to 0700 for security reasons. If you want to
+# create dirs. with group=rw permissions, set next parameter to 0775.
+   directory mask = 0700
+
+# By default, \\server\username shares can be connected to by anyone
+# with access to the samba server.
+# The following parameter makes sure that only "username" can connect
+# to \\server\username
+# This might need tweaking when using external authentication schemes
+   valid users = %S
+
+# Un-comment the following and create the netlogon directory for Domain Logons
+# (you need to configure Samba to act as a domain controller too.)
+;[netlogon]
+;   comment = Network Logon Service
+;   path = /home/samba/netlogon
+;   guest ok = yes
+;   read only = yes
+
+# Un-comment the following and create the profiles directory to store
+# users profiles (see the "logon path" option above)
+# (you need to configure Samba to act as a domain controller too.)
+# The path below should be writable by all users so that their
+# profile directory may be created the first time they log on
+;[profiles]
+;   comment = Users profiles
+;   path = /home/samba/profiles
+;   guest ok = no
+;   browseable = no
+;   create mask = 0600
+;   directory mask = 0700
+
+[printers]
+   comment = All Printers
+   browseable = no
+   path = /var/spool/samba
+   printable = yes
+   guest ok = no
+   read only = yes
+   create mask = 0700
+
+# Windows clients look for this share name as a source of downloadable
+# printer drivers
+[print$]
+   comment = Printer Drivers
+   path = /var/lib/samba/printers
+   browseable = yes
+   read only = yes
+   guest ok = no
+# Uncomment to allow remote administration of Windows print drivers.
+# You may need to replace 'lpadmin' with the name of the group your
+# admin users are members of.
+# Please note that you also need to set appropriate Unix permissions
+# to the drivers directory for these users to have write rights in it
+;   write list = root, @lpadmin
+
diff --git a/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
index 77c8b3626b..6ae292835b 100644
--- a/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
@@ -1,4 +1,7 @@
-samba: correct log files location
+From f99b6a8617df6a46f41fb68ffafb2608dbb6681e Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Wed, 8 Nov 2017 11:58:05 -0800
+Subject: [PATCH] samba: correct log files location
 
 We use /var/log/samba.
 
@@ -6,9 +9,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
---- a/packaging/RHEL/setup/smb.conf
-+++ b/packaging/RHEL/setup/smb.conf
-@@ -63,7 +63,7 @@
+---
+ examples/smb.conf.default | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/smb.conf.default b/examples/smb.conf.default
+index 2f20720..44c1aa8 100644
+--- a/examples/smb.conf.default
++++ b/examples/smb.conf.default
+@@ -52,7 +52,7 @@
  
  # this tells Samba to use a separate log file for each machine
  # that connects
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
index fc1a2e0fd0..5afb1d1345 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
@@ -13,25 +13,27 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
 "
 
 SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
+           file://smb.conf \
            file://16-do-not-check-xsltproc-manpages.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
-           file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
-           file://0006-avoid-using-colon-in-the-checking-msg.patch \
            file://netdb_defines.patch \
            file://glibc_only.patch \
            file://iconv-4.7.0.patch \
            file://dnsserver-4.7.0.patch \
            file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
-          "
+           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch \
+           file://samba-pam.patch \
+           file://samba-4.3.9-remove-getpwent_r.patch \
+           "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
 
-SRC_URI[md5sum] = "16b70fda54cf84521ed976a0856430cc"
-SRC_URI[sha256sum] = "ca6fca9d7e248bcaa55c54bdcc115eeed10660074da5c54a2b78dd3cccc604de"
+SRC_URI[md5sum] = "67f271ed6b793c2acfe014b5b8f0cca8"
+SRC_URI[sha256sum] = "e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.7(\.\d+)+).tar.gz"
 
@@ -39,7 +41,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
@@ -104,7 +106,7 @@ SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODU
 # .so files so there will not be a conflict.  This is not done consistantly, so be very careful
 # when adding to this list.
 #
-SAMBA4_LIBS="heimdal,cmocka,NONE"
+SAMBA4_LIBS="heimdal,cmocka,ldb,pyldb-util,NONE"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
@@ -135,7 +137,7 @@ do_install_append() {
     done
 
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/bin/default/packaging/systemd/*.service ${D}${systemd_system_unitdir}/
     sed -e 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' \
         -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
         -i ${D}${systemd_system_unitdir}/*.service
@@ -159,7 +161,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
-    install -m644 packaging/RHEL/setup/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -m644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
     install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
     install -d ${D}${sysconfdir}/default
@@ -268,6 +270,7 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${libdir}/samba/idmap \
                  ${libdir}/samba/nss_info \
                  ${libdir}/winbind_krb5_locator.so \
+                 ${libdir}/winbind-krb5-localauth.so \
                  ${sysconfdir}/init.d/winbind \
                  ${systemd_system_unitdir}/winbind.service"
 
-- 
2.18.0


