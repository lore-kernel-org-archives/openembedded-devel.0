Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976D1C9832B
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 21:50:59 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4478.1768686654482528033
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 13:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZO3wk+cq;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64472c71fc0so2765616d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768686653; x=1769291453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUiidEj4Q9CbrQsHxZdLBcEh03cChhAWyGlT05G7b1A=;
        b=ZO3wk+cqiw4FFEMvymJEpY8eMyF64QIbEv2RHJVnM3GTPOr5n/ReUKKNxodqKfZqP4
         H3mLRyMmfNSN7HSTIZErrwXw5nawIPE6dRBTkbHI58T1hBMUMMkLdUuMs2/4TPUdNMah
         xc0f8N95PWJ3C+fN0LA9e+Z+vaEfsNQDKkAQj1u8VPozYv3KG3ERNeqaZNJG9rQsn1rd
         8E5+GLylxSmE2EkzBgpaoUqjOE8j6sKJ5l7/GJFYnoMZ3UaWh5AR5dhlstPq2KEl42Zb
         OOlIum7FoIfeNXlKto9JJYFY4zv1hTqv+3Ij5kbT2GDNt3+xLv8OLrc2DF0kIYU5vLpO
         rN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686653; x=1769291453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUiidEj4Q9CbrQsHxZdLBcEh03cChhAWyGlT05G7b1A=;
        b=dBgGlS+t7H+iLlbx+Bc4+Vcuk0BqCqqHjQjLoj+gNBabSP+g1TIZ9FcixbevYv8iem
         aDrii2zL51hkHHpudH4R/HNk7p6ztAeYgNUQsHTigK6PzE85miOP/qEH6MmtzNlTOOzl
         ZBRgy2emIg7/bN4cYNH6esCM7/OjlhmDBCo1SwNPIVhA1P2zjWgx7+CrD4X4RLlDlAFs
         xXEd2CMGM3pN/JiefLjCI9g7sLYy05WSWa1U6UDsrBO8tYxDfBmqs5r4atYbo+TMgGQy
         koCB5goJFdLJTw9gsXuNjM7Pt8XWC4sKXNreXYj+hFB2lz/W1MwN++i/T/ccj0dS1Hpx
         kCiQ==
X-Gm-Message-State: AOJu0YwOu/Q+mLnPFvKEY9AXe/Dn8RyqUDjUnRHws8oNE1geJMy29mca
	QdExJvHeYNYwVViXrF/MFymRWwCF3r/mXWd9rsRw2NSxyOK5h+nqWxWSmOH5pg17
X-Gm-Gg: AY/fxX7yFSLGEOEDO13kbAm9iQa4TDzBC8TSLswUFpq7wCX19ZhxDOCVHMNCTaazG3G
	fod4WT1OaJPsq/wgdFb5pDYyoDAVM5wVRSkzIUjQuF5RtISI2Bq4yc5HEg0I1BXHCMa7ZNMu4z2
	9/UEFXO7UATg38ofGAld4G74HNiYXtPFknY2WcVf1HFq0utfC4oQCDZwxTjIPiPqbTdRLxY+puY
	9sBcOVjf5os4/4aIymbvs0u1gVKLquf2ifHxOdxY+lOUClk/3W/Nhk7jcxKHOUUhpHEMoC3J/NO
	x4FwE+6/MXXsQG61mHFfwQ+aA3c0uKhr3XEKHbqUq87LZje3GfIM54enQY7snodnuS4mpuOwLr9
	EQdZI//GFIGEha6/5xhjfbkCyfRm/bOZ9YwjCUDi2vbIU9eaG/OLs+dzucbbEVjPKmiQrDEq3vS
	jE4DeploktFRbVMV80JQJy0S9aXDNtUcw9+eJGYT1dJjl3KJDO5fETsxwoGlM9e230m9A9QKyXo
	EhzJe4x+qGzFGagTRzdajQSDVpGByH+oHZUpw==
X-Received: by 2002:a05:690e:6d0:b0:641:f5bc:6943 with SMTP id 956f58d0204a3-6491771e34amr3777166d50.71.1768686653219;
        Sat, 17 Jan 2026 13:50:53 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72d5sm24325037b3.9.2026.01.17.13.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 13:50:52 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-notifyd: upgrade 0.8.2 -> 0.9.4
Date: Sat, 17 Jan 2026 16:50:46 -0500
Message-ID: <20260117215046.50934-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 21:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123559

Changelog: https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.4
Changelog: https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.3
Changelog: https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.2
Changelog: https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.1
Changelog: https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfce4-notifyd-get-var-abs-path.patch      | 41 -------------------
 ...otifyd_0.8.2.bb => xfce4-notifyd_0.9.4.bb} | 11 +++--
 2 files changed, 7 insertions(+), 45 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.8.2.bb => xfce4-notifyd_0.9.4.bb} (62%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
deleted file mode 100644
index 719267fd16..0000000000
--- a/meta-xfce/recipes-apps/xfce4-notifyd/files/xfce4-notifyd-get-var-abs-path.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Native pkg_config only return basename of the variable queried. Invoke `which`
-to get the absolute path.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0f49e2b..a589147 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -116,7 +116,7 @@ AC_MSG_CHECKING([for gdbus-codegen])
- if test x"$GDBUS_CODEGEN" = x""; then
-     GDBUS_CODEGEN=`$PKG_CONFIG --variable=gdbus_codegen gio-2.0`
- fi
--if test -x "$GDBUS_CODEGEN"; then
-+if test -x "$(which $GDBUS_CODEGEN)"; then
-     AC_MSG_RESULT([$GDBUS_CODEGEN])
- else
-     AC_MSG_ERROR([could not find gdbus-codegen in \$PATH. You can run
-@@ -129,7 +129,7 @@ AC_MSG_CHECKING([for glib-compile-resources])
- if test x"$GLIB_COMPILE_RESOURCES" = x""; then
-     GLIB_COMPILE_RESOURCES=`$PKG_CONFIG --variable=glib_compile_resources gio-2.0`
- fi
--if test -x "$GLIB_COMPILE_RESOURCES"; then
-+if test -x "$(which $GLIB_COMPILE_RESOURCES)"; then
-     AC_MSG_RESULT([$GLIB_COMPILE_RESOURCES])
- else
-     AC_MSG_ERROR([could not find glib-compile-resources in \$PATH. You can run
-@@ -142,7 +142,7 @@ AC_MSG_CHECKING([for glib-genmarshal])
- if test x"$GLIB_GENMARSHAL" = x""; then
-     GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
- fi
--if test -x "$GLIB_GENMARSHAL"; then
-+if test -x "$(which $GLIB_GENMARSHAL)"; then
-     AC_MSG_RESULT([$GLIB_GENMARSHAL])
- else
-     AC_MSG_ERROR([could not find glib-genmarshal in \$PATH. You can run
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb
similarity index 62%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb
index 96cfd32f7b..987735e763 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb
@@ -16,13 +16,16 @@ DEPENDS = " \
 inherit xfce-app
 inherit python3native
 
-SRC_URI:append = " file://xfce4-notifyd-get-var-abs-path.patch"
-
-SRC_URI[sha256sum] = "e3a28adb08daa1411135142a0d421e4d6050c4035a4e513a673a59460ff2ae84"
+SRC_URI[sha256sum] = "ae6c128c055c44bd07202f73ae69ad833c5e4754f3530696965136e4d9ea7818"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-EXTRA_OECONF = "--disable-dbus-start-daemon"
+EXTRA_OECONF = "--disable-dbus-start-daemon \
+                GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
+                GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources \
+                GLIB_GENMARSHAL=${STAGING_BINDIR_NATIVE}/glib-genmarshal \
+                GLIB_MKENUMS=${STAGING_BINDIR_NATIVE}/glib-mkenums \
+               " 
 
 do_compile:prepend() {
     mkdir -p xfce4-notifyd xfce4-notifyd-config
-- 
2.43.0


