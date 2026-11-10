Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1089.1794332158100706761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mzIpHYgU;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so637426f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332156; x=1794936956; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xXRRykqRrKToxez0VFTiK6p6eky8RT4rH1pd7Lp3y4=;
        b=mzIpHYgUFAaR3T8v9Bh/fwz6etY60K0OwGuodcDwkPpIVfhgpDgb+jk06Xyz0kW+Wm
         8efiZ/0mZUKOFxZA6OjOTlDYej7BEwghfiotI5ZJGdbFfl/+81DwHl5flQIE/tAfZYI2
         SMxGG1psNzfnV8y3XsITadVl5sr52qXD35zprqTLLZ/cv7/N8FrMVjwcd0RyJ+e+gSB7
         l4GO0wePhkNuhEhxTS2zuiZz0KFdlX65ziuW63ODljVJz7VmnE0nFEOFl6uGsiopByAB
         B+3M4GAwvMesdi+hQBkLZH4URRGgViQb9EJ4PdBNGHl3oW4MOy6MbXr8TQ+1oXQBftGe
         la/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332156; x=1794936956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xXRRykqRrKToxez0VFTiK6p6eky8RT4rH1pd7Lp3y4=;
        b=XN2s9BQssVd10KGqLbhAx3H5QvMkeNjtP3tvxXyu7axCAjZY5Evjd95qxCRtPQyV6E
         d13HqTjFlV3Vm9O3/01AUPJwPwIfiU+P6/bEBsNO2Dt4SWjr2Na8s/8PBhMz0xmXm47M
         1faElFzdaRR980Vtk7dvLhkd/iR7dXBrf3XQZE0DM2r0khshbSWn/5mTsgfRLmBgp7D5
         asKp+pc3QOkohdh6mnrGT3OJwjtjsTaKvTYaz4SNzUJDQb7KmeR+c1K0dU8/lfd8YFln
         PGErdWlG3+hW15td5PvlW74irQ52SKuTYr6xO7wDNHPALQMDPBCWLbzdV7TMVszNBiVW
         uzCQ==
X-Gm-Message-State: APuU4Z+6C8nBOYwMYtyw+0E4y2EmQUKWmUyUDFZVRMLu0N9Qs41VhRRp
	ewY3CMy0KXKhZDyGm+srRF3Jvv2Rz1Bl5+V7hJRfP60PDlh5RjchHbbsD/4VwQ==
X-Gm-Gg: AYBFou2nNxBVKAmXcvnVSdvb1eX8nROHKyhFlgPREyE0+vtU/3rXAzuvwuVtcVD11u+
	XPgLIXWpAs0XXuSZgCgQ5EdTuGQsoHfTyfrunzTjNlSyAhG2LSlaCDAJU9Sk8Poig9PPaNy6DkH
	qE7BnyzUovJgDWXHqj6oXREHK+AAilQnlfevtVezSgdpTPTVyu/1Mj1+gbSxJ3Mmd6fdrb9YaDH
	z/ixHTjBtrMmcKBUUU+QKpxQLixV+5Eiit6xaOrczZnvhQuVxgx84F4xpFljjeTbVUXYFQ/bCYt
	q2+aigYblnv2gtw7zcaZYe2n9dmYZVazXPrBMO8H8YoYSP3DOmZFk/oQ9krMIp0yfE4NxMVE3jN
	NP5CnTFvroEML1Tz3RsUxMwkTpbSBfjpIq5Rj9iTlg2wQcP/+W2+vcQnhS7u5QJuQcqE2mqib7E
	YFwRVOzybLyeAgsqzNdqdnuG1DAOv1yHshAmbX9/AeBjUeJ9XsiJBbZL60/YkS6C1Tr6a4wLu0x
	uoQAd4wEhv4i5fEB/UD1i4siaBV4GR3A03+HVLXno88HaqwhUZ/UPx+lLcCOq1xCBJIxEtmr2HU
	WPSFeLuSwNTl6NgOAoQf4vtZNJEXpj8YsX9+xSmdyz3HFJRMXJ6otHGJaLxGwCdEV8rB4d5uEFo
	xZZDQnqqhoAkEYHUzqXrtrmi5
X-Received: by 2002:a05:600c:a310:b0:4ba:809:5453 with SMTP id 5b1f17b1804b1-4ba0809556amr15680855e9.31.1794332156264;
        Tue, 10 Nov 2026 09:35:56 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:55 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:31 +0000
Subject: [PATCH meta-oe 02/10] android-tools: adbd: start adb shell in
 $HOME, without Android's TMPDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-2-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132099

adbd execs the login shell itself, so `adb shell` starts in adbd's working
directory rather than the user's home, and with TMPDIR=/data/local/tmp,
which does not exist on a Linux rootfs.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...start-in-HOME-and-drop-the-Android-only-T.patch | 45 ++++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |  1 +
 2 files changed, 46 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch
new file mode 100644
index 000000000000..d8839d776069
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch
@@ -0,0 +1,45 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 17 Jul 2026 18:20:41 +0100
+Subject: [PATCH] adbd: shell - start in $HOME and drop the Android-only TMPDIR
+
+adbd execs the login shell directly (no login(1)), so it never chdir()s and the
+shell lands in adbd's cwd (/) instead of the user's home. chdir() to the passwd
+home before exec, best-effort. Also drop the hardcoded TMPDIR=/data/local/tmp:
+that path only exists on Android and is wrong on a normal Linux rootfs, where an
+unset TMPDIR correctly falls back to /tmp.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 4.8 (claude-opus-4-8)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/daemon/shell_service.cpp | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/daemon/shell_service.cpp b/packages/modules/adb/daemon/shell_service.cpp
+index dbca4adb61e2..4e9e50edf271 100644
+--- a/packages/modules/adb/daemon/shell_service.cpp
++++ b/packages/modules/adb/daemon/shell_service.cpp
+@@ -274,7 +274,6 @@ bool Subprocess::ForkAndExec(std::string* error) {
+         env["HOSTNAME"] = GetHostName();
+         env["LOGNAME"] = pw->pw_name;
+         env["SHELL"] = pw->pw_shell;
+-        env["TMPDIR"] = "/data/local/tmp";
+         env["USER"] = pw->pw_name;
+     }
+ 
+@@ -386,6 +385,13 @@ bool Subprocess::ForkAndExec(std::string* error) {
+         }
+ #endif
+ 
++        // Start the shell in the user's home dir, like login(1) would - adbd
++        // execs the shell directly (no login), so without this it inherits
++        // adbd's cwd (/). Best-effort: if HOME is missing/unset, stay put.
++        if (pw != nullptr && pw->pw_dir && pw->pw_dir[0]) {
++            (void)chdir(pw->pw_dir);
++        }
++
+         if (command_.empty()) {
+             // Spawn a login shell if we don't have a command.
+             execle(_PATH_BSHELL, "-" _PATH_BSHELL, nullptr, cenv.data());
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 4961a13963c4..b1e66198f88c 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch \
            file://0015-adbd-make-fs-config-opt-in-on-non-android-builds.patch \
            file://0016-adbd-forward-the-reboot-target-to-RESTART2.patch \
+           file://0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

