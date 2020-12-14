Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.31702.1607932521187186199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Dec 2020 23:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,417,1599494400"; 
   d="scan'208";a="102368031"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Dec 2020 15:55:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DB1E4CE6011
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 15:55:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 14 Dec 2020 15:55:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mcpp: Normalize the patch format of CVE
Date: Mon, 14 Dec 2020 15:54:59 +0800
Message-ID: <1607932499-36539-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9DB1E4CE6011.A3669
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because CVE-2019-14274.patch is included in ice-mcpp.patch, the cve-check-tool fails to correctly judge the CVE of the OSS. CVE-2019-14274.patch is separated from ice-mcpp.patch to fix the problem.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mcpp/files/CVE-2019-14274.patch           | 34 +++++++++++++++++++
 .../mcpp/files/ice-mcpp.patch                 | 31 -----------------
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |  3 +-
 3 files changed, 36 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch

diff --git a/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
new file mode 100644
index 000000000..a0c6584ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
@@ -0,0 +1,34 @@
+From ea453aca2742be6ac43ba4ce0da6f938a7e5a5d8 Mon Sep 17 00:00:00 2001
+From: He Liu <liulonnie@gmail.com>
+Date: Tue, 4 Feb 2014 11:00:40 -0800
+Subject: [PATCH] line comment bug
+
+---
+ src/support.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/support.c b/src/support.c
+index c57eaef..e3357e4 100644
+--- a/src/support.c
++++ b/src/support.c
+@@ -188,7 +188,7 @@ static char *   append_to_buffer(
+     size_t      length
+ )
+ {
+-    if (mem_buf_p->bytes_avail < length) {  /* Need to allocate more memory */
++    if (mem_buf_p->bytes_avail < length + 1) {  /* Need to allocate more memory */
+         size_t size = MAX( BUF_INCR_SIZE, length);
+ 
+         if (mem_buf_p->buffer == NULL) {            /* 1st append   */
+@@ -1722,6 +1722,8 @@ com_start:
+                     sp -= 2;
+                     while (*sp != '\n')     /* Until end of line    */
+                         mcpp_fputc( *sp++, OUT);
++                    mcpp_fputc('\n', OUT);
++                    wrong_line = TRUE;
+                 }
+                 goto  end_line;
+             default:                        /* Not a comment        */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
index 8103cf092..1df3ae55b 100644
--- a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
+++ b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
@@ -114,37 +114,6 @@ diff -r -c -N ../mcpp-2.7.2-old/src/main.c ./src/main.c
   }
   
   int     mcpp_lib_main
-diff -r -c -N ../mcpp-2.7.2-old/src/support.c ./src/support.c
-*** ../mcpp-2.7.2-old/src/support.c	Tue Jun 10 06:02:33 2008
---- ./src/support.c	Fri May 14 12:40:56 2010
-***************
-*** 188,194 ****
-      size_t      length
-  )
-  {
-!     if (mem_buf_p->bytes_avail < length) {  /* Need to allocate more memory */
-          size_t size = MAX( BUF_INCR_SIZE, length);
-  
-          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
---- 188,194 ----
-      size_t      length
-  )
-  {
-!     if (mem_buf_p->bytes_avail < length + 1) {  /* Need to allocate more memory */
-          size_t size = MAX( BUF_INCR_SIZE, length);
-  
-          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
-***************
-*** 1722,1727 ****
---- 1722,1729 ----
-                      sp -= 2;
-                      while (*sp != '\n')     /* Until end of line    */
-                          mcpp_fputc( *sp++, OUT);
-+                     mcpp_fputc( '\n', OUT);
-+                     wrong_line = TRUE;
-                  }
-                  goto  end_line;
-              default:                        /* Not a comment        */
 diff -r -c -N ../mcpp-2.7.2-old/src/system.c ./src/system.c
 *** ../mcpp-2.7.2-old/src/system.c      2008-11-26 10:53:51.000000000 +0100
 --- ./src/system.c      2011-02-21 16:18:05.678058106 +0100
diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index b5ca49566..f8125f72d 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ca370b75ec890321888a00cea9bc1d5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://ice-mcpp.patch "
+           file://ice-mcpp.patch \
+           file://CVE-2019-14274.patch"
 SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
-- 
2.25.1



