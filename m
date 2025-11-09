Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F9ECCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 14:54:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25955.1762700041195376105
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 06:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cp1FAaRJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b9ef786babcso1404881a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762700040; x=1763304840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HExgIX9kRex5aUpv1CbSUCGRNpZ/PjiPwSKbgjN1o+U=;
        b=cp1FAaRJK47c7DF9ThoiKMSvFceZBLwLkIq5JumAshkSAq0HPYBh1YQLGVl7yW5mdX
         f3Dx4ORkhhoS8LmluDAWjOd59FSefZ76u7OO2d4kkpZeIb1GXIoHvz4szoQvyNy+YH5D
         DUQTe8M+zDbVWq9P1Io0Kk1V9hC8HpDMRIyYSkWGNBHSRmbRxP0hO09AIwj1K/2QdXQ6
         xYUmoGW0JYuE2e0ONDW4ueBWYtJdJpoQQ4usMdtQJZ8HYT6pSdgDQG4C4n3fqPAnOpxK
         wTuuB7PMO8nOuGR4SFq8AVrUc36Z5m696MnPvKMwAzOzqYRdZ3sWCtK3NvMifYuxLarJ
         yQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762700040; x=1763304840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HExgIX9kRex5aUpv1CbSUCGRNpZ/PjiPwSKbgjN1o+U=;
        b=NVpNMQjVhKc4qjsQgFPGytSMRubLlisXoa1rb9nBsCinGHmaHBIk4u3lfVKtOVE1yX
         DtDizHLo7vOfVnQHY2uOhGOi34/JVvUoNbhG7ec55oJ8Aa+CIXhCc8ExTjgaa7atGx93
         VF4az7Uso6DPjTt65BC8xr8eseXGeXJbcoX85mQIo8DhtL0NcNqgr4moCZhd4Sr0RwAS
         IoUJUPOD5dvyKczEQoENCop7hGY0WcZkzKLTBWi485WoOLfxuCQKs0pXjEhWFdrOHd53
         VgyDap6hN2HpSghG0/sEbVvDI6psmaF9IPzWWEqWRA36wVCIjg1ek0EOk4y8La/NRWlr
         usWw==
X-Gm-Message-State: AOJu0Yz5F+nWG2fhwLHDpX/9F7yn/EzI1RD0HQjZYeqn0v6WNnG17EBr
	+H8djtaO8HVV3wfJdMKjWtSRCa1X2xqT5oW297J4INhhA8vgS62SpCJXxgPB8QNn
X-Gm-Gg: ASbGnctcj/YIe5GTQbZEjN2vOx5uRJ8k3iXYf6Z453zPlI52ZdOMSzHi7n+n4RVeBMZ
	i6VRJXt3xzW/rmRmFTj/KeC/fHYPl9r0rbIrSRfqsLG9T+xtC6SaBxkisPj2FTQIBxMkow041sy
	GpzM8gpmZ13Md7X06NMyjjI3XmH/9R7w02yNCi5lbhyShj568q75BR4L23poNP0NEjddEirA03F
	T/fKVOvXN4s+0FzNAOmZybRvLvsRmG5ygFSetLE5E56F/FPkQuYDtyZtito4dxyREio4Ut4EqCf
	qvVbRuOA9musQyYtqVjmlFsVFwJobiECZjKpz/6dWh0w1MZqwmQ/6feWZCoIk2RtuEZnYyWKpol
	iBDgTGJKsxHAlkGElKadUvlYlczSWRXsbQzPcf5h0hnMH3f4O3zv8ek6Drc09MoO4mvAIbwZlty
	9jedcMDzrffCjjQMgKjsDIrKxfrXq1fxQctmdrxEcQhvxgQ4e1oLIxSfQDbUjXEw==
X-Google-Smtp-Source: AGHT+IEyXxiiUJ57VzWc9eGavPJGOGRMUWJQ3J7i+qaOigFJCzHhSl2Us39vl1sTWhtN+/8LGMnkCQ==
X-Received: by 2002:a17:902:da4b:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-297e54029d0mr69518155ad.12.1762700040083;
        Sun, 09 Nov 2025 06:54:00 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93cebsm116223735ad.90.2025.11.09.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:53:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] atftp,tftp-hpa,vsftpd,dante,stunnel: Disable and remove tcp-wrapper support
Date: Sun,  9 Nov 2025 06:53:56 -0800
Message-ID: <20251109145357.784999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 14:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121415

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/atftp/atftp_0.8.0.bb      |  3 +--
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb  |  2 +-
 .../recipes-daemons/vsftpd/files/vsftpd.conf  | 12 ++++-----
 .../nopam-with-tcp_wrappers.patch             | 26 -------------------
 .../vsftpd-tcp_wrappers-support.patch         | 26 -------------------
 .../recipes-daemons/vsftpd/vsftpd_3.0.5.bb    | 10 ++-----
 .../recipes-protocols/dante/dante_1.4.3.bb    |  2 --
 .../recipes-support/stunnel/stunnel_5.76.bb   |  3 +--
 8 files changed, 11 insertions(+), 73 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
index eca004302b..9db0aebccb 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
@@ -14,9 +14,8 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \

 inherit autotools update-rc.d systemd

-PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-libpcre,--disable-libpcre,libpcre"
-PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline"

 INITSCRIPT_PACKAGES = "${PN}d"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index b5a2b9dae0..96c9bdb653 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -5,7 +5,7 @@ booting diskless workstations.  The tftp package provides the user   \
 interface for TFTP, which allows users to transfer files to and from a \
 remote machine.  This program and TFTP provide very little security, \
 and should not be enabled unless it is expressly needed."
-DEPENDS = "tcp-wrappers readline"
+DEPENDS = "readline"
 SECTION = "net"
 HOMEPAGE = "http://freecode.com/projects/tftp-hpa"
 LICENSE = "BSD-4-Clause"
diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
index bb1929480d..5bf26fceb0 100644
--- a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
+++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
@@ -110,14 +110,14 @@ xferlog_std_format=YES
 pam_service_name=vsftpd
 #
 # This option is examined if userlist_enable is activated. If you set this
-# setting to NO, then users will be denied login  unless  they are  explicitly
-# listed  in the file specified by userlist_file.  When login is denied, the
+# setting to NO, then users will be denied login  unless  they are  explicitly
+# listed  in the file specified by userlist_file.  When login is denied, the
 # denial is issued before the user is asked for a password.
 userlist_deny=YES
 #
 # If enabled, vsftpd will load a list of usernames, from the filename given by
 # userlist_file.  If a user tries to log in using  a  name in  this  file,  they
-# will be denied before they are asked for a password. This may be useful in
+# will be denied before they are asked for a password. This may be useful in
 # preventing cleartext passwords being transmitted. See also userlist_deny.
 userlist_enable=YES
 #
@@ -127,13 +127,13 @@ userlist_enable=YES
 use_localtime=YES
 #
 # If set to YES, local users will be (by default) placed in a chroot() jail in
-# their home directory after login.  Warning: This  option has  security
+# their home directory after login.  Warning: This  option has  security
 # implications,  especially  if  the users have upload permission, or shell access.
 # Only enable if you know what you are doing.  Note that these security implications
-# are not vsftpd specific. They apply to all FTP daemons which offer to put
+# are not vsftpd specific. They apply to all FTP daemons which offer to put
 # local  users in chroot() jails.
 chroot_local_user=YES
 #
 allow_writeable_chroot=YES
 #
-tcp_wrappers=YES
+tcp_wrappers=NO
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
deleted file mode 100644
index a4387c132b..0000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/nopam-with-tcp_wrappers.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 71628ddc91b6efb9b922a3fcf8cc18522f5387be Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Mon, 20 Feb 2012 13:51:49 +0000
-Subject: [PATCH] Disable PAM
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
----
- builddefs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/builddefs.h b/builddefs.h
-index 0106d1a..f48a568 100644
---- a/builddefs.h
-+++ b/builddefs.h
-@@ -2,7 +2,7 @@
- #define VSF_BUILDDEFS_H
-
- #define VSF_BUILD_TCPWRAPPERS
--#define VSF_BUILD_PAM
-+#undef VSF_BUILD_PAM
- #undef VSF_BUILD_SSL
-
- #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
deleted file mode 100644
index c558aee0aa..0000000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/vsftpd-tcp_wrappers-support.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c026b0c0de4eebb189bc77b2d4c3b9528454ac04 Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Fri, 19 Jul 2013 10:19:25 +0800
-Subject: [PATCH] Enable tcp_wrapper.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
----
- builddefs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/builddefs.h b/builddefs.h
-index e908352..0106d1a 100644
---- a/builddefs.h
-+++ b/builddefs.h
-@@ -1,7 +1,7 @@
- #ifndef VSF_BUILDDEFS_H
- #define VSF_BUILDDEFS_H
-
--#undef VSF_BUILD_TCPWRAPPERS
-+#define VSF_BUILD_TCPWRAPPERS
- #define VSF_BUILD_PAM
- #undef VSF_BUILD_SSL
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 9b2be6236b..f2c27606e1 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -18,7 +18,6 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
            file://vsftpd-2.1.0-filter.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)} \
            file://0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch \
            "
@@ -31,15 +30,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
 SRC_URI[sha256sum] = "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3"

-
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
-WRAPLIB = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '-lwrap', '', d)}"
-NOPAM_SRC = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
+NOPAM_SRC = "file://nopam.patch"

 inherit update-rc.d useradd systemd

@@ -56,7 +50,7 @@ do_configure() {
 }

 do_compile() {
-   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} ${WRAPLIB}"
+   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB}"
 }

 do_install() {
diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
index 4badff8bbd..901167f1b3 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
@@ -33,8 +33,6 @@ REQUIRED_DISTRO_FEATURES = "pam"

 EXTRA_AUTORECONF = "-I ${S}"

-PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
-
 PACKAGECONFIG ??= ""

 do_install:append() {
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.76.bb b/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
index 4121044560..dcd3d8cdf1 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
@@ -15,10 +15,9 @@ SRC_URI[sha256sum] = "cda37eb4d0fb1e129718ed27ad77b5735e899394ce040bb2be28bbb937

 inherit autotools bash-completion pkgconfig

-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} libwrap"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)}"

 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[libwrap] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"

 EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"

