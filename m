Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6109775E2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 06:38:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u756cHqH004007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Aug 2016 23:38:17 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Aug 2016 23:38:16 -0700
From: Mingli Yu <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Aug 2016 14:38:11 +0800
Message-ID: <1470379091-15828-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: 9.4.5 -> 9.4.8
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
X-List-Received-Date: Fri, 05 Aug 2016 06:38:18 -0000
Content-Type: text/plain

* Upgrade postgresql from 9.4.5 to 9.4.8
* Update LIC_FILES_CHKSUM as COPYRIGHT file
  updates
* Remove two backport CVE patches

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../files/postgresql-CVE-2016-0766.patch           |  35 ----
 .../files/postgresql-CVE-2016-0773.patch           | 222 ---------------------
 meta-oe/recipes-support/postgresql/postgresql.inc  |   2 -
 .../recipes-support/postgresql/postgresql_9.4.5.bb |  14 --
 .../recipes-support/postgresql/postgresql_9.4.8.bb |  14 ++
 5 files changed, 14 insertions(+), 273 deletions(-)
 delete mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch
 delete mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0773.patch
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch b/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch
deleted file mode 100644
index df89eb0..0000000
--- a/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f4aa3a18a20d51575562520754aa376b3b08b2d0 Mon Sep 17 00:00:00 2001
-From: Noah Misch <noah@leadboat.com>
-Date: Fri, 5 Feb 2016 20:22:51 -0500
-Subject: [PATCH] Force certain "pljava" custom GUCs to be PGC_SUSET.
-
-Future PL/Java versions will close CVE-2016-0766 by making these GUCs
-PGC_SUSET.  This PostgreSQL change independently mitigates that PL/Java
-vulnerability, helping sites that update PostgreSQL more frequently than
-PL/Java.  Back-patch to 9.1 (all supported versions).
-
-Upstream-Status: Backport
-
-Signed-off-by: Noah Misch <noah@leadboat.com>
-Index: postgresql-9.4.4/src/backend/utils/misc/guc.c
-===================================================================
---- postgresql-9.4.4.orig/src/backend/utils/misc/guc.c	2015-06-10 03:29:38.000000000 +0800
-+++ postgresql-9.4.4/src/backend/utils/misc/guc.c	2016-03-04 15:58:26.459266951 +0800
-@@ -7072,6 +7072,17 @@
- 		!process_shared_preload_libraries_in_progress)
- 		elog(FATAL, "cannot create PGC_POSTMASTER variables after startup");
- 
-+	/*
-+	 * Before pljava commit 398f3b876ed402bdaec8bc804f29e2be95c75139
-+	 * (2015-12-15), two of that module's PGC_USERSET variables facilitated
-+	 * trivial escalation to superuser privileges.  Restrict the variables to
-+	 * protect sites that have yet to upgrade pljava.
-+	 */
-+	if (context == PGC_USERSET &&
-+		(strcmp(name, "pljava.classpath") == 0 ||
-+		 strcmp(name, "pljava.vmoptions") == 0))
-+		context = PGC_SUSET;
-+
- 	gen = (struct config_generic *) guc_malloc(ERROR, sz);
- 	memset(gen, 0, sz);
- 
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0773.patch b/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0773.patch
deleted file mode 100644
index 0fc9082..0000000
--- a/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0773.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-From 3bb3f42f3749d40b8d4de65871e8d828b18d4a45 Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Mon, 8 Feb 2016 10:25:40 -0500
-Subject: [PATCH] Fix some regex issues with out-of-range characters and large
- char ranges.
-
-Previously, our regex code defined CHR_MAX as 0xfffffffe, which is a
-bad choice because it is outside the range of type "celt" (int32).
-Characters approaching that limit could lead to infinite loops in logic
-such as "for (c = a; c <= b; c++)" where c is of type celt but the
-range bounds are chr.  Such loops will work safely only if CHR_MAX+1
-is representable in celt, since c must advance to beyond b before the
-loop will exit.
-
-Fortunately, there seems no reason not to restrict CHR_MAX to 0x7ffffffe.
-It's highly unlikely that Unicode will ever assign codes that high, and
-none of our other backend encodings need characters beyond that either.
-
-In addition to modifying the macro, we have to explicitly enforce character
-range restrictions on the values of \u, \U, and \x escape sequences, else
-the limit is trivially bypassed.
-
-Also, the code for expanding case-independent character ranges in bracket
-expressions had a potential integer overflow in its calculation of the
-number of characters it could generate, which could lead to allocating too
-small a character vector and then overwriting memory.  An attacker with the
-ability to supply arbitrary regex patterns could easily cause transient DOS
-via server crashes, and the possibility for privilege escalation has not
-been ruled out.
-
-Quite aside from the integer-overflow problem, the range expansion code was
-unnecessarily inefficient in that it always produced a result consisting of
-individual characters, abandoning the knowledge that we had a range to
-start with.  If the input range is large, this requires excessive memory.
-Change it so that the original range is reported as-is, and then we add on
-any case-equivalent characters that are outside that range.  With this
-approach, we can bound the number of individual characters allowed without
-sacrificing much.  This patch allows at most 100000 individual characters,
-which I believe to be more than the number of case pairs existing in
-Unicode, so that the restriction will never be hit in practice.
-
-It's still possible for range() to take awhile given a large character code
-range, so also add statement-cancel detection to its loop.  The downstream
-function dovec() also lacked cancel detection, and could take a long time
-given a large output from range().
-
-Per fuzz testing by Greg Stark.  Back-patch to all supported branches.
-
-Security: CVE-2016-0773
-
-Upstream-Status: Backport
-
-Signed-off-by: Tom Lane <tgl@sss.pgh.pa.us>
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
-Index: postgresql-9.4.5/src/backend/regex/regc_lex.c
-===================================================================
---- postgresql-9.4.5.orig/src/backend/regex/regc_lex.c	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/backend/regex/regc_lex.c	2016-03-10 10:29:57.045784317 +0800
-@@ -792,13 +792,13 @@
- 			break;
- 		case CHR('u'):
- 			c = lexdigits(v, 16, 4, 4);
--			if (ISERR())
-+			if (ISERR() || c < CHR_MIN || c > CHR_MAX)
- 				FAILW(REG_EESCAPE);
- 			RETV(PLAIN, c);
- 			break;
- 		case CHR('U'):
- 			c = lexdigits(v, 16, 8, 8);
--			if (ISERR())
-+			if (ISERR() || c < CHR_MIN || c > CHR_MAX)
- 				FAILW(REG_EESCAPE);
- 			RETV(PLAIN, c);
- 			break;
-@@ -816,7 +816,7 @@
- 		case CHR('x'):
- 			NOTE(REG_UUNPORT);
- 			c = lexdigits(v, 16, 1, 255);		/* REs >255 long outside spec */
--			if (ISERR())
-+			if (ISERR() || c < CHR_MIN || c > CHR_MAX)
- 				FAILW(REG_EESCAPE);
- 			RETV(PLAIN, c);
- 			break;
-@@ -872,6 +872,9 @@
- 
- /*
-  * lexdigits - slurp up digits and return chr value
-+ *
-+ * This does not account for overflow; callers should range-check the result
-+ * if maxlen is large enough to make that possible.
-  */
- static chr						/* chr value; errors signalled via ERR */
- lexdigits(struct vars * v,
-Index: postgresql-9.4.5/src/backend/regex/regc_locale.c
-===================================================================
---- postgresql-9.4.5.orig/src/backend/regex/regc_locale.c	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/backend/regex/regc_locale.c	2016-03-10 10:34:28.757781726 +0800
-@@ -408,8 +408,7 @@
- 	int			nchrs;
- 	struct cvec *cv;
- 	celt		c,
--				lc,
--				uc;
-+				cc;
- 
- 	if (a != b && !before(a, b))
- 	{
-@@ -427,24 +426,48 @@
- 
- 	/*
- 	 * When case-independent, it's hard to decide when cvec ranges are usable,
--	 * so for now at least, we won't try.  We allocate enough space for two
--	 * case variants plus a little extra for the two title case variants.
-+	 * so for now at least, we won't try.  We use a range for the originally
-+	 * specified chrs and then add on any case-equivalents that are outside
-+	 * that range as individual chrs.
-+	 *
-+	 * To ensure sane behavior if someone specifies a very large range, limit
-+	 * the allocation size to 100000 chrs (arbitrary) and check for overrun
-+	 * inside the loop below.
- 	 */
- 
--	nchrs = (b - a + 1) * 2 + 4;
--
--	cv = getcvec(v, nchrs, 0);
-+	cv = getcvec(v, nchrs, 1);
- 	NOERRN();
-+	addrange(cv, a, b);
- 
- 	for (c = a; c <= b; c++)
- 	{
--		addchr(cv, c);
--		lc = pg_wc_tolower((chr) c);
--		if (c != lc)
--			addchr(cv, lc);
--		uc = pg_wc_toupper((chr) c);
--		if (c != uc)
--			addchr(cv, uc);
-+		cc = pg_wc_tolower((chr) c);
-+		if (cc != c &&
-+			(before(cc, a) || before(b, cc)))
-+		{
-+			if (cv->nchrs >= cv->chrspace)
-+			{
-+				ERR(REG_ETOOBIG);
-+				return NULL;
-+			}
-+			addchr(cv, cc);
-+		}
-+		cc = pg_wc_toupper((chr) c);
-+		if (cc != c &&
-+			(before(cc, a) || before(b, cc)))
-+		{
-+			if (cv->nchrs >= cv->chrspace)
-+			{
-+				ERR(REG_ETOOBIG);
-+				return NULL;
-+			}
-+			addchr(cv, cc);
-+		}
-+		if (CANCEL_REQUESTED(v->re))
-+		{
-+			ERR(REG_CANCEL);
-+			return NULL;
-+		}
- 	}
- 
- 	return cv;
-Index: postgresql-9.4.5/src/backend/regex/regcomp.c
-===================================================================
---- postgresql-9.4.5.orig/src/backend/regex/regcomp.c	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/backend/regex/regcomp.c	2016-03-10 10:35:25.397781185 +0800
-@@ -1569,6 +1569,7 @@
- 	{
- 		ch = *p;
- 		newarc(v->nfa, PLAIN, subcolor(v->cm, ch), lp, rp);
-+		NOERR();
- 	}
- 
- 	/* and the ranges */
-@@ -1578,6 +1579,7 @@
- 		to = *(p + 1);
- 		if (from <= to)
- 			subrange(v, from, to, lp, rp);
-+		NOERR();
- 	}
- }
- 
-Index: postgresql-9.4.5/src/include/regex/regcustom.h
-===================================================================
---- postgresql-9.4.5.orig/src/include/regex/regcustom.h	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/include/regex/regcustom.h	2016-03-10 10:37:09.989780188 +0800
-@@ -65,7 +65,8 @@
- #define DIGITVAL(c) ((c)-'0')	/* turn chr digit into its value */
- #define CHRBITS 32				/* bits in a chr; must not use sizeof */
- #define CHR_MIN 0x00000000		/* smallest and largest chr; the value */
--#define CHR_MAX 0xfffffffe		/* CHR_MAX-CHR_MIN+1 should fit in uchr */
-+#define CHR_MAX 0x7ffffffe		/* CHR_MAX-CHR_MIN+1 must fit in an int, and
-+								 * CHR_MAX+1 must fit in both chr and celt */
- 
- /* functions operating on chr */
- #define iscalnum(x) pg_wc_isalnum(x)
-Index: postgresql-9.4.5/src/test/regress/expected/regex.out
-===================================================================
---- postgresql-9.4.5.orig/src/test/regress/expected/regex.out	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/test/regress/expected/regex.out	2016-03-10 10:38:28.821779436 +0800
-@@ -222,3 +222,5 @@
-  t
- (1 row)
- 
-+select 'a' ~ '\x7fffffff';  -- invalid chr code
-+ERROR:  invalid regular expression: invalid escape \ sequence
-Index: postgresql-9.4.5/src/test/regress/sql/regex.sql
-===================================================================
---- postgresql-9.4.5.orig/src/test/regress/sql/regex.sql	2015-10-06 03:12:06.000000000 +0800
-+++ postgresql-9.4.5/src/test/regress/sql/regex.sql	2016-03-10 10:38:57.845779159 +0800
-@@ -57,3 +57,4 @@
- select 'a' ~ '.. ()|\1';
- select 'a' ~ '()*\1';
- select 'a' ~ '()+\1';
-+select 'a' ~ '\x7fffffff';  -- invalid chr code
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 32ffe19..e473f58 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -31,8 +31,6 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql-setup \
     file://postgresql.service \
     file://0001-Use-pkg-config-for-libxml2-detection.patch \
-    file://postgresql-CVE-2016-0766.patch \
-    file://postgresql-CVE-2016-0773.patch \
 "
 
 LEAD_SONAME = "libpq.so"
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
deleted file mode 100644
index 54b660e..0000000
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7d847a9b446ddfe187acfac664189672"
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "\
-    file://remove.autoconf.version.check.patch \
-    file://not-check-libperl.patch \
-"
-
-SRC_URI[md5sum] = "8b2e3472a8dc786649b4d02d02e039a0"
-SRC_URI[sha256sum] = "b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39"
-
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb
new file mode 100644
index 0000000..7dba92c
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb
@@ -0,0 +1,14 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a9c1120056a102a8c8c4013cd828dce"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "\
+    file://remove.autoconf.version.check.patch \
+    file://not-check-libperl.patch \
+"
+
+SRC_URI[md5sum] = "a1a2e8014b2b4c49fc58fe2e2fe83681"
+SRC_URI[sha256sum] = "4a10640e180e0d9adb587bc25a82dcce6bf507b033637e7fb9d4eeffa33a6b4c"
+
-- 
2.8.1


