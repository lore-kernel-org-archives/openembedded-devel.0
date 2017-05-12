Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2935A71A75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 07:09:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4C799DU029497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 00:09:09 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 12 May 2017 00:09:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 May 2017 15:09:02 +0800
Message-ID: <20170512070908.14356-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494572274.git.jackie.huang@windriver.com>
References: <cover.1494572274.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] vblade: update to version 22
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
X-List-Received-Date: Fri, 12 May 2017 07:09:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Update to version 22 and add support for systemd
and sysvinit, the scripts and conf files are taken
from Fedora.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-daemons/vblade/files/vblade.conf       |   2 +
 .../recipes-daemons/vblade/files/vblade.init       | 193 +++++++++++++++++++++
 .../recipes-daemons/vblade/files/vblade.service    |  11 ++
 .../vblade/files/volatiles.99_vblade               |   1 +
 .../vblade/{vblade_20.bb => vblade_22.bb}          |  37 +++-
 5 files changed, 240 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.conf
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.init
 create mode 100644 meta-networking/recipes-daemons/vblade/files/vblade.service
 create mode 100644 meta-networking/recipes-daemons/vblade/files/volatiles.99_vblade
 rename meta-networking/recipes-daemons/vblade/{vblade_20.bb => vblade_22.bb} (23%)

diff --git a/meta-networking/recipes-daemons/vblade/files/vblade.conf b/meta-networking/recipes-daemons/vblade/files/vblade.conf
new file mode 100644
index 000000000..e8b93ec37
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/vblade.conf
@@ -0,0 +1,2 @@
+# network_device shelf slot file/disk/partition mac[,mac[,mac]]
+#eth0 0 0 /dev/sdb 00:11:22:33:44:55
diff --git a/meta-networking/recipes-daemons/vblade/files/vblade.init b/meta-networking/recipes-daemons/vblade/files/vblade.init
new file mode 100644
index 000000000..0298c8001
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/vblade.init
@@ -0,0 +1,193 @@
+#!/bin/sh
+# 
+# Init script for vblade (ATA over Ethernet daemon)
+# 
+# chkconfig: - 30 70
+# description: vblade AoE daemon
+# 
+# processname: vblade
+# config: /etc/vblade.conf
+# 
+# Shamelessly hacked together from other init scripts (sshd, mostly)
+# integrate vblade.init from Fedora's vblade-14-6.fc12.src.rpm
+# 
+
+RETVAL=0
+prog=vblade
+
+spawn_vblade() {
+  ALLOWMACS=""
+  [ -n "$5" ] && ALLOWMACS="-m $5"
+  ID="$1-e$2.$3"
+  if [ ! -d "/var/run/$prog" ]; then
+    mkdir /var/run/$prog
+  fi
+  PID_FILE=/var/run/$prog/${ID}.pid
+  $prog $ALLOWMACS $2 $3 $1 $4 >> /var/log/$prog.log 2>&1 &
+  pid=$!
+  RETVAL=$?
+  echo $pid > $PID_FILE
+  echo -n $"$4 (e$2.$3@$1) [pid $pid]"
+  [ "$RETVAL" = 0 ] && echo "success" || echo "failure"
+  echo
+}
+
+start() {
+  local ret
+
+  echo $"Starting up $prog: "
+  
+  #/var/lock/subsys/$prog exists?
+  status $prog 2>&1 > /dev/null
+  ret=$?
+
+  if [ "$ret" = "2" ]; then
+    echo "$prog dead but subsys locked"
+    echo
+    return 2
+  else 
+    if [ "$ret" = "0" ]; then
+      #is running
+      echo "already running"
+      return 0
+    fi
+  fi
+
+  if [ 0 -ne `grep -vc '^#\|^$' /etc/$prog.conf` ]
+  then
+    grep -v '^#' /etc/$prog.conf | sed -e 's/	/ /g' -e 's/  / /g' | while read line
+    do
+      spawn_vblade $line
+    done
+    touch /var/lock/subsys/$prog
+  else
+    echo -n "empty $prog.conf?"
+    echo " passed"
+    echo
+  fi
+}
+
+stop() {
+  echo -n $"Shutting down $prog: "
+  for pidfile in `ls /var/run/$prog/*.pid 2>/dev/null`
+  do
+    kill -TERM `cat $pidfile`
+    rm -f $pidfile
+  done
+  echo "success"
+  echo
+  rm -f /var/lock/subsys/$prog
+}
+
+__pids_var_run() {
+        local base=${1##*/}
+        local pid_file=${2:-/var/run/$base.pid}
+
+        pid=
+        if [ -f "$pid_file" ] ; then
+                local line p
+
+                while : ; do
+                        read line
+                        [ -z "$line" ] && break
+                        for p in $line ; do
+                                [ -z "${p//[0-9]/}" -a -d "/proc/$p" ] && pid="$pid $p"
+                        done
+                done < "$pid_file"
+
+                if [ -n "$pid" ]; then
+                        return 0
+                fi
+                return 1 # "Program is dead and /var/run pid file exists"
+        fi
+        return 3 # "Program is not running"
+}
+
+__pids_pidof() {
+        pidof "$1" || pidof "${1##*/}"
+}
+
+status() {
+        local base pid lock_file= pid_file=
+
+        # Test syntax.
+        if [ "$#" = 0 ] ; then
+                echo $"Usage: status [-p pidfile] {program}"
+                return 1
+        fi
+        if [ "$1" = "-p" ]; then
+                pid_file=$2
+                shift 2
+        fi
+        if [ "$1" = "-l" ]; then
+                lock_file=$2
+                shift 2
+        fi
+        base=${1##*/}
+
+        # First try "pidof"
+        __pids_var_run "$1" "$pid_file"
+        RC=$?
+        if [ -z "$pid_file" -a -z "$pid" ]; then
+                pid="$(__pids_pidof "$1")"
+        fi
+        if [ -n "$pid" ]; then
+                echo $"${base} (pid $pid) is running..."
+                return 0
+        fi
+
+        case "$RC" in
+                0)
+                        echo $"${base} (pid $pid) is running..."
+                        return 0
+                        ;;
+                1)
+                        echo $"${base} dead but pid file exists"
+                        return 1
+                        ;;
+        esac
+        if [ -z "${lock_file}" ]; then
+                lock_file=${base}
+        fi
+        # See if /var/lock/subsys/${lock_file} exists
+        if [ -f /var/lock/subsys/${lock_file} ]; then
+                echo $"${base} dead but subsys locked"
+                return 2
+        fi
+        echo $"${base} is stopped"
+        return 3
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	reload)
+		# yes, this sucks, but the vblade processes die on SIGHUP
+		stop
+		start
+		;;
+	condrestart)
+		if [ -f /var/lock/subsys/$prog ]; then
+			stop
+			# avoid race
+			sleep 3
+			start
+		fi
+		;;
+	status)
+		status $prog
+		RETVAL=$?
+		;;
+	*)
+		echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
+		RETVAL=1
+esac
+exit $RETVAL
diff --git a/meta-networking/recipes-daemons/vblade/files/vblade.service b/meta-networking/recipes-daemons/vblade/files/vblade.service
new file mode 100644
index 000000000..83a4d5dcb
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/vblade.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Virtual EtherDrive blade AoE target
+After=syslog.target network.target
+
+[Service]
+Type=forking
+ExecStart=@BINDIR@/vblade.init start
+ExecStop=@BINDIR@/vblade.init stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/vblade/files/volatiles.99_vblade b/meta-networking/recipes-daemons/vblade/files/volatiles.99_vblade
new file mode 100644
index 000000000..64a5881c0
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/volatiles.99_vblade
@@ -0,0 +1 @@
+d root root 0755 /var/run/vblade none
diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_22.bb
similarity index 23%
rename from meta-networking/recipes-daemons/vblade/vblade_20.bb
rename to meta-networking/recipes-daemons/vblade/vblade_22.bb
index 344c7462c..d7b1dfaad 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_22.bb
@@ -4,19 +4,48 @@ SECTION = "admin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BPN}-${PV}.tgz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BP}.tar.gz \
            file://cross.patch \
            file://makefile-add-ldflags.patch \
+           file://${BPN}.conf \
+           file://${BPN}.init \
+           file://${BPN}.service \
+           file://volatiles.99_vblade \
           "
 
-SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59"
-SRC_URI[sha256sum] = "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d"
+SRC_URI[md5sum] = "510d98ba0f231284a5fbe2da11cb2d6e"
+SRC_URI[sha256sum] = "a990378f273f10eb431e42954a871aed52714035bbab28c54cef600c458356bb"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-rc.d systemd
 
 do_install() {
     install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade
     install -D -m 0755 ${S}/vbladed ${D}/${sbindir}/vbladed
     install -D -m 0644 ${S}/vblade.8 ${D}/${mandir}/man8/vblade.8
+
+    install -D -m 0644 ${WORKDIR}/${BPN}.conf ${D}/${sysconfdir}/${BPN}.conf
+    install -D -m 0755 ${WORKDIR}/${BPN}.init ${D}/${sysconfdir}/init.d/${BPN}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}/${sysconfdir}/default/volatiles
+        install -m 0755 ${WORKDIR}/volatiles.99_vblade ${D}/${sysconfdir}/default/volatiles/99_vblade
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}/${bindir}
+        install -m 0755 ${WORKDIR}/${BPN}.init ${D}/${bindir}/
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/run/${BPN} 0755 root root -" > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/vblade.service ${D}${systemd_system_unitdir}
+        sed -e 's,@BINDIR@,${bindir},g' -i ${D}${systemd_system_unitdir}/*.service
+    fi
+
 }
 
+INITSCRIPT_NAME = "vblade"
+INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+
+SYSTEMD_SERVICE_${PN} = "vblade.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.11.0


