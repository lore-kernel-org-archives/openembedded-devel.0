Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD6CC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:57:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10216.1775113020415679187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XqychcXZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775113020; x=1806649020;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1yjnRjDzdbuCYrXV+Al+3yf5HPPYoL7EdCarL9ZDEL8=;
  b=XqychcXZYshyCgTt3iSeZV0fCZzhUni/SqWMu8miyvtNzdPjGx6qa4zi
   EpzzFSIHhnKzAZjdve1mMoZdlTaRd5DeOSDqJe9wW0I1+rlCfZ+XZUm1W
   x5XLmRyTWIHmZhDPepB8PLwswZ90gROtnLPtmsEMEM3Rif1KvvGcyCFIr
   9z7THi6Bl8ZNu+fcSFuo39MkKNJVl3xI5dRH06qsw+AzmC9Kz4MZ6Csdh
   N29Z7tUCti2hhx9Ec6XTh0ZuEXisLW5gEdDc3me6FjQYZz7P5Xr5MTfwh
   KIBcChomy+pwsjJXX+qySnZPZ5bejMFXMeJ5apZL8yk3dHr82uLHpLDUj
   g==;
X-CSE-ConnectionGUID: 1SIGwXX9TkWmbvo1k9YvzA==
X-CSE-MsgGUID: FSfHXPBbSk6dVzzfXaWsIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224199628"
X-IronPort-AV: E=Sophos;i="6.23,155,1770562800"; 
   d="scan'208";a="224199628"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 15:56:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D9EDC1C00540
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 81E42101B16B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:58 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 497B1100375C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:56 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] psqlodbc: upgrade 17.00.0007 -> 17.00.0010
Date: Thu,  2 Apr 2026 14:56:51 +0800
Message-ID: <20260402065652.14800-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402065652.14800-1-liuyd.fnst@fujitsu.com>
References: <20260402065652.14800-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125961

Update psqlodbc-fix-for-ptest-support.patch for 17.00.0010

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../psqlodbc-fix-for-ptest-support.patch      | 26 ++++++++++++-------
 ...c_17.00.0007.bb => psqlodbc_17.00.0010.bb} |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_17.00.0007.bb => psqlodbc_17.00.0010.bb} (97%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
index a1f60b2692..b28aa104c4 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -1,6 +1,6 @@
-From b0175d6124ae0460fbeaf34c964aff587fa978c2 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 5 Sep 2017 10:24:10 +0800
+From dbd40a22367ae5cc24ec75d704226b68e856df4f Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Thu, 2 Apr 2026 06:43:39 +0000
 Subject: [PATCH] psqlodbc: fixes for ptest support
 
 * Fix the LIBODBC since we don't use ODBC_CONFIG.
@@ -12,6 +12,9 @@ Subject: [PATCH] psqlodbc: fixes for ptest support
 Upstream-Status: Inappropriate [OE ptest specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Update for 17.00.0010
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  test/Makefile.in    |  2 +-
  test/odbcini-gen.sh | 10 +++++-----
@@ -19,7 +22,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  3 files changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/test/Makefile.in b/test/Makefile.in
-index 3f9a9af..09406ae 100644
+index 969839d..1d53299 100644
 --- a/test/Makefile.in
 +++ b/test/Makefile.in
 @@ -19,7 +19,7 @@ CPPFLAGS = @CPPFLAGS@ -I..	# config.h
@@ -68,7 +71,7 @@ index 2eaba35..d7c03ba 100755
  RowVersioning           = No
  ShowSystemTables                = No
 diff --git a/test/runsuite.c b/test/runsuite.c
-index 6ac3709..023ac1d 100644
+index bc3000b..dd65795 100644
 --- a/test/runsuite.c
 +++ b/test/runsuite.c
 @@ -55,7 +55,7 @@ bailout(const char *fmt, ...)
@@ -89,16 +92,16 @@ index 6ac3709..023ac1d 100644
  		return;
  	}
  
-@@ -131,7 +131,7 @@ int main(int argc, char **argv)
+@@ -139,7 +139,7 @@ int main(int argc, char **argv)
  	failures = 0;
  	for (i = 1, j = 1; i <= numtests; i++, j++)
  	{
 -		parse_argument(argv[j], testname, binname);
-+		parse_argument(argv[j], testname, binname, inputdir);
- 		if (runtest(binname, testname, i, inputdir) != 0)
++ 		parse_argument(argv[j], testname, binname, inputdir);
+ 		if (runtest(binname, testname, i, inputdir, server_version) != 0)
  			failures++;
  	}
-@@ -161,29 +161,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
+@@ -169,29 +169,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
  #ifndef WIN32
  	snprintf(cmdline, sizeof(cmdline),
  			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
@@ -115,7 +118,7 @@ index 6ac3709..023ac1d 100644
  #endif
  	rc = system(cmdline);
  
- 	diff = rundiff(testname, inputdir);
+ 	diff = rundiff(testname, inputdir, server_version);
  	if (rc != 0)
  	{
 -		printf("not ok %d - %s test returned %d\n", testno, testname, rc);
@@ -135,3 +138,6 @@ index 6ac3709..023ac1d 100644
  		ret = 0;
  	}
  	fflush(stdout);
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0010.bb
similarity index 97%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0010.bb
index 92ee2594f9..7450c3178c 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0007.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0010.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
            file://run-ptest \
            "
 
-SRCREV = "8038cee43d6dff468320008ea928f3eaa1186726"
+SRCREV = "6be815ea5e16ed86033c673ffef98c07c91f865a"
 PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
 
 DEPENDS += "postgresql unixodbc"
-- 
2.43.0


