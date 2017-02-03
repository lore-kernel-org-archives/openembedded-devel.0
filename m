Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A2C4E71B0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 01:33:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 19so369459pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 17:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zmQfIrVqKOeWQYUggQiW3ckvnexjpY72B5YbX4oA9ds=;
	b=PACE9olBpeuWP3ym9oYSigPFxakYpAqIak0wi3cjx1IZ/FpncXoh0RWjI4Sumk98mm
	yX454aRvCNvWMPi/teQgroVKSMu5Pl9a85Ken+Pqe0T8F3UGCkZ1/xT7u6gQrF9knl10
	TGC7TwfekcA5BCvwUfl6otjOQ/pindzgaAAJJdIGaCRfaLnc45ZJucm1fb8l0Ype8W3S
	kW6USSdjkuUEq5NEXrtz6VGttk7p5kTUSluokxU1aoX4LYfxqvG+u0fLiloRrBqepvED
	+d7jF5vq0ZMZgMgP+YeoqnkaQ8WIKm9rnj4GRhUV9AOMMk5mPcGY8KhPY5SNVXzwHh23
	XCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zmQfIrVqKOeWQYUggQiW3ckvnexjpY72B5YbX4oA9ds=;
	b=MQZPUwdIRwFRPwLL6/OnPoqtcS0pC+ocD3nGpUm700DGB8eT1A+80XgHxxhvEfyfTI
	bMOgIO/ZUa/8BqrypVG4pa9e2cyL/fjJUVtekOHbGyO6BPmwHpvu0cApsmgWgMEuUw/f
	lnb99X+D1ypp2Lzy5L5a/EqTpUOUTKRgdTgsrgVmq5253zJRECHK6IOsAByT/LkEjF90
	nrNwUb2tfK1O1x83k/DPf0cG9rjp6MXmcMNqRWf9OOinYl/pJugMo5O96MgKStvIsGyz
	QNNSyK7Cw+6SCSJpFocDHvmQ6+ixn771dr7EyqOZEJdYLtX9Wmj+ZqpBDzO9zJRBTY9P
	ROJQ==
X-Gm-Message-State: AIkVDXIH51jtfzlFQxlnQVSOipnhpRoUFY3wZYzfyRmVIwNCp0L/6lcVGYzcT/kxZOIknA==
X-Received: by 10.99.231.5 with SMTP id b5mr14608623pgi.80.1486085598184;
	Thu, 02 Feb 2017 17:33:18 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	r78sm61625329pfl.63.2017.02.02.17.33.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 17:33:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2017 17:33:16 -0800
Message-Id: <1486085596-30775-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe]PATCH] openipmi: Add new package
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
X-List-Received-Date: Fri, 03 Feb 2017 01:33:19 -0000

From: Armin Kuster <akuster@mvista.com>

Intelligent Platform Management Interface (IPMI) is has become a standard hw interface in many X86 platforms.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openipmi-2.0.22/makefiles_remove_libdir.patch  |  71 +++
 .../openipmi/openipmi-2.0.22/openipmi.initscript   | 584 +++++++++++++++++++++
 .../openipmi/openipmi-2.0.22/openipmi.service      |  12 +
 meta-oe/recipes-bsp/openipmi/openipmi_2.0.22.bb    |  45 ++
 4 files changed, 712 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/makefiles_remove_libdir.patch
 create mode 100644 meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.initscript
 create mode 100644 meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.service
 create mode 100644 meta-oe/recipes-bsp/openipmi/openipmi_2.0.22.bb

diff --git a/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/makefiles_remove_libdir.patch b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/makefiles_remove_libdir.patch
new file mode 100644
index 0000000..ba6f222
--- /dev/null
+++ b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/makefiles_remove_libdir.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Inappropriate (OE specific)
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: OpenIPMI-2.0.22/unix/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.22.orig/unix/Makefile.am
++++ OpenIPMI-2.0.22/unix/Makefile.am
+@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_th
+ libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la
+ libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIpthread.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIpthread.map
+ 
+ libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
+ libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(GDBM_LIB)
+ libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIposix.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIposix.map
+ 
+ noinst_HEADERS = heap.h
+ 
+Index: OpenIPMI-2.0.22/glib/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.22.orig/glib/Makefile.am
++++ OpenIPMI-2.0.22/glib/Makefile.am
+@@ -11,14 +11,14 @@ libOpenIPMIglib_la_SOURCES = glib_os_hnd
+ libOpenIPMIglib_la_CFLAGS = $(GLIB_CFLAGS) $(AM_CFLAGS)
+ libOpenIPMIglib_la_LIBADD = $(GDBM_LIB)
+ libOpenIPMIglib_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIglib.map $(GLIB_LIBS) -L$(libdir) \
++	-Wl,-Map -Wl,libOpenIPMIglib.map $(GLIB_LIBS) \
+ 	-rpath $(libdir)
+ 
+ libOpenIPMIglib12_la_SOURCES = glib_os_hnd.c
+ libOpenIPMIglib12_la_CFLAGS = $(GLIB12_CFLAGS) $(AM_CFLAGS)
+ libOpenIPMIglib12_la_LIBADD = $(GDBM_LIB)
+ libOpenIPMIglib12_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIglib12.map $(GLIB12_LIBS) -L$(libdir) \
++	-Wl,-Map -Wl,libOpenIPMIglib12.map $(GLIB12_LIBS) \
+ 	-rpath $(libdir)
+ 
+ CLEANFILES = libOpenIPMIglib.map libOpenIPMIglib12.map
+Index: OpenIPMI-2.0.22/cmdlang/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.22.orig/cmdlang/Makefile.am
++++ OpenIPMI-2.0.22/cmdlang/Makefile.am
+@@ -16,7 +16,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(top_builddir)/lib/libOpenIPMI.la
+ libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIcmdlang.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIcmdlang.map
+ 
+ bin_PROGRAMS = openipmish
+ 
+Index: OpenIPMI-2.0.22/tcl/Makefile.am
+===================================================================
+--- OpenIPMI-2.0.22.orig/tcl/Makefile.am
++++ OpenIPMI-2.0.22/tcl/Makefile.am
+@@ -11,7 +11,7 @@ libOpenIPMItcl_la_SOURCES = tcl_os_hnd.c
+ libOpenIPMItcl_la_CFLAGS = $(TCL_CFLAGS) $(AM_CFLAGS)
+ libOpenIPMItcl_la_LIBADD = $(GDBM_LIB)
+ libOpenIPMItcl_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) -L$(libdir) \
++	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) \
+ 	-rpath $(libdir)
+ 
+ noinst_PROGRAMS = test_handlers
diff --git a/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.initscript b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.initscript
new file mode 100644
index 0000000..3eda3f8
--- /dev/null
+++ b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.initscript
@@ -0,0 +1,584 @@
+#!/bin/sh
+#############################################################################
+#
+# ipmi:		OpenIPMI Driver init script
+#
+# Authors:	Matt Domsch <Matt_Domsch@dell.com>
+#               Chris Poblete <Chris_Poblete@dell.com>
+#
+# chkconfig: - 13 87
+# description: OpenIPMI Driver init script
+#
+### BEGIN INIT INFO
+# Provides: ipmidrv
+# Required-Start: $local_fs $remote_fs $syslog
+# Required-Stop: $local_fs $remote_fs $syslog
+# Default-Start:
+# Default-Stop:
+# Short-Description: OpenIPMI Driver init script
+# Description: OpenIPMI Driver init script
+### END INIT INFO
+#
+# Status return code bits
+# no bits set = no errors
+# bit 0 set = minimum modules aren't loaded
+# bit 1 set = requested feature module isn't loaded
+# bit 2 set = /dev/ipmi0 (or /dev/imb if using that instead) doesn't exist
+# bit 3 set = /dev/watchdog doesn't exist
+# bit 4 set = lockfile doesn't exist
+# bit 5 set = modules are loaded even when asked to be unloaded
+
+#
+#############################################################################
+# for log_success_msg and friends
+if [ -r /lib/lsb/init-functions ]; then
+# LSB, SLES, ...
+    . /lib/lsb/init-functions
+elif [ -r /etc/init.d/functions ]; then
+# Red Hat / VMware
+    . /etc/init.d/functions
+    my_log_message()
+    {
+	ACTION=$1
+	shift
+	
+	case "$ACTION" in
+	    success)
+		echo -n $*
+		success "$*"
+		echo
+		;;
+	    failure)
+		echo -n $*
+		failure "$*"
+		echo
+		;;
+	    warning)
+		echo -n $*
+		warning "$*"
+		echo
+		;;
+	    *)
+		;;
+	esac
+    }
+    log_success_msg()
+    {
+	my_log_message success "$*"
+    }
+    log_failure_msg()
+    {
+	my_log_message failure "$*"
+    }
+    log_warning_msg()
+    {
+	my_log_message warning "$*"
+    }
+fi
+
+CONFIGFILE=/etc/sysconfig/ipmi
+# source config info
+[ -r ${CONFIGFILE} ] && . ${CONFIGFILE}
+
+#############################################################################
+# GLOBALS
+#############################################################################
+MODULE_NAME="ipmi"
+INTF_NUM=0
+
+IPMI_SMB_MODULE_NAME="ipmi_smb"
+IPMI_SI_MODULE_NAME="ipmi_si"
+kernel=`uname -r | cut -d. -f1-2`
+if [ "${kernel}" == "2.4" ]; then
+    IPMI_SMB_MODULE_NAME="ipmi_smb_intf"
+    IPMI_SI_MODULE_NAME="ipmi_si_drv"
+fi
+
+MODULES_INTERFACES=""
+[ "${DEV_IPMI}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_devintf"
+[ "${IPMI_IMB}" = "yes" ] && MODULES_INTERFACES="${MODULES_INTERFACES} ipmi_imb"
+
+MODULES_FEATURES=""
+[ "${IPMI_WATCHDOG}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_watchdog"
+[ "${IPMI_POWEROFF}" = "yes" ] && MODULES_FEATURES="${MODULES_FEATURES} ipmi_poweroff"
+
+MODULES_HW=""
+[ "${IPMI_SI}"  = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SI_MODULE_NAME}"
+[ "${IPMI_SMB}" = "yes" ] && MODULES_HW="${MODULES_HW} ${IPMI_SMB_MODULE_NAME}"
+
+MODULES_BASE="ipmi_msghandler"
+MODULES="${MODULES_INTERFACES} ${MODULES_FEATURES} ${MODULES_HW} ${MODULES_BASE}"
+
+RETVAL=0
+LOCKFILE=/var/lock/subsys/ipmi
+DEV_IPMI_TIMEOUT=150
+
+UDEV_EXISTS=0
+if [ -e /sbin/udev -o -e /sbin/udevd ]; then
+    UDEV_EXISTS=1
+fi
+
+#############################################################################
+# NOTES:
+# * /dev/ipmi0 is unconditionally deleted here on ipmi_devintf unload,
+#   because SLES9 and RHEL4 kernels don't send a message for udev to delete
+#   it for us.
+# 
+#############################################################################
+
+modules_loaded_verbose()
+{
+	OnePlusLoaded=0
+	OnePlusUnloaded=0
+	for m in $@; do
+		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
+			echo "$m module loaded."
+			OnePlusLoaded=1
+		else
+			echo "$m module not loaded."
+			OnePlusUnloaded=1
+		fi
+	done
+}
+
+modules_loaded()
+{
+	OnePlusLoaded=0
+	OnePlusUnloaded=0
+	for m in $@; do
+		if /sbin/lsmod | grep $m >/dev/null 2>&1 ; then
+			OnePlusLoaded=1
+		else
+			OnePlusUnloaded=1
+		fi
+	done
+}
+
+device_node_exists ()
+{
+	if [ -e "$1" ]; then
+		echo "$1 exists."
+		return 1
+	fi
+	echo "$1 does not exist."
+	return 0
+}
+
+minimum_modules_loaded()
+{
+        rc_base=1
+	rc_hw=1
+        modules_loaded_verbose "${MODULES_BASE}"
+	[ ${OnePlusLoaded} -eq 0 ] && rc_base=0
+	    
+	modules_loaded_verbose "${MODULES_HW}"
+	[ ${OnePlusLoaded} -eq 0 ] && rc_hw=0
+	
+	return $((rc_base && rc_hw))
+}
+
+#############################################################################
+
+load_si()
+{
+	if [ "${IPMI_SI}" = "yes" ]; then
+		modprobe ${IPMI_SI_MODULE_NAME} > /dev/null 2>&1
+		modules_loaded ${IPMI_SI_MODULE_NAME}
+		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
+	fi
+}
+
+load_smb()
+{
+	if [ "${IPMI_SMB}" = "yes" ]; then
+		modprobe ${IPMI_SMB_MODULE_NAME} > /dev/null 2>&1
+		modules_loaded ${IPMI_SMB_MODULE_NAME}
+		[ ${OnePlusLoaded} -ne 1 ] && RETVAL=$((RETVAL | 1))
+	fi
+}
+
+load_hw_modules()
+{
+	load_si
+	load_smb
+}
+
+start_watchdog_common()
+{
+	load_hw_modules
+	modprobe ipmi_watchdog ${IPMI_WATCHDOG_OPTIONS} > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	[ ${OnePlusUnloaded} -ne 0 ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		log_failure_msg &&
+		return
+	if [ ${UDEV_EXISTS} -eq 0 -a ! -e /dev/watchdog ]; then
+		mknod -m 0600 /dev/watchdog c 10 130
+		[ $? -ne 0 ] &&
+			RETVAL=$((RETVAL | 8)) &&
+			log_failure_msg &&
+			return
+	fi
+	log_success_msg
+}
+
+start_watchdog_quiet()
+{
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		return
+	echo -n $"Starting ipmi_watchdog driver: "
+	start_watchdog_common
+}
+
+start_watchdog()
+{
+	echo -n $"Starting ipmi_watchdog driver: "
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		log_failure_msg "not configured" &&
+		return
+	start_watchdog_common
+}
+
+stop_watchdog()
+{
+	echo -n $"Stopping ipmi_watchdog driver: "
+	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    log_failure_msg
+	else
+	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
+	    fi
+	    log_success_msg
+	fi
+}
+
+stop_watchdog_quiet()
+{
+	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	else
+	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
+	    fi
+	fi
+}
+
+start_powercontrol_common()
+{
+	local poweroff_opts=""
+	load_hw_modules
+	if [ "${IPMI_POWERCYCLE}" == "yes" ]; then
+	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_control > /dev/null 2>&1 && \
+		poweroff_opts="poweroff_control=2"
+	    modinfo ipmi_poweroff 2>/dev/null | grep poweroff_powercycle > /dev/null 2>&1 && \
+		poweroff_opts="poweroff_powercycle=1"
+	fi
+	modprobe ipmi_poweroff "${poweroff_opts}" > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	[ ${OnePlusUnloaded} -ne 0 ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		log_failure_msg &&
+		return
+	log_success_msg
+}
+
+start_powercontrol_quiet()
+{
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		return
+	echo -n $"Starting ipmi_poweroff driver: "
+	start_powercontrol_common
+}
+
+start_powercontrol()
+{
+	echo -n $"Starting ipmi_poweroff driver: "
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		log_failure_msg "not configured" &&
+		return
+	start_powercontrol_common
+}
+
+stop_powercontrol()
+{
+	echo -n $"Stopping ipmi_poweroff driver: "
+	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    log_failure_msg
+	else
+	    log_success_msg
+	fi
+}
+
+stop_powercontrol_quiet()
+{
+	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	[ ${OnePlusLoaded} -ne 0 ] && RETVAL=$((RETVAL | 32))
+}
+
+#############################################################################
+unload_all_ipmi_modules()
+{
+	stop_watchdog_quiet
+	stop_powercontrol_quiet
+	for m in ${MODULES}; do
+		modprobe -q -r ${m} > /dev/null 2>&1
+	done
+        # delete interface node ONLY if ipmi_devintf is unloaded
+        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
+	        rm -f "/dev/ipmi${INTF_NUM}"
+}
+
+unload_ipmi_modules_leave_features()
+{
+	for m in ${MODULES_INTERFACES}; do
+		modprobe -q -r ${m} > /dev/null 2>&1
+	done
+        # delete interface node ONLY if ipmi_devintf is unloaded
+        [ `lsmod | grep -c "ipmi_devintf"` -eq 0 ] &&
+	        rm -f "/dev/ipmi${INTF_NUM}"
+	lsmod | egrep -q "ipmi_(poweroff|watchdog)" > /dev/null 2>&1
+	if [ "$?" -ne "0" ]; then
+		stop_watchdog_quiet
+		stop_powercontrol_quiet
+		for m in ${MODULES}; do
+			modprobe -q -r ${m} > /dev/null 2>&1
+		done
+	fi
+}
+
+#############################################################################
+load_ipmi_modules ()
+{
+	local locdelay
+	modprobe ipmi_msghandler > /dev/null 2>&1
+	modules_loaded ipmi_msghandler
+	[ ${OnePlusLoaded} -ne 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
+	load_hw_modules
+	[ $((RETVAL & 1)) -eq 1 ] && unload_all_ipmi_modules && RETVAL=$((RETVAL | 1)) && return
+
+	if [ "${DEV_IPMI}" = "yes" ]; then
+		modprobe ipmi_devintf > /dev/null 2>&1
+		modules_loaded ipmi_devintf
+		RETVAL=$((RETVAL & ~2))
+		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+		if [ ${OnePlusLoaded} -eq 1 ]; then
+			if [ ${UDEV_EXISTS} -eq 0 ]; then
+				DEVMAJOR=`cat /proc/devices | awk '/ipmidev/{print $1}'`
+				rm -f /dev/ipmi${INTF_NUM}
+				mknod -m 0600 /dev/ipmi${INTF_NUM} c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
+			fi
+
+			# udev can take several seconds to create /dev/ipmi0, 
+			# but it happens asynchronously, so delay here
+			locdelay=${DEV_IPMI_TIMEOUT}
+			while [ ! -e /dev/ipmi${INTF_NUM} -a ${locdelay} -gt 0 ]; do
+				locdelay=$((locdelay - 1))
+				sleep 0.1
+			done
+		fi
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+		modprobe ipmi_imb > /dev/null 2>&1
+		modules_loaded ipmi_imb
+		RETVAL=$((RETVAL & ~2))
+		[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+		if [ ${OnePlusLoaded} -eq 1 ]; then
+			DEVMAJOR=`cat /proc/devices | awk '/imb/{print $1}'`
+			rm -f /dev/imb
+			mknod -m 0600 /dev/imb c ${DEVMAJOR} 0 || RETVAL=$((RETVAL | 4))
+		fi
+	fi
+
+	# Per Corey Minyard, essentially no one uses ipmi_radisys
+	# and we don't want to encourage its further use
+	# so it won't be handled here.
+	return
+}
+
+#############################################################################
+start()
+{
+	echo -n "Starting ${MODULE_NAME} drivers: "
+	load_ipmi_modules
+	if [ ${RETVAL} -eq 0 ]; then
+		touch ${LOCKFILE} && log_success_msg
+	else
+		if [ $((RETVAL & 1)) -eq 1 ]; then
+			log_failure_msg
+		else
+			touch ${LOCKFILE} && log_warning_msg
+		fi
+	fi
+	start_watchdog_quiet
+	start_powercontrol_quiet
+}
+
+#############################################################################
+stop()
+{
+	echo -n "Stopping ${MODULE_NAME} drivers: "
+	unload_ipmi_modules_leave_features
+	modules_loaded ${MODULES_INTERFACES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		log_failure_msg "may be in use"
+	else
+		rm -f ${LOCKFILE}
+		log_success_msg
+	fi
+}
+
+stop_all()
+{
+	echo -n $"Stopping all ${MODULE_NAME} drivers: "
+	unload_all_ipmi_modules
+	modules_loaded ${MODULES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		log_failure_msg "may be in use"
+	else
+		rm -f ${LOCKFILE}
+		log_success_msg
+	fi
+}
+
+#############################################################################
+restart()
+{
+	stop_all
+	RETVAL=0
+	start
+}
+
+#############################################################################
+
+reload()
+{
+	stop_all
+	RETVAL=0
+	start
+}
+
+#############################################################################
+
+status_all()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+	
+	modules_loaded_verbose ${MODULES_FEATURES} ${MODULES_INTERFACES}
+	[ ${OnePlusUnloaded} -ne 0 ] && RETVAL=$((RETVAL | 2))
+
+	if [ "${DEV_IPMI}" = "yes" ]; then 
+	    device_node_exists /dev/ipmi${INTF_NUM}
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+	    device_node_exists /dev/imb
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+	    device_node_exists /dev/watchdog
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
+	fi
+
+	[ ! -e ${LOCKFILE} ] && RETVAL=$((RETVAL | 16))
+}
+
+status()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+	
+	if [ "${DEV_IPMI}" = "yes" ]; then 
+	    modules_loaded_verbose ipmi_devintf
+	    [ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+
+	    device_node_exists /dev/ipmi${INTF_NUM}
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+
+	if [ "${IPMI_IMB}" = "yes" ]; then
+	    device_node_exists /dev/imb
+	    [ $? -eq 0 ] && RETVAL=$((RETVAL | 4))
+	fi
+}
+
+status_watchdog()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+
+	modules_loaded_verbose ipmi_watchdog
+	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+
+	device_node_exists /dev/watchdog
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 8))
+}
+
+status_powercontrol()
+{
+	minimum_modules_loaded
+	[ $? -eq 0 ] && RETVAL=$((RETVAL | 1))
+
+	modules_loaded_verbose ipmi_powercontrol
+	[ ${OnePlusLoaded} -eq 0 ] && RETVAL=$((RETVAL | 2))
+}
+
+#############################################################################
+usage ()
+{
+	echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart" 1>&2
+	echo $"          start-watchdog|stop-watchdog|status-watchdog" 1>&2
+	echo $"          start-powercontrol|stop-powercontrol|status-powercontrol" 1>&2
+	echo $"          stop-all|status-all}" 1>&2
+	RETVAL=1
+}
+
+condrestart ()
+{
+	[ -e ${LOCKFILE} ] && restart
+}
+
+#############################################################################
+# MAIN
+#############################################################################
+case "$1" in
+	start) start ;;
+	stop)  stop ;;
+	restart) restart ;;
+	reload) reload ;;
+	status)	status ;;
+	status-all) status_all ;;
+	condrestart) condrestart ;;
+	try-restart) condrestart ;;
+	start-watchdog) start_watchdog ;;
+	stop-watchdog) stop_watchdog ;;
+	status-watchdog) status_watchdog ;;
+	start-powercontrol) start_powercontrol ;;
+	stop-powercontrol) stop_powercontrol ;;
+	status-powercontrol) status_powercontrol ;;
+	stop-all) stop_all ;;
+	*) usage ;;
+esac
+
+exit ${RETVAL}
+
+#############################################################################
+# end of file
+#############################################################################
+
diff --git a/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.service b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.service
new file mode 100644
index 0000000..f85ed20
--- /dev/null
+++ b/meta-oe/recipes-bsp/openipmi/openipmi-2.0.22/openipmi.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=IPMI Driver
+After=network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@libexecdir@/openipmi-helper start
+ExecStop=@libexecdir@/openipmi-helper stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-bsp/openipmi/openipmi_2.0.22.bb b/meta-oe/recipes-bsp/openipmi/openipmi_2.0.22.bb
new file mode 100644
index 0000000..d605e45
--- /dev/null
+++ b/meta-oe/recipes-bsp/openipmi/openipmi_2.0.22.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "This is the OpenIPMI library, a library that makes simplifies building complex IPMI management software."
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "popt zlib ncurses gdbm"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
+           file://openipmi.service \
+           file://openipmi.initscript \
+           file://makefiles_remove_libdir.patch \
+          "
+SRC_URI[md5sum] = "9a4e1f6bb073379c494839201ea10aee"
+SRC_URI[sha256sum] = "4988900043c35fcfa9b2bf275d6593904f6429221befb770ba6ecb5502108e55"
+
+inherit autotools gettext update-alternatives ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','', d)}
+
+
+S = "${WORKDIR}/OpenIPMI-${PV}"
+
+PACKAGECONFIG ??= "glib openssl net-snmp"
+
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
+PACKAGECONFIG[glib] = "--with-glib=yes --with-glibver=2.0,--with-glib=no,glib-2.0"
+PACKAGECONFIG[net-snmp] = ",--with-ucdsnmp=no,net-snmp"
+PACKAGECONFIG[python] = "--with-python,--without-python,python,"
+PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE},--with-perl=no,perl,"
+PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
+PACKAGECONFIG[swig] = "--with-swig=yes,--with-swig=no,swig,"
+
+PARALLEL_MAKE = ""
+
+do_install_append() {
+    install -d ${D}/etc/init.d
+    install -m 755 ${WORKDIR}/openipmi.initscript ${D}/etc/init.d/ipmi
+    install -d ${D}/${libexecdir}
+    install -m 755 ${WORKDIR}/openipmi.initscript ${D}${libexecdir}/openipmi-helper
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/openipmi.service ${D}/${systemd_unitdir}/system/ipmi.service
+        sed -i -e 's,@libexecdir@,${libexecdir},g' ${D}/${systemd_unitdir}/system/ipmi.service
+    fi
+}
+
+COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.7.4


