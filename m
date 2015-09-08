Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3E41A65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 19:28:42 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so132148073pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=auUR8p746CvuseK6uXv79gUhUIoFVN4vEjILZG0k4qM=;
	b=cLSYIx1dDZoUMS31gXJBCqimI241oCDcBp2L3r30IwHikxkQr8GO3FwQZ9/SFrjxHL
	bk4j5hph7vSUMkPLmCic31RJhqIiQx8mbrThh9JVg9lktgJG0tMCW2Ow8vI3D2VcJZ6O
	0muIF4UQ77J6sJbsQwSuJ5tRBBZEbAOM9t9LwMcpRDpTv4RHR5pcGI6tR51vqVGhNcFI
	d9+ugCIYbeOnMbKCpnHYdBl8Cb583VFU8j1wHleJSG6fAnMETnT272lHy2Jg6Sbe1yBn
	sjIdg9qqVWFNoBMLed9diJQ2ZZyh2Hh6PiG3QoRlSku0Nrzhqz9Yeme/ZVjYcYCaJ3gm
	ryfA==
X-Received: by 10.67.5.228 with SMTP id cp4mr53182246pad.120.1441740523261;
	Tue, 08 Sep 2015 12:28:43 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.gmail.com with ESMTPSA id qp5sm4344235pbc.0.2015.09.08.12.28.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 12:28:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Tue,  8 Sep 2015 12:28:41 -0700
Message-Id: <1441740521-11801-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH][V2] netmap: fix multiple build issues.
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
X-List-Received-Date: Tue, 08 Sep 2015 19:28:44 -0000

From: Armin Kuster <akuster@mvista.com>

V2: Fix "Upstream-Status" typos

updated to latest version to get kernel 4.1 support

update makefile patch
fixed printf type issue
Fixed manual config options
Readme checksum changed, don't know why. must got it wrong to begin with.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...1-testmmap-fix-compile-issue-with-gcc-5.x.patch | 33 +++++++++++++++++++++
 .../netmap/files/makefile_fixup.patch              | 34 +++++++++++++++++-----
 .../recipes-kernel/netmap/netmap-modules_git.bb    |  8 ++++-
 meta-networking/recipes-kernel/netmap/netmap.inc   |  4 +--
 .../recipes-kernel/netmap/netmap_git.bb            |  1 +
 5 files changed, 69 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch

diff --git a/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
new file mode 100644
index 0000000..ea36b1c
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+From c81bf54d6eb870286662a11d3b4a994717c47696 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster808@gmail.com>
+Date: Tue, 8 Sep 2015 05:36:27 -0700
+Subject: [PATCH] testmmap: fix compile issue with gcc 5.x
+
+this fixes:
+examples/testmmap.c:540:10: error: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t {aka const int}' [-Werror=format=]
+|    printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
+|           ^
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+---
+ examples/testmmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/testmmap.c b/examples/testmmap.c
+index d7f6acc..934489a 100644
+--- a/examples/testmmap.c
++++ b/examples/testmmap.c
+@@ -537,7 +537,7 @@ do_if()
+ 	for (i = 0; i < 5; i++)
+ 		printf("spare1[%d]  %u\n", i, nifp->ni_spare1[i]);
+ 	for (i = 0; i < (nifp->ni_tx_rings + nifp->ni_rx_rings + 2); i++)
+-		printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
++		printf("ring_ofs[%d] %zd\n", i, nifp->ring_ofs[i]);
+ }
+ 
+ struct netmap_ring *
+-- 
+2.3.5
+
diff --git a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
index e838653..b050bf0 100644
--- a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
+++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
@@ -10,24 +10,24 @@ Index: LINUX/netmap.mak.in
 ===================================================================
 --- a/LINUX/netmap.mak.in
 +++ b/LINUX/netmap.mak.in
-@@ -12,10 +12,8 @@ SRCDIR:=@SRCDIR@
+@@ -12,10 +12,9 @@ SRCDIR:=@SRCDIR@
  # The following commands are needed to build the modules as out-of-tree,
  # in fact the kernel sources path must be specified.
  
 -PWD ?= $(CURDIR)
--
+ 
  # Additional compile flags (e.g. header location)
 -EXTRA_CFLAGS := -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
 +EXTRA_CFLAGS := -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
  EXTRA_CFLAGS += -Wno-unused-but-set-variable
- EXTRA_CFLAGS += $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s|tr a-z A-Z))
+ EXTRA_CFLAGS += $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s|tr a-z- A-Z_))
  
 Index: LINUX/configure
 ===================================================================
 --- a/LINUX/configure
 +++ b/LINUX/configure
-@@ -311,34 +311,6 @@ reset_tests() {
- 	NEXTTEST=1
+@@ -349,52 +349,6 @@ reset_tests() {
+ 	EOF
  }
  
 -# run_tests: run all accumulated tests and exec the pertinent
@@ -48,28 +48,46 @@ Index: LINUX/configure
 -		cat >> $TMPDIR/Makefile <<-EOF
 -			get-$d:
 -			$t	[ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if \$($d-dst),\$($d-dst),.)
+-			$t	touch get-$d
 -		EOF
 -	done
 -	echo endif >> $TMPDIR/Makefile
+-	{
+-		cat <<-EOF
+-##############################################################################
+-## BEGIN RUNNING TESTS: $(date)
+-##############################################################################
+-## Makefile:
+-		EOF
+-		cat $TMPDIR/Makefile
+-		cat <<-EOF
+-##############################################################################
+-		EOF
+-	} >> config.log
 -	(
 -		cd $TMPDIR
 -		make -k -j $(grep -c processor /proc/cpuinfo)
 -	) >> config.log
 -	eval "$TESTPOSTPROC"
+-	cat >> config.log <<-EOF
+-##############################################################################
+-## END RUNNING TESTS: $(date)
+-##############################################################################
+-	EOF
 -}
 -
  configh=netmap_linux_config.h
  # succes/failure actions are expected to write some macros
  # in netma_linux_config.h. The following functions can be
-@@ -555,7 +527,6 @@ configuration. Please check 'config.log'
- 
+@@ -619,7 +573,6 @@ configuration. Please check 'config.log'
  reset_tests
+ rm -f drivers.mak
  add_test true broken_buildsystem < /dev/null
 -run_tests
  
  drvname2config() {
  	local name=$1
-@@ -1087,7 +1058,6 @@ cat > $configh <<-EOF
+@@ -1280,7 +1233,6 @@ cat > $configh <<-EOF
  EOF
  
  # the TESTPOSTPROC script will add macros to $configh
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 00d334f..bb0db9d 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -36,7 +36,13 @@ do_configure_append () {
 #define NETMAP_LINUX_HAVE_TX_SKB_SHARING
 #define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
 #define NETMAP_LINUX_HAVE_PERNET_OPS_ID
-#define NETMAP_LINUX_TIMER_RTYPE static enum hrtimer_restart
+#define NETMAP_LINUX_VIRTIO_FUNCTIONS
+#define NETMAP_LINUX_VIRTIO_FREE_PAGES
+#define NETMAP_LINUX_VIRTIO_GET_VRSIZE
+#define NETMAP_LINUX_TIMER_RTYPE enum hrtimer_restart
+#define NETMAP_LINUX_VIRTIO_MULTI_QUEUE
+#define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
+#define NETMAP_LINUX_HAVE_E1000E_DOWN2
 EOF
 }
 
diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-networking/recipes-kernel/netmap/netmap.inc
index 9083c69..ab33e76 100644
--- a/meta-networking/recipes-kernel/netmap/netmap.inc
+++ b/meta-networking/recipes-kernel/netmap/netmap.inc
@@ -4,9 +4,9 @@ SECTION = "networking"
 HOMEPAGE = "http://code.google.com/p/netmap/"
 LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://README;beginline=13;endline=14;md5=f64f2b172fe6903ff7b6272c6edde588"
+LIC_FILES_CHKSUM = "file://README;beginline=13;endline=14;md5=56ae0b9c7ba0476ab9098de94c2714d6"
 
-SRCREV = "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
+SRCREV = "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
 PV = "master+git${SRCPV}"
 
 SRC_URI = "git://github.com/luigirizzo/netmap.git"
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index 0ee19d4..f15a626 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -11,6 +11,7 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --cc='${CC}' \
                 --ld='${LD}' \
                 "
+SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
 
 do_fetch[depends] += "netmap-modules:do_fetch"
 
-- 
2.3.5


