Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97E026AB99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 08:33:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4I8XYYF009664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 May 2015 01:33:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 18 May 2015 01:33:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 May 2015 16:28:36 +0800
Message-ID: <1431937716-23382-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] autofs: fix a building failure
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
X-List-Received-Date: Mon, 18 May 2015 08:33:34 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...x-the-YACC-rule-to-fix-a-building-failure.patch | 62 ++++++++++++++++++++++
 meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb             |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch
new file mode 100644
index 0000000..9b64183
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch
@@ -0,0 +1,62 @@
+[PATCH] fix the YACC rule to fix a building failure
+
+Upstream-Statu: Pending
+
+The original rule will create the header file twice, one is that the header
+file as the object file is created, other time is when create the C source file.
+since YACC always has "-d" parameter.
+
+This lead to a race when compile amd_tok.o, the header file maybe rewritten.
+  |----------------------
+  |amd_tok.l:359:10: error: 'RBRACKET' undeclared (first use in this function)
+  |  ")" { return RBRACKET; }
+  |          ^
+  |../Makefile.rules:64: recipe for target 'amd_tok.o' failed
+  |----------------------
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ lib/Makefile     | 6 ++++--
+ modules/Makefile | 3 ++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 4798a4b..c40cf86 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -57,7 +57,8 @@ mount_xdr.o: mount_xdr.c
+ master_tok.c: master_tok.l
+ 	$(LEX) -o$@ -Pmaster_ $?
+ 
+-master_parse.tab.c master_parse.tab.h: master_parse.y
++master_parse.tab.h: master_parse.tab.c
++master_parse.tab.c: master_parse.y
+ 	$(YACC) -v -d -p master_ -b master_parse $?
+ 
+ master_tok.o: master_tok.c master_parse.tab.h
+@@ -67,7 +68,8 @@ master_parse.tab.o: master_parse.tab.c master_parse.tab.h
+ nss_tok.c: nss_tok.l
+ 	$(LEX) -o$@ -Pnss_ $?
+ 
+-nss_parse.tab.c nss_parse.tab.h: nss_parse.y
++nss_parse.tab.h: nss_parse.tab.c
++nss_parse.tab.c: nss_parse.y
+ 	$(YACC) -v -d -p nss_ -b nss_parse $?
+ 
+ nss_tok.o: nss_tok.c nss_parse.tab.h
+diff --git a/modules/Makefile b/modules/Makefile
+index 237b70b..71415d0 100644
+--- a/modules/Makefile
++++ b/modules/Makefile
+@@ -103,7 +103,8 @@ amd_tok.c: amd_tok.l
+ 
+ amd_tok.o: amd_tok.c amd_parse.tab.h
+ 
+-amd_parse.tab.c amd_parse.tab.h: amd_parse.y
++amd_parse.tab.h: amd_parse.tab.c
++amd_parse.tab.c: amd_parse.y
+ 	$(YACC) -v -d -p amd_ -b amd_parse $?
+ 
+ amd_parse.tab.o: amd_parse.tab.c amd_parse.tab.h
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
index 13af2fe..9540f92 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://using-pkg-config-to-detect-libxml-2.0-and-krb5.patch \
            file://force-STRIP-to-emtpy.patch \
            file://remove-bashism.patch \
+           file://fix-the-YACC-rule-to-fix-a-building-failure.patch \
 "
 
 SRC_URI[md5sum] = "b7724a9a55923f3c06933a8dfd1e79d3"
-- 
1.9.1


