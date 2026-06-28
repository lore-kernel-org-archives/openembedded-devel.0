Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DFEC44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75146.1782663748500103295
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a8J431D6;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so5292592eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663748; x=1783268548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCu7hLk8al9lQnKF7xy5rLWUNouthxnsyrudBAV18Mo=;
        b=a8J431D6XVVBE0vHpiBgqm5poX43WF1lfS2rVPIpPZfFCkmV+LuyIEN6+hdb8fbv3G
         FtIS14tK5J10w6ITzG1QkUTclJRDSzs/HaHY+U2KHMTKWIIRlmoLiuVU6684oFDmXwD1
         K9hJDSkefhk94vQ8zp8ofPJqCeBd2QNWIs6Y1Oum+vxhPdgl6qiPGDX0T9j/+aDJR+y5
         bQl9ZuxZvP0vSEJc2qPn5VUasNLKxrOhEMTPP7/pPaSY9xx5e0dOlGpv0Q+MrquYHAiF
         uteTpUB0Nj7VC6O27S0t8+KVoQhl6ifW8uW2iXtviPmSIx972Xi18BouKd/T/qWCSFH0
         b+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663748; x=1783268548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCu7hLk8al9lQnKF7xy5rLWUNouthxnsyrudBAV18Mo=;
        b=kf7nQuwdJES8KvnGF6lXsNgi+dSz1gwOx1KPwAxg4xVqLaABy34wDHCthONtBUBUOb
         ICIB/KXIMhIKmvaEH6FF+6d6Xrl26pINQdFHl6BS6nC5Ly8syrfbDVh6ewxAX1D2tdi2
         CPk9mlfW27YR7XJni/pyaS1p29suBh8bnF3WFgioU8Ioz42PXx8rvkmMvAOK7b1Imm+V
         NeVTmGj/HzBsNuy+d4ND20twPWJSaRNzhfUblPcRqn/sziYAF+FU/wbWvncCYBd1YZmc
         sKXxJu8l8HulUHZVb9hOPpBR+6zSYuLgq/r9i2pJRggZ4tMXhlAG76uZey0P2SBkP2DU
         BbQw==
X-Gm-Message-State: AOJu0YyPZ3D9D8pb9T3YmnbqkNLMUDcyVcvLJC+TIzTf++Vc8cEOxp+u
	oSA1lfptU16UvFeW443/EOz3QClroXOnTbwGckDJmC+8y6efAyJQ8t6uYgJZBI+dAcXTNg==
X-Gm-Gg: AfdE7clOZ+n07sHtOXXKcSLjxLyxGq99O7F6ox727fpcGe43SQf8G9amcguYGnPC2Ty
	i51Ea7Msc7pWF62r1PyrjJRBl9XpSmCHbAwR3iyKTNV5OgHef/TACZTu8hKWhAwkDcO50Chi8iL
	aNhe+5JrvaLAUUf6y14d7jWR8gQtn1RtxnC+sf4HhuXG7yynf5FxVlqlCYuPikpSWfGrBP4hzUZ
	l/WJYCwRQBpaiuQMjAMtlLl6X0xFIXUZMUWO79N8lFfj/bC7u+QmnEqfPYBzrSOBt1aUUdEr2eX
	M0cw3fJwI9BWlMzdDszZX4ukJaZqh9LEcZAMtw6+F67kkkBqs08GtA3UnT6g7CcWzd43ybxe9Ln
	TStYFKhB8ixVPs7CAF466sYv6sLonVzcR6cqUMzGgnyjpNVUv91FCTerK9/3KbsCQ3l8nsIOZCW
	tkjK+nVd/M+pfKcjIyMU8kJrk7eeHfGVLGC6MZ2rQqTOTdEHG1oX2rHP/oceoubSaXDQcFxnJ+A
	j5HDDh/9aKHHzN/hqkh3K5Wfb53W5WCHOIUydHH0sKitRpUST3c3uDx73s3bwd0FJmiFVbzIoou
	sDlbXfa7wmi+y48Rmw2k0qBZC7QV/g==
X-Received: by 2002:a05:7300:e6c1:b0:30c:6673:39a6 with SMTP id 5a478bee46e88-30cab09689bmr7222038eec.14.1782663747609;
        Sun, 28 Jun 2026 09:22:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 101/128] networkmanager-openconnect: only require webkit2gtk for the auth dialog
Date: Sun, 28 Jun 2026 09:21:55 -0700
Message-ID: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127911

The webkit2gtk pkg-config check was unconditional, but WEBKIT is only
used by the GNOME auth dialog. Move it under the with-gnome guard

add webkitgtk3 to the gnome PACKAGECONFIG deps

ship the D-Bus system policy file.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...quire-webkit2gtk-when-building-the-a.patch | 54 +++++++++++++++++++
 .../networkmanager-openconnect_1.2.10.bb      |  7 ++-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect/0001-configure-only-require-webkit2gtk-when-building-the-a.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect/0001-configure-only-require-webkit2gtk-when-building-the-a.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect/0001-configure-only-require-webkit2gtk-when-building-the-a.patch
new file mode 100644
index 0000000000..ba4752dd4b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect/0001-configure-only-require-webkit2gtk-when-building-the-a.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jun 2026 00:00:00 +0000
+Subject: [PATCH] configure: only require webkit2gtk when building the auth
+ dialog
+
+The webkit2gtk pkg-config module (webkit2gtk-4.1 / -4.0) is only ever used
+by the GNOME authentication dialog (auth-dialog/nm-openconnect-auth-dialog),
+which is built only when WITH_GNOME && WITH_AUTHDLG. However configure.ac
+runs PKG_CHECK_MODULES(WEBKIT, ...) unconditionally, so a VPN-service-only
+build configured with --without-gnome (and hence without the auth dialog)
+still hard-fails with:
+
+    configure: error: Neither webkit2gtk-4.0 nor webkit2gtk-4.1 found
+
+Move the WEBKIT check inside the "with_authdlg" block (next to the
+OPENCONNECT check which is already guarded the same way) so that webkit2gtk
+is only required when the auth dialog is actually being built.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1111111..2222222 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -145,10 +145,6 @@ if test x"$with_gtk4" != xno; then
+ 	PKG_CHECK_MODULES(LIBNMA_GTK4, libnma-gtk4 >= 1.8.33)
+ fi
+
+-PKG_CHECK_MODULES(WEBKIT, webkit2gtk-4.1, [wekbit=4.1],
+-			  [PKG_CHECK_MODULES(WEBKIT, webkit2gtk-4.0,
+-			  [webkit=4.0], AC_MSG_ERROR(Neither webkit2gtk-4.0 nor wekit2gtk-4.1 found))])
+-
+ PKG_CHECK_MODULES(LIBNM, libnm >= 1.2.0)
+ LIBNM_CFLAGS="$LIBNM_CFLAGS -DNM_VERSION_MIN_REQUIRED=NM_VERSION_1_2"
+ LIBNM_CFLAGS="$LIBNM_CFLAGS -DNM_VERSION_MAX_ALLOWED=NM_VERSION_1_4"
+@@ -165,6 +161,10 @@ else
+ fi
+ if test x"$with_authdlg" != xno; then
+ 	PKG_CHECK_MODULES(OPENCONNECT, openconnect >= 3.02)
++	PKG_CHECK_MODULES(WEBKIT, webkit2gtk-4.1, [webkit=4.1],
++			  [PKG_CHECK_MODULES(WEBKIT, webkit2gtk-4.0,
++			  [webkit=4.0],
++			  AC_MSG_ERROR(Neither webkit2gtk-4.0 nor webkit2gtk-4.1 found))])
+ fi
+ AM_CONDITIONAL(WITH_AUTHDLG, test x"$with_authdlg" != xno)
+
+--
+2.43.0
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
index c3f9b9f806..b5bf715d38 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
@@ -9,14 +9,16 @@ DEPENDS = "glib-2.0-native intltool-native libxml2 networkmanager openconnect"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase useradd
 
-SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/NetworkManager-openconnect-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/NetworkManager-openconnect-${PV}.tar.xz \
+           file://0001-configure-only-require-webkit2gtk-when-building-the-a.patch \
+"
 
 SRC_URI[sha256sum] = "844b6bf64ecadb97b4a68c776db89aa5e6ee7e59bd24b0180228406863136464"
 
 S = "${UNPACKDIR}/NetworkManager-openconnect-${PV}"
 
 # meta-gnome in layers is required using gnome:
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 gcr3 libnma libsecret,"
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 gcr3 libnma libsecret webkitgtk3,"
 PACKAGECONFIG[gtk4] = "--with-gtk4,--without-gtk4,gtk4,"
 
 do_configure:append() {
@@ -35,6 +37,7 @@ USERADD_PARAM:${PN} = "--system nm-openconnect"
 FILES:${PN} += " \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openconnect-service.name \
+    ${datadir}/dbus-1/system.d \
 "
 
 FILES:${PN}-staticdev += " \

