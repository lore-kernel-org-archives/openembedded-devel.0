Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B609874AA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9359520BA7;
	Tue,  3 Apr 2018 23:03:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BZLaHFRNv-NW; Tue,  3 Apr 2018 23:03:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 700C720BA5;
	Tue,  3 Apr 2018 23:03:25 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F411F1633B1;
	Tue,  3 Apr 2018 19:03:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 19:03:24 -0400
Message-Id: <1522796604-38261-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-networking][PATCH] tcpdump: refresh local patches to avoid fuzz warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 23:03:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/tcpdump/tcpdump/add-ptest.patch   | 13 +++++++------
 .../tcpdump/unnecessary-to-check-libpcap.patch        | 19 ++++++++++---------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index 196cec7..7a02155 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -1,4 +1,4 @@
-From 7b259580800e259d232229dc89f97058b56e2fe8 Mon Sep 17 00:00:00 2001
+From 09c310b48f73b62dc6673ce0bdfc638d9ae4bbda Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Wed, 22 Oct 2014 10:02:48 +0800
 Subject: [PATCH] Add ptest for tcpdump
@@ -6,15 +6,16 @@ Subject: [PATCH] Add ptest for tcpdump
 Upstream-Status: Pending
 
 Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+
 ---
  Makefile.in | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
-Index: tcpdump-4.9.0/Makefile.in
-===================================================================
---- tcpdump-4.9.0.orig/Makefile.in
-+++ tcpdump-4.9.0/Makefile.in
-@@ -436,9 +436,17 @@ distclean:
+diff --git a/Makefile.in b/Makefile.in
+index 0941f0e..3ce40c6 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -437,9 +437,17 @@ distclean:
  	    tests/failure-outputs.txt
  	rm -rf autom4te.cache tests/DIFF tests/NEW
  
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
index d7a3ac2..c70404c 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-libpcap.patch
@@ -1,4 +1,7 @@
-unnecessary to check libpcap
+From 66ee5c0d49c3e4a67cd9a691c1313e4a02eafa59 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 8 Jul 2014 13:20:47 +0800
+Subject: [PATCH] unnecessary to check libpcap
 
 Upstream-Status: Pending
 
@@ -11,23 +14,21 @@ In fact, the libpcap has been added into the tcpdump's DEPENDS, not need to
 check if libpcap existed.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- configure.in |    2 +-
+ configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 06fade1..9125de7 100644
+index b2305a5..b3b5dbf 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -567,7 +567,7 @@ AC_SEARCH_LIBS(getrpcbynumber, nsl,
- dnl AC_CHECK_LIB(z, uncompress)
- dnl AC_CHECK_HEADERS(zlib.h)
+@@ -418,7 +418,7 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
+ AC_SEARCH_LIBS(getrpcbynumber, nsl,
+     AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber()]))
  
 -AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
 +#AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
  
  #
  # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
--- 
-1.7.9.5
-
-- 
2.7.4


