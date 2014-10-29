Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB876E633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:34:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T0YQTB017305
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 17:34:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 28 Oct 2014 17:34:26 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <otavio@ossystems.com.br>
Date: Wed, 29 Oct 2014 08:30:57 +0800
Message-ID: <1414542659-15721-7-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
References: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: Yue.Tao@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/8] postgresql: add fix for CVE-2014-0067 Security Advisory
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
X-List-Received-Date: Wed, 29 Oct 2014 00:34:26 -0000
Content-Type: text/plain

The make check command for the test suites in PostgreSQL 9.3.3 and
earlier does not properly invoke initdb to specify the authentication
requirements for a database cluster to be used for the tests, which
allows local users to gain privileges by leveraging access to this
cluster.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0067

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
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


