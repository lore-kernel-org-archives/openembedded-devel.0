Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944F1CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33229.1792042980868994266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E00zyFzr;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e87c66e556so20919935ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042980; x=1792647780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7p0v19ZNzkYNszoWvr2ZPVZE3rwVn7I3lRuUx7y4eeE=;
        b=E00zyFzriZl1BUP7NglQYXOfov0O3d8FuI3uneq0sNKFCK6C5hVjYcpLfA6H1FFilB
         iE/ECaFaHeCZCvdaliqzKgHygQgtfxTrns00bENDec3K7VLFqG+39j51xQKsJE87gjmE
         nCF4SxHELE5cETAt5qBQ4e5w18XrxxU6YWL2geSX29ZsHFzS79ZQ2uZgFFhr4YejXUvv
         zsqPYIrcyGjEhxLJk6HuCbsY28ykFKoyZsHdgMFPZDoD7NqfcGCtd8jEg1xsaOjr2Vos
         6aSe38jVEwDARn178rT5MC3/8P+UDW4XAej5Uf06QDqt7TWHzTP+8DEQTdo32Iu7eDf7
         bKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042980; x=1792647780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7p0v19ZNzkYNszoWvr2ZPVZE3rwVn7I3lRuUx7y4eeE=;
        b=BVRFduIGupZygN9HfaH1igLZwsuLaXSA/20BM00aJYKe8Q3psrpee/spCWazKrsILo
         V8bwIXyHZQkQZ0N2MaIsYUOjkSVOrR774zt4qDkKk+z+/mL/PwtjJNjsbTfjTEZyci0E
         aivZfUfKZ6ZmE4bhdCGqRUgR0AM6dPbekC3Ux2/E06mSfDoAAm1/zQJJKPg7LEl0Db5y
         PNDNHWOfPQjCU+KL3Ha5uTvoIvH/4QVBIbOcWcNdf/bQPMnjmLCGnZXhPQnufUWi/hmV
         Qebbl6m/ywf8MmLPOmgbLs6ETPaO4nqpZJ34BSZ/DUPbV3F1u5TOKyvQUZJ9Y+DPyvCA
         sDEw==
X-Gm-Message-State: AFq9FYKJuoyAJxBNNe9oajIYDjtqnSvDBrFqPdTh6x2cYx2MuABlbhSw
	nITHxpiE1NTxqZDcxToGUzU2ujJ7ujm7/arFku+Q6DF5FRdlpOsbMQ7wwKjKVg==
X-Gm-Gg: AYBFou3lKfqh089L9qTt/d5svw81w67yLizJ/LqDr6LKs7zCEcLTrW5NpN8ldyVexpb
	8JvCYy6rrS3Iv/wBVsrnmqDmZBGZDDQTUEe8cAo50SNe/T0s5ofcBrWhys66UMfMUU45JIP9lN+
	ELwpCYrHWdKGQZlgNGalufyoMWtk8KsQZSzWWzJ33WU+QdyZVBkA0uJgy/rXEubyZflVyChvSKq
	W2jIm4RzIkfMQFqmlBnWpJziqR50zKuWEWPCWZISw8ifiaLIen+cdcJJIEvRBioG1PwBOJ4Uscy
	vHjMuDogLlCjNGSffsKTeiIJxD0QhJ2eHR6X14PQ79QiYBtNj/iJkVs0l4VtEsrJSndKEujVsFp
	nGmsnBFG6tQDQb/J2cSX4QcsqNeqhSm5E1EXjUzG3ttrCBjqUoOFguMpJ0BcIUpUHUaLjsqyZvR
	PXvxjAUJXX6KKuDl81UMiueeCH7j9drcMPB0s1KnyyUeezIXHYf8FQPFrlWGGf6BwK8vkuA8G++
	qlWipyNoyJrbJfoie2dqBp5tw==
X-Received: by 2002:a17:903:2446:b0:2d8:d4d2:d136 with SMTP id d9443c01a7336-2e8404d753amr121277435ad.18.1792042980221;
        Wed, 14 Oct 2026 22:43:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/82] Revert "mutter: upgrade 50.4 -> 51.0"
Date: Thu, 15 Oct 2026 18:40:54 +1300
Message-ID: <8199790102b29eb409a98d5d036bae39dea5d131.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130926

From: Markus Volk <f_l_k@t-online.de>

This reverts commit 6f735ce8ac29f1e57dc463bac8c34f3c439a7fb7.

mutter 51.0 needs gsettings-desktop-schemas >= 51.rc, but oe-core
blacksail has 50.1. Tested by building gnome-image against oe-core
blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mutter/{mutter_51.0.bb => mutter_50.4.bb}   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb => mutter_50.4.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
index 6604865f67..f9b3e9d5e5 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
@@ -17,17 +17,12 @@ DEPENDS = " \
     libdisplay-info \
     libdrm \
     libei \
-    libgudev \
-    libinput \
-    libxcvt-native \
     libxkbcommon \
     pango \
     pixman \
     python3-argcomplete-native \
     python3-docutils-native \
-    udev \
     virtual/egl \
-    virtual/libgbm \
     virtual/libgles2 \
     wayland \
     wayland-native \
@@ -37,7 +32,7 @@ DEPENDS = " \
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
 SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
-SRC_URI[archive.sha256sum] = "5d28f3ae225692428fcafb96500d673f34328b698b86960c9c1460d0b1d983b3"
+SRC_URI[archive.sha256sum] = "273d33c875abcb4b6cbea3f4ec045d18155fbc510c3521fc7e47926371310988"
 
 REQUIRED_DISTRO_FEATURES = "wayland polkit"
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
@@ -45,10 +40,10 @@ ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 # systemd can be replaced by libelogind (not available atow - make systemd
 # mandatory distro feature)
 LOGIND ?= "systemd"
-DEPENDS += "${LOGIND}"
 REQUIRED_DISTRO_FEATURES += "systemd"
 
 PACKAGECONFIG ??= " \
+    native-backend \
     egl \
     gles2 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)} \
@@ -56,11 +51,17 @@ PACKAGECONFIG ??= " \
     bash-completion \
     gnome-desktop \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', '', d)} \
 "
 
+PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false, virtual/libgl"
 PACKAGECONFIG[gles2] = "-Dgles2=true, -Dgles2=false, virtual/libgles2"
 PACKAGECONFIG[egl] = "-Degl=true, -Degl=false, virtual/egl"
+PACKAGECONFIG[egl-device] = "-Degl_device=true, -Degl_device=false"
+PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true, -Dwayland_eglstream=false, wayland-eglstream-protocols"
+PACKAGECONFIG[udev] = "-Dudev=true, -Dudev=false, udev"
+PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
 PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
 PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
@@ -87,7 +88,7 @@ EXTRA_OEMESON += " \
     -Dverbose=true \
 "
 
-MUTTER_API_NAME = "mutter-${@oe.utils.trim_version('${PV}', 1)}"
+MUTTER_API_NAME = "mutter-18"
 
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c

