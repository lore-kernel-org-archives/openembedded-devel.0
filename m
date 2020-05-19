Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.13266.1589899433392749186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pVkOPtBJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id j21so6495679pgb.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/SVo8HuHtUf02tBSoerYNphlig4HyL8ohcEDA59bH5Q=;
        b=pVkOPtBJolMCr949OtbCuSJ7xmTFD4/UqOpV51bHqK9GMy2EykKE+FkEBAOXhkZh0b
         40RDo/xAXcEJ+PDjGu9RxtVeu2h7pXhFz37AeI7TlM2Xu4rtIvgzQd6OCNWyU5Nlzsha
         qCxN0MZkncmvPvezlQ+wKQxDV6XgFbhSvfMV+rTXXUqP4aKhX3N0pvb+UNeNn6bTCBlu
         FUhbkubr8QVfI+y4Oe9TFRIm/l9XSTYYKB/H9tJ7bZZDiYJz3fb+/XrNueWN2cPADSfO
         R1/MmtaOtvSXWE6g6xtjFbW0TKJOpXWFGZ9hHjKfIZaZMMKyb7M7If9R0SyJLWlY1d+A
         3jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/SVo8HuHtUf02tBSoerYNphlig4HyL8ohcEDA59bH5Q=;
        b=KjUoLwA39fLDysZyL2jpltA9LgQP4cJmi/bg6gvGsDHyjbYEEtczEheU7CMVQfhRN2
         Uyneldhs10kgvOyX5Ra9kq1RdD7x8qRSmUg+hzjBk4jGm2yBw8EvP4rjjo21bmoAeJpO
         HppHMQO+eLOoqYFlnz/efdRNN+VQ+aNC7nHbYZxZhjn88O7fEkw18KQIm/ZhBTMagJ7x
         rEQRn1P5OuPBoMkZxZS1dOT63TX0FftQPdO9G+GjQtkHYr7HiMtF+5KbsZi/iYiVS6pP
         HsKq5+oGzxOXo+Nmwg7PRzcHbxoYLxjSo3N8v7C9sItBA5aXbGvKHqqhFbfssDMtLPFs
         h1aA==
X-Gm-Message-State: AOAM530MMN247k68SKumdCtqWJZk4ACIiiFDRKfh8SLicMJ386VEs1sP
	NZHgwvfOkulOqviyPEauzRGwdemI
X-Google-Smtp-Source: ABdhPJwnnj3My9bdC6VHq45M8vjcpGK92joF8e+xnAR3+Xe4+zbqA+y7BouY+GW0ipoIFcW3qaBtXg==
X-Received: by 2002:a62:1684:: with SMTP id 126mr22383834pfw.169.1589899432544;
        Tue, 19 May 2020 07:43:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 15/18] apache2: fix service start fail
Date: Tue, 19 May 2020 07:43:29 -0700
Message-Id: <20200519144332.12822-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. boot up target
2. scp apache2-2.4.41-r0.1.aarch64.rpm on target
3. rpm -i apache2-2.4.41-r0.1.aarch64.rpm
4. systemctl status apache2

Error:
httpd[7767]: (2)No such file or directory: AH02291: Cannot access directory '/var/log/apache2/' for main error log

with the old way, /var/log/apache2/ is created by service
systemd-tmpfiles-setup during boot, so only works when apache2
already installed before boot, in above scenario,
/var/log/apache2/ will not created. fix by creating it in the
service file. similar fix for sysV system

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e789c3837ca8d65abb4bac29dc2e5c595c8ce05b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb    | 8 --------
 .../recipes-httpd/apache2/files/apache2-volatile.conf     | 2 --
 .../recipes-httpd/apache2/files/apache2.service           | 4 ++++
 meta-webserver/recipes-httpd/apache2/files/init           | 5 +++++
 .../recipes-httpd/apache2/files/volatiles.04_apache2      | 3 ---
 5 files changed, 9 insertions(+), 13 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 delete mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 5200111520..9b80bbff67 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -20,9 +20,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 SRC_URI_append_class-target = " \
            file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
-           file://apache2-volatile.conf \
            file://apache2.service \
-           file://volatiles.04_apache2 \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
@@ -128,16 +126,10 @@ do_install_append_class-target() {
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
-    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
deleted file mode 100644
index ff2c587046..0000000000
--- a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-d  /var/run/apache2 0755 root root -
-d  /var/log/apache2 0755 root root -
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
index 9b5548c761..25d43acf8e 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2.service
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -5,6 +5,10 @@ After=network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 Environment=LANG=C
+ExecStartPre=mkdir -p /var/log/apache2
+ExecStartPre=mkdir -p /var/run/apache2
+ExecStartPre=chmod -R 0755 /var/log/apache2
+ExecStartPre=chmod -R 0755 /var/run/apache2
 ExecStart=@SBINDIR@/httpd -DFOREGROUND -D SSL -D PHP5 -k start
 ExecStop=@BASE_BINDIR@/kill -WINCH ${MAINPID}
 KillSignal=SIGCONT
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 758d133b9e..80a7ebfcb2 100644
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -97,6 +97,11 @@ do_start()
             return 1
     fi
 
+    mkdir -p /var/log/apache2
+    chmod -R 0755 /var/log/apache2
+    mkdir -p /var/run/apache2
+    chmod -R 0755 /var/run/apache2
+
     if apache_conftest ; then
             $APACHECTL start
             apache_wait_start $?
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
deleted file mode 100644
index 922075b1bd..0000000000
--- a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
+++ /dev/null
@@ -1,3 +0,0 @@
-# <type> <owner> <group> <mode> <path> <linksource>
-d root root 0755 /var/run/apache2 none
-d root root 0755 /var/log/apache2 none
-- 
2.17.1

