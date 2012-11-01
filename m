Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TTk1B-0003yK-NC
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 02:56:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA11glbW015930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 18:42:47 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 31 Oct 2012 18:42:46 -0700
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2012 09:42:46 +0800
Message-ID: <1351734166-8711-2-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking 2/2] netperf: uprev to 2.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Nov 2012 01:56:26 -0000
Content-Type: text/plain

Also fix license, summary and patches.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 .../recipes-support/netperf/files/cpu_set.patch    |   34 ++++++----
 .../recipes-support/netperf/files/vfork.patch      |   72 ++++++++++++++------
 .../netperf/{netperf_2.4.4.bb => netperf_2.6.0.bb} |   23 +++++--
 3 files changed, 89 insertions(+), 40 deletions(-)
 rename meta-networking/recipes-support/netperf/{netperf_2.4.4.bb => netperf_2.6.0.bb} (65%)

diff --git a/meta-networking/recipes-support/netperf/files/cpu_set.patch b/meta-networking/recipes-support/netperf/files/cpu_set.patch
index b2b95c7..434b790 100644
--- a/meta-networking/recipes-support/netperf/files/cpu_set.patch
+++ b/meta-networking/recipes-support/netperf/files/cpu_set.patch
@@ -1,24 +1,30 @@
-Index: netperf-2.4.4/src/netlib.c
-===================================================================
---- netperf-2.4.4.orig/src/netlib.c	2007-10-17 23:16:02.000000000 +0200
-+++ netperf-2.4.4/src/netlib.c	2008-12-03 17:56:32.000000000 +0100
-@@ -1988,10 +1988,15 @@
+Subject: [PATCH] netperf: fix CPU_SETSIZE to build with eglibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ src/netlib.c |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/src/netlib.c b/src/netlib.c
+index 206e002..e33aae6 100644
+--- a/src/netlib.c
++++ b/src/netlib.c
+@@ -2265,7 +2265,12 @@ bind_to_specific_processor(int processor_affinity, int use_cpu_map)
       fall-back on what we had before, which is to use just the size of
       an unsigned long. raj 2006-09-14 */
  
 -#if defined(__CPU_SETSIZE)
--#define NETPERF_CPU_SETSIZE __CPU_SETSIZE
--#define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET(cpu, cpusetp)
--#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
 +#if defined(CPU_SETSIZE)
 +#define NETPERF_CPU_SETSIZE CPU_SETSIZE
 +#define NETPERF_CPU_SET(cpu, cpusetp)  CPU_SET(cpu, cpusetp)
 +#define NETPERF_CPU_ZERO(cpusetp)      CPU_ZERO (cpusetp)
 +  typedef cpu_set_t netperf_cpu_set_t;
 +#elif defined(__CPU_SETSIZE)
-+#define NETPERF_CPU_SETSIZE __CPU_SETSIZE
-+#define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET (cpu, cpusetp)
-+#define NETPERF_CPU_ZERO(cpusetp)      __CPU_ZERO (cpusetp)
-   typedef cpu_set_t netperf_cpu_set_t;
- #else
- #define NETPERF_CPU_SETSIZE sizeof(unsigned long)
+ #define NETPERF_CPU_SETSIZE __CPU_SETSIZE
+ #if defined(__CPU_SET_S)
+ #define NETPERF_CPU_SET(cpu, cpusetp)  __CPU_SET_S(cpu, sizeof (cpu_set_t), cpusetp)
+-- 
+1.7.1.1
+
diff --git a/meta-networking/recipes-support/netperf/files/vfork.patch b/meta-networking/recipes-support/netperf/files/vfork.patch
index a40c96f..eff98bf 100644
--- a/meta-networking/recipes-support/netperf/files/vfork.patch
+++ b/meta-networking/recipes-support/netperf/files/vfork.patch
@@ -1,26 +1,58 @@
---- netperf-2.4.4/src/netserver.c	2007-10-17 17:09:12.000000000 -0400
-+++ netperf-2.4.4.new/src/netserver.c	2011-01-23 12:26:39.000000000 -0500
-@@ -567,7 +567,11 @@
-   fflush (stdin);
-   fflush (stdout);
-   fflush (stderr);
+Subject: [PATCH] netperf: fix vfork/fork
+
+Upstream-Status: Pending
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ src/netserver.c |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/netserver.c b/src/netserver.c
+index 379a106..f6a8b09 100644
+--- a/src/netserver.c
++++ b/src/netserver.c
+@@ -1020,7 +1020,7 @@ process_requests()
+ void
+ spawn_child() {
+ 
+-#if defined(HAVE_FORK)
++#if defined(HAVE_FORK) || defined(HAVE_VFORK)
+ 
+   if (debug) {
+     fprintf(where,
+@@ -1038,7 +1038,11 @@ spawn_child() {
+ 
+   signal(SIGCLD,SIG_IGN);
+ 
 +#if defined(HAVE_FORK)
-   switch (fork())
+   switch (fork()) {
 +#else
-+  switch (vfork())
++  switch (vfork()) {
 +#endif
-     {
-     case -1:  	
-       perror("netperf server error");
-@@ -712,7 +716,11 @@
- #else
-       signal(SIGCLD, SIG_IGN);
- 	  
+   case -1:
+     fprintf(where,
+ 	    "%s: fork() error %s (errno %d)\n",
+@@ -1405,7 +1409,7 @@ scan_netserver_args(int argc, char *argv[]) {
+ 
+ void
+ daemonize() {
+-#if defined(HAVE_FORK)
++#if defined(HAVE_FORK) || defined(HAVE_VFORK)
+ 
+   if (debug) {
+     fprintf(where,
+@@ -1419,7 +1423,11 @@ daemonize() {
+   fflush(stdout);
+   fflush(stderr);
+ 
 +#if defined(HAVE_FORK)
- 	  switch (fork())
+   switch (fork()) {
 +#else
-+	  switch (vfork())
++  switch (vfork()) {
 +#endif
- 	    {
- 	    case -1:
- 	      /* something went wrong */
+   case -1:
+     fprintf(stderr,
+ 	    "%s: fork() error %s (errno %d)\n",
+-- 
+1.7.1.1
+
diff --git a/meta-networking/recipes-support/netperf/netperf_2.4.4.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
similarity index 65%
rename from meta-networking/recipes-support/netperf/netperf_2.4.4.bb
rename to meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index 4ffa822..8b57a46 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.4.4.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -1,14 +1,19 @@
-DESCRIPTION="Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
+SUMMARY = "A networking benchmarking tool"
+DESCRIPTION = "Network performance benchmark including tests for TCP, UDP, sockets, ATM and more."
 SECTION = "console/network"
 HOMEPAGE = "http://www.netperf.org/"
-LICENSE = "netperf"
-PR = "r3"
+LICENSE = "HP"
+LICENSE_FLAGS = "commercial"
 
-SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
+PR = "r0"
+
+SRC_URI="ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
          file://cpu_set.patch \
          file://vfork.patch \
          file://init"
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+
 inherit update-rc.d autotools
 
 S = "${WORKDIR}/netperf-${PV}"
@@ -16,6 +21,12 @@ S = "${WORKDIR}/netperf-${PV}"
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 
+# autotools.bbclass attends to include m4 files with path depth <= 2 by 
+# "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
+do_configure_prepend() {
+	test -d m4/m4 && mv -f m4/m4 m4-files
+}
+
 do_install() {
         install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
         install -m 4755 src/netperf ${D}${bindir}
@@ -41,5 +52,5 @@ do_install() {
 INITSCRIPT_NAME="netperf"
 INITSCRIPT_PARAMS="defaults"
 
-SRC_URI[md5sum] = "0e942f22864e601406a994420231075b"
-SRC_URI[sha256sum] = "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"
+SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
+SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
-- 
1.7.5.4



