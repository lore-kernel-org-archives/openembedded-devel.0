Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7A84460800
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 23:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 043C720BB5;
	Wed,  4 Apr 2018 23:54:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id M10k6S_m0fnF; Wed,  4 Apr 2018 23:54:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CDF8020B22;
	Wed,  4 Apr 2018 23:54:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 61BC51633B7;
	Wed,  4 Apr 2018 19:54:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 19:54:11 -0400
Message-Id: <1522886051-4482-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522886051-4482-1-git-send-email-denis@denix.org>
References: <1522886051-4482-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 2/2] iperf3: refresh local patches to avoid fuzz warnings
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
X-List-Received-Date: Wed, 04 Apr 2018 23:54:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - dropped one of the patches as it was accepted upstream

 .../iperf3/0002-Remove-pg-from-profile_CFLAGS.patch    | 12 +++++-------
 .../iperf3/iperf3/automake-foreign.patch               | 18 ++++++++++++++----
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
index 06eb41a..f012a02 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
@@ -1,20 +1,21 @@
-From 6db0e28f906bc3784019dfb5bb011237a8034fda Mon Sep 17 00:00:00 2001
+From c36a330f1cbbc1687b396c29a4164e9691d639ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:00:16 -0700
-Subject: [PATCH 2/2] Remove -pg from profile_CFLAGS
+Subject: [PATCH] Remove -pg from profile_CFLAGS
 
 musl fails to link with missing gcrt1.o
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 23b0c72..6268145 100644
+index 11d763d..c394bef 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -49,9 +49,9 @@ iperf3_LDFLAGS          = -g
+@@ -52,9 +52,9 @@ iperf3_LDFLAGS          = -g
  iperf3_profile_SOURCES  = main.c \
  						  $(libiperf_la_SOURCES)
  
@@ -26,6 +27,3 @@ index 23b0c72..6268145 100644
  
  # Specify the sources and various flags for the test cases
  t_timer_SOURCES         = t_timer.c
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
index 06c394e..b99440a 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/automake-foreign.patch
@@ -1,12 +1,22 @@
-Pass the 'foreign' option to automake to enable iperf3 to build.
+From 3dd9f84b42aa468cfb5e62f3fe64e018761d8dde Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <b40290@freescale.com>
+Date: Mon, 5 Jan 2015 11:39:45 -0600
+Subject: [PATCH] Pass the 'foreign' option to automake to enable iperf3 to
+ build.
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Chunrong Guo <b40290@freescale.com>
 
---- a/configure.ac	2015-10-19 02:49:30.471867352 -0500
-+++ b/configure.ac	2015-10-19 02:46:36.207873572 -0500
-@@ -33,7 +33,7 @@
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b988322..a554fcf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AC_CONFIG_AUX_DIR(config)
  
  
  # Initialize the automake system
-- 
2.7.4


