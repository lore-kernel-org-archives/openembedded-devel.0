Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.7797.1608793200638576831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Dec 2020 23:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PLmLunag;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id q4so881697plr.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Dec 2020 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lcxhU+fhI2aBvuIzxxrM1tUIOupk2lPgQTb7FbX9oKk=;
        b=PLmLunagGBFsquTcPJI5086tAirYfXWALd+paV1FI7FVl2wcPQQ6hYzUf12sf1s2Nr
         Tz8q6VdXFv3uq3nA4NsVbmaszxtH7rSv22ArYAD/J/fGWc/HF0h907XNrJ20UTkG9Er7
         j5Ae+8p3skkARD+baQyBOJxK0zC+DdZODHTS0LBQEmgwYq/ouhgNj7XKJT2KFx7Gvnzz
         Kc6LqObPM32jpDQ1DVwyJZUn2nj7vwJ4KLylCUn7qLupF2VDvbCXgX7DVq8hr1dndLT5
         bj8FqipRujVPEJgWSK+lwLsNSKouopD+vZA9F9aoxNXlNFHNx23ncj+hnQMWlH8hjGd4
         kAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lcxhU+fhI2aBvuIzxxrM1tUIOupk2lPgQTb7FbX9oKk=;
        b=DFhm3JToND/iWfoWxNrRIwfvN+5Iwg2IiEMFaalWYdhsBzcKZ8VwqzMYlNe/XvbS2b
         zEiO3Ad4CitJiA2BEXch5seV72Z8JmAES76/dLKKJXQPEHsXo03jCUyUFr4w++FBW8oE
         Gn1nGaG/80xNqr53aGdRayltvDgmifEfNZZERKiHICa62+of/aTLZS6HB5OWjctb4Azb
         +aoCLKseTbo2X3kZOoUi3qutHHrJ3ZfptSaxnFCdo70SpBA6IBsB6RBlThogUQy1W4Mn
         1PUwPQZ+H07e7StQKauEag7Avv1aQ7Gai+7Ud7Dy0A7c/IWUxi9BxOh4RO18ANmHUm8y
         6JHA==
X-Gm-Message-State: AOAM533713XFbJ6OYjZV1ps3H/3jToy1y4d7eRn847m06kU4kjl+OLha
	jAd6P0/3Xx5i2m8OIZsvU5PDTJId9ASs5Q==
X-Google-Smtp-Source: ABdhPJxvgHKHG3Ym7AIiNVe14QRIjCuOXnoxkegmSXWu9WgTJkUz47KogYz9BWJoOjIci09GViNODw==
X-Received: by 2002:a17:90a:e60d:: with SMTP id j13mr3224155pjy.52.1608793199864;
        Wed, 23 Dec 2020 22:59:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id r20sm18840034pgb.3.2020.12.23.22.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 22:59:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] xrdp: Upgrade to 0.9.14
Date: Wed, 23 Dec 2020 22:59:52 -0800
Message-Id: <20201224065952.3714857-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224065952.3714857-1-raj.khem@gmail.com>
References: <20201224065952.3714857-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant setting of PV in recipe
Fix build on riscv and musl
Do not install xrdp.sh, it does not exist anymore
Fix build with gcc 9+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with riscv/musl
v3: Fix build with gcc9+

 ...-warnings-about-snprintf-truncations.patch | 28 +++++++++++++++++
 ...0001-correct-the-location-of-errno.h.patch | 30 +++++++++++++++++++
 ...esn-t-require-pointers-to-be-aligned.patch | 28 +++++++++++++++++
 .../xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb}   | 19 ++++++------
 4 files changed, 95 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb} (88%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
new file mode 100644
index 0000000000..5b9315cfb4
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
@@ -0,0 +1,28 @@
+From 9de23a9199d26e64ab6b5be2bb74f260200b2dc5 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Fri, 21 Aug 2020 12:20:31 +0100
+Subject: [PATCH] Fixed compiler warnings about snprintf truncations
+
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/pull/1659]
+---
+ common/log.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/common/log.c b/common/log.c
+index 4a0bd2f3..8686789d 100644
+--- a/common/log.c
++++ b/common/log.c
+@@ -555,9 +555,7 @@ log_message(const enum logLevels lvl, const char *msg, ...)
+     now_t = time(&now_t);
+     now = localtime(&now_t);
+ 
+-    snprintf(buff, 21, "[%.4d%.2d%.2d-%.2d:%.2d:%.2d] ", now->tm_year + 1900,
+-             now->tm_mon + 1, now->tm_mday, now->tm_hour, now->tm_min,
+-             now->tm_sec);
++    strftime(buff, 21, "[%Y%m%d-%H:%M:%S] ", now);
+ 
+     internal_log_lvl2str(lvl, buff + 20);
+ 
+-- 
+2.29.2
+
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
similarity index 88%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
index deda0fd1b5..078e23c6ed 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
@@ -10,15 +10,15 @@ DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
+SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
+           file://0001-riscv-doesn-t-require-pointers-to-be-aligned.patch \
+           file://0001-correct-the-location-of-errno.h.patch \
+           file://0001-Fixed-compiler-warnings-about-snprintf-truncations.patch \
            "
-
-SRCREV = "1e4b03eb3c9aa7173de251a328c93c073dcc0fca"
-
-PV = "0.9.11"
+SRCREV = "1469d659dbccd6d042ac44f0afc4e1309788dc9d"
 
 S = "${WORKDIR}/git"
 
@@ -52,15 +52,15 @@ do_compile_prepend() {
 
 
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
@@ -70,7 +70,6 @@ do_install_append() {
 	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp.ini.in ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp_keyboard.ini ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/instfiles/xrdp.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${WORKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
 	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
@@ -92,6 +91,6 @@ pkg_postinst_${PN}() {
 			-out ${sysconfdir}/xrdp/cert.pem \
 			-config ${sysconfdir}/xrdp/openssl.conf >/dev/null 2>&1
 			chmod 400 ${sysconfdir}/xrdp/key.pem
-		fi			
+		fi
         fi
 }
-- 
2.29.2

