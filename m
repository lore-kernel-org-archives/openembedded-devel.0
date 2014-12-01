Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1600372262
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:37 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so9907484pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dNi6Gbrgtze6xteMoyoeCGti+i1XQMVPu0RVAchSQeg=;
	b=ft7Kscr9yqnLLeXHCf30+Dvh0B4IyIS4r6/zYY72TZcCZSTvkPHio4W1q+D3JXSa33
	u4me7Vy1A0u5sUV/x8q129m6gLeNv6nj6zkgmAd3qK9sh0+37NgazUADPR3NQ14jEDXK
	xLXGihpcpZsfLcdErW2JnOCwElMptMLolFzX0Dn4OvtPP7/Lu1d7fgAaaAPzEKMxRhZa
	1YayLM8SKfQ4aop5ZiqmXrBnYas2rkwfhBpz9u8l4fGu2FIoOrxpqvgzQOXEgHq2sNke
	zUkEAJwSeZpALgBNE6nyS7sQ9dhaJJx44tR6sA2o/bEzkamRm5yHPfOLN7FDLsVnHREe
	NO5A==
X-Received: by 10.68.91.4 with SMTP id ca4mr68843239pbb.97.1417395878616;
	Sun, 30 Nov 2014 17:04:38 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:10 -0800
Message-Id: <05175dcccfe0d9ec5f964c3d9a793fb9c9c9c0f3.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 08/15] postgresql: add fix for CVE-2014-0067 Security Advisory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 01:04:38 -0000

From: Kang Kai <kai.kang@windriver.com>

The make check command for the test suites in PostgreSQL 9.3.3 and
earlier does not properly invoke initdb to specify the authentication
requirements for a database cluster to be used for the tests, which
allows local users to gain privileges by leveraging access to this
cluster.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0067

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...al-available-to-pg_regress-of-ECPG-and-is.patch | 75 ++++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch

diff --git a/meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch b/meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch
new file mode 100644
index 0000000..3cffc0a
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch
@@ -0,0 +1,75 @@
+From 0ae841a98c21c53901d5bc9a9323a8cc800364f6 Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Sat, 14 Jun 2014 10:52:25 -0400
+Subject: [PATCH] Make pqsignal() available to pg_regress of ECPG and
+ isolation suites.
+
+commit 0ae841a98c21c53901d5bc9a9323a8cc800364f6 REL9_2_STABLE
+
+Commit 453a5d91d49e4d35054f92785d830df4067e10c1 made it available to the
+src/test/regress build of pg_regress, but all pg_regress builds need the
+same treatment.  Patch 9.2 through 8.4; in 9.3 and later, pg_regress
+gets pqsignal() via libpgport.
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/interfaces/ecpg/test/Makefile |    4 ++--
+ src/test/isolation/Makefile       |   12 +++++++-----
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/src/interfaces/ecpg/test/Makefile b/src/interfaces/ecpg/test/Makefile
+index e9944c6..4bb9525 100644
+--- a/src/interfaces/ecpg/test/Makefile
++++ b/src/interfaces/ecpg/test/Makefile
+@@ -47,10 +47,10 @@ clean distclean maintainer-clean:
+ 
+ all: pg_regress$(X)
+ 
+-pg_regress$(X): pg_regress_ecpg.o $(top_builddir)/src/test/regress/pg_regress.o
++pg_regress$(X): pg_regress_ecpg.o $(top_builddir)/src/test/regress/pg_regress.o $(top_builddir)/src/test/regress/pqsignal.o
+ 	$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_EX) $^ $(LIBS) -o $@
+ 
+-$(top_builddir)/src/test/regress/pg_regress.o:
++$(top_builddir)/src/test/regress/pg_regress.o $(top_builddir)/src/test/regress/pqsignal.o:
+ 	$(MAKE) -C $(dir $@) $(notdir $@)
+ 
+ # dependencies ensure that path changes propagate
+diff --git a/src/test/isolation/Makefile b/src/test/isolation/Makefile
+index 46ea6f0..e20ba48 100644
+--- a/src/test/isolation/Makefile
++++ b/src/test/isolation/Makefile
+@@ -15,13 +15,15 @@ OBJS =  specparse.o isolationtester.o
+ 
+ all: isolationtester$(X) pg_isolation_regress$(X)
+ 
+-submake-regress:
++pg_regress.o:
+ 	$(MAKE) -C $(top_builddir)/src/test/regress pg_regress.o
+-
+-pg_regress.o: | submake-regress
+ 	rm -f $@ && $(LN_S) $(top_builddir)/src/test/regress/pg_regress.o .
+ 
+-pg_isolation_regress$(X): isolation_main.o pg_regress.o
++pqsignal.o:
++	$(MAKE) -C $(top_builddir)/src/test/regress pqsignal.o
++	rm -f $@ && $(LN_S) $(top_builddir)/src/test/regress/pqsignal.o .
++
++pg_isolation_regress$(X): isolation_main.o pg_regress.o pqsignal.o
+ 	$(CC) $(CFLAGS) $^ $(LDFLAGS) $(LDFLAGS_EX) $(LIBS) -o $@
+ 
+ isolationtester$(X): $(OBJS) | submake-libpq submake-libpgport
+@@ -59,7 +61,7 @@ endif
+ # so do not clean them here
+ clean distclean:
+ 	rm -f isolationtester$(X) pg_isolation_regress$(X) $(OBJS) isolation_main.o
+-	rm -f pg_regress.o
++	rm -f pg_regress.o pqsignal.o
+ 	rm -rf $(pg_regress_clean_files)
+ 
+ maintainer-clean: distclean
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 4a62eb6..ce31205 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch \
            file://0005-Avoid-repeated-name-lookups-during-table-and-index-D.patch \
            file://0006-Fix-handling-of-wide-datetime-input-output.patch \
+           file://0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch \
           "
 
 LEAD_SONAME = "libpq.so"
-- 
1.9.1


