Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3B675596
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c78so3718654pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=efPRKM7+qUTedu0Uckyu8MnijUC+k/3elMQAXiK8jHo=;
	b=sbjKrbEbh3mP7dQNqKP+WfWUKE14hkWF8iJP6DEArCD5J2C12hg34VqRTVVHONEeaB
	NZE2rWp60opbdzbhoqsn3L3Gq5J7WbU8bs13FNi78JXnxxOjiD1xw1ZZtPtDAuAgs8vE
	I/VxgvQdUF3AHQdIiQ3RY8ycliEVwX68We6YsiK5fSAYE+rfywUIE/h9QQKqIF4CT8sV
	13PtB+DFDoe1xXto+37Fl+VKWVY8Teno+hKV6ZmwHUiCQgRWt0DNp5MFWGQ5sIL+dygm
	a3LATmmR+1FiSifzMhSezKf+TMyGKvP3MLqesC6obNkHTkfb8f6eY9f6zOfN3xkseFqh
	p3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=efPRKM7+qUTedu0Uckyu8MnijUC+k/3elMQAXiK8jHo=;
	b=UlAO86manyPAm+VC3NlN1mQA+k+b0aP4tkthU7Yx66jHho2LL47yv6WDQcerXyIAd7
	ZK+H7G34+NYNiVVROmx+gowaHvBh3IFxODokXcmcLlbn/gVOMV1XMVsjhi2akIINX+20
	4FkeYA+Z4a9wDEwW79Rsq1I7M7kkEum5UpEW+62SVODs6Gxjzqd9H/X8n/kJPYKRxGg4
	HzDoDLmT9aAmcfqVaAwAb2wQoNhn++zrKWKnA8KUj3H6DzVNWgkdFRpg4+/o1vXxRaSt
	lST9XtshCxg4/KFGFQEmRSaaU70cMYXVfaUn5E6Eh2j56M7/jJHQ+VZQGwi90j8u9/k4
	NbuQ==
X-Gm-Message-State: AElRT7GgNprKFgBzpnYiog2C4VTWLZ0fCa5WcyzSaz8PU7cyeCjjEp3P
	gi7kAG7g/Ju+OwfUcI1BlkdNtw==
X-Google-Smtp-Source: AIpwx4+EM1FeHFDGnX1YeHiDA7PTGyFlE7ZezU2AFCT6KjzqMJZZU6IQ2wqbDFeR1lDmzs0tDpr40A==
X-Received: by 10.98.213.9 with SMTP id d9mr25180993pfg.234.1523170762362;
	Sat, 07 Apr 2018 23:59:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:42 -0700
Message-Id: <1523170729-26321-30-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 30/37] postgresql: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:21 -0000

WARNING: postgresql-9.4.15-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch remove.autoconf.version.check.patch
patching file configure.in
Hunk #1 succeeded at 19 with fuzz 2.

Now at patch remove.autoconf.version.check.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Use-pkg-config-for-libxml2-detection.patch   | 13 +++++--------
 .../recipes-dbs/postgresql/files/not-check-libperl.patch    | 13 +++++--------
 .../postgresql/files/remove.autoconf.version.check.patch    |  9 ++++-----
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
index d08ec6a..ce2a60c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -12,11 +12,11 @@ Signed-off-by: Philip Balister <philip@balister.org>
  configure.in | 15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index f8bf466..1f4fabf 100644
---- a/configure.in
-+++ b/configure.in
-@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
+Index: postgresql-9.4.15/configure.in
+===================================================================
+--- postgresql-9.4.15.orig/configure.in
++++ postgresql-9.4.15/configure.in
+@@ -759,19 +759,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build w
                [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
  
  if test "$with_libxml" = yes ; then
@@ -38,6 +38,3 @@ index f8bf466..1f4fabf 100644
  fi
  
  AC_SUBST(with_libxml)
--- 
-1.8.3.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index e199f39..9715109 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -13,11 +13,11 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index ae1a5a0..9a0970d 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1877,7 +1877,7 @@ if test "$with_tcl" = yes; then
+Index: postgresql-9.4.15/configure.in
+===================================================================
+--- postgresql-9.4.15.orig/configure.in
++++ postgresql-9.4.15/configure.in
+@@ -1879,7 +1879,7 @@ if test "$with_tcl" = yes; then
  fi
  
  # check for <perl.h>
@@ -26,6 +26,3 @@ index ae1a5a0..9a0970d 100644
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS -I$perl_archlibexp/CORE"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch b/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
index be23fd4..be82f10 100644
--- a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
@@ -1,10 +1,10 @@
-Index: postgresql-9.2.4/configure.in
+Index: postgresql-9.4.15/configure.in
 ===================================================================
---- postgresql-9.2.4.orig/configure.in
-+++ postgresql-9.2.4/configure.in
+--- postgresql-9.4.15.orig/configure.in
++++ postgresql-9.4.15/configure.in
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
  
- AC_INIT([PostgreSQL], [9.4.2], [pgsql-bugs@postgresql.org])
+ AC_INIT([PostgreSQL], [9.4.15], [pgsql-bugs@postgresql.org])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -13,4 +13,3 @@ Index: postgresql-9.2.4/configure.in
  AC_COPYRIGHT([Copyright (c) 1996-2014, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
-
-- 
2.7.4


