Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9993F76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:55:29 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so41411602pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 22:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DbDCDjoyNAg/nsPrLW+dt/bIbsQAmGVRD9RGH5RKdXQ=;
	b=AkyJFhYl8xeA1fG7JCybM0cnnjMlwJtukc7sIeJ+pd36ePTcLc13cYNEEdyS2LGehS
	pPZ01atIivY58/HX69vDPULR9v+RmALL6wtfMM6yvcvkfechRkyF1Y89ff7kJLU9gf2Q
	dqEnmPwfGAE8XtI1TC2I6XFWu4vgkiMfgNgWIbToq5P2JKciEFZtFneZOb1ypmZRKifR
	0L0aBwB+6Nv6lxS7Q00JFFu10X9aQIda0SFaa3IMEQ3OIhNPQUa9r7rj3aQyKUiXYgwP
	rQol3JpoxgqeP2H9+SOGs+MdG6ypIu9/C+k1x13KJbHJb3uY2jvb9axMkjbrGEsDX0zB
	8SEw==
X-Received: by 10.66.255.42 with SMTP id an10mr5049842pad.107.1442555729743;
	Thu, 17 Sep 2015 22:55:29 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ey3sm6659385pbd.28.2015.09.17.22.55.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Sep 2015 22:55:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 01:55:22 -0400
Message-Id: <1442555722-30399-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
Subject: [meta-networking][PATCH] net-snmp: Fix build with gcc5
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
X-List-Received-Date: Fri, 18 Sep 2015 05:55:29 -0000

Fix errors seen with gcc5

Change-Id: I9c4361f3a9c25342f5c740263f551c162dce8faf
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tools.c-Don-t-check-for-return-from-EVP_M.patch | 33 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
new file mode 100644
index 0000000..af242fa
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -0,0 +1,33 @@
+From d3027a227bc0f603a5b650d01f97ee1dec515be5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 18 Sep 2015 00:28:45 -0400
+Subject: [PATCH] snmplib/keytools.c: Don't check for return from
+ EVP_MD_CTX_init()
+
+EVP_MD_CTX_init() API returns void, it fixes errors with new compilers
+
+snmplib/keytools.c: In function 'generate_Ku': error: invalid use of void expression
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://sourceforge.net/p/net-snmp/patches/1317/]
+ snmplib/keytools.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/snmplib/keytools.c b/snmplib/keytools.c
+index 0ccb3a6..880fc14 100644
+--- a/snmplib/keytools.c
++++ b/snmplib/keytools.c
+@@ -153,8 +153,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
+     ctx = EVP_MD_CTX_create();
+ #else
+     ctx = malloc(sizeof(*ctx));
+-    if (!EVP_MD_CTX_init(ctx))
+-        return SNMPERR_GENERR;
++    EVP_MD_CTX_init(ctx);
+ #endif
+ #ifndef NETSNMP_DISABLE_MD5
+     if (ISTRANSFORM(hashtype, HMACMD5Auth)) {
+-- 
+2.5.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 431a633..b32d842 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://run-ptest \
         file://dont-return-incompletely-parsed-varbinds.patch \
         file://0001-config_os_headers-Error-Fix.patch \
+        file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
 "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
2.5.2


