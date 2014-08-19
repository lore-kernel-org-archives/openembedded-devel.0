Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A73E870E63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:16:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9GNMZ017711
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 02:16:23 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:16:23 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 05:16:17 -0400
Message-ID: <8846f5810a56305845046f5af16d428926811be9.1408438614.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1408438614.git.jackie.huang@windriver.com>
References: <cover.1408438614.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] lmbench: fix lmbench memory check failure
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
X-List-Received-Date: Tue, 19 Aug 2014 09:16:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

lmbench can't proceed on some targets.  The memory check fails because the
memory latency of each page is longer then 10us, which is a time limit set
in the original memsize.c.

The memory latency is very different on different targets due to the
hardware and current system load.  The targets with slower memory
chips or heavy system load need much longer time to read or write
the memory.

This fix changes the fixed time limit of 10us to a specific value calculated
from the runtime target.

Also set an upper limit of memory size used for lmbench testing.  The memory
check sometimes fails if the target has a large amount of memory, for
example more than 4G.

Signed-off-by: Qingming Su <qingming.su@windriver.com>
Signed-off-by: Fupan Li <fupan.li@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../fix-lmbench-memory-check-failure.patch         |  206 ++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
new file mode 100644
index 0000000..549a114
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
@@ -0,0 +1,206 @@
+lmbench: Can't proceed on some targets
+
+lmbench can't proceed on some targets.  The memory check fails because the
+memory latency of each page is longer then 10us, which is a time limit set
+in the original memsize.c.
+
+The memory latency is very different on different targets due to the
+hardware and current system load.  The targets with slower memory
+chips or heavy system load need much longer time to read or write
+the memory.
+
+This fix changes the fixed time limit of 10us to a specific value calculated
+from the runtime target.
+
+Also set an upper limit of memory size used for lmbench testing.  The memory
+check sometimes fails if the target has a large amount of memory, for
+example more than 4G.
+
+Signed-off-by: Qingming Su <qingming.su@windriver.com>
+Signed-off-by: Fupan Li <fupan.li@windriver.com>
+
+Add and reword above comments
+
+Upstream-status: inappropriate [ configuration ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/scripts/config-run b/scripts/config-run
+index e1f7b6d..31b9256 100755
+--- a/scripts/config-run
++++ b/scripts/config-run
+@@ -214,6 +214,12 @@ The bigger the range, the more accurate the results, but larger sizes
+ take somewhat longer to run the benchmark.
+
+ EOF
++
++# By default, use 512M memory as the upper limit for lmbench test
++if [ $MB -gt 512 ];then
++MB=512
++fi
++
+ echo $ECHON "MB [default $MB]: $ECHOC"
+ #read TMP
+ TMP=""
+@@ -718,10 +724,10 @@ case $MAIL in
+		;;
+ esac
+
+-INFO=`../scripts/info`
++INFO=`../scripts/hostinfo`
+ if [ $MAIL = yes ]
+ then	if [ ! -f $INFO ]
+-	then	cp ../scripts/info-template $INFO
++	then	cp ../scripts/hostinfo-template $INFO
+ 		chmod +w $INFO
+ 		REUSE=no
+ 	else
+@@ -765,7 +771,7 @@ EOF
+ 		then	EDITOR=$TMP
+ 		fi
+ 		if [ X$EDITOR != "none" ]
+-		then	$EDITOR `../scripts/info`
++		then	$EDITOR `../scripts/hostinfo`
+ 		fi
+ 	fi
+ fi
+diff --git a/src/Makefile b/src/Makefile
+index d1f0dc6..5098998 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -49,7 +49,7 @@ TARGET=`../scripts/target`
+ BINDIR=../bin/$(OS)
+ CONFIG=../bin/$(OS)/`../scripts/config`
+ UTILS=../scripts/target ../scripts/os ../scripts/gnu-os ../scripts/compiler \
+-	../scripts/info ../scripts/info-template ../scripts/version \
++	../scripts/hostinfo ../scripts/hostinfo-template ../scripts/version \
+ 	../scripts/config ../scripts/config-run ../scripts/results \
+ 	../scripts/lmbench ../scripts/make ../scripts/build
+ INSTALL=cp
+@@ -240,7 +240,7 @@ $O/getopt.o : getopt.c $(INCS)
+ 	$(COMPILE) -c getopt.c -o $O/getopt.o
+
+ $(UTILS) :
+-	-cd ../scripts; make get
++	-cd ../scripts; cp info hostinfo; cp info-template hostinfo-template
+
+ # Do not remove the next line, $(MAKE) depend needs it
+ # MAKEDEPEND follows
+diff --git a/src/memsize.c b/src/memsize.c
+index eb25a09..cf9fe0c 100644
+--- a/src/memsize.c
++++ b/src/memsize.c
+@@ -14,9 +14,12 @@ char	*id = "$Id$\n";
+
+ #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
+
+-#ifndef	TOO_LONG
+-#define	TOO_LONG	10	/* usecs */
+-#endif
++//#ifndef	TOO_LONG
++//#define	TOO_LONG	10	/* usecs */
++//#endif
++
++#define	MEMORY_SIZE_1MB (1024 * 1024)
++#define	MEMORY_SIZE_8MB (8 * 1024 * 1024)
+
+ int	alarm_triggered = 0;
+
+@@ -35,10 +38,10 @@ main(int ac, char **av)
+ 	size_t	delta;
+
+ 	if (ac == 2) {
+-		max = size = bytes(av[1]) * 1024 * 1024;
++		max = size = bytes(av[1]) * MEMORY_SIZE_1MB;
+ 	}
+-	if (max < 1024 * 1024) {
+-		max = size = 1024 * 1024 * 1024;
++	if (max < MEMORY_SIZE_1MB) {
++		max = size = 1024 * MEMORY_SIZE_1MB;
+ 	}
+ 	/*
+ 	 * Binary search down and then binary search up
+@@ -48,7 +51,7 @@ main(int ac, char **av)
+ 	}
+ 	/* delta = size / (2 * 1024 * 1024) */
+ 	for (delta = (size >> 21); delta > 0; delta >>= 1) {
+-		uint64 sz = (uint64)size + (uint64)delta * 1024 * 1024;
++		uint64 sz = (uint64)size + (uint64)delta * MEMORY_SIZE_1MB;
+ 		size_t check = sz;
+ 		if (max < sz) continue;
+ 		if (check < sz || !test_malloc(sz)) break;
+@@ -66,41 +69,58 @@ timeit(char *where, size_t size)
+ {
+ 	int	sum = 0;
+ 	size_t	n;
+-	size_t	s_prev;
++	size_t	s_prev = MEMORY_SIZE_8MB;
+ 	size_t	range;
+-	size_t	incr = 1024 * 1024;
++	size_t	incr = MEMORY_SIZE_1MB;
+ 	size_t	pagesize = getpagesize();
+-	unsigned long long	s;
+-
+-	if (size < 1024*1024 - 16*1024) {
+-		fprintf(stderr, "Bad size\n");
+-		return;
+-	}
++	size_t	time_each_page = 0;
++	size_t	too_long = 0;
++	unsigned long long      s;
++
++	if (pagesize < MEMORY_SIZE_1MB)
++		range = MEMORY_SIZE_1MB;
++	else
++		range = MEMORY_SIZE_8MB;
++
++	incr = MEMORY_SIZE_1MB;
++	
++	if (size < range) {
++              fprintf(stderr, "Bad size\n");
++              return;
++	    }
++
++	//Touch range of memory, get the average time (usec) of operating each memory page on this system
++        start(0);
++        touchRange(where, range, pagesize);
++        sum = stop(0, 0);
++
++        if ((time_each_page = sum * pagesize / range) < 1)
++		time_each_page = 1;
++	//Set the uper limit of time spending on one page
++        too_long = 10 * time_each_page;
+
+-	range = 1024 * 1024;
+-	incr = 1024 * 1024;
+-	touchRange(where, range, pagesize);
+ 	for (range += incr; range <= size; range += incr) {
+ 		n = range / pagesize;
+-		set_alarm(n * TOO_LONG);
++		set_alarm(n * too_long);
+ 		touchRange(where + range - incr, incr, pagesize);
+ 		clear_alarm();
+-		set_alarm(n * TOO_LONG);
++		set_alarm(n * too_long);
+ 		start(0);
+ 		touchRange(where, range, pagesize);
+ 		sum = stop(0, 0);
+ 		clear_alarm();
+-		if ((sum / n) > TOO_LONG || alarm_triggered) {
++		if ((sum / n) > too_long || alarm_triggered) {
+ 			size = range - incr;
++			fprintf(stderr, "Error! Memory testing timeout! Touch one page of memory needs more than %d (usecs)\n ", too_long);
+ 			break;
+ 		}
+-		for (s = 8 * 1024 * 1024; s <= range; s_prev = s, s *= 2)
++		for (s = s_prev; s <= range; s_prev = s, s *= 2)
+ 			if (s < s_prev) break;
+ 		incr = s / 8;
+ 		if (range < size && size < range + incr) {
+ 			incr = size - range;
+ 		}
+-		fprintf(stderr, "%dMB OK\r", (int)(range/(1024*1024)));
++		fprintf(stderr, "%dMB OK\r", (int)(range/MEMORY_SIZE_1MB));
+ 	}
+ 	fprintf(stderr, "\n");
+ 	printf("%d\n", (int)(size>>20));
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index d8238ae..c5d6ac8 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://update-config-script.patch \
            file://use-base_libdir-instead-of-hardcoded-lib.patch \
            file://lmbench_result_html_report.patch \
+           file://fix-lmbench-memory-check-failure.patch \
 "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
--
1.7.9.5


