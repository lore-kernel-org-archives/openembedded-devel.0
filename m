Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D3C847FA27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:12:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4732mV2HCfz5h
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572426778;
	bh=56r/5UvBoO6aA6sHSkkx7P5FSf2/1IzmGIA7Sndm4g4=;
	h=From:To:Subject:Date:From;
	b=ijigEGFDclrPcoe4fcX913CMlxPIXBYLAV+mZCuWYUbs2wcE4oq4Plqom6MkONMmo
	IUqdqFT0EIqbPz7Hz+VnDnm7N6Bc8ahALG+PsoocQhTddmkg7DVdELPIAmPRnlyhgB
	4EpBcSKVgWmvpyPQ6u+aYNWIcvRKQAyuMvGQvlECNDs5ESHKEf446/Nftcb5mYgloc
	hIj1EsiVBWYN7DpLVv9IL3bjFS1ODGhSU7dNC/p1nd/SfZR7Y+Ns/HROOuusVDc3Xj
	IbYn+3XW6nbrPlb0wNmp3jemqJnQPsDNh7eg9Lqc+jVQu5A7OHOnu5Ke5c6nv4+s8O
	LFoU6An/AqX8//PePhsUN6G9bmJMLyEJJNDHecRec9O+8mnC8DnXoT1EE0DM4tRof+
	6SLOvOwT4DO8TvVJPUq1fipbm971U3eRaKNCQXerGU+DMJDpq4Mi6vZgx2BENJJR5k
	0TV1LHTsrXZyEqn6E3ckndd544LI5JwKdJHAGeekqEDIG03G+/saqybSCZIUEcOyxq
	J3STq9cHp/+XGaTz4tXnopKcuMxKZnF1eQQlUxlMkgzPE22mMzzYVcOuzv8c7/Do/5
	cT5Pvx4YlUkx9waCpCOnNOIHxvwSFHQ6leXx7PirvylKunJdyMIZeEvOi/1USnTBvl
	fVeiXC8O4UndqZm2RoefYAcE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 11:12:57 +0200
Message-Id: <20191030091257.2642-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] cgdb: Upgrade 0.6.8 -> 0.7.1
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
X-List-Received-Date: Wed, 30 Oct 2019 09:12:59 -0000

Obsolete patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: Fix for mips build.
---
 ...se-of-mips-which-is-reserved-on-mips.patch | 67 +++++++++++++++++++
 .../cgdb/cgdb/remove-help2man.patch           | 47 -------------
 .../cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb}     |  9 +--
 3 files changed, 72 insertions(+), 51 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
 delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
 rename meta-oe/recipes-devtools/cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb} (68%)

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch b/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
new file mode 100644
index 000000000..daf90ad44
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
@@ -0,0 +1,67 @@
+From a3eba0fcee5e96ef47a6d3fac7196a1074f0dc17 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Wed, 30 Oct 2019 11:07:23 +0200
+Subject: Avoid use of "mips" which is reserved on mips
+
+Upstream-Status: Submitted [https://github.com/brasko/gdbwire/pull/9]
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+
+diff --git a/src/gdbwire_mi_parser.c b/src/gdbwire_mi_parser.c
+index 3f6b563..24aa0cf 100644
+--- a/lib/tgdb/gdbwire.c
++++ b/lib/tgdb/gdbwire.c
+@@ -40,7 +40,7 @@ struct gdbwire_mi_parser {
+     /* The GDB/MI lexer state */
+     yyscan_t mils;
+     /* The GDB/MI push parser state */
+-    gdbwire_mi_pstate *mips;
++    gdbwire_mi_pstate *mipst;
+     /* The client parser callbacks */
+     struct gdbwire_mi_parser_callbacks callbacks;
+ };
+@@ -71,8 +71,8 @@ gdbwire_mi_parser_create(struct gdbwire_mi_parser_callbacks callbacks)
+     }
+ 
+     /* Create a new push parser state instance */
+-    parser->mips = gdbwire_mi_pstate_new();
+-    if (!parser->mips) {
++    parser->mipst = gdbwire_mi_pstate_new();
++    if (!parser->mipst) {
+         gdbwire_mi_lex_destroy(parser->mils);
+         gdbwire_string_destroy(parser->buffer);
+         free(parser);
+@@ -81,7 +81,7 @@ gdbwire_mi_parser_create(struct gdbwire_mi_parser_callbacks callbacks)
+ 
+     /* Ensure that the callbacks are non null */
+     if (!callbacks.gdbwire_mi_output_callback) {
+-        gdbwire_mi_pstate_delete(parser->mips);
++        gdbwire_mi_pstate_delete(parser->mipst);
+         gdbwire_mi_lex_destroy(parser->mils);
+         gdbwire_string_destroy(parser->buffer);
+         free(parser);
+@@ -109,9 +109,9 @@ void gdbwire_mi_parser_destroy(struct gdbwire_mi_parser *parser)
+         }
+ 
+         /* Free the push parser instance */
+-        if (parser->mips) {
+-            gdbwire_mi_pstate_delete(parser->mips);
+-            parser->mips = NULL;
++        if (parser->mipst) {
++            gdbwire_mi_pstate_delete(parser->mipst);
++            parser->mipst = NULL;
+         }
+ 
+         free(parser);
+@@ -162,7 +162,7 @@ gdbwire_mi_parser_parse_line(struct gdbwire_mi_parser *parser,
+         pattern = gdbwire_mi_lex(parser->mils);
+         if (pattern == 0)
+             break;
+-        mi_status = gdbwire_mi_push_parse(parser->mips, pattern, NULL,
++        mi_status = gdbwire_mi_push_parse(parser->mipst, pattern, NULL,
+             parser->mils, &output);
+     } while (mi_status == YYPUSH_MORE);
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch b/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
deleted file mode 100644
index 4358629b7..000000000
--- a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Disable building manpages so that make install doesn't fail due to lack of help2man
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
----
- configure.ac    | 3 ---
- doc/Makefile.am | 5 -----
- 2 files changed, 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ee7eca0..1f0d924 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -134,9 +134,6 @@ dnl check that the required tools are available to generate documentation
- if test "$HAS_MAKEINFO" != "yes" ; then
- 	AC_MSG_ERROR([Please install makeinfo before installing])
- fi
--if test "$HAS_HELP2MAN" != "yes" ; then
--	AC_MSG_ERROR([Please install help2man])
--fi
- 
- dnl Checking for log10 function in math - I would like to remove this
- AC_CHECK_LIB(m, log10)
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 60662f6..0ae0013 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -1,15 +1,10 @@
- info_TEXINFOS = cgdb.texi
- cgdb_TEXINFOS = gpl.texi
- 
--dist_man_MANS = cgdb.1
- EXTRA_DIST = cgdb.txt
- 
- dist_pkgdata_DATA = cgdb.txt
- 
--# generate the man page using help2man.
--cgdb.1:
--	help2man --output=$(top_srcdir)/doc/cgdb.1 $(top_builddir)/cgdb/cgdb$(EXEEXT)
--
- cgdb.txt: cgdb.texi $(srcdir)/version.texi $(cgdb_TEXINFOS)
- TEXTS = cgdb.txt
- text-am: $(TEXTS)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
similarity index 68%
rename from meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
rename to meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
index 74019fb62..57e364e1c 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
@@ -10,11 +10,12 @@ DEPENDS = "flex-native readline ncurses"
 inherit autotools
 
 SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
-    file://remove-help2man.patch"
-SRC_URI[md5sum] = "7bd38c79bf4d794d239928fef401fca3"
-SRC_URI[sha256sum] = "be203e29be295097439ab67efe3dc8261f742c55ff3647718d67d52891f4cf41"
+           file://0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch \
+"
+SRC_URI[md5sum] = "a104862ffd3145b076303992e9a3af26"
+SRC_URI[sha256sum] = "bb723be58ec68cb59a598b8e24a31d10ef31e0e9c277a4de07b2f457fe7de198"
 
-CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2"
+CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2 ac_cv_file__proc_self_status=yes"
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} \
     --with-ncurses=${STAGING_LIBDIR}"
 
-- 
2.17.1


