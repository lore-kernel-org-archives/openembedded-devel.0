Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A19F875713
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 08:10:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t518AF4j010864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Jun 2015 01:10:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 01:10:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jun 2015 16:04:16 +0800
Message-ID: <1433145856-23231-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] mariadb: Security Advisory -CVE-2015-2305
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
X-List-Received-Date: Mon, 01 Jun 2015 08:10:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-2305

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mysql/mariadb/fix-CVE-2015-2305.patch          | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 00fa965..540b159 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -12,6 +12,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
+           file://fix-CVE-2015-2305.patch \
           "
 
 SRC_URI[md5sum] = "c8760d6b5890fc1de76c07af48092c88"
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch b/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
new file mode 100644
index 0000000..2d1b467
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
@@ -0,0 +1,43 @@
+From f5c1d00a9ceb61acfe038dcf2ec0236c2939328c Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 1 Jun 2015 15:31:48 +0800
+Subject: [PATCH] From 70bc2965604b6b8aaf260049e64c708dddf85334 Mon Sep 17
+ 00:00:00 2001 From: Gary Houston <ghouston@arglist.com> Date: Wed, 25 Feb
+ 2015 13:29:03 +1100 Subject: [PATCH] Bug fix for integer overflow in regcomp
+ for excessively long  pattern strings. CERT Vulnerability Note VU#695940.
+ Found by Guido Vranken.
+
+Upsteam-Status: Backport
+
+https://bugzilla.suse.com/attachment.cgi?id=627001
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ regex/regcomp.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/regex/regcomp.c b/regex/regcomp.c
+index abc1817..31e57c1 100644
+--- a/regex/regcomp.c
++++ b/regex/regcomp.c
+@@ -138,7 +138,16 @@ struct cclass cclasses[CCLASS_LAST+1]= {
+ 							(NC-1)*sizeof(cat_t));
+ 	if (g == NULL)
+ 		return(REG_ESPACE);
+-	p->ssize = (long) (len/(size_t)2*(size_t)3 + (size_t)1); /* ugh */
++	{
++	  /* Patched for CERT Vulnerability Note VU#695940, Feb 2015. */
++	  size_t new_ssize = len/(size_t)2*(size_t)3 + (size_t)1; /* ugh */
++	  if (new_ssize < len || new_ssize > LONG_MAX / sizeof(sop)) {
++	    free((char *) g);
++	    return REG_INVARG;
++	  }
++	  p->ssize = new_ssize;
++	}
++
+ 	p->strip = (sop *)malloc(p->ssize * sizeof(sop));
+ 	p->slen = 0;
+ 	if (p->strip == NULL) {
+-- 
+1.9.1
+
-- 
1.9.1


