Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 786C8615B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 13:58:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Jan 2014 05:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="453252067"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.130])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2014 05:58:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jan 2014 13:58:28 +0000
Message-Id: <1388757508-21116-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-webserver][PATCH] ajenti: remove
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
X-List-Received-Date: Fri, 03 Jan 2014 13:58:33 -0000

In recent versions, upstream has decided to place additional
restrictions on commercial use beyond a standard open source license
(LGPLv3) [1]. This makes it hard to set a LICENSE value that is easily
understood. Of course, as the authors, they have the right to decide
what licensing terms they wish to distribute their project under, and we
could always set LICENSE_FLAGS to denote the extra terms, but this is
somewhat messy and personally I feel less inclined to continue
maintaining this recipe in meta-webserver now, especially since I
originally put it together on my own time. At the moment due to a
branch/commit mismatch it is no longer fetching in any case.

(If someone wants to resurrect this recipe in another layer, they are
more than welcome to do so.)

[1] http://support.ajenti.org/topic/351265-clarify-licensing/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-setup.py-remove-extra-data-files.patch    |  33 ------
 ...stat-fix-disk-usage-check-to-work-with-bu.patch |  29 -----
 ...-plugins-sysload-fix-to-work-with-busybox.patch |  47 --------
 .../ajenti/0005-plugins-power-fix-shutdown.patch   |  31 ------
 ...ervices-add-basic-sysvinit-implementation.patch | 119 ---------------------
 ...vices-replace-s_upstart-with-s_init-in-MO.patch |  23 ----
 .../ajenti/distributor-logo-openembedded.png       | Bin 2165 -> 0 bytes
 .../ajenti/distro-detection-openembedded.patch     |  42 --------
 .../recipes-webadmin/ajenti/ajenti_git.bb          |  80 --------------
 9 files changed, 404 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0001-setup.py-remove-extra-data-files.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0003-plugins-sysload-fix-to-work-with-busybox.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0005-plugins-power-fix-shutdown.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0006-plugins-services-add-basic-sysvinit-implementation.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/distributor-logo-openembedded.png
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti/distro-detection-openembedded.patch
 delete mode 100644 meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb

diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0001-setup.py-remove-extra-data-files.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0001-setup.py-remove-extra-data-files.patch
deleted file mode 100644
index 11d7a92..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0001-setup.py-remove-extra-data-files.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 37bf4c471f23140e00fe87dde6f7c3cf38933c22 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 12 Mar 2012 02:01:48 +0000
-Subject: [PATCH] setup.py: remove extra data files
-
-Don't install files using setup.py, since this fails due to absolute
-paths and we can easily install these within the recipe instead.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- setup.py |    6 ------
- 1 files changed, 0 insertions(+), 6 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 8daea4c..11e3acb 100755
---- a/setup.py
-+++ b/setup.py
-@@ -18,10 +18,4 @@ setup(
-     packages = find_packages(),
-     package_data={'': ['files/*.*', 'files/*/*.*', 'files/*/*/*.*', 'templates/*.*', 'widgets/*.*', 'layout/*.*']},
-     scripts=['ajenti-panel', 'ajenti-pkg'],
--    data_files=[
--        ('/etc/ajenti', ['packaging/files/ajenti.conf']),
--        ('/etc/ajenti/users', ['packaging/files/admin.conf']),
--        ('/etc/init.d', ['packaging/files/ajenti']),
--        ('/var/lib/ajenti/plugins', ['packaging/files/.placeholder']),
--    ],
- )
--- 
-1.7.5.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch
deleted file mode 100644
index 48c255d..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cde811cfffba48c148b60fb1083fe8fd409b8b24 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 13 Mar 2012 01:52:34 +0000
-Subject: [PATCH 1/2] plugins/hddstat: fix disk usage check to work with
- busybox
-
-busybox df does not have --total, so fake it using awk.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- plugins/hddstat/usage.py |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/plugins/hddstat/usage.py b/plugins/hddstat/usage.py
-index 3c84181..cf5f037 100644
---- a/plugins/hddstat/usage.py
-+++ b/plugins/hddstat/usage.py
-@@ -7,7 +7,7 @@ class DiskUsageMeter(LinearMeter):
-     transform = 'percent'
-     
-     def get_usage(self):
--        u = int(shell('df --total | grep total').split().pop().strip('%'))
-+        u = int(round(float(shell("df -P | awk 'NR > 1 {total+=$3+$4 ; used+=$3} END { print used/total*100}'").strip())))
-         return u
-     
-     def get_value(self):
--- 
-1.7.4.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0003-plugins-sysload-fix-to-work-with-busybox.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0003-plugins-sysload-fix-to-work-with-busybox.patch
deleted file mode 100644
index 1efec9b..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0003-plugins-sysload-fix-to-work-with-busybox.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 552c46fb22fe336175c42612c33ceb0828ddd6aa Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 13 Mar 2012 01:54:09 +0000
-Subject: [PATCH 2/2] plugins/sysload: fix to work with busybox
-
-The busybox free command does not support -b, so specify -k (which is
-also ignored, but will help if real "free" is being used) and multiply
-kb values by 1024.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- plugins/sysload/ss_linux.py |   18 +++++++++++-------
- 1 files changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/plugins/sysload/ss_linux.py b/plugins/sysload/ss_linux.py
-index cab7708..be60c53 100644
---- a/plugins/sysload/ss_linux.py
-+++ b/plugins/sysload/ss_linux.py
-@@ -11,14 +11,18 @@ class LinuxSysStat(Plugin):
-         return open('/proc/loadavg', 'r').read().split()[0:3]
- 
-     def get_ram(self):
--        s = shell('free -b | grep Mem').split()[1:]
--        t = int(s[0])
--        u = int(s[1])
--        b = int(s[4])
--        c = int(s[5])
-+        # busybox free doesn't support -b
-+        s = shell('free -k | grep Mem').split()[1:]
-+        t = int(s[0]) * 1024
-+        u = int(s[1]) * 1024
-+        b = int(s[4]) * 1024
-+        if len(s) > 5:
-+                c = int(s[5]) * 1024
-+        else:
-+                c = 0
-         u -= c + b;
-         return (u, t)
- 
-     def get_swap(self):
--        s = shell('free -b | grep Swap').split()[1:]
--        return (int(s[1]), int(s[0]))
-+        s = shell('free -k | grep Swap').split()[1:]
-+        return (int(s[1]) * 1024, int(s[0]) * 1024)
--- 
-1.7.4.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0005-plugins-power-fix-shutdown.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0005-plugins-power-fix-shutdown.patch
deleted file mode 100644
index 2934385..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0005-plugins-power-fix-shutdown.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From acd997cf610f8e9b0dbea00d2f1184d256d1b85b Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Sat, 17 Mar 2012 23:50:48 +0000
-Subject: [PATCH] plugins/power: fix shutdown
-
-Fix shutdown to use the -h option together with -P (which is required
-for sysvinit shutdown.)
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- plugins/power/main.py |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/plugins/power/main.py b/plugins/power/main.py
-index 0ab6337..069bde7 100755
---- a/plugins/power/main.py
-+++ b/plugins/power/main.py
-@@ -57,7 +57,7 @@ class PowerPlugin(CategoryPlugin):
-     @event('button/click')
-     def on_aclick(self, event, params, vars=None):
-         if params[0] == 'shutdown':
--            shell('shutdown -P now')
-+            shell('shutdown -h -P now')
-         if params[0] == 'reboot':
-             shell('reboot')
- 
--- 
-1.7.5.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0006-plugins-services-add-basic-sysvinit-implementation.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0006-plugins-services-add-basic-sysvinit-implementation.patch
deleted file mode 100644
index 651018e..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0006-plugins-services-add-basic-sysvinit-implementation.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 57f949a7ab34812d8384bf41c05c3b25bdade92b Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Sun, 18 Mar 2012 14:26:34 +0000
-Subject: [PATCH] plugins/services: add basic sysvinit implementation
-
-This allows operation on systems that don't have the "service" command.
-The PID finding is a little hacky but mostly works. Note that this uses
-psutil to detect whether the service is really running rather than just
-assuming that it is if the pid file exists.
-
-Note: you need to remove s_upstart.py before this will work.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- plugins/services/s_init.py |   90 ++++++++++++++++++++++++++++++++++++++++++++
- 1 files changed, 90 insertions(+), 0 deletions(-)
- create mode 100755 plugins/services/s_init.py
-
-diff --git a/plugins/services/s_init.py b/plugins/services/s_init.py
-new file mode 100755
-index 0000000..6f38b0a
---- /dev/null
-+++ b/plugins/services/s_init.py
-@@ -0,0 +1,90 @@
-+# Basic sysvinit service backend implementation for Ajenti Services plugin
-+#
-+# Copyright (C) 2012 Intel Corporation
-+# Author: Paul Eggleton <paul.eggleton@linux.intel.com>
-+#
-+
-+import os
-+import psutil
-+
-+from ajenti.com import *
-+from ajenti.utils import *
-+from ajenti import apis
-+from ajenti.api import *
-+
-+def find_service_pid(service):
-+    svcfile = os.path.join('/etc/init.d', service)
-+    pidfile = ''
-+    try:
-+        svcf = open(svcfile)
-+    except:
-+        return None
-+    while 1:
-+        line = svcf.readline()
-+        if not line:
-+            break
-+        if line.startswith('PID='):
-+            pidfile = line.split('=')[1].strip("'\n\r \"")
-+            break
-+    svcf.close()
-+    if not pidfile:
-+        pf = '/var/run/%s.pid' % service
-+        if os.path.exists(pf):
-+            pidfile = pf
-+        else:
-+            pf = '/var/run/%sd.pid' % service
-+            if os.path.exists(pf):
-+                pidfile = pf
-+    if pidfile:
-+        pidf = open(pidfile)
-+        pid = pidf.readline()
-+        pidf.close
-+        if pid:
-+            pid = pid.strip()
-+            pid = int(pid)
-+            try:
-+                p = psutil.Process(pid)
-+            except:
-+                pid = None
-+        return pid
-+    return None
-+
-+
-+class UpstartServiceManager(Plugin):
-+    implements(apis.services.IServiceManager)
-+    platform = ['debian']
-+
-+    def list_all(self):
-+        r = []
-+
-+        blacklist = 'functions mountall.sh save-rtc.sh umountnfs.sh populate-volatile.sh rcS bootlogd urandom halt sendsigs single bootmisc.sh sysfs.sh mountnfs.sh busybox-udhcpc devpts.sh banner.sh modutils.sh checkroot.sh networking umountfs udev rc hostname.sh fbsetup stop-bootlogd rmnologin.sh reboot hwclock.sh read-only-rootfs-hook.sh functions.initscripts syslog.busybox'.split()
-+
-+        for f in os.listdir('/etc/init.d'):
-+            if not f in blacklist:
-+                svc = apis.services.Service()
-+                svc.name = f
-+                pid = find_service_pid(f)
-+                if pid:
-+                    svc.status = 'running'
-+                else:
-+                    svc.status = 'stopped'
-+                r.append(svc)
-+
-+        return sorted(r, key=lambda s: s.name)
-+
-+    def get_status(self, name):
-+        pid = find_service_pid(name)
-+        if pid:
-+            return 'running'
-+        else:
-+            return 'stopped'
-+
-+    def start(self, name):
-+        shell('/etc/init.d/%s start' % name)
-+
-+    def stop(self, name):
-+        shell('/etc/init.d/%s stop' % name)
-+
-+    def restart(self, name):
-+        shell('/etc/init.d/%s restart' % name)
-+
--- 
-1.7.5.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch
deleted file mode 100644
index 7623e3f..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 75b5109ceb4874c967daf6c1e8434e6093b1df79 Mon Sep 17 00:00:00 2001
-From: Kevin Strasser <kevin.strasser@linux.intel.com>
-Date: Mon, 29 Oct 2012 01:44:10 -0700
-Subject: [PATCH] plugins/services: replace s_upstart with s_init in MODULES
-
-Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
----
- plugins/services/__init__.py |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/services/__init__.py b/plugins/services/__init__.py
-index 6cf58e5..ced3300 100755
---- a/plugins/services/__init__.py
-+++ b/plugins/services/__init__.py
-@@ -1,4 +1,4 @@
--MODULES = ['api', 'main', 'meter', 'widget', 's_upstart', 's_arch', 's_bsd', 's_centos', 's_gentoo']
-+MODULES = ['api', 'main', 'meter', 'widget', 's_init', 's_arch', 's_bsd', 's_centos', 's_gentoo']
- 
- DEPS =  [
-     (['centos', 'fedora'],
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/distributor-logo-openembedded.png b/meta-webserver/recipes-webadmin/ajenti/ajenti/distributor-logo-openembedded.png
deleted file mode 100644
index 0aad9df90c26bb63e6eec88f0f1bf2d1ca1188bf..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2165
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

diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti/distro-detection-openembedded.patch b/meta-webserver/recipes-webadmin/ajenti/ajenti/distro-detection-openembedded.patch
deleted file mode 100644
index 9ef9bac..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti/distro-detection-openembedded.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5b3864f5ff76915887774fa78961616b6e7c1649 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Thu, 15 Mar 2012 03:25:36 +0000
-Subject: [PATCH] Hardcode distro detection
-
-Use "openembedded" as the distro identification string if none is able
-to be detected.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- ajenti/utils/utils.py |    6 +++++-
- 1 files changed, 5 insertions(+), 1 deletions(-)
-
-diff --git a/ajenti/utils/utils.py b/ajenti/utils/utils.py
-index c7e1463..98199c0 100755
---- a/ajenti/utils/utils.py
-+++ b/ajenti/utils/utils.py
-@@ -41,6 +41,7 @@ def detect_platform(mapping=True):
-     platform_mapping = {
-         'ubuntu': 'debian',
-         'linuxmint': 'debian',
-+        'openembedded': 'debian',
-     }
- 
-     if platform.system() != 'Linux':
-@@ -57,7 +58,10 @@ def detect_platform(mapping=True):
-         try:
-             dist = shell('strings -4 /etc/issue').split()[0]
-         except:
--            dist = 'unknown'
-+            dist = ''
-+
-+    if dist == '':
-+        dist = 'openembedded'
- 
-     res = dist.strip().lower()
-     if res in base_mapping:
--- 
-1.7.4.4
-
diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
deleted file mode 100644
index 83e92f6..0000000
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
+++ /dev/null
@@ -1,80 +0,0 @@
-SUMMARY = "Web-based system administration interface"
-HOMEPAGE = "http://ajenti.org"
-SECTION = "devel/python"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-DEPENDS += "python-pyopenssl python-lxml python-gevent python-greenlet \
-            python-psutil python-imaging"
-
-PV = "0.6.2+git${SRCPV}"
-
-SRC_URI = "git://github.com/Eugeny/ajenti.git \
-           file://0001-setup.py-remove-extra-data-files.patch \
-           file://0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch \
-           file://0003-plugins-sysload-fix-to-work-with-busybox.patch \
-           file://0005-plugins-power-fix-shutdown.patch \
-           file://0006-plugins-services-add-basic-sysvinit-implementation.patch \
-           file://0007-plugins-services-replace-s_upstart-with-s_init-in-MO.patch \
-           ${DISTRO_FILES}"
-
-# Allow this to be customised easily
-DISTRO_FILES = "file://distro-detection-openembedded.patch \
-                file://distributor-logo-openembedded.png"
-
-# Corresponds to the 0.6.2 tag
-SRCREV = "c08fb4da65923aebd09116750a1f43f13b98a51a"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools update-rc.d
-
-do_configure_prepend() {
-    rm ajenti/plugins/dashboard/files/distributor-logo-*.png
-    cp ${WORKDIR}/distributor-logo-*.png ajenti/plugins/dashboard/files/
-    rm plugins/services/s_upstart.py
-}
-
-do_install_append() {
-    install -d ${D}${sysconfdir}
-    install -d ${D}${sysconfdir}/ajenti
-    install -m 0644 packaging/files/ajenti.conf ${D}${sysconfdir}/ajenti/
-    install -d ${D}${sysconfdir}/ajenti/users
-    install -m 0644 packaging/files/admin.conf ${D}${sysconfdir}/ajenti/users/
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 packaging/files/ajenti ${D}${sysconfdir}/init.d/
-    install -d ${D}${localstatedir}
-    install -d ${D}${localstatedir}/lib
-    install -d ${D}${localstatedir}/lib/ajenti
-    install -d ${D}${localstatedir}/lib/ajenti/plugins
-    install -m 0644 packaging/files/.placeholder ${D}${localstatedir}/lib/ajenti/plugins
-
-    for plugin in plugins/* ; do
-        cp -r $plugin ${D}${localstatedir}/lib/ajenti/plugins/
-    done
-}
-
-INITSCRIPT_NAME = "ajenti"
-INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 20 0 1 6 ."
-
-python populate_packages_prepend() {
-    plugindir = d.expand('${localstatedir}/lib/ajenti/plugins')
-    do_split_packages(d, plugindir, '(^[^.]*$)', 'ajenti-plugin-%s', 'Ajenti plugin for %s', allow_dirs=True, prepend=False)
-}
-
-PACKAGES_DYNAMIC = "ajenti-plugin-*"
-FILES_${PN} += "${sysconfdir}/ajenti.conf \
-                ${sysconfdir}/ajenti \
-                ${sysconfdir}/init.d \
-                ${localstatedir}/lib/ajenti/plugins/.placeholder"
-RDEPENDS_${PN} += "python-re python-json python-logging python-subprocess \
-                   python-threading python-setuptools python-netclient \
-                   python-netserver python-shell python-syslog \
-                   python-pyopenssl python-lxml python-gevent python-greenlet"
-RDEPENDS_${PN}-plugin-taskmgr += "python-psutil"
-RDEPENDS_${PN}-plugin-services += "python-psutil"
-RDEPENDS_${PN}-plugin-logs += "python-compression"
-RDEPENDS_${PN}-plugin-terminal += "python-compression python-codecs python-math \
-                                   python-terminal python-imaging"
-RDEPENDS_${PN}-plugin-fm += "python-unixadmin"
-
-- 
1.8.1.2


