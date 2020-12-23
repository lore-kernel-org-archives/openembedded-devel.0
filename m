Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6025.1608708216390721197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 23:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5fF4Yt9;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id lb18so2566305pjb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 23:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5aVJmJjDu36qwsaESaSmuXgV1QTA2zBGoOUKPOOr+c=;
        b=D5fF4Yt9I/4bF5Ejf+W435Rw1KKgu0i4Tmyh4QNRuGo0xFtgaPf2DfjFaJsXKjMQxw
         YlqFPReK43RVWjSu5LbChgz0fXj+0mXDb/JmYGeuGIQ/59YnhudpAaG/6F1qvypx+cjp
         K2bYyFZon0cdLu7Fuf+XfF9IcdBOFTGbuaxpJv+JadhmQRphHAvDdLYuVysZtTqwj2Db
         vp0m45EroEiICmw8V9aKpHuF1YaV7ukWRCzwR6aTIc4KXgeoDxaXA4qJO/gieJsjPakz
         ze2quIGa4MdrE2J4yoAtD/3kq0SgcvthfFVHP4h1gQbtNBAdhkaDz5/ge4tgzF9F2poa
         4GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5aVJmJjDu36qwsaESaSmuXgV1QTA2zBGoOUKPOOr+c=;
        b=DyUgxU0jVKV6AKagg0rrmuFwybyuttKcCaRlmYgdqTV67pP7jYFNRsxDeAonQRE/aR
         fJfuEeOkCFgJnRv0ckjS6Ux6ECCDIr837ZIadmDOp016i6UIJ/A1pjKqT3cKCqPMzhHW
         pa558VsFy6Dbf8Vi6lVp3218ePqKqkjzcGs/TGq+gZO//mhKvc2NE8DtU2ptVfbANx4/
         H+j+RZUHtOtrN8mgETFXHgqH5uXv9DB9Coi4i+RDayjL2hBLRB406+oJBRiMMhpOt78L
         U03sRZUI5QA0Me6Xi6RuKhyZHkez3EMO273xdw2KBxeEbuZPQf2I9XXvQalNGKOzB8a0
         1C0g==
X-Gm-Message-State: AOAM530FP151D5ku6ZiTt4N9QC2uVUSfNeLtxczsmtVrrn83VKiiir63
	Zu4iocQUIwXlhUZf47oqykMsllJuI4rK4Q==
X-Google-Smtp-Source: ABdhPJxdt2ylxS6Jzzy0ilnf8GdPiuqpgaM8jVu+T36eRYSmAxXFbzlUxFtnbev2maWCS5jb1ab+Eg==
X-Received: by 2002:a17:90b:2355:: with SMTP id ms21mr25479348pjb.125.1608708215527;
        Tue, 22 Dec 2020 23:23:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id u189sm22162517pfb.51.2020.12.22.23.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 23:23:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] xrdp: Upgrade to 0.9.14
Date: Tue, 22 Dec 2020 23:23:32 -0800
Message-Id: <20201223072332.1132821-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant setting of PV in recipe
Fix build on riscv and musl
Do not install xrdp.sh, it does not exist anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with riscv/musl

 ...0001-correct-the-location-of-errno.h.patch | 30 +++++++++++++++++++
 ...esn-t-require-pointers-to-be-aligned.patch | 28 +++++++++++++++++
 .../xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb}   | 18 +++++------
 3 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb} (90%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
new file mode 100644
index 0000000000..b06077bf02
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
@@ -0,0 +1,30 @@
+From c8d3df40ece7d659ccc8212b18de916d28f4398a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Dec 2020 23:10:52 -0800
+Subject: [PATCH] correct the location of errno.h
+
+Fixes build on musl
+
+Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/1761]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sesman/chansrv/sound.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sesman/chansrv/sound.c b/sesman/chansrv/sound.c
+index b0480d33..45e17307 100644
+--- a/sesman/chansrv/sound.c
++++ b/sesman/chansrv/sound.c
+@@ -23,7 +23,7 @@
+ #include <stdio.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <signal.h>
+ #include <sys/un.h>
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
new file mode 100644
index 0000000000..4cd26df04c
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
@@ -0,0 +1,28 @@
+From 229206aa5e55a6e26a074a54a1b50139ab794b36 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Dec 2020 23:01:13 -0800
+Subject: [PATCH] riscv doesn't require pointers to be aligned
+
+Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/1761]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/arch.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/common/arch.h b/common/arch.h
+index ccccfa5a..8c2ac1a4 100644
+--- a/common/arch.h
++++ b/common/arch.h
+@@ -84,7 +84,8 @@ typedef int bool_t;
+ #define NEED_ALIGN
+ #elif defined(__x86__) || defined(__x86_64__) || \
+       defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
+-      defined(__i386__) || defined(__aarch64__)
++      defined(__i386__) || defined(__aarch64__) || \
++      defined(__riscv)
+ #define NO_NEED_ALIGN
+ #else
+ #warning unknown arch
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
similarity index 90%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
index deda0fd1b5..955c3007e4 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
@@ -10,15 +10,14 @@ DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
+SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
+           file://0001-riscv-doesn-t-require-pointers-to-be-aligned.patch \
+           file://0001-correct-the-location-of-errno.h.patch \
            "
-
-SRCREV = "1e4b03eb3c9aa7173de251a328c93c073dcc0fca"
-
-PV = "0.9.11"
+SRCREV = "1469d659dbccd6d042ac44f0afc4e1309788dc9d"
 
 S = "${WORKDIR}/git"
 
@@ -52,15 +51,15 @@ do_compile_prepend() {
 
 
 do_install_append() {
-	install -d ${D}${sysconfdir} 
+	install -d ${D}${sysconfdir}
 	install -d ${D}${sysconfdir}/xrdp
 	install -d ${D}${sysconfdir}/xrdp/pam.d
 	install -d ${D}${sysconfdir}/sysconfig/xrdp
-   
+
 	# deal with systemd unit files
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${S}/instfiles/xrdp.service.in ${D}${systemd_unitdir}/system/xrdp.service
-	install -m 0644 ${S}/instfiles/xrdp-sesman.service.in ${D}${systemd_unitdir}/system/xrdp-sesman.service 
+	install -m 0644 ${S}/instfiles/xrdp-sesman.service.in ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@sysconfdir@,${sysconfdir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
@@ -70,7 +69,6 @@ do_install_append() {
 	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp.ini.in ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp_keyboard.ini ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/instfiles/xrdp.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${WORKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
 	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
@@ -92,6 +90,6 @@ pkg_postinst_${PN}() {
 			-out ${sysconfdir}/xrdp/cert.pem \
 			-config ${sysconfdir}/xrdp/openssl.conf >/dev/null 2>&1
 			chmod 400 ${sysconfdir}/xrdp/key.pem
-		fi			
+		fi
         fi
 }
-- 
2.29.2

