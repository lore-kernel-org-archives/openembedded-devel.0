Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC0778413
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:20:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6S7Kic6028968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 00:20:44 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 28 Jul 2017 00:20:43 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jul 2017 15:20:17 +0800
Message-ID: <7f5a00d47ee401e99caace9a99133e172805f019.1501226187.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501226187.git.jackie.huang@windriver.com>
References: <cover.1501226187.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] openl2tp: add init script and systemd support
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
X-List-Received-Date: Fri, 28 Jul 2017 07:20:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- Add patches to fix init script issues
- Add openl2tpd.service to add systemd support
- Add runtime dependency on ppp and ppp-l2tp

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../openl2tpd-initscript-fix-sysconfig.patch       | 35 ++++++++++++++++
 .../openl2tpd-initscript-fix-warning.patch         | 32 ++++++++++++++
 .../openl2tp/openl2tpd-initscript-fix.patch        | 49 ++++++++++++++++++++++
 .../openl2tp/openl2tp/openl2tpd.service            | 17 ++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     | 29 ++++++++++++-
 5 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-warning.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
new file mode 100644
index 000000000..3119425e6
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
@@ -0,0 +1,35 @@
+commit 6ea3125e2bec15004f312814022335d94cdf7e94
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Wed Sep 19 11:34:48 2012 -0400
+
+    Fix openl2tp config script location
+    
+    Correct the location of the sysconfig
+    script. Use /etc/default/ instead of
+    /etc/sysconfig/
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+    Upstream-Status: Inappropriate [configuration]
+
+    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+diff --git a/etc/rc.d/init.d/openl2tpd b/etc/rc.d/init.d/openl2tpd
+index 7f27bb7..4194f63 100755
+--- a/etc/rc.d/init.d/openl2tpd
++++ b/etc/rc.d/init.d/openl2tpd
+@@ -8,12 +8,12 @@
+ #              can be used to implement L2TP VPNs. As a server, it can handle
+ #              hundreds of tunnels and sessions.
+ # processname: openl2tpd
+-# config: /etc/sysconfig/openl2tpd
++# config: /etc/default/openl2tpd
+ # pidfile: /var/run/openl2tpd.pid
+ 
+ # Source function library.
+ . /etc/init.d/functions
+-. /etc/sysconfig/openl2tpd
++. /etc/default/openl2tpd
+  
+ # See how we were called.
+   
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-warning.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-warning.patch
new file mode 100644
index 000000000..15a8c5b08
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-warning.patch
@@ -0,0 +1,32 @@
+openl2tp: eliminate warning from modprobe
+
+modprobe will emit alarming warnings if it cannot
+find a module, but we only care that it find one
+of two possible modules when we start openl2tpd.
+
+Suppress messages from modprobe.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/etc/rc.d/init.d/openl2tpd
++++ b/etc/rc.d/init.d/openl2tpd
+@@ -29,7 +29,7 @@ start() {
+ 		return 1
+ 	    fi
+ 	fi
+-	modprobe -s pppol2tp || modprobe -s l2tp_ppp
++	modprobe -sq pppol2tp || modprobe -sq l2tp_ppp
+ 	RETVAL=$?
+ 	if [ $RETVAL -eq 0 ]; then
+ 	    start-stop-daemon --start --exec openl2tpd $OPENL2TPDARGS
+@@ -57,7 +57,7 @@ stop() {
+ 	    return 1;
+ 	fi
+ 	killproc openl2tpd
+-	modprobe -s -r pppol2tp || modprobe -s -r l2tp_ppp
++	modprobe -srq pppol2tp || modprobe -srq l2tp_ppp
+ 	echo
+ 	rm -f /var/run/openl2tpd.pid
+         rm -f /var/lock/subsys/openl2tpd
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
new file mode 100644
index 000000000..9ecd4b072
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
@@ -0,0 +1,49 @@
+commit 7c58a1e244ea83a9e7bbd51a6d354cee25cdbd33
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Wed Sep 12 23:35:40 2012 -0400
+
+    Fix openl2tpd initscript
+    
+    - Correct the location of the retval statement.
+    - use start-stop-daemon instead of daemon.
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+    Upstream-Status: Inappropriate [OE specific]
+
+    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+diff --git a/etc/rc.d/init.d/openl2tpd b/etc/rc.d/init.d/openl2tpd
+index ce21b50..7f27bb7 100755
+--- a/etc/rc.d/init.d/openl2tpd
++++ b/etc/rc.d/init.d/openl2tpd
+@@ -24,7 +24,7 @@ start() {
+         if [ -e /var/lock/subsys/openl2tpd ]; then
+ 	    if [ -e /var/run/openl2tpd.pid ] && [ -e /proc/`cat /var/run/openl2tpd.pid` ]; then
+ 		echo -n $"cannot start openl2tpd: openl2tpd is already running.";
+-		failure $"cannot start openl2tpd: openl2tpd already running.";
++		#failure $"cannot start openl2tpd: openl2tpd already running.";
+ 		echo
+ 		return 1
+ 	    fi
+@@ -32,9 +32,9 @@ start() {
+ 	modprobe -s pppol2tp || modprobe -s l2tp_ppp
+ 	RETVAL=$?
+ 	if [ $RETVAL -eq 0 ]; then
+-	    daemon openl2tpd $OPENL2TPDARGS
++	    start-stop-daemon --start --exec openl2tpd $OPENL2TPDARGS
++        RETVAL=$?
+ 	fi
+-	RETVAL=$?
+ 	echo
+ 	if [ $RETVAL -eq 0 ]; then
+ 	    touch /var/lock/subsys/openl2tpd
+@@ -52,7 +52,7 @@ stop() {
+ 	echo -n $"Stopping $prog: "
+         if [ ! -e /var/lock/subsys/openl2tpd ]; then
+ 	    echo -n $"cannot stop openl2tpd: openl2tpd is not running."
+-	    failure $"cannot stop openl2tpd: openl2tpd is not running."
++	    #failure $"cannot stop openl2tpd: openl2tpd is not running."
+ 	    echo
+ 	    return 1;
+ 	fi
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
new file mode 100644
index 000000000..7b3faf672
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=The open L2TP implementation
+After=network.target remote-fs.target nss-lookup.target rpcbind.target
+Requires=rpcbind.service
+
+[Service]
+Type=forking
+PIDFile=@STATEDIR@/run/openl2tpd.pid
+EnvironmentFile=@SYSCONFDIR@/default/openl2tpd
+ExecStartPre=@BASE_BINDIR@/sh -c "@BASE_SBINDIR@/modprobe -sq l2tp_ppp || @BASE_SBINDIR@/modprobe -sq pppol2tp"
+ExecStart=@SBINDIR@/openl2tpd $OPENL2TPDARGS
+ExecStartPost=@BASE_BINDIR@/sh -c 'if [ -n "$OPENL2TPD_CONFIG_FILE" ]; then sleep 1; @BINDIR@/l2tpconfig config restore file=$OPENL2TPD_CONFIG_FILE; fi'
+ExecStopPost=@BASE_BINDIR@/sh -c "@BASE_SBINDIR@/modprobe -rsq l2tp_ppp || @BASE_SBINDIR@/modprobe -rsq pppol2tp"
+SuccessExitStatus=1
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 9be1c7956..1e5bfe264 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -27,6 +27,10 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://0002-cli-include-fcntl.h-for-O_CREAT-define.patch \
            file://0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch \
            file://0001-l2tp_api-Included-needed-headers.patch \
+           file://openl2tpd-initscript-fix.patch \
+           file://openl2tpd-initscript-fix-sysconfig.patch \
+           file://openl2tpd-initscript-fix-warning.patch \
+           file://openl2tpd.service \
            "
 
 SRC_URI_append_libc-musl = "\
@@ -36,7 +40,10 @@ SRC_URI_append_libc-musl = "\
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "openl2tpd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 DEPENDS_append_libc-musl = " libtirpc"
 CPPFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
@@ -58,3 +65,23 @@ do_compile_prepend() {
         -e 's:CPPFLAGS-y:CPPFLAGS:g' \
         ${S}/Makefile
 }
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/default
+    install -m 0755 ${S}/etc/rc.d/init.d/openl2tpd ${D}${sysconfdir}/init.d/openl2tpd
+    install -m 0755 ${S}/etc/sysconfig/openl2tpd ${D}${sysconfdir}/default/openl2tpd
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0644 ${WORKDIR}/openl2tpd.service ${D}${systemd_system_unitdir}/openl2tpd.service
+        sed -i -e 's,@STATEDIR@,${localstatedir},g' \
+               -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+               -e 's,@SBINDIR@,${sbindir},g' \
+               -e 's,@BINDIR@,${bindir},g' \
+               -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+               -e 's,@BASE_BINDIR@,${base_bindir},g' \
+               ${D}${systemd_system_unitdir}/openl2tpd.service
+    fi
+}
+
+RDEPENDS_${PN} = "ppp ppp-l2tp"
-- 
2.11.0


