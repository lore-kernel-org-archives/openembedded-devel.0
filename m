Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2BD71A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 05:42:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v575graZ004610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Jun 2017 22:42:54 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 6 Jun 2017 22:42:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Jun 2017 13:42:51 +0800
Message-ID: <1496814171-19938-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH] ippool: add new recipe
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
X-List-Received-Date: Wed, 07 Jun 2017 05:42:55 -0000
Content-Type: text/plain

IpPool is a userspace daemon for managing one or more pools of IP
addresses. It was developed as part of the OpenL2TP project but has
since been repackaged so that it may be used independently of OpenL2TP.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ippool/ippool/always_syslog.patch              |  22 +++++
 .../recipes-daemons/ippool/ippool/ippool.service   |  19 ++++
 .../ippool/ippool/ippool_init.d.patch              |  65 +++++++++++++
 .../ippool/ippool_parallel_make_and_pic.patch      |  89 +++++++++++++++++
 .../ippool/ippool/ippool_usl_timer.patch           |  49 ++++++++++
 .../ippool/ippool/makefile-add-ldflags.patch       |  21 +++++
 .../recipes-daemons/ippool/ippool/runtest.sh       |  26 +++++
 .../recipes-daemons/ippool/ippool_1.3.bb           | 105 +++++++++++++++++++++
 8 files changed, 396 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/always_syslog.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/ippool.service
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/ippool_init.d.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/ippool_parallel_make_and_pic.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/ippool_usl_timer.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/runtest.sh
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool_1.3.bb

diff --git a/meta-networking/recipes-daemons/ippool/ippool/always_syslog.patch b/meta-networking/recipes-daemons/ippool/ippool/always_syslog.patch
new file mode 100644
index 0000000..e475276
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/always_syslog.patch
@@ -0,0 +1,22 @@
+ippool: always log to syslog
+
+Even when running in the foreground, send log messages to syslog.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/ippool_main.c
++++ b/ippool_main.c
+@@ -251,9 +251,8 @@ void ippool_vlog(int level, const char *
+ 	if (ippool_opt_nodaemon) {
+ 		vprintf(fmt, ap);
+ 		printf("\n");
+-	} else {
+-		vsyslog(level, fmt, ap);
+ 	}
++	vsyslog(level, fmt, ap);
+ 	DMALLOC_VMESSAGE(fmt, ap);
+ }
+ 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool.service b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
new file mode 100644
index 0000000..e5917fc
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
@@ -0,0 +1,19 @@
+[Unit]
+Description=ip address pool allocator
+Requires=rpcbind.service
+After=rpcbind.service
+
+[Service]
+Type=simple
+# Start ippoold in the foreground!
+ExecStart=@SBINDIR@/ippoold -f
+# Normal output will go to syslog, so suppress stdout.
+StandardOutput=null
+StandardError=syslog
+# ExecStop is not needed. systemd will send SIGTERM
+# and ippoold will exit status 1.
+SuccessExitStatus=1
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool_init.d.patch b/meta-networking/recipes-daemons/ippool/ippool/ippool_init.d.patch
new file mode 100644
index 0000000..14a768d
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool_init.d.patch
@@ -0,0 +1,65 @@
+Fix start error if lsb init-functions doesn't exist
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/debian/init.d b/debian/init.d
+index 363ba89..0327fec 100644
+--- a/debian/init.d
++++ b/debian/init.d
+@@ -10,6 +10,9 @@
+ # Description:       Start ippool daemon
+ ### END INIT INFO
+ 
++# Source function library.
++. /etc/init.d/functions
++
+ DAEMON=/usr/sbin/ippoold
+ NAME=ippoold
+ MODULE=pppol2tp
+@@ -18,7 +21,23 @@ MODULE=pppol2tp
+ test -x $DAEMON || exit 0
+ 
+ # Get lsb functions
+-. /lib/lsb/init-functions
++if [ -f /lib/lsb/init-functions ]
++then
++  . /lib/lsb/init-functions
++else
++  log_begin_msg() {
++    echo -n $*
++  }
++
++  log_end_msg() {
++    if [ $1 -eq 0 ]; then
++      echo "done"
++    else
++      echo "failed"
++    fi
++  }
++fi
++
+ . /etc/default/rcS
+ 
+ case "$1" in
+@@ -35,6 +54,10 @@ case "$1" in
+     fi
+     log_end_msg $?
+     ;;
++  status)
++    status /usr/sbin/ippoold;
++    exit $?
++    ;;
+   restart)
+     $0 stop
+     sleep 1
+@@ -46,7 +69,7 @@ case "$1" in
+     log_end_msg $?
+     ;;
+   *)
+-    log_success_msg "Usage: /etc/init.d/ippoold {start|stop|restart|reload|force-reload}"
++    log_success_msg "Usage: /etc/init.d/ippoold {start|stop|status|restart|reload|force-reload}"
+     exit 1
+ esac
+ 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool_parallel_make_and_pic.patch b/meta-networking/recipes-daemons/ippool/ippool/ippool_parallel_make_and_pic.patch
new file mode 100644
index 0000000..1ebd95e
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool_parallel_make_and_pic.patch
@@ -0,0 +1,89 @@
+1)add -fPIC for $(IPPOOL_RPC_STEM)_xdr.o, $(IPPOOL_RPC_STEM)_client.o
+2)add sub target for subdirs-all, and those dependencies below
+  pppd plugin directory build depends on $(IPPOOL_RPC_STEM)_xdr.o 
+$(IPPOOL_RPC_STEM)_client.o ippool_rpc.h
+
+  ippoold depends on libusl
+  ippoolconfig depends on libcli
+
+  $(IPPOOL_RPC_STEM)_xdr.o, $(IPPOOL_RPC_STEM)_client.o 
+$(IPPOOL_RPC_STEM)_server.o *.o in main directory depends on ippool_rpc.h
+as those all directly or indirectly include ippool_rpc.h which is 
+dynamically generated by rpcgen
+
+to make parallel make working.
+3)include dependency files for pppd.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/Makefile b/Makefile
+index 73aa72f..4f7af1d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -106,14 +106,14 @@ all:			generated-files $(IPPOOL_RPC_STEM)_xdr.o $(IPPOOL_RPC_STEM)_client.o \
+ 			subdirs-all $(PROGS.sbin) $(PROGS.bin)
+ 
+ # Compile without -Wall because rpcgen-generated code is full of warnings
+-$(IPPOOL_RPC_STEM)_xdr.o:	$(IPPOOL_RPC_STEM)_xdr.c
+-			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $<
++$(IPPOOL_RPC_STEM)_xdr.o:	$(IPPOOL_RPC_STEM)_xdr.c $(IPPOOL_RPC_STEM).h
++			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $< -fPIC
+ 
+-$(IPPOOL_RPC_STEM)_client.o:	$(IPPOOL_RPC_STEM)_client.c
+-			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $<
++$(IPPOOL_RPC_STEM)_client.o:	$(IPPOOL_RPC_STEM)_client.c $(IPPOOL_RPC_STEM).h
++			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $< -fPIC
+ 
+-$(IPPOOL_RPC_STEM)_server.o:	$(IPPOOL_RPC_STEM)_server.c
+-			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $<
++$(IPPOOL_RPC_STEM)_server.o:	$(IPPOOL_RPC_STEM)_server.c $(IPPOOL_RPC_STEM).h
++			$(CC) -I. -MMD -g -c -w $(CPPFLAGS) $(CFLAGS.optimize) $< -fPIC
+ 
+ $(IPPOOL_RPC_STEM)_xdr.c:	$(IPPOOL_RPC_STEM).x
+ 			-$(RM) $@
+@@ -136,8 +136,12 @@ $(IPPOOL_RPC_STEM).h:	$(IPPOOL_RPC_STEM).x
+ 
+ generated-files:	$(RPC_FILES)
+ 
+-subdirs-all:
+-			@for d in $(SUBDIRS); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS)" all; if [ $$? -ne 0 ]; then exit 1; fi; done
++subdirs-all:	$(patsubst %,%-dir, $(SUBDIRS))
++
++pppd-dir: $(IPPOOL_RPC_STEM)_xdr.o $(IPPOOL_RPC_STEM)_client.o $(IPPOOL_RPC_STEM).h
++
++$(patsubst %,%-dir,$(SUBDIRS)):
++			@for d in $(patsubst %-dir,%,$@); do $(MAKE) -C $$d $(MFLAGS) EXTRA_CFLAGS="$(CPPFLAGS)" all; if [ $$? -ne 0 ]; then exit 1; fi; done
+ 
+ clean:
+ 			@for d in $(SUBDIRS); do $(MAKE) -C $$d $(MFLAGS) $@; if [ $$? -ne 0 ]; then exit 1; fi; done
+@@ -151,13 +155,13 @@ TAGS:
+ 			@for d in $(SUBDIRS); do $(MAKE) -C $$d $(MFLAGS) $@; done
+ 			etags -t $(wildcard *.c) $(wildcard *.h)
+ 
+-ippoold:		$(IPPOOLD_SRCS.o)
+-			$(CC) -o $@ $^ $(LDFLAGS.ippoold)
++ippoold:		$(IPPOOLD_SRCS.o) usl-dir
++			$(CC) -o $@ $(IPPOOLD_SRCS.o) $(LDFLAGS.ippoold)
+ 
+-ippoolconfig:		$(IPPOOLCONFIG_SRCS.o)
+-			$(CC) -o $@ $^ $(LDFLAGS.ippoolconfig)
++ippoolconfig:		$(IPPOOLCONFIG_SRCS.o) cli-dir
++			$(CC) -o $@ $(IPPOOLCONFIG_SRCS.o) $(LDFLAGS.ippoolconfig)
+ 
+-%.o:	%.c
++%.o:	%.c $(IPPOOL_RPC_STEM).h
+ 			$(CC) -c $(CFLAGS) $< -o $@
+ 
+ install:		all
+diff --git a/pppd/Makefile b/pppd/Makefile
+index 78d9b33..106deca 100644
+--- a/pppd/Makefile
++++ b/pppd/Makefile
+@@ -24,3 +24,5 @@ install: ippool.so
+ 
+ clean:
+ 	-rm -rf *.o *.so
++
++include $(wildcard *.d /dev/null)
diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool_usl_timer.patch b/meta-networking/recipes-daemons/ippool/ippool/ippool_usl_timer.patch
new file mode 100644
index 0000000..ca0e332
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool_usl_timer.patch
@@ -0,0 +1,49 @@
+include limits.h to avoid UINT_MAX undefined compiling error.
+remove the unused assign which caused compiling error with -Werror.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+
+diff --git a/usl/usl_timer.c b/usl/usl_timer.c
+index 734b820..fda752b 100644
+--- a/usl/usl_timer.c
++++ b/usl/usl_timer.c
+@@ -42,6 +42,7 @@
+ #include <signal.h>
+ #include <string.h>
+ #include <sys/time.h>
++#include <limits.h>
+ 
+ #include "usl.h"
+ 
+@@ -87,14 +88,13 @@ void (*usl_timer_tick_hook)(void);
+  */
+ void usl_timer_tick(void)
+ {
+-	int result;
+ 	char msg = '\0';
+ 
+ 	usl_tick++;
+ 
+ 	if (!usl_tick_pending) {
+ 		usl_tick_pending = 1;
+-		result = write(usl_tick_pipe[1], &msg, sizeof(msg));
++		write(usl_tick_pipe[1], &msg, sizeof(msg));
+ 	}
+ }
+ 
+@@ -111,11 +111,10 @@ static void usl_timer_tick_handler(int fd, void *arg)
+ 	struct usl_ord_list_head *tmp;
+ 	struct usl_list_head *iwalk;
+ 	struct usl_list_head *itmp;
+-	int result;
+ 	char msg;
+ 	USL_LIST_HEAD(expire_list);
+ 
+-	result = usl_fd_read(usl_tick_pipe[0], &msg, sizeof(msg));
++	usl_fd_read(usl_tick_pipe[0], &msg, sizeof(msg));
+ 	usl_tick_pending = 0;
+ 
+ 	usl_list_for_each(walk, tmp, &usl_timer_list) {
diff --git a/meta-networking/recipes-daemons/ippool/ippool/makefile-add-ldflags.patch b/meta-networking/recipes-daemons/ippool/ippool/makefile-add-ldflags.patch
new file mode 100644
index 0000000..7d5b715
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/makefile-add-ldflags.patch
@@ -0,0 +1,21 @@
+Add LDFLAGS variable to Makefile so that extra linker flags can be sent via this variable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 4f7af1d..a05a000 100644
+--- a/Makefile
++++ b/Makefile
+@@ -83,8 +83,8 @@ endif
+ 
+ CPPFLAGS=		$(CPPFLAGS.ippooltest)
+ CFLAGS=			-I. -Iusl -Icli -MMD -Wall -g $(CPPFLAGS) $(CPPFLAGS.dmalloc)
+-LDFLAGS.ippoold=	-Wl,-E -L. -Lusl -lusl -lnsl -ldl $(LIBS.dmalloc) -lc
+-LDFLAGS.ippoolconfig=	-Lcli -lcli -lreadline -lcurses -lnsl $(LIBS.dmalloc) -lc
++LDFLAGS.ippoold=	$(LDFLAGS) -Wl,-E -L. -Lusl -lusl -lnsl -ldl $(LIBS.dmalloc) -lc
++LDFLAGS.ippoolconfig=	$(LDFLAGS) -Lcli -lcli -lreadline -lcurses -lnsl $(LIBS.dmalloc) -lc
+ 
+ OPT_CFLAGS?=		-O
+ 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/runtest.sh b/meta-networking/recipes-daemons/ippool/ippool/runtest.sh
new file mode 100644
index 0000000..f91f582
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/runtest.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+BANNER="----------------------------------------------------------------------------"
+TCLSH="tclsh all.tcl -preservecore 3 -verbose bps -tmpdir ./results -outfile test-ippool.result"
+
+test_setup() {
+        if [ -d ./results ]; then rm -fr ./results; fi
+        mkdir ./results
+}
+
+test_ippool() {
+        echo "${BANNER}"
+        eval $TCLSH -constraints "ipPool"
+}
+test_postprocess() {
+        echo "${BANNER}"
+        (failed=`grep FAILED results/*.result | wc -l`; \
+        let failed2=failed/2 ;\
+        passed=`grep PASSED results/*.result | wc -l`; \
+        echo "TEST SUMMARY: $passed tests PASSED, $failed2 tests FAILED" ;\
+        exit $failed2)
+}
+
+test_setup
+test_ippool
+test_postprocess
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
new file mode 100644
index 0000000..969f434
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -0,0 +1,105 @@
+SUMMARY = "An IP address pool manager"
+DESCRIPTION = "IpPool is implemented as a separate server daemon \
+to allow any application to use its address pools. This makes it possible \
+to define address pools that are shared by PPP, L2TP, PPTP etc. It may be \
+useful in some VPN server setups. IpPool comes with a command line \
+management application, ippoolconfig to manage and query address pool \
+status. A pppd plugin is supplied which allows pppd to request IP \
+addresses from ippoold. \
+"
+HOMEPAGE = "http://www.openl2tp.org/"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+
+SRC_URI = "\
+        https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+        file://ippool_usl_timer.patch \
+        file://ippool_parallel_make_and_pic.patch \
+        file://ippool_init.d.patch \
+        file://always_syslog.patch \
+        file://makefile-add-ldflags.patch \
+        file://runtest.sh \
+        file://ippool.service \
+        "
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
+SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
+SRC_URI[sha256sum] = "d3eab7d6cad5da8ccc9d1e31d5303e27a39622c07bdb8fa3618eea314412075b"
+
+inherit systemd
+
+DEPENDS = "readline ppp ncurses gzip-native"
+RDEPENDS_${PN} = "rpcbind"
+
+EXTRA_OEMAKE = "CC='${CC}' AS='${AS}' LD='${LD}' AR='${AR}' NM='${NM}' STRIP='${STRIP}'"
+EXTRA_OEMAKE += "PPPD_VERSION=${PPPD_VERSION} SYS_LIBDIR=${libdir}"
+# enable self tests
+EXTRA_OEMAKE += "IPPOOL_TEST=y"
+
+
+SYSTEMD_SERVICE_${PN} = "ippool.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+
+do_compile_prepend() {
+    # fix the CFLAGS= and CPPFLAGS= in main Makefile, to have the extra CFLAGS in env
+    sed -i -e "s/^CFLAGS=/CFLAGS+=/" ${S}/Makefile
+    sed -i -e "s/^CPPFLAGS=/CPPFLAGS+=/" ${S}/Makefile
+
+    sed -i -e "s:-I/usr/include/pppd:-I=/usr/include/pppd:" ${S}/pppd/Makefile
+
+    # ignore the OPT_CFLAGS?= in Makefile,
+    # it should be in CFLAGS from env
+    export OPT_CFLAGS=
+}
+
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+
+    install -D -m 0755 ${S}/debian/init.d ${D}${sysconfdir}/init.d/ippoold
+    install -D -m 0644 ${WORKDIR}/ippool.service ${D}${systemd_system_unitdir}/ippool.service
+    sed -i -e 's:@SBINDIR@:${sbindir}:g' ${D}${systemd_system_unitdir}/ippool.service
+
+    # install self test
+    install -d ${D}/opt/${BPN}
+    install ${S}/test/all.tcl  ${S}/test/ippool.test \
+        ${S}/test/test_procs.tcl ${D}/opt/${BPN}
+    install ${WORKDIR}/runtest.sh ${D}/opt/${BPN}
+    # fix the ../ippoolconfig in test_procs.tcl
+    sed -i -e "s:../ippoolconfig:ippoolconfig:" \
+        ${D}/opt/${BPN}/test_procs.tcl
+}
+
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN} += "${libdir}/pppd/${PPPD_VERSION}/ippool.so"
+FILES_${PN}-dbg += "${libdir}/pppd/${PPPD_VERSION}/.debug/ippool.so"
+FILES_${PN}-test = "/opt/${BPN}"
+
+# needs tcl to run tests
+RDEPENDS_${PN}-test += "tcl ${BPN}"
+
+PPPD_VERSION="${@get_ppp_version(d)}"
+
+def get_ppp_version(d):
+    import re
+
+    pppd_plugin = d.expand('${STAGING_LIBDIR}/pppd')
+    if not os.path.isdir(pppd_plugin):
+        return None
+
+    bb.debug(1, "pppd plugin dir %s" % pppd_plugin)
+    r = re.compile("\d*\.\d*\.\d*")
+    for f in os.listdir(pppd_plugin):
+        if os.path.isdir(os.path.join(pppd_plugin, f)):
+            ma = r.match(f)
+            if ma:
+                bb.debug(1, "pppd version dir %s" % f)
+                return f
+            else:
+                bb.debug(1, "under pppd plugin dir %s" % f)
+
+    return None
+
-- 
2.7.4


