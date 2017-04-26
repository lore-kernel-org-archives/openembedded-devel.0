Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF4577C9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3Q8MU3g023732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:33 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:06 +0800
Message-ID: <d24e590832369a1100cdc8bd9d501f9a6e5c2e64.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/8 v2] openipmi: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

OpenIPMI is an effort to create a full-function IPMI
system to allow full access to all IPMI information
on a server and to abstract it to a level that will
make it easy to use.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/do-not-install-pyc-and-pyo.patch         |  25 +
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 +
 .../files/ipmi-init-fix-the-arguments.patch        |  41 ++
 .../recipes-support/openipmi/files/ipmi.service    |  12 +
 .../openipmi/files/makefile-add-ldflags.patch      |  19 +
 .../openipmi/files/openipmi-don-t-rm-.libs.patch   |  32 ++
 .../recipes-support/openipmi/files/openipmi-helper | 512 +++++++++++++++++++++
 .../files/openipmi-no-openipmigui-man.patch        |  26 ++
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  85 ++++
 .../recipes-support/openipmi/openipmi_2.0.22.bb    | 111 +++++
 10 files changed, 885 insertions(+)
 create mode 100644 meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/ipmi.service
 create mode 100644 meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
 create mode 100755 meta-oe/recipes-support/openipmi/files/openipmi-helper
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 create mode 100644 meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb

diff --git a/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch b/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
new file mode 100644
index 000000000..d4e02be45
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
@@ -0,0 +1,25 @@
+Do not install pyc and pyo for python module
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ swig/python/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/swig/python/Makefile.am b/swig/python/Makefile.am
+index da95a81..97a62bf 100644
+--- a/swig/python/Makefile.am
++++ b/swig/python/Makefile.am
+@@ -33,8 +33,6 @@ CLEANFILES = OpenIPMI_wrap.c OpenIPMI.py OpenIPMI.pyo OpenIPMI.pyc
+ install-exec-local: _OpenIPMI.la OpenIPMI.py OpenIPMI.pyc OpenIPMI.pyo
+ 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)
+ 	$(INSTALL_DATA) OpenIPMI.py "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+-	$(INSTALL_DATA) OpenIPMI.pyc "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+-	$(INSTALL_DATA) OpenIPMI.pyo "$(DESTDIR)$(PYTHON_INSTALL_DIR)"
+ 	if test "x$(PYTHON_GUI_DIR)" = "xopenipmigui"; then \
+ 	    $(INSTALL) -d $(DESTDIR)$(bindir); \
+ 	    $(INSTALL_SCRIPT) $(srcdir)/openipmigui.py "$(DESTDIR)$(bindir)/openipmigui";\
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
new file mode 100644
index 000000000..9a568b2b2
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
@@ -0,0 +1,22 @@
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Thu Jun 7 16:00:13 2012 -0400
+
+    This patch fixes the error during the install stage when
+    creating a symbolic link for opeipmish in openipmi/cmdlang
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
+index 92d6e83..f6039f9 100644
+--- a/cmdlang/Makefile.am
++++ b/cmdlang/Makefile.am
+@@ -36,6 +36,7 @@ CLEANFILES = libOpenIPMIcmdlang.map
+ # compatability.
+ install-data-local:
+ 	rm -f $(DESTDIR)$(bindir)/ipmish
++	mkdir -p $(DESTDIR)$(bindir)/
+ 	$(LN_S) openipmish $(DESTDIR)$(bindir)/ipmish
+ 
+ uninstall-local:
diff --git a/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
new file mode 100644
index 000000000..51a398ba5
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] ipmi-init: fix the arguments
+
+The functions success/failure/warning defined in /etc/init.d/functions
+(provided by initscripts) only accepts numeric argument as return code,
+not a string.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ ipmi.init | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ipmi.init b/ipmi.init
+index 2ebcd94..d8161c5 100644
+--- a/ipmi.init
++++ b/ipmi.init
+@@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
+ 	case "$ACTION" in
+ 	    success)
+ 		echo -n $*
+-		success "$*"
++		success 0
+ 		echo
+ 		;;
+ 	    failure)
+ 		echo -n $*
+-		failure "$*"
++		failure 1
+ 		echo
+ 		;;
+ 	    warning)
+ 		echo -n $*
+-		warning "$*"
++		warning 0
+ 		echo
+ 		;;
+ 	    *)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/openipmi/files/ipmi.service b/meta-oe/recipes-support/openipmi/files/ipmi.service
new file mode 100644
index 000000000..6fe137819
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/ipmi.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=IPMI Driver
+After=network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@LIBEXECDIR@/openipmi-helper start
+ExecStop=@LIBEXECDIR@/openipmi-helper stop-all
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch b/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
new file mode 100644
index 000000000..271c5323f
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/makefile-add-ldflags.patch
@@ -0,0 +1,19 @@
+Add LDFLAGS variable to Makefile.am, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/swig/perl/Makefile.am b/swig/perl/Makefile.am
+index 2f9ee4c..3a18892 100644
+--- a/swig/perl/Makefile.am
++++ b/swig/perl/Makefile.am
+@@ -20,7 +20,7 @@ OpenIPMI_SRC = OpenIPMI_perl.c
+ OpenIPMI_OBJ = OpenIPMI_wrap.lo OpenIPMI_perl.lo
+ 
+ OpenIPMI.so: $(OpenIPMI_OBJ)
+-	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
++	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version $(LDFLAGS) -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
+ 	rm -f OpenIPMI.so
+ 	mv .libs/OpenIPMI.so .
+ 
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch b/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
new file mode 100644
index 000000000..ee3c66043
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/openipmi-don-t-rm-.libs.patch
@@ -0,0 +1,32 @@
+From bbd51cf010c80322034f7094e2c6a656aa1f17a7 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Fri, 13 Feb 2015 06:55:33 +0000
+Subject: [PATCH] openipmi: don't rm .libs
+
+Don't remove .libs after OpenIPMI.so generated, this may cause
+dummystuff.so fails to link from the second build with error:
+
+* error: .libs/dummystuff.o: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ swig/perl/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/swig/perl/Makefile.am b/swig/perl/Makefile.am
+index 12a282c..2f9ee4c 100644
+--- a/swig/perl/Makefile.am
++++ b/swig/perl/Makefile.am
+@@ -23,7 +23,6 @@ OpenIPMI.so: $(OpenIPMI_OBJ)
+ 	$(LIBTOOL) --mode=link $(CC) -shared -module -avoid-version -o $(@:.so=.la) $^ $(OPENIPMI_SWIG_LIBS) $(PERL_POSIX_LIB) -rpath $(PERL_INSTALL_DIR)/auto/OpenIPMI
+ 	rm -f OpenIPMI.so
+ 	mv .libs/OpenIPMI.so .
+-	rm -rf .libs
+ 
+ dummystuff.lo: dummystuff.c
+ 	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-helper b/meta-oe/recipes-support/openipmi/files/openipmi-helper
new file mode 100755
index 000000000..4cebfb9c6
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/openipmi-helper
@@ -0,0 +1,512 @@
+#!/bin/sh
+#############################################################################
+#
+# ipmi:		OpenIPMI Driver helper script
+#
+# Authors:	Jan Safranek <jsafrane@redhat.com>
+#
+# Based on IPMI init script by:
+#               Matt Domsch <Matt_Domsch@dell.com>
+#               Chris Poblete <Chris_Poblete@dell.com>
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
+		echo "Watchdog startup failed: cannot load ipmi_watchdog module" &&
+		return
+	if [ ${UDEV_EXISTS} -eq 0 -a ! -e /dev/watchdog ]; then
+		mknod -m 0600 /dev/watchdog c 10 130
+		[ $? -ne 0 ] &&
+			RETVAL=$((RETVAL | 8)) &&
+			echo "Watchdog startup failed: cannot create /dev/watchdog" &&
+			return
+	fi
+}
+
+start_watchdog_quiet()
+{
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		return
+	start_watchdog_common
+}
+
+start_watchdog()
+{
+	[ "${IPMI_WATCHDOG}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Watchdog not configured" &&
+		return
+	start_watchdog_common
+}
+
+stop_watchdog()
+{
+	modprobe -q -r ipmi_watchdog > /dev/null 2>&1
+	modules_loaded ipmi_watchdog
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    echo "Watchog shutdown failed: cannot unload ipmi_watchdog module"
+	else
+	    if [ "${IPMI_WATCHDOG}" = "yes" ]; then
+		[ ${UDEV_EXISTS} -eq 0 ] && rm -f /dev/watchdog
+	    fi
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
+		echo "Powercontroll startup failed: cannot load ipmi_poweroff module" &&
+		return
+}
+
+start_powercontrol_quiet()
+{
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		return
+	start_powercontrol_common
+}
+
+start_powercontrol()
+{
+	[ "${IPMI_POWEROFF}" != "yes" ] &&
+		RETVAL=$((RETVAL | 2)) &&
+		echo "Powercontroll not configured" &&
+		return
+	start_powercontrol_common
+}
+
+stop_powercontrol()
+{
+	modprobe -q -r ipmi_poweroff > /dev/null 2>&1
+	modules_loaded ipmi_poweroff
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+	    RETVAL=$((RETVAL | 32))
+	    echo "Powercontroll shutdown failed: cannot unload ipmi_poweroff module"
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
+	load_ipmi_modules
+	if [ ${RETVAL} -eq 0 ]; then
+		touch ${LOCKFILE}
+	else
+		if [ $((RETVAL & 1)) -eq 1 ]; then
+			echo "Startup failed."
+		else
+			touch ${LOCKFILE} && echo "Warning!?"
+		fi
+	fi
+	start_watchdog_quiet
+	start_powercontrol_quiet
+}
+
+#############################################################################
+stop()
+{
+	unload_ipmi_modules_leave_features
+	modules_loaded ${MODULES_INTERFACES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		echo "Shutdown failed, something may be in use"
+	else
+		rm -f ${LOCKFILE}
+	fi
+}
+
+stop_all()
+{
+	unload_all_ipmi_modules
+	modules_loaded ${MODULES}
+	if [ ${OnePlusLoaded} -ne 0 ]; then
+		RETVAL=$((RETVAL | 32))
+		echo "Shutdown failed, something may be in use"
+	else
+		rm -f ${LOCKFILE}
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
+	echo $"Usage: $0 {start|stop|status" 1>&2
+	echo $"          restart|condrestart|try-restart|reload|force-reload" 1>&2
+	echo $"          start-watchdog|stop-watchdog|status-watchdog" 1>&2
+	echo $"          start-powercontrol|stop-powercontrol|status-powercontrol" 1>&2
+	echo $"          stop-all|status-all}" 1>&2
+	RETVAL=2
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
+	force-reload) reload ;;
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
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
new file mode 100644
index 000000000..1fa68f9ba
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
@@ -0,0 +1,26 @@
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Thu Jun 7 12:28:34 2012 -0400
+
+    This patch was carried over from WRL4.3 (openipmi v2.0.16)
+    
+    It was updated for openipmi v2.0.19
+    
+    Disable making openipmigui man page since we don't need it
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+    Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 632f55b..5ce79f5 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,6 +1,6 @@
+ 
+ man_MANS = ipmi_ui.1 openipmicmd.1 openipmish.1 ipmi_cmdlang.7 \
+-	openipmigui.1 openipmi_conparms.7 solterm.1 rmcp_ping.1 \
++	openipmi_conparms.7 solterm.1 rmcp_ping.1 \
+ 	openipmi_eventd.1
+ 
+ EXTRA_DIST = $(man_MANS)
diff --git a/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
new file mode 100644
index 000000000..6f16234bc
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
@@ -0,0 +1,85 @@
+From aa0dc0783a6ff5fb56c914b640836223e3c192bb Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 29 Dec 2014 18:16:04 +0800
+Subject: [PATCH] remove host path from la_LDFLAGS
+
+Upstream-Status: Inappropriate [ cross compile specific ]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ cmdlang/Makefile.am |    2 +-
+ glib/Makefile.am    |    4 ++--
+ tcl/Makefile.am     |    2 +-
+ unix/Makefile.am    |    4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
+index 00c3d2b..0fa85d7 100644
+--- a/cmdlang/Makefile.am
++++ b/cmdlang/Makefile.am
+@@ -16,7 +16,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(top_builddir)/lib/libOpenIPMI.la
+ libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIcmdlang.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIcmdlang.map
+ 
+ bin_PROGRAMS = openipmish
+ 
+diff --git a/glib/Makefile.am b/glib/Makefile.am
+index 671cae2..eff55f3 100644
+--- a/glib/Makefile.am
++++ b/glib/Makefile.am
+@@ -11,14 +11,14 @@ libOpenIPMIglib_la_SOURCES = glib_os_hnd.c
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
+diff --git a/tcl/Makefile.am b/tcl/Makefile.am
+index b702819..282619c 100644
+--- a/tcl/Makefile.am
++++ b/tcl/Makefile.am
+@@ -11,7 +11,7 @@ libOpenIPMItcl_la_SOURCES = tcl_os_hnd.c
+ libOpenIPMItcl_la_CFLAGS = $(TCL_CFLAGS) $(AM_CFLAGS)
+ libOpenIPMItcl_la_LIBADD = $(GDBM_LIB)
+ libOpenIPMItcl_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) -L$(libdir) \
++	-Wl,-Map -Wl,libOpenIPMItcl.map $(TCL_LIBS) \
+ 	-rpath $(libdir)
+ 
+ noinst_PROGRAMS = test_handlers
+diff --git a/unix/Makefile.am b/unix/Makefile.am
+index a792147..a108bc6 100644
+--- a/unix/Makefile.am
++++ b/unix/Makefile.am
+@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
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
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
new file mode 100644
index 000000000..82e8cac3e
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
@@ -0,0 +1,111 @@
+SUMMARY = "IPMI (Intelligent Platform Management Interface) library and tools"
+DESCRIPTION = "OpenIPMI is an effort to create a full-function IPMI system, \
+to allow full access to all IPMI information on a server \
+and to abstract it to a level that will make it easy to use"
+
+HOMEPAGE = "http://openipmi.sourceforge.net"
+
+DEPENDS = " \
+    glib-2.0 \
+    ncurses \
+    net-snmp \
+    openssl \
+    popt \
+    python \
+    swig-native \
+    "
+
+LICENSE = "GPLv2 & LGPLv2.1 & BSD"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://COPYING.BSD;md5=4b318d4160eb69c8ee53452feb1b4cdf \
+                    "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
+           file://fix-symlink-install-error-in-cmdlang.patch \
+           file://openipmi-no-openipmigui-man.patch \
+           file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
+           file://openipmi-don-t-rm-.libs.patch \
+           file://ipmi-init-fix-the-arguments.patch \
+           file://makefile-add-ldflags.patch \
+           file://do-not-install-pyc-and-pyo.patch \
+           file://openipmi-helper \
+           file://ipmi.service \
+           "
+
+SRC_URI[md5sum] = "9a4e1f6bb073379c494839201ea10aee"
+SRC_URI[sha256sum] = "4988900043c35fcfa9b2bf275d6593904f6429221befb770ba6ecb5502108e55"
+
+S = "${WORKDIR}/OpenIPMI-${PV}"
+
+inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd
+
+EXTRA_OECONF = "--disable-static \
+                --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
+                --with-python='${STAGING_BINDIR_NATIVE}/python-native/python' \
+                --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
+                --with-glibver=2.0 --with-glib12=no"
+
+PACKAGECONFIG ??= "gdbm"
+PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
+
+PACKAGES += "${PN}-perl ${PN}-python"
+
+FILES_${PN}-perl = " \
+    ${libdir}/perl/vendor_perl/*/OpenIPMI.pm \
+    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/OpenIPMI.so \
+    "
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+
+FILES_${PN}-dbg += " \
+    ${libdir}/perl/vendor_perl/*/auto/OpenIPMI/.debug \
+    ${PYTHON_SITEPACKAGES_DIR}/.debug \
+    "
+
+do_configure () {
+
+    # Let's perform regular configuration first then handle perl issues.
+    autotools_do_configure
+
+    perl_ver=`perl -V:version | cut -d\' -f 2`
+    
+    # Force openipmi perl bindings to be compiled using perl-native instead of
+    # the host's perl. Set the proper install directory for the resulting
+    # openipmi.pm and openipmi.so
+    for i in ${S}/swig/Makefile ${S}/swig/perl/Makefile; do
+        echo "SAL: i = $i"
+        echo "SAL: STAGING_INCDIR_NATIVE = $STAGING_INCDIR_NATIVE"
+        echo "SAL: libdir = $libdir"
+        sed -i -e "/^PERL_CFLAGS/s:-I/usr/local/include:-I${STAGING_INCDIR_NATIVE}:g" $i
+        sed -i -e "/^PERL_INSTALL_DIR/s:^PERL_INSTALL_DIR = .*:PERL_INSTALL_DIR = ${libdir}/perl/vendor_perl/$perl_ver:g" $i
+    done
+}
+
+do_install_append () {
+    echo "SAL: D = $D"
+    echo "SAL: libdir = $libdir"
+    install -m 0755 -d ${D}${sysconfdir}/sysconfig ${D}${sysconfdir}/init.d
+    install -m 0755 ${S}/ipmi.init ${D}${sysconfdir}/init.d/ipmi
+    install -m 0644 ${S}/ipmi.sysconf ${D}${sysconfdir}/sysconfig/ipmi
+    # SAL: mv: cannot stat `/localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/openipmi-2.0.19-r4/image/usr/lib64/perl5': No such file or directory
+    # SAL: real path to perl is /localdisk/loadbuild/slittle1/workspace/cgts_test_build/bitbake_build/tmp/work/x86_64-wrs-linux/perl-5.14.2-r8.3/package/usr/lib64/perl5 and it is a symlink to perl so no need to mv.
+    if [ -d ${D}${libdir}/perl5 ]
+    then
+        mv ${D}${libdir}/perl5 ${D}${libdir}/perl
+    fi
+ 
+    # for systemd
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0664 ${WORKDIR}/ipmi.service ${D}${systemd_unitdir}/system
+    sed -i -e "s,@LIBEXECDIR@,${libexecdir},g" ${D}${systemd_unitdir}/system/ipmi.service
+    install -d ${D}${libexecdir}
+    install -m 0755 ${WORKDIR}/openipmi-helper ${D}${libexecdir}
+}
+
+INITSCRIPT_NAME = "ipmi"
+INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+
+SYSTEMD_SERVICE_${PN} = "ipmi.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.11.0


