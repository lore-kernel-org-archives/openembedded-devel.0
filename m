Return-Path: <akuster808@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A7F8D60167
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2015 00:08:40 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so107301345wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5IUGCswFIWfMGfLa5OU0lYSOhylTgTZWC9bdPLWjdqY=;
	b=R5KGUqv0xvfQ0V8GvvGct5L9+A3B3BTG0bQ+Uwzv55zCj40L9HTQ8ut6SqmQfdInC5
	x8SELZW7KiTuO42uMGb1nGWNZ2sYMVnzzxoMN+bhVfWZR5/P3X35B6Ub9kVtJiNT3C8W
	nvwf9jmyegk+f6+kzUWa3+ZHlHdAedyE13A8AvPxz/3YG94UgQgPsGucELpNn6rsa+kL
	EiyXrCquNRslPpIIggw2YQbWHo+q8PkjfN74I0obO9B1J2Dc/xyTYWeabPofEsO0Ur+M
	mA+A4bVJ8o27r/EwapdMNBYVGKWedCfd5XjfNWW6SQI058iDB/EIDUncz6SA2lrqFWld
	EYTQ==
X-Received: by 10.180.88.196 with SMTP id bi4mr11388093wib.70.1439078920847;
	Sat, 08 Aug 2015 17:08:40 -0700 (PDT)
Received: from localhost.localdomain ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id j2sm7240920wjq.5.2015.08.08.17.08.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 08 Aug 2015 17:08:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Sun,  9 Aug 2015 05:38:30 +0530
Message-Id: <1439078910-14318-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] netmap v2: add new package
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
X-List-Received-Date: Sun, 09 Aug 2015 00:08:45 -0000

From: Armin Kuster <akuster@mvista.com>

this adds netmap, the fast packet I/O framework
http://info.iet.unipi.it/~luigi/netmap/

v2:
fix config opt typo
fix compile on non x86 targets
exclude ppc and arm from builds do to issues with kernel headers

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../netmap/files/makefile_fixup.patch              | 79 ++++++++++++++++++++++
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 51 ++++++++++++++
 meta-networking/recipes-kernel/netmap/netmap.inc   | 17 +++++
 .../recipes-kernel/netmap/netmap_git.bb            | 34 ++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap.inc
 create mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb

diff --git a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
new file mode 100644
index 0000000..e838653
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
@@ -0,0 +1,79 @@
+The makefile assumes building locally.
+
+Upstream Status: Inappropriate [Native]
+
+The configure is not auto-make based
+
+Signed-of-by: Armin Kuster <akuster@mvista.com>
+
+Index: LINUX/netmap.mak.in
+===================================================================
+--- a/LINUX/netmap.mak.in
++++ b/LINUX/netmap.mak.in
+@@ -12,10 +12,8 @@ SRCDIR:=@SRCDIR@
+ # The following commands are needed to build the modules as out-of-tree,
+ # in fact the kernel sources path must be specified.
+ 
+-PWD ?= $(CURDIR)
+-
+ # Additional compile flags (e.g. header location)
+-EXTRA_CFLAGS := -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
++EXTRA_CFLAGS := -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sys/dev -DCONFIG_NETMAP
+ EXTRA_CFLAGS += -Wno-unused-but-set-variable
+ EXTRA_CFLAGS += $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell echo $s|tr a-z A-Z))
+ 
+Index: LINUX/configure
+===================================================================
+--- a/LINUX/configure
++++ b/LINUX/configure
+@@ -311,34 +311,6 @@ reset_tests() {
+ 	NEXTTEST=1
+ }
+ 
+-# run_tests: run all accumulated tests and exec the pertinent
+-#   success/failure actions for each one.
+-run_tests() {
+-	local t= 	# prevent -EOF to eat the make TAB
+-	cat > $TMPDIR/Makefile <<-EOF
+-		ifneq (\$(KERNELRELEASE),)
+-		obj-m := $TESTOBJS
+-		else
+-		S_DRIVERS := $(drv print)
+-		all: \$(S_DRIVERS:%=get-%)
+-		$t	\$(MAKE) -C $ksrc M=\$\$PWD $kopts
+-
+-		-include $TOPDIR/drivers.mak
+-	EOF
+-	for d in $(drv print); do
+-		cat >> $TMPDIR/Makefile <<-EOF
+-			get-$d:
+-			$t	[ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if \$($d-dst),\$($d-dst),.)
+-		EOF
+-	done
+-	echo endif >> $TMPDIR/Makefile
+-	(
+-		cd $TMPDIR
+-		make -k -j $(grep -c processor /proc/cpuinfo)
+-	) >> config.log
+-	eval "$TESTPOSTPROC"
+-}
+-
+ configh=netmap_linux_config.h
+ # succes/failure actions are expected to write some macros
+ # in netma_linux_config.h. The following functions can be
+@@ -555,7 +527,6 @@ configuration. Please check 'config.log'
+ 
+ reset_tests
+ add_test true broken_buildsystem < /dev/null
+-run_tests
+ 
+ drvname2config() {
+ 	local name=$1
+@@ -1087,7 +1058,6 @@ cat > $configh <<-EOF
+ EOF
+ 
+ # the TESTPOSTPROC script will add macros to $configh
+-run_tests
+ 
+ define DRIVER_SUFFIX \"$drvsuffix\"
+ 
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
new file mode 100644
index 0000000..00d334f
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -0,0 +1,51 @@
+require netmap.inc
+
+DEPENDS = "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit module
+
+CLEANBROKEN = "1"
+
+export INSTALL_MOD_DIR="kernel/netmap-modules"
+
+EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
+                --kernel-sources=${STAGING_KERNEL_DIR} \
+                --install-mod-path=${D} \
+                --driver-suffix="-netmap" \
+                "
+
+LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
+LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
+
+do_configure () {
+    cd ${S}/LINUX
+    ./configure ${EXTRA_OECONF}
+}
+
+do_configure_append () {
+    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
+#define NETMAP_LINUX_HAVE_HRTIMER_MODE_REL
+#define NETMAP_LINUX_HAVE_HRTIMER_FORWARD_NOW
+#define NETMAP_LINUX_HAVE_PHYS_ADDR_T
+#define NETMAP_LINUX_HAVE_ACCESS_ONCE
+#define NETMAP_LINUX_HAVE_NETDEV_OPS
+#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
+#define NETMAP_LINUX_HAVE_INIT_NET
+#define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
+#define NETMAP_LINUX_HAVE_TX_SKB_SHARING
+#define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
+#define NETMAP_LINUX_HAVE_PERNET_OPS_ID
+#define NETMAP_LINUX_TIMER_RTYPE static enum hrtimer_restart
+EOF
+}
+
+do_compile () {
+    cd ${S}/LINUX
+    oe_runmake 
+}
+
+do_install () {
+    cd ${S}/LINUX
+    oe_runmake install
+}
diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-networking/recipes-kernel/netmap/netmap.inc
new file mode 100644
index 0000000..9083c69
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap.inc
@@ -0,0 +1,17 @@
+SUMMARY = "netmap and VALE - very fast packet I/O from userspace (FreeBSD/Linux)"
+DESCRIPTION= "NETMAP is a framework for very fast packet I/O from userspace.  VALE is an equally fast in-kernel software switch using the netmap API.  Both are implemented as a single kernel module for FreeBSD and Linux, and can deal with line rate on real or emulated 10 Gbit ports."
+SECTION = "networking"
+HOMEPAGE = "http://code.google.com/p/netmap/"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=13;endline=14;md5=f64f2b172fe6903ff7b6272c6edde588"
+
+SRCREV = "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
+PV = "master+git${SRCPV}"
+
+SRC_URI = "git://github.com/luigirizzo/netmap.git"
+SRC_URI += "file://makefile_fixup.patch"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = '(x86_64|i.86|mips|arm).*-linux'
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
new file mode 100644
index 0000000..0ee19d4
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -0,0 +1,34 @@
+require netmap.inc
+
+DEPENDS = "netmap-modules"
+
+EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
+                --kernel-sources=${STAGING_KERNEL_DIR} \
+                --no-drivers \
+                --disable-generic \
+                --prefix=${prefix} \
+                --destdir=${D} \
+                --cc='${CC}' \
+                --ld='${LD}' \
+                "
+
+do_fetch[depends] += "netmap-modules:do_fetch"
+
+do_configure () {
+    cd ${S}/LINUX
+    ./configure ${EXTRA_OECONF}
+}
+
+do_compile () {
+    cd ${S}/LINUX
+    make apps
+}
+
+do_install () {
+    cd ${S}/LINUX
+    make install-apps DESTDIR=${D}
+}
+
+FILES_${PN} += "${bindir}"
+RDEPENDS_${PN} = "kernel-module-netmap"
+RRECOMMENDS_${PN} = "kernel-module-netmap"
-- 
2.3.5


