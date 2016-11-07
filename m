Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id ECB2E719B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 07:41:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so15448217pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 23:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w/cZegccxTGeHLOFIucRUT54CDoFZUP7h6HMCZI/wPA=;
	b=rMZyX0rFCi4j7k3YQTFSjee+lJxvQ6kuorc4X1E7j3qpt42xMu/8kv2/3a1U+ErE94
	osXKkD5FkvORkF6I+JzHRKi3nEXKiO9bk4Etab5qlVkqrRp8gd3Pxvjbn0CNWy4b9Kwj
	fIa923CQOdHberdiIaWntxXh5yVMAGMnUd2K5hSb4MSkzlUKc7NdyTSf2tQ2dF3l19pk
	QNZ8HGzO5w2Q84b5Vahgkory+247jfR21tlbsAzNCyA9+cAWkRmutnqySC193uyvCoN9
	HUKDwiEgtzHVe5aV3NBr0dSa9YQXneyrDB5q/qXuoJzXQuI1HQYdGpd/mQg0hi5lwSEP
	P1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w/cZegccxTGeHLOFIucRUT54CDoFZUP7h6HMCZI/wPA=;
	b=NYrl4DjkyXQxnEOwZZNmlzBhPRd3Gt4IAv3pd0nzY2KC8MZQ0EAx0c9AR42GrZJfDK
	TtqEIXyAXx3OibGh7Usd+bStCxQMegAS7F3AE4DQfOHML7WrmLgzxcwxD+x+xVcZEXC7
	R26RLSPorOsTRmgs+ij39R2HKgx2+/pGHhJBgONAq8uXwPoZCR3c9lUn81gcdAx+2VA8
	hzxQVMyn+7YKiXK1nYAXNnUhpV/6e7MNCI4xLUih2ilc+XGnQYH7+wyT/dOTTqT4Qc1p
	jPaPP5rene9ZbNoUSRkInYTU450FaXpFNI/9ojmO5oFfk8hf8A/RdIci36gs3/fCiva6
	SaMg==
X-Gm-Message-State: ABUngvc9RU3asEPylGxdnyYmiyhmw0ETYoHZJHLdViw7YxVQYabxTdkVcPBdk1f7mfl1IQ==
X-Received: by 10.99.54.74 with SMTP id d71mr8888705pga.34.1478504462750;
	Sun, 06 Nov 2016 23:41:02 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	131sm37626623pfx.92.2016.11.06.23.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 23:41:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:40:54 -0800
Message-Id: <20161107074056.18613-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-networking][PATCH 1/3] samba: Fix build with musl
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
X-List-Received-Date: Mon, 07 Nov 2016 07:41:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../samba/samba-4.4.5/samba-4.2.7-pam.patch        | 36 +++++++++
 .../samba-4.3.9-remove-getpwent_r.patch            | 87 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.4.5.bb      |  7 ++
 3 files changed, 130 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch
new file mode 100644
index 0000000..6b9ade9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.2.7-pam.patch
@@ -0,0 +1,36 @@
+Lifted from gentoo and ported to 4.4.5
+
+http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: samba-4.4.5/source3/wscript
+===================================================================
+--- samba-4.4.5.orig/source3/wscript
++++ samba-4.4.5/source3/wscript
+@@ -873,7 +873,7 @@ msg.msg_accrightslen = sizeof(fd);
+         if conf.env.with_iconv:
+             conf.DEFINE('HAVE_ICONV', 1)
+ 
+-    if Options.options.with_pam:
++    if Options.options.with_pam != False:
+         use_pam=True
+         conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
+         if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
+@@ -945,6 +945,15 @@ int i; i = PAM_RADIO_TYPE;
+         if use_pam:
+             conf.DEFINE('WITH_PAM', 1)
+             conf.DEFINE('WITH_PAM_MODULES', 1)
++    else:
++        Logs.warn("PAM disabled")
++        use_pam=False
++        conf.undefine('WITH_PAM')
++        conf.undefine('WITH_PAM_MODULES')
++        conf.undefine('HAVE_SECURITY_PAM_APPL_H')
++        conf.undefine('PAM_RHOST')
++        conf.undefine('PAM_TTY')
++        conf.undefine('HAVE_PAM_PAM_APPL_H')
+ 
+     seteuid = False
+ 
diff --git a/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch
new file mode 100644
index 0000000..71db99c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.4.5/samba-4.3.9-remove-getpwent_r.patch
@@ -0,0 +1,87 @@
+Musl does not have _r versions of getent() and getpwent() APIs
+
+Taken from gentoo
+http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_r.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: samba-4.4.5/source4/torture/local/nss_tests.c
+===================================================================
+--- samba-4.4.5.orig/source4/torture/local/nss_tests.c
++++ samba-4.4.5/source4/torture/local/nss_tests.c
+@@ -247,7 +247,6 @@ static bool test_getgrnam_r(struct tortu
+ 	return true;
+ }
+ 
+-
+ static bool test_getgrgid(struct torture_context *tctx,
+ 			  gid_t gid,
+ 			  struct group *grp_p)
+@@ -333,6 +332,7 @@ static bool test_enum_passwd(struct tort
+ 	return true;
+ }
+ 
++#if HAVE_GETPWENT_R
+ static bool test_enum_r_passwd(struct torture_context *tctx,
+ 			       struct passwd **pwd_array_p,
+ 			       size_t *num_pwd_p)
+@@ -381,6 +381,7 @@ static bool test_enum_r_passwd(struct to
+ 
+ 	return true;
+ }
++#endif
+ 
+ static bool torture_assert_passwd_equal(struct torture_context *tctx,
+ 					const struct passwd *p1,
+@@ -432,7 +433,7 @@ static bool test_passwd_r(struct torture
+ 	struct passwd *pwd, pwd1, pwd2;
+ 	size_t num_pwd;
+ 
+-	torture_assert(tctx, test_enum_r_passwd(tctx, &pwd, &num_pwd),
++	torture_assert(tctx, test_enum_passwd(tctx, &pwd, &num_pwd),
+ 						"failed to enumerate passwd");
+ 
+ 	for (i=0; i < num_pwd; i++) {
+@@ -460,7 +461,7 @@ static bool test_passwd_r_cross(struct t
+ 	struct passwd *pwd, pwd1, pwd2, pwd3, pwd4;
+ 	size_t num_pwd;
+ 
+-	torture_assert(tctx, test_enum_r_passwd(tctx, &pwd, &num_pwd),
++	torture_assert(tctx, test_enum_passwd(tctx, &pwd, &num_pwd),
+ 						"failed to enumerate passwd");
+ 
+ 	for (i=0; i < num_pwd; i++) {
+@@ -531,6 +532,7 @@ static bool test_enum_group(struct tortu
+ 	return true;
+ }
+ 
++#if HAVE_GETGRENT_R
+ static bool test_enum_r_group(struct torture_context *tctx,
+ 			      struct group **grp_array_p,
+ 			      size_t *num_grp_p)
+@@ -579,6 +581,7 @@ static bool test_enum_r_group(struct tor
+ 
+ 	return true;
+ }
++#endif
+ 
+ static bool torture_assert_group_equal(struct torture_context *tctx,
+ 				       const struct group *g1,
+@@ -635,7 +638,7 @@ static bool test_group_r(struct torture_
+ 	struct group *grp, grp1, grp2;
+ 	size_t num_grp;
+ 
+-	torture_assert(tctx, test_enum_r_group(tctx, &grp, &num_grp),
++	torture_assert(tctx, test_enum_group(tctx, &grp, &num_grp),
+ 					       "failed to enumerate group");
+ 
+ 	for (i=0; i < num_grp; i++) {
+@@ -663,7 +666,7 @@ static bool test_group_r_cross(struct to
+ 	struct group *grp, grp1, grp2, grp3, grp4;
+ 	size_t num_grp;
+ 
+-	torture_assert(tctx, test_enum_r_group(tctx, &grp, &num_grp),
++	torture_assert(tctx, test_enum_group(tctx, &grp, &num_grp),
+ 					       "failed to enumerate group");
+ 
+ 	for (i=0; i < num_grp; i++) {
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e9694d4..a27bcd1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -20,6 +20,10 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
            file://volatiles.03_samba \
           "
+SRC_URI_append_libc-musl = " \
+           file://samba-4.2.7-pam.patch \
+           file://samba-4.3.9-remove-getpwent_r.patch \
+          "
 
 SRC_URI[md5sum] = "6950c5e9f7bdeb8a610c2ca957a15be4"
 SRC_URI[sha256sum] = "b876ef2e63f66265490e80a122e66ef2d7616112b839df68f56ac2e1ce17a7bd"
@@ -29,6 +33,9 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 RDEPENDS_${PN}_remove = "perl"
 
 DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
-- 
2.10.2


