Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 31CBE73D89
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:49 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so40578225pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=M5VUDmewwjUd/xG67z9PavDSS7pMJzIcD9AGeSOtQKg=;
	b=R5QK0LOAxHFcgSCWLY0jsi1pPtecxMLw/EVKGG9TA8qeeXVh8bsMDcVJcvz4clcShA
	4JSthCiMCH0vOV0iqS67+28odpGpc/3VFRxZ0rnjHZToRoW9SXovGVx4yqCZNXF3+nBj
	P9GXm1iq+EkfvEYJZe9B4a+/b/4lRR2GJnvdo3YDL8MPhbuYbpK/LR+AosSNK3DbvknX
	oX/FIJnWjP8dDMYvQaqv7hx0QduKqmJcO6mi8sZmEJHoUKOVbomWK9EwBJCCS99pmqkd
	AZ3Hh4sWbxLwpmfPTb2DnlW0dyC51CJ/yw4rQEqq/WYuTNxXjEtHCrQcU+GbH1LgCTK7
	+9hQ==
X-Received: by 10.66.159.1 with SMTP id wy1mr69781687pab.103.1437454610165;
	Mon, 20 Jul 2015 21:56:50 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	y2sm24689038pdc.91.2015.07.20.21.56.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 21:56:48 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id F3A90FC0E53; Mon, 20 Jul 2015 21:56:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 20 Jul 2015 21:56:36 -0700
Message-Id: <0fb90bef8c72bd39574d06c943c7a7220483870b.1437454485.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
References: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
In-Reply-To: <cover.1437454485.git.akuster808@gmail.com>
References: <cover.1437454485.git.akuster808@gmail.com>
Subject: [PATCH 3/5] mariadb: Security Advisory -CVE-2015-2305
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
X-List-Received-Date: Tue, 21 Jul 2015 04:56:51 -0000

From: Roy Li <rongqing.li@windriver.com>

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-2305

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
---
 .../mysql/mariadb/fix-CVE-2015-2305.patch          | 43 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch

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
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index ae2e92b..bf15163 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -10,6 +10,7 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
            file://mysqld.service \
+           file://fix-CVE-2015-2305.patch \
           "
 
 SRC_URI[md5sum] = "917a807d8cf2c8ef9deedd2a89b6decd"
-- 
1.9.1


