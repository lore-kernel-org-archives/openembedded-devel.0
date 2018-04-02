Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2C64F746A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 23:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8520120992;
	Mon,  2 Apr 2018 23:40:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cGp6_HtUDzZn; Mon,  2 Apr 2018 23:40:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 526B92017D;
	Mon,  2 Apr 2018 23:40:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D29621633B6;
	Mon,  2 Apr 2018 19:40:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 19:40:37 -0400
Message-Id: <1522712437-3086-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] lmbench: refresh local patches to avoid fuzz warnings
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
X-List-Received-Date: Mon, 02 Apr 2018 23:40:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...usl-define-guard-before-redefining-sockle.patch |  8 +--
 .../0001-lat_http.c-Add-printf-format.patch        |  6 +-
 ...t-CFLAGS-LDFLAGS-to-append-values-passed-.patch |  9 +--
 .../fix-lmbench-memory-check-failure.patch         | 53 ++++++++------
 .../lmbench_result_html_report.patch               | 12 +++-
 .../lmbench/lmbench-3.0-a9/obey-ranlib.patch       | 18 +++--
 .../lmbench-3.0-a9/update-config-script.patch      | 18 +++--
 .../lmbench-3.0-a9/update-results-script.patch     | 84 ++++++++++++----------
 .../use-base_libdir-instead-of-hardcoded-lib.patch | 10 ++-
 .../0001-avoid-gcc-optimize-away-the-loops.patch   |  9 +--
 .../lmbench/lmbench/rename-line-binary.patch       | 15 +++-
 11 files changed, 144 insertions(+), 98 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
index 20791bf..d716949 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
@@ -1,12 +1,13 @@
-From 31d58ed7e6552781f415501e96d7cc74f83b910d Mon Sep 17 00:00:00 2001
+From ac1657e11cbb0545bdf4d1124def8c013958ed7e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 18:08:51 -0700
-Subject: [PATCH 1/2] Check for musl define guard before redefining socklen_t
+Subject: [PATCH] Check for musl define guard before redefining socklen_t
 
 musl uses __DEFINED_socklen_t so check for that as well
 along with HAVE_socklen_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/bench.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -24,6 +25,3 @@ index 597d068..2ebdf5a 100644
  typedef int socklen_t;
  #endif
  
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
index 18ed43d..943b3ec 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
@@ -1,9 +1,10 @@
-From 6faa6acdf20aa6f738eed1483b7dceed94286adb Mon Sep 17 00:00:00 2001
+From 7c05fa5353ad91acae6e5e8a01f65d54935ef778 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 14:39:10 -0700
 Subject: [PATCH] lat_http.c: Add printf format
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/lat_http.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,6 +22,3 @@ index c630d59..28d04f7 100644
  	}
  	write(sock, buf, strlen(buf));
  	while ((n = read(sock, buf, XFERSIZE)) > 0) {
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
index d5c8f5f..353d80b 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
@@ -1,13 +1,13 @@
-From 76f3a9abc2ff96155425ef97d8c5520cfbc8fe6a Mon Sep 17 00:00:00 2001
+From b27c253bfb78fa3c5f416e6caee101098a4b58cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 18:09:46 -0700
-Subject: [PATCH 2/2] build: Adjust CFLAGS/LDFLAGS to append values passed from
- env
+Subject: [PATCH] build: Adjust CFLAGS/LDFLAGS to append values passed from env
 
 For musl we have to pass additional arguments via cflags and ldflags
 to link in librirpc, make room for those changes to take effect
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  scripts/build |  2 +-
  src/Makefile  | 14 +++++++-------
@@ -71,6 +71,3 @@ index d9efd54..96467d7 100644
  
  
  tag:
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
index 549a114..cbab5c4 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
@@ -1,4 +1,7 @@
-lmbench: Can't proceed on some targets
+From 65180976c9963432d166b47a0b692260a69c0d47 Mon Sep 17 00:00:00 2001
+From: Qingming Su <qingming.su@windriver.com>
+Date: Tue, 19 Aug 2014 05:16:17 -0400
+Subject: [PATCH] lmbench: Can't proceed on some targets
 
 lmbench can't proceed on some targets.  The memory check fails because the
 memory latency of each page is longer then 10us, which is a time limit set
@@ -25,13 +28,19 @@ Upstream-status: inappropriate [ configuration ]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
+---
+ scripts/config-run | 12 +++++++---
+ src/Makefile       |  4 ++--
+ src/memsize.c      | 66 +++++++++++++++++++++++++++++++++++-------------------
+ 3 files changed, 54 insertions(+), 28 deletions(-)
+
 diff --git a/scripts/config-run b/scripts/config-run
-index e1f7b6d..31b9256 100755
+index 918cbdf..096ed12 100755
 --- a/scripts/config-run
 +++ b/scripts/config-run
-@@ -214,6 +214,12 @@ The bigger the range, the more accurate the results, but larger sizes
+@@ -197,6 +197,12 @@ The bigger the range, the more accurate the results, but larger sizes
  take somewhat longer to run the benchmark.
-
+ 
  EOF
 +
 +# By default, use 512M memory as the upper limit for lmbench test
@@ -40,12 +49,12 @@ index e1f7b6d..31b9256 100755
 +fi
 +
  echo $ECHON "MB [default $MB]: $ECHOC"
- #read TMP
- TMP=""
-@@ -718,10 +724,10 @@ case $MAIL in
-		;;
+ read TMP
+ if [ X$TMP != X ]
+@@ -687,10 +693,10 @@ case $MAIL in
+ 		;;
  esac
-
+ 
 -INFO=`../scripts/info`
 +INFO=`../scripts/hostinfo`
  if [ $MAIL = yes ]
@@ -54,8 +63,8 @@ index e1f7b6d..31b9256 100755
 +	then	cp ../scripts/hostinfo-template $INFO
  		chmod +w $INFO
  		REUSE=no
- 	else
-@@ -765,7 +771,7 @@ EOF
+ 	else	
+@@ -733,7 +739,7 @@ EOF
  		then	EDITOR=$TMP
  		fi
  		if [ X$EDITOR != "none" ]
@@ -65,10 +74,10 @@ index e1f7b6d..31b9256 100755
  	fi
  fi
 diff --git a/src/Makefile b/src/Makefile
-index d1f0dc6..5098998 100644
+index c7e4e3c..d9efd54 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -49,7 +49,7 @@ TARGET=`../scripts/target`
+@@ -50,7 +50,7 @@ TARGET=`../scripts/target`
  BINDIR=../bin/$(OS)
  CONFIG=../bin/$(OS)/`../scripts/config`
  UTILS=../scripts/target ../scripts/os ../scripts/gnu-os ../scripts/compiler \
@@ -79,21 +88,21 @@ index d1f0dc6..5098998 100644
  INSTALL=cp
 @@ -240,7 +240,7 @@ $O/getopt.o : getopt.c $(INCS)
  	$(COMPILE) -c getopt.c -o $O/getopt.o
-
+ 
  $(UTILS) :
 -	-cd ../scripts; make get
 +	-cd ../scripts; cp info hostinfo; cp info-template hostinfo-template
-
+ 
  # Do not remove the next line, $(MAKE) depend needs it
  # MAKEDEPEND follows
 diff --git a/src/memsize.c b/src/memsize.c
-index eb25a09..cf9fe0c 100644
+index eb25a09..82d7faf 100644
 --- a/src/memsize.c
 +++ b/src/memsize.c
 @@ -14,9 +14,12 @@ char	*id = "$Id$\n";
-
+ 
  #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
-
+ 
 -#ifndef	TOO_LONG
 -#define	TOO_LONG	10	/* usecs */
 -#endif
@@ -103,12 +112,12 @@ index eb25a09..cf9fe0c 100644
 +
 +#define	MEMORY_SIZE_1MB (1024 * 1024)
 +#define	MEMORY_SIZE_8MB (8 * 1024 * 1024)
-
+ 
  int	alarm_triggered = 0;
-
+ 
 @@ -35,10 +38,10 @@ main(int ac, char **av)
  	size_t	delta;
-
+ 
  	if (ac == 2) {
 -		max = size = bytes(av[1]) * 1024 * 1024;
 +		max = size = bytes(av[1]) * MEMORY_SIZE_1MB;
@@ -170,7 +179,7 @@ index eb25a09..cf9fe0c 100644
 +		time_each_page = 1;
 +	//Set the uper limit of time spending on one page
 +        too_long = 10 * time_each_page;
-
+ 
 -	range = 1024 * 1024;
 -	incr = 1024 * 1024;
 -	touchRange(where, range, pagesize);
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
index cda2f0c..30708c8 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch
@@ -1,4 +1,7 @@
-lmbench: Fix "make html" graph failure
+From b21ca9f3911628fb66f308c6916485bbbcfb29a4 Mon Sep 17 00:00:00 2001
+From: Lin Yu <lin.yu@windriver.com>
+Date: Tue, 19 Aug 2014 05:16:16 -0400
+Subject: [PATCH] lmbench: Fix "make html" graph failure
 
 The html-list perl script cannot parse the first line of the result
 files about the lmbench version.
@@ -14,6 +17,11 @@ Upstream-status: inappropriate [ configuration ]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
+---
+ results/Makefile  | 1 +
+ scripts/html-list | 7 ++-----
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
 diff --git a/results/Makefile b/results/Makefile
 index 0935376..1ef9a15 100644
 --- a/results/Makefile
@@ -38,7 +46,7 @@ index 9850461..6383115 100755
 +<h2><a href=summary.out>Summary of results</a></h2>
  <hr>
  EOF
-
+ 
 @@ -47,7 +47,7 @@ foreach $os (@os) {
  		open(F, $file);
  		$_ = <F>;
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
index 41a3b32..fa5e6db 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
@@ -1,16 +1,22 @@
+From 182a5d3dba3f440bbf35551da6d21ab1c990eb58 Mon Sep 17 00:00:00 2001
+From: Noor Ahsan <noor_ahsan@mentor.com>
+Date: Mon, 29 Aug 2011 16:17:51 +0000
+Subject: [PATCH] lmbench: Add version 3.0-a9 (initial recipe)
+
 In some cases the host may have too old of a ranlib to work.  Since it's
 not exactly a great idea to not be using the cross ranlib anyhow, fix the
 Makefile so we can override ranlib and then override it
 
 Upstream-Status: Inappropriate [build system specific change]
+
 ---
- src/Makefile |    3 ++-
+ src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: lmbench-3.0-a9/src/Makefile
-===================================================================
---- lmbench-3.0-a9.orig/src/Makefile
-+++ lmbench-3.0-a9/src/Makefile
+diff --git a/src/Makefile b/src/Makefile
+index 4962815..c7a8c79 100644
+--- a/src/Makefile
++++ b/src/Makefile
 @@ -38,6 +38,7 @@ CC=`../scripts/compiler`
  MAKE=`../scripts/make`
  AR=ar
@@ -19,7 +25,7 @@ Index: lmbench-3.0-a9/src/Makefile
  
  # base of installation location
  BASE=/usr/local
-@@ -217,7 +218,7 @@ $O/lmbench : ../scripts/lmbench version.
+@@ -217,7 +218,7 @@ $O/lmbench : ../scripts/lmbench version.h
  $O/lmbench.a: $(LIBOBJS)
  	/bin/rm -f $O/lmbench.a
  	$(AR) $(ARCREATE) $O/lmbench.a $(LIBOBJS)
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
index b46e09a..44bc7bb 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
@@ -1,8 +1,18 @@
+From aca1a59d888421c1fc553229b8049be47e8b3ddf Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <b40290@freescale.com>
+Date: Fri, 1 Mar 2013 09:50:42 +0000
+Subject: [PATCH] lmbench: update config script
+
 Upstream-Status: Pending
-Index: lmbench-3.0-a9/scripts/config
-===================================================================
---- lmbench-3.0-a9/scripts/config	2000-01-31 18:29:31.000000000 -0600
-+++ lmbench-3.0-a9/scripts/config	2013-03-01 00:19:41.032984315 -0600
+
+---
+ scripts/config | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/config b/scripts/config
+index b58cb60..25d9d77 100755
+--- a/scripts/config
++++ b/scripts/config
 @@ -3,5 +3,5 @@
  UNAME=`uname -n 2>/dev/null`
  if [ X$UNAME = X ]
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
index 894f146..31c4aec 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
@@ -1,45 +1,24 @@
+From 4955021bc283be404df62b97b86af3943efd29de Mon Sep 17 00:00:00 2001
+From: Noor Ahsan <noor_ahsan@mentor.com>
+Date: Mon, 29 Aug 2011 16:17:51 +0000
+Subject: [PATCH] lmbench: Add version 3.0-a9 (initial recipe)
+
 Now that we have our binaries in /usr/bin rather than the normal
 lmbench hierarchy we need to update the scripts as well to behave well here.
 
 Upstream-Status: Inappropriate [This is related to the OE-specific behavior
-of installing into /usr/bin, etc, rather than dumping everything into 
+of installing into /usr/bin, etc, rather than dumping everything into
 /usr/share/lmbench or similar]
 
-Index: lmbench-3.0-a9/scripts/results
-===================================================================
---- lmbench-3.0-a9.orig/scripts/results
-+++ lmbench-3.0-a9/scripts/results
-@@ -8,11 +8,11 @@ RESULTS=results/$OS
- BASE=../$RESULTS/`uname -n`
- EXT=0
- 
--if [ ! -f "../bin/$OS/$CONFIG" ]
-+if [ ! -f "$CONFIG" ]
- then	echo "No config file?"
- 	exit 1
- fi
--. ../bin/$OS/$CONFIG
-+. $CONFIG
- 
- if [ ! -d ../$RESULTS ]
- then	mkdir -p ../$RESULTS
-@@ -23,11 +23,9 @@ do      EXT=`expr $EXT + 1`
- 	RESULTS=$BASE.$EXT
- done
- 
--cd ../bin/$OS 
--PATH=.:${PATH}; export PATH
- export SYNC_MAX
- export OUTPUT
--lmbench $CONFIG 2>../${RESULTS}
-+lmbench $CONFIG 2>${RESULTS}
- 
- if [ X$MAIL = Xyes ]
- then	echo Mailing results
-Index: lmbench-3.0-a9/scripts/config-run
-===================================================================
---- lmbench-3.0-a9.orig/scripts/config-run
-+++ lmbench-3.0-a9/scripts/config-run
+---
+ scripts/config-run | 40 ++++++++++++++++++++--------------------
+ scripts/results    |  8 +++-----
+ 2 files changed, 23 insertions(+), 25 deletions(-)
+
+diff --git a/scripts/config-run b/scripts/config-run
+index a2d5ba4..918cbdf 100755
+--- a/scripts/config-run
++++ b/scripts/config-run
 @@ -132,20 +132,20 @@ export LMBENCH_SCHED
  ############################################################################
  echo $L; echo "";
@@ -89,7 +68,7 @@ Index: lmbench-3.0-a9/scripts/config-run
  if [ `expr $SYNC_MAX \* $MB` -gt `expr $TOTAL_MEM` ]
  then
  	MB=`expr $TOTAL_MEM / $SYNC_MAX`
-@@ -223,8 +223,8 @@ then	echo Warning: you have only ${MB}MB
+@@ -223,8 +223,8 @@ then	echo Warning: you have only ${MB}MB available memory.
  fi
  
  echo "Hang on, we are calculating your cache line size."
@@ -158,3 +137,34 @@ Index: lmbench-3.0-a9/scripts/config-run
  echo DISKS=\"$DISKS\" > $C
  echo DISK_DESC=\"$DISK_DESC\" >> $C
  echo OUTPUT=$OUTPUT >> $C
+diff --git a/scripts/results b/scripts/results
+index cd07c15..d5aa558 100755
+--- a/scripts/results
++++ b/scripts/results
+@@ -8,11 +8,11 @@ RESULTS=results/$OS
+ BASE=../$RESULTS/`uname -n`
+ EXT=0
+ 
+-if [ ! -f "../bin/$OS/$CONFIG" ]
++if [ ! -f "$CONFIG" ]
+ then	echo "No config file?"
+ 	exit 1
+ fi
+-. ../bin/$OS/$CONFIG
++. $CONFIG
+ 
+ if [ ! -d ../$RESULTS ]
+ then	mkdir -p ../$RESULTS
+@@ -23,11 +23,9 @@ do      EXT=`expr $EXT + 1`
+ 	RESULTS=$BASE.$EXT
+ done
+ 
+-cd ../bin/$OS 
+-PATH=.:${PATH}; export PATH
+ export SYNC_MAX
+ export OUTPUT
+-lmbench $CONFIG 2>../${RESULTS}
++lmbench $CONFIG 2>${RESULTS}
+ 
+ if [ X$MAIL = Xyes ]
+ then	echo Mailing results
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
index 3351ce8..53ec714 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
@@ -1,4 +1,4 @@
-From 0d09e31970616e09beb7f238c2b59bfc541148fb Mon Sep 17 00:00:00 2001
+From 73fdc58ca4eb9e2f24d854b3af3a4e5daac5a33e Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Fri, 22 Nov 2013 15:20:08 +0800
 Subject: [PATCH] use base_libdir instead of hardcoded /lib
@@ -6,9 +6,10 @@ Subject: [PATCH] use base_libdir instead of hardcoded /lib
 Upsteam Status: Inappropriate [configuration]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
+
 ---
- src/Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
 index c7a8c79..c7e4e3c 100644
@@ -27,6 +28,3 @@ index c7a8c79..c7e4e3c 100644
  	cd ../doc; env MAKEFLAGS="$(MAKEFLAGS)" make CC="${CC}" OS="${OS}" BASE="$(BASE)" install
  
  
--- 
-1.7.5.4
-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
index 2d8a246..b964bef 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
@@ -1,4 +1,7 @@
-[PATCH] avoid gcc optimize-away the loops
+From 25738bb9c75f94b451201acfd6bcab13bdeee512 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 5 May 2016 09:52:01 +0800
+Subject: [PATCH] [PATCH] avoid gcc optimize-away the loops
 
 Upstream-Status: pending
 
@@ -15,6 +18,7 @@ and TEN is macro:
 	#define TEN(a) a a a a a a a a a a
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  src/lat_ops.c | 30 +++++++++++++++++++++++++-----
  1 file changed, 25 insertions(+), 5 deletions(-)
@@ -74,6 +78,3 @@ index d343ff3..457072b 100644
  	}
  	use_int((int)r);
  }
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
index 9a40521..b42ee7d 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
@@ -1,3 +1,8 @@
+From 16823f5c3d3d5adad0b70e9055c08cb4e18d255b Mon Sep 17 00:00:00 2001
+From: Noor Ahsan <noor_ahsan@mentor.com>
+Date: Mon, 29 Aug 2011 16:17:51 +0000
+Subject: [PATCH] lmbench: Add version 3.0-a9 (initial recipe)
+
 Both lmbench and util-linux-ng packages provide own /usr/bin/line binaries.
 Even though the binaries name is the same, their functionality is different.
 This patch renames lmbench's line binary as lm_line to avoid conflicts with
@@ -6,8 +11,14 @@ instead of line.
 
 Upstream-Status: Inappropriate [build system specific change]
 
---- patches/scripts/config-run	2006-11-26 15:11:04.000000000 -0500
-+++ patches/scripts/config-run	2011-04-01 09:35:50.000000000 -0400
+---
+ scripts/config-run | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/config-run b/scripts/config-run
+index f620c15..a2d5ba4 100755
+--- a/scripts/config-run
++++ b/scripts/config-run
 @@ -224,7 +224,7 @@ fi
  
  echo "Hang on, we are calculating your cache line size."
-- 
2.7.4


