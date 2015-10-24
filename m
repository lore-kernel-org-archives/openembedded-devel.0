Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF307570D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:43 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so146184471pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bQArgzyoyhcZovjuB/C1cgEJKHX10DipcDFqwMUahms=;
	b=c8Pgj1dhBUZS0ZZXWApzgsOIKEXcPILYgfz3IYhmF6i2nMwb3SJcnuozdfI4hnMBSO
	VrnN5zDm/KeyxCLI4ghRq+CWz9qTi1W9+azRzR0QGvUj3SVrz8lCoUzAuVusVIojtFbA
	2LZ1S1l8K8GkkB+v3+FU/fwNYR4b2cLo9lDv69+Nxf9Xv4hSqg4y7D2Y70G5iRaVE1O7
	e8mMuJO4p829BlwXtpz9P86Q1LQhgKHkugPvTxHa4IenHlv3nWtJOHSjUxSysdjCp8vf
	N4Hd97VVx3NtEIF6jWL4WmztOVeCqFxrha0tj5Q4HsGYAZd/66K7yVClK176ceBojFyC
	DKlg==
X-Received: by 10.66.118.200 with SMTP id ko8mr361000pab.85.1445709464494;
	Sat, 24 Oct 2015 10:57:44 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yp5sm23634616pac.38.2015.10.24.10.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:40 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id D735DFC66D9; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:19 -0700
Message-Id: <5ef80031d2a36d404d3b1f1e292f309061bcd16a.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 1/7] mariadb: Security Advisory -CVE-2015-2305
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:45 -0000

From: Roy Li <rongqing.li@windriver.com>

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-2305

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta-oe/recipes-support/mysql/mariadb.inc
	removed ref to patch fix-a-building-failure.patch
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mysql/mariadb/fix-CVE-2015-2305.patch          | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index f385bfc..34c59fe 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://my.cnf \
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
+           file://fix-CVE-2015-2305.patch \
           "
 
 SRC_URI[md5sum] = "d2415efc6a6d73d7a58f3c79bb42f2e8"
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


