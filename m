Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF9D754B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 17:25:59 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id v8-v6so29068115oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jul 2018 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wg9ePgIlq7XoKwobs5I/014/tnUwOvs6CLOiYzCY8L0=;
	b=pi++q2nEy2u4dWSq6hJl8D+4NSv/Ny80L6EMU+SjDeLCrobMRX1eYf9apbud4TRlrL
	vxV2Mx201Eqq1CYBC5b50eEThRs4wy71QnRAC4oGoOybPZ+AsoXcWkXzZsIH1DYYwfll
	CA11UCnLj9NC3Xem/4cTGTOYuXeMJgaG3OA/GZOhKx0G87R9cBtodE99zgNxFRu2t1Om
	0GMvBJvO2ZxXi9TikmCIld89Q7kZPCyd9246NfcmWOkpOTj6WHf15NRTCsBfg9P4LTxw
	2e4AyTPKVj5nmmNuebAa8eKd6qO52LgoZKPuI+PMiO47PfAy5CKJ1ZL7nq7pr6VUYsbz
	MB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wg9ePgIlq7XoKwobs5I/014/tnUwOvs6CLOiYzCY8L0=;
	b=Ij5hl7hMKCK7mVw1cw8E9KeuFrOevrLsRH2Edq6knE2V/uqbru4QTjLnOTU14bkQiy
	3Ivtue4sOdfIUGW7vklXkOt0mSVTufy/Yz4uh9B/bGc2+eWTxNBQ2/Tq1tO/lOIU3fsN
	yJWm23xu8j4LOyn732zQEldZVZh9X4TYVe0rRhU4IkpiN4ep/xk6psM++2iwIyQsYAaR
	JbJkB1iOtGpMf+sSe3Y8DGQQA48TcKDCIrCtQx7fUltwvO+06/IxeK8jFAR1pt0B48SH
	VD95V5B5+Kt1iYI+2xlvpjf1WtaeC5EDj2r+PoHI+mEgXRC4JSpeTF0OE8f+C27znGGX
	5J1A==
X-Gm-Message-State: APt69E3L0Ki3ID52GrPS9TNR1N7K/mhQXS01a0tcE4e5e0LNLT3dgSGT
	Pm9b6pqDhosZVyS/95Zm2cxgmvAWP9k=
X-Google-Smtp-Source: AAOMgpcEffvNF8Y2H87Q+ySCqYXiVSWawGTmrisLxk7jSzlYdABLEN5Ny1P3RM7Rc7xfwNNGYeDbyw==
X-Received: by 2002:aca:ebd8:: with SMTP id
	j207-v6mr16928725oih.206.1530984360227; 
	Sat, 07 Jul 2018 10:26:00 -0700 (PDT)
Received: from jagadeesh-TravelMate-4740.mvista.com
	([2405:204:5403:8d8d:8c9d:7ec1:c798:feb])
	by smtp.gmail.com with ESMTPSA id
	p2-v6sm10353037oih.38.2018.07.07.10.25.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Jul 2018 10:25:59 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Jul 2018 22:55:52 +0530
Message-Id: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tgt: Migrate recipe from meta-openstack layer
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
X-List-Received-Date: Sat, 07 Jul 2018 17:25:59 -0000

As iscsitarget cannot be built with Linux kernel >= 4.14, so
migrate Linux SCSI target framework (tgt) recipe from meta-openstack
layer; to allow users to test iSCSI target feature with tgt in
meta-networking layer.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...-path-of-header-files-check-in-Yocto-buil.patch |  47 +++++++++
 .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  29 ++++++
 .../recipes-support/tgt/files/tgtd.init            | 116 +++++++++++++++++++++
 ...Makefile-apply-LDFLAGS-to-all-executables.patch |  35 +++++++
 meta-networking/recipes-support/tgt/tgt_git.bb     |  73 +++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
 create mode 100644 meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
 create mode 100644 meta-networking/recipes-support/tgt/files/tgtd.init
 create mode 100644 meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
 create mode 100644 meta-networking/recipes-support/tgt/tgt_git.bb

diff --git a/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
new file mode 100644
index 0000000..173ecb6
--- /dev/null
+++ b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
@@ -0,0 +1,47 @@
+From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Thu, 10 Apr 2014 11:26:39 +0800
+Subject: [PATCH] Correct the path of header files check in Yocto build env
+
+Upstream-Status: Inappropriate [the fix is specific to Yocto build env]
+
+Current Makefile will check headers on host instead of Yocto sysroot, following
+error appears. Change the path of header check.
+| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
+| #include <libaio.h>
+|                     ^
+| compilation terminated.
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+---
+ usr/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index decf13c..9ff8f15 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -1,11 +1,11 @@
+ sbindir ?= $(PREFIX)/sbin
+ libdir ?= $(PREFIX)/lib/tgt
+ 
+-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo 1),)
+ CFLAGS += -DUSE_SIGNALFD
+ endif
+ 
+-ifneq ($(shell test -n $(shell find /usr/include -name "timerfd.h" | head -n1) && echo 1),)
++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -name "timerfd.h" | head -n1) && echo 1),)
+ CFLAGS += -DUSE_TIMERFD
+ endif
+ 
+@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
+ CFLAGS += -DUSE_SYSTEMD
+ endif
+ 
+-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e /usr/include/libaio.h && echo 1),)
++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test -e $(SYSROOT)/usr/include/libaio.h && echo 1),)
+ CFLAGS += -DUSE_EVENTFD
+ TGTD_OBJS += bs_aio.o
+ LIBS += -laio
diff --git a/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
new file mode 100644
index 0000000..078ba9e
--- /dev/null
+++ b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix.patch
@@ -0,0 +1,29 @@
+From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sun, 26 Jul 2015 04:23:51 +0900
+Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tgt:
+ /work/i586-oe-linux/tgt/1.0.60+gitAUTOINC+ab51727a36-r0/
+ packages-split/tgt/usr/sbin/tgtd contains probably-redundant RPATH /usr/lib
+ [useless-rpaths]
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
+---
+ usr/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index 9ff8f15..cc8df11 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -63,7 +63,7 @@ TGTD_OBJS += tgtd.o mgmt.o target.o scsi.o log.o driver.o util.o work.o \
+ 
+ TGTD_DEP = $(TGTD_OBJS:.o=.d)
+ 
+-LDFLAGS = -Wl,-E,-rpath=$(libdir)
++LDFLAGS += -Wl,-E
+ 
+ .PHONY:all
+ all: $(PROGRAMS) $(MODULES)
diff --git a/meta-networking/recipes-support/tgt/files/tgtd.init b/meta-networking/recipes-support/tgt/files/tgtd.init
new file mode 100644
index 0000000..4b0ce94
--- /dev/null
+++ b/meta-networking/recipes-support/tgt/files/tgtd.init
@@ -0,0 +1,116 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides: tgtd
+# Required-Start: $remote_fs $network $syslog
+# Required-Stop: $remote_fs $syslog
+# Default-Start:     3 5
+# Default-Stop:      0 1 2 6
+# Short-Description: SCSI target daemon
+# Description: Linux SCSI target framework (tgt)
+### END INIT INFO
+
+DESC="tgtd"
+DAEMON="/usr/sbin/tgtd"
+TGTD_CONFIG=/etc/tgt/targets.conf
+
+start ()
+{
+    echo -n "Starting $DESC..."
+
+    # Ensure service isn't running
+    tgt-admin -s >/dev/null 2>&1
+    RETVAL=$?
+    if [ "$RETVAL" -ne 107 ] ; then
+        echo "$DESC is already running."
+        exit 1
+    fi
+
+    # Start tgtd first
+    $DAEMON &>/dev/null
+    RETVAL=$?
+    if [ "$RETVAL" -ne 0 ]; then
+        echo "failed."
+        exit 1
+    fi
+
+    # Put tgtd into "offline" state until all the targets are configured.
+    # We don't want initiators to (re)connect and fail the connection
+    # if it's not ready.
+    tgtadm --op update --mode sys --name State -v offline
+    # Configure the targets.
+    tgt-admin -f -e -c $TGTD_CONFIG
+    # Put tgtd into "ready" state.
+    tgtadm --op update --mode sys --name State -v ready
+
+    echo "done."
+}
+
+stop ()
+{
+    echo -n "Stopping $DESC..."
+
+    # Remove all targets. It only removes targets which are not in use.
+    tgt-admin --update ALL -c /dev/null &>/dev/null
+    # tgtd will exit if all targets were removed
+    tgtadm --op delete --mode system &>/dev/null
+    RETVAL=$?
+    if [ "$RETVAL" -eq 107 ] ; then
+        if [ "$TASK" != "restart" ] ; then
+            return 1
+        fi
+    elif [ "$RETVAL" -ne 0 ] ; then
+        echo "Some initiators are still connected - could not stop tgtd"
+        return 2
+    fi
+    echo -n
+}
+
+reload()
+{
+        echo "Reloading configuration of $DESC" "$NAME"
+        # Update configuration for targets. Only targets which
+        # are not in use will be updated.
+        tgt-admin --update ALL -c $TGTD_CONFIG &>/dev/null
+        RETVAL=$?
+        if [ "$RETVAL" -eq 107 ] ; then
+                echo "tgtd is not running"
+                exit 1
+        fi
+}
+
+status()
+{
+        tgt-admin -s >/dev/null 2>&1
+	RETVAL=$?
+        if [ "$RETVAL" -eq 107 ] ; then
+                echo "tgtd is not running"
+        else
+                echo "tgtd is running"
+        fi
+}
+
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    restart|force-reload)
+        stop
+        start
+        ;;
+    reload)
+        reload
+        ;;
+    status)
+        status
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|force-reload|restart|status|reload}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
new file mode 100644
index 0000000..d480ef7
--- /dev/null
+++ b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
@@ -0,0 +1,35 @@
+From a815ac8ee16b344d9e24b445957f32bf2aafa532 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 5 Jan 2017 11:07:51 -0500
+Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ usr/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index cc8df11..c55fd68 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -78,7 +78,7 @@ TGTADM_OBJS = tgtadm.o concat_buf.o
+ TGTADM_DEP = $(TGTADM_OBJS:.o=.d)
+ 
+ tgtadm: $(TGTADM_OBJS)
+-	$(CC) $^ -o $@
++	$(CC) $^ -o $@ $(LDFLAGS)
+ 
+ -include $(TGTADM_DEP)
+ 
+@@ -86,7 +86,7 @@ TGTIMG_OBJS = tgtimg.o libssc.o libcrc32c.o
+ TGTIMG_DEP = $(TGTIMG_OBJS:.o=.d)
+ 
+ tgtimg: $(TGTIMG_OBJS)
+-	$(CC) $^ -o $@
++	$(CC) $^ -o $@ $(LDFLAGS)
+ 
+ -include $(TGTIMG_DEP)
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/tgt/tgt_git.bb b/meta-networking/recipes-support/tgt/tgt_git.bb
new file mode 100644
index 0000000..9ca181a
--- /dev/null
+++ b/meta-networking/recipes-support/tgt/tgt_git.bb
@@ -0,0 +1,73 @@
+DESCRIPTION = "Linux SCSI target framework (tgt)"
+HOMEPAGE = "http://stgt.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
+DEPENDS = "sg3-utils"
+
+SRCREV = "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
+PV = "1.0.67+git${SRCPV}"
+
+SRC_URI = "git://github.com/fujita/tgt.git \
+	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
+        file://0001-usr-Makefile-WARNING-fix.patch \
+        file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
+"
+SRC_URI += "file://tgtd.init"
+
+S = "${WORKDIR}/git"
+
+CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
+
+inherit update-rc.d
+
+CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
+
+#do_compile() {
+#    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
+#}
+EXTRA_OEMAKE = "-e programs conf scripts"
+
+do_install() {
+    oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
+    fi
+}
+
+RDEPENDS_${PN} = " \
+    bash \
+    libaio \
+    libconfig-general-perl \
+    perl-module-english \
+    perl-module-tie-hash-namedcapture \
+    perl-module-xsloader \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-errno \
+    perl-module-exporter-heavy \
+    perl-module-symbol \
+    perl-module-selectsaver \
+    perl-module-dynaloader \
+    perl-module-carp-heavy \
+    perl-module-filehandle \
+    perl-module-feature \
+    perl-module-overload \
+    perl-module-fcntl \
+    perl-module-io \
+    perl-module-io-file \
+    perl-module-io-handle \
+    perl-module-io-seekable \
+    perl-module-file-glob \
+    perl-module-base \
+    perl-module-encoding-warnings \
+    perl-module-file-spec-unix \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-getopt-long \
+    perl-module-constant \
+    "
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "tgtd"
+
-- 
2.7.4


