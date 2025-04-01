Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC68C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 16:20:43 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.341.1743524437723451623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 09:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 2 Apr 2025 01:20:35 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.121 with ESMTP; 2 Apr 2025 01:20:35 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH v2] linpack: fix build with gcc-15.0.1
Date: Wed,  2 Apr 2025 01:20:32 +0900
Message-Id: <20250401162032.2582478-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 16:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116481

From: "mark.yang" <mark.yang@lge.com>

* fix following error:
    linpacknew.c: In function 'dgefa':
    linpacknew.c:257:9: error: conflicting types for 'idamax'; have 'int(void)'
    257 |     int idamax(),j,k,kp1,l,nm1;
        |         ^~~~~~
    linpacknew.c:63:13: note: previous declaration of 'idamax' with type 'int(int,  REAL *, int)' {aka 'int(int,  double *, int)'}
    63 | static int  idamax   (int n,REAL *dx,int incx);
        |             ^~~~~~
    linpacknew.c:272:21: error: too many arguments to function 'idamax'; expected 0, have 3
    272 |                 l = idamax(n-k,&a[lda*k+k],1) + k;
        |                     ^~~~~~ ~~~
    linpacknew.c:257:9: note: declared here
    257 |     int idamax(),j,k,kp1,l,nm1;
        |         ^~~~~~
    linpacknew.c:326:21: error: too many arguments to function 'idamax'; expected 0, have 3
    326 |                 l = idamax(n-k,&a[lda*k+k],1) + k;
        |                     ^~~~~~ ~~~
    linpacknew.c:257:9: note: declared here
    257 |     int idamax(),j,k,kp1,l,nm1;
        |         ^~~~~~

    The function was already declared as static int idamax(int n, REAL *dx, int incx);
    on line 63, but it was redeclared as int idamax() inside the dgefa function on line 257,
    causing a conflict.
    where functions are redeclared without parameters,
    causing conflicts with the original function definitions.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: Use a Inactive-Upstream

 ...in-gcc-15.0.1-due-to-function-redecl.patch | 52 +++++++++++++++++++
 .../recipes-benchmark/linpack/linpack_1.0.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.patch

diff --git a/meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.patch b/meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.patch
new file mode 100644
index 0000000000..fbde7396c2
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.patch
@@ -0,0 +1,52 @@
+From a1c1211fd6fc8d82053074c6dc531340f046c8d4 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 1 Apr 2025 16:06:56 +0900
+Subject: [PATCH] Fix build error in gcc 15.0.1 due to function redeclaration.
+
+Fix build error:
+linpacknew.c: In function 'dgefa':
+linpacknew.c:257:9: error: conflicting types for 'idamax'; have 'int(void)'
+  257 |     int idamax(),j,k,kp1,l,nm1;
+      |         ^~~~~~
+linpacknew.c:63:13: note: previous declaration of 'idamax' with type 'int(int,  REAL *, int)' {aka 'int(int,  double *, int)'}
+   63 | static int  idamax   (int n,REAL *dx,int incx);
+      |             ^~~~~~
+linpacknew.c:272:21: error: too many arguments to function 'idamax'; expected 0, have 3
+  272 |                 l = idamax(n-k,&a[lda*k+k],1) + k;
+      |                     ^~~~~~ ~~~
+linpacknew.c:257:9: note: declared here
+  257 |     int idamax(),j,k,kp1,l,nm1;
+      |         ^~~~~~
+linpacknew.c:326:21: error: too many arguments to function 'idamax'; expected 0, have 3
+  326 |                 l = idamax(n-k,&a[lda*k+k],1) + k;
+      |                     ^~~~~~ ~~~
+linpacknew.c:257:9: note: declared here
+  257 |     int idamax(),j,k,kp1,l,nm1;
+      |         ^~~~~~
+
+The function was already declared as static int idamax(int n, REAL *dx, int incx);
+on line 63, but it was redeclared as int idamax() inside the dgefa function on line 257,
+causing a conflict.
+where functions are redeclared without parameters,
+causing conflicts with the original function definitions.
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2/25/94]
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ linpacknew.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linpacknew.c b/linpacknew.c
+index c656082..5c8687b 100644
+--- a/linpacknew.c
++++ b/linpacknew.c
+@@ -254,7 +254,7 @@ static void dgefa(REAL *a,int lda,int n,int *ipvt,int *info,int roll)
+ 
+     {
+     REAL t;
+-    int idamax(),j,k,kp1,l,nm1;
++    int j,k,kp1,l,nm1;
+ 
+     /* gaussian elimination with partial pivoting */
+ 
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index fe540749b5..735b5560e0 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=
 
 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
            file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
+		   file://0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.patch \
           "
 SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
 

