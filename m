Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.1402.1605911283610287269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 14:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p1UIondc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 1so11802835wme.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 14:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRZ6TizRF+Dql2bCsVaLaAHhroHMjFWA3gfWKP2DkWg=;
        b=p1UIondcgUUg+ez5tG/Ed0VFHf2kO8pu0ARftkfrENn7q1UKhT5/oPgycXNypJ3AFd
         y5af7g3/Hft/8cZ0+NZLmyp10COmzKe0CmUBYTjim70HtBXTBSMqIehA4P5Rn39VUxS6
         wIpRNyJ/DHRj+NXmo+FTV3Uc7zYBnjGAeSU9kyD6h4Vjm6X3kxOj73uA/pnbemEK4y/3
         uSnnD/vqkc1enQre7tA5ltun9HHjCjf54uHUyQ3B26LNRftNrI5mYsrada7RRem/CCZK
         nVrlfMigHH9p4Wk/gTOzGM0xdHGDirxDFK8KPwd1dZ0OBNmCNtwHrXPXO2/WA0Hx3XaM
         Ydxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRZ6TizRF+Dql2bCsVaLaAHhroHMjFWA3gfWKP2DkWg=;
        b=P1UKtTMXa3HBsFWNj2xTfJ/WLTC25t+aNkia8RfYt9X5GM5IXN4+k9tzEVpSSwjICK
         cf3sMHDjEwNVnSY1hXoMww/yrcv73312LcHNFmGQqr3JSc/txvZD81VbKEGbG10W31zV
         J25Yp2MyYsj1uyukF62VUC3dcrWQn6IqgNZNr+mUl9WdFDBpAfj6EnVAFrRMU7Q/9KEu
         Q/zmsa4B2uNiVSKQNu6x0qlEdnJR8hnzANuUMmD6XlwgMwla9wz+iWc7KqYV547a7pUf
         Vo8RVy6GQkc/wpE/XeeXscwZJxpWSiqFEs3z8Rlb1Sabuw5zpn3jyI/GF02b2bW8IXSC
         eDTQ==
X-Gm-Message-State: AOAM532cCpQnNSakpXmJ+REw2FHEymFo20J8j5X1akP3kprNdkmKzbX1
	ls+QFW8SJf3jvoVI64HUia22oj92MmQ=
X-Google-Smtp-Source: ABdhPJw7tZICmGYNBjeQnw+LWqO4Rxvmxb88RRRgG7pMrtCjW6Ku245cKDcfKsX0tIRzr9Me3APyDQ==
X-Received: by 2002:a1c:9c0e:: with SMTP id f14mr11939060wme.22.1605911281641;
        Fri, 20 Nov 2020 14:28:01 -0800 (PST)
Return-Path: <beniaminsandu@gmail.com>
Received: from localhost.localdomain (5-13-193-159.residential.rdsnet.ro. [5.13.193.159])
        by smtp.gmail.com with ESMTPSA id d2sm6910546wra.73.2020.11.20.14.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 14:28:00 -0800 (PST)
From: "Beni" <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: convert to git based recipe and upgrade to 1.12.0
Date: Sat, 21 Nov 2020 00:27:50 +0200
Message-Id: <20201120222750.2809675-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We eliminate the need to rename the recipe file with every
upgrade and also get better change history

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...rib-add-yocto-compatible-init-script.patch | 78 +++++++++++++++++++
 ...add-yocto-compatible-startup-scripts.patch | 78 -------------------
 .../{unbound_1.9.4.bb => unbound_git.bb}      |  6 +-
 3 files changed, 82 insertions(+), 80 deletions(-)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
 delete mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
 rename meta-networking/recipes-support/unbound/{unbound_1.9.4.bb => unbound_git.bb} (92%)

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
new file mode 100644
index 000000000..7168a352f
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
@@ -0,0 +1,78 @@
+From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Fri, 20 Nov 2020 23:00:20 +0200
+Subject: [PATCH] contrib: add yocto compatible init script
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ contrib/unbound.init | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/contrib/unbound.init b/contrib/unbound.init
+index c5bb52bb..4eba752b 100644
+--- a/contrib/unbound.init
++++ b/contrib/unbound.init
+@@ -19,11 +19,11 @@
+ ### END INIT INFO
+ 
+ # Source function library.
+-. /etc/rc.d/init.d/functions
++. /etc/init.d/functions
+ 
+ exec="/usr/sbin/unbound"
+ prog="unbound"
+-config="/var/unbound/unbound.conf"
++config="/etc/unbound/unbound.conf"
+ pidfile="/var/unbound/unbound.pid"
+ rootdir="/var/unbound"
+ 
+@@ -54,14 +54,14 @@ start() {
+ 	[ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
+ 	mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
+     fi;
+-    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
++    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
+ 	[ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
+-	[ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
+-	mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null 2>&1;
++	[ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
++	mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1;
+     fi;
+ 
+     # if not running, start it up here
+-    daemon $exec
++    daemonize $exec
+     retval=$?
+     echo
+     [ $retval -eq 0 ] && touch $lockfile
+@@ -71,15 +71,15 @@ start() {
+ stop() {
+     echo -n $"Stopping $prog: "
+     # stop it here, often "killproc $prog"
+-    killproc -p $pidfile $prog
++    killproc $prog
+     retval=$?
+     echo
+     [ $retval -eq 0 ] && rm -f $lockfile
+     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log' /proc/mounts; then
+ 	umount ${rootdir}/dev/log >/dev/null 2>&1
+     fi;
+-    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
+-	umount ${rootdir}/dev/urandom >/dev/null 2>&1
++    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
++	umount ${rootdir}/dev/random >/dev/null 2>&1
+     fi;
+     return $retval
+ }
+@@ -99,7 +99,7 @@ force_reload() {
+ 
+ rh_status() {
+     # run checks to determine if the service is running or use generic status
+-    status -p $pidfile $prog
++    status $prog
+ }
+ 
+ rh_status_q() {
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
deleted file mode 100644
index 46f6a7b3f..000000000
--- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Tue, 16 Jul 2019 19:59:23 +0300
-Subject: [PATCH] contrib: add yocto compatible startup scripts
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- contrib/unbound.init       | 10 +++++-----
- contrib/unbound.service.in |  4 ++--
- 2 files changed, 7 insertions(+), 7 deletions(-)
- mode change 100644 => 100755 contrib/unbound.init
-
-diff --git a/contrib/unbound.init b/contrib/unbound.init
-old mode 100644
-new mode 100755
-index cccadecc..4eba752b
---- a/contrib/unbound.init
-+++ b/contrib/unbound.init
-@@ -19,11 +19,11 @@
- ### END INIT INFO
- 
- # Source function library.
--. /etc/rc.d/init.d/functions
-+. /etc/init.d/functions
- 
- exec="/usr/sbin/unbound"
- prog="unbound"
--config="/var/unbound/unbound.conf"
-+config="/etc/unbound/unbound.conf"
- pidfile="/var/unbound/unbound.pid"
- rootdir="/var/unbound"
- 
-@@ -61,7 +61,7 @@ start() {
-     fi;
- 
-     # if not running, start it up here
--    daemon $exec
-+    daemonize $exec
-     retval=$?
-     echo
-     [ $retval -eq 0 ] && touch $lockfile
-@@ -71,7 +71,7 @@ start() {
- stop() {
-     echo -n $"Stopping $prog: "
-     # stop it here, often "killproc $prog"
--    killproc -p $pidfile $prog
-+    killproc $prog
-     retval=$?
-     echo
-     [ $retval -eq 0 ] && rm -f $lockfile
-@@ -99,7 +99,7 @@ force_reload() {
- 
- rh_status() {
-     # run checks to determine if the service is running or use generic status
--    status -p $pidfile $prog
-+    status $prog
- }
- 
- rh_status_q() {
-diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
-index 95976dd9..0e7f79a9 100644
---- a/contrib/unbound.service.in
-+++ b/contrib/unbound.service.in
-@@ -10,9 +10,9 @@ WantedBy=multi-user.target
- 
- [Service]
- ExecReload=/bin/kill -HUP $MAINPID
--ExecStart=@UNBOUND_SBIN_DIR@/unbound
-+ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
- NotifyAccess=main
--Type=notify
-+Type=simple
- CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
- MemoryDenyWriteExecute=true
- NoNewPrivileges=true
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_git.bb
similarity index 92%
rename from meta-networking/recipes-support/unbound/unbound_1.9.4.bb
rename to meta-networking/recipes-support/unbound/unbound_git.bb
index 6200214ac..eeaf85344 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
+++ b/meta-networking/recipes-support/unbound/unbound_git.bb
@@ -10,9 +10,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
-	file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
+	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV="b60c4a472c856f0a98120b7259e991b3a6507eb5"
+
+PV = "1.12.0"
+SRCREV="52b04806f4236c37acd10179ab465a54adc7e86a"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1

