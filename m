Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.18200.1590941809661720731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=phe7T112;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id fs4so3938722pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BgRp1fgrI75avIFh7Mq6DeQHrQe6pUYZIQBOGTNnGiI=;
        b=phe7T112pkAG+1j3nTB/VMn0UIKyjshhNTgTADn2HVlRk25M/vDi8VuapE/ad5czxt
         PbfJ9t6buAdLCPZwBmFglDNevxiiWiuAGcoTiXfXDRD/0cDKXyL9OwH7RacgqFXeRW7a
         9T5tgX+VaoFjKAUZUhQLmG4HBeq0u/9G5cAs8709Y5/zyNikmcqfE6m3M5rrmIpPX+EU
         ZBH/RUzE+urZyY1cjLTomGNXwJIhVr4MV6RtNPaqduAjR+xH0RO6agHh0VuALKdSWDo6
         yq3E5bgWyfBNwRGEQWC2+CiJqR2O2byR880uIJH4hFVP9dEGvza9ke4M+B2W/+IcZnHS
         hvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BgRp1fgrI75avIFh7Mq6DeQHrQe6pUYZIQBOGTNnGiI=;
        b=lNPfdBCn034xWfbVGQcwZrBBzMHS58rMujZaiIxxs3DcSIdB1OBymHN840ToBVE25+
         OComOu+mioYdaW7PUPdwa2/GyCfT5LeUG+EW89aTiaPzL9zkjhXc2XjBrPDzWBVsOd6T
         RMdmcmCk5sQgAmtxvlD2bL1AvJVsimj20zTMo0vu85BKsdMvOwfbHrZHdoFC5imaltBd
         ELzWwfoswvyIJ0MqkoOdPXnWWy2kU9rJ1iNVwi90Ab12koHKi4lOVv4KQMTggK9PyB8J
         CsmeoF8Fcvpb1HZn9uK2oGuSfJgoSpXkWi0fQKGas4Btaejw7x1CmrIUQXaLFYi6zG+z
         GyqQ==
X-Gm-Message-State: AOAM532Tb+RRC8chqTP1624K/e0ydY6XDDZTYqfXGS8gSF22au6mwnJz
	JHTeqLRH3dOvOj/3IO4DyVbcVCpg
X-Google-Smtp-Source: ABdhPJzTojcf2Pg7jwA4px9Yp4v9Lg9D3qj5RXLMW8gQCJxGQ85D1sVxj1o/slRzoFSLm7dWka9dEQ==
X-Received: by 2002:a17:902:c411:: with SMTP id k17mr13842331plk.165.1590941808962;
        Sun, 31 May 2020 09:16:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 20/35] apache2: create log/run directory via pkg_postinst
Date: Sun, 31 May 2020 09:16:07 -0700
Message-Id: <1a42752afa43202a26b7185561007a081d9782bf.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

The commit e789c3837ca8d65abb4bac29dc2e5c595c8ce05b tries to create
log/run directory in initscript/systemd unit file. This is not a correct
method. We should create them in pkg_postinst.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6f4d0dbfbc7d5ab8c5781379884f41d30cb6db25)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/apache2_2.4.43.bb    | 18 ++++++++++++++++++
 .../apache2/files/apache2-volatile.conf        |  2 ++
 .../apache2/files/apache2.service              |  4 ----
 .../recipes-httpd/apache2/files/init           |  5 -----
 .../apache2/files/volatiles.04_apache2         |  3 +++
 5 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
index 9b80bbff67..a7083d80e9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
@@ -20,7 +20,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 SRC_URI_append_class-target = " \
            file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
+           file://apache2-volatile.conf \
            file://apache2.service \
+           file://volatiles.04_apache2 \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
@@ -126,10 +128,16 @@ do_install_append_class-target() {
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
@@ -206,3 +214,13 @@ RDEPENDS_${PN}-scripts += "perl ${PN}"
 RDEPENDS_${PN}-dev = "perl"
 
 BBCLASSEXTEND = "native"
+
+pkg_postinst_${PN}() {
+    if [ -z "$D" ]; then
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
new file mode 100644
index 0000000000..ff2c587046
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
@@ -0,0 +1,2 @@
+d  /var/run/apache2 0755 root root -
+d  /var/log/apache2 0755 root root -
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
index 25d43acf8e..9b5548c761 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2.service
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -5,10 +5,6 @@ After=network.target remote-fs.target nss-lookup.target
 [Service]
 Type=simple
 Environment=LANG=C
-ExecStartPre=mkdir -p /var/log/apache2
-ExecStartPre=mkdir -p /var/run/apache2
-ExecStartPre=chmod -R 0755 /var/log/apache2
-ExecStartPre=chmod -R 0755 /var/run/apache2
 ExecStart=@SBINDIR@/httpd -DFOREGROUND -D SSL -D PHP5 -k start
 ExecStop=@BASE_BINDIR@/kill -WINCH ${MAINPID}
 KillSignal=SIGCONT
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index 80a7ebfcb2..758d133b9e 100644
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -97,11 +97,6 @@ do_start()
             return 1
     fi
 
-    mkdir -p /var/log/apache2
-    chmod -R 0755 /var/log/apache2
-    mkdir -p /var/run/apache2
-    chmod -R 0755 /var/run/apache2
-
     if apache_conftest ; then
             $APACHECTL start
             apache_wait_start $?
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
new file mode 100644
index 0000000000..922075b1bd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/run/apache2 none
+d root root 0755 /var/log/apache2 none
-- 
2.17.1

