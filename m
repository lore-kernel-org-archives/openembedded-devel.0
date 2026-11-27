Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3722.1795810344333660181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UTeqiq7g;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3898226f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810342; x=1796415142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgcNQf9FYiQ8kxr7Z/1ug/NQGOAUhFfg4gaWrDaX6zA=;
        b=UTeqiq7giYJgh5PXU4E45VTLbxecHkAgtdsoXHOFzlqTpZJMAb8QnNg4Nf7F3DrXmU
         YV4nOJXguCzsn81EfYx7OJ6M/ibS6hr05yiAPKkegcWQw52QvWiZNnd96XuI+DldMSZF
         mNjNg/vX1lGL+hAHMrHA1tuqR2nrygi52s95ZDr0LQlHPgMc8sVUD3UvOCjwSge0RqF+
         sVWzknltBSrDTcjd3PZ9EtJFn12rWlDO0AqdGmrPsd6y1t/dcNlMIJwVypjk4B1RXvk0
         /3XoyntuQmWl/Vk+dE7ggP+xTu43W2kVVPOm39hDs+iRInTNhQ94XWn1rFtOyDOFNGIc
         MEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810342; x=1796415142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgcNQf9FYiQ8kxr7Z/1ug/NQGOAUhFfg4gaWrDaX6zA=;
        b=fSQ+voiJpbXfak862Q9UK9+pAadrN3RZmgjNYwO4E2MB1CE4ILsfI5TvqK+U86MHe6
         wuU38u279ysw1gdSyMorFEufU/2idv9cnFtgBwi2z0Rr/qU4MkIw+pddvZ2KwyeUxF9q
         Ox2rtyW/AiGKzrtz7e1/f7Uf7Y1183PVRfi8fCsQosE/9ZVrHSp3UFJjDfAMScqCtPu2
         THMON+DiRJOEAL6WrZa5U+JkiN9LMhJj65XBgT8Q25zf763r9KSsB+/OJE8EMTkBfTI7
         Wwr+NEb3BLGWCFPSusC3sCc4+iPJk0U95F5yBdWAJ8NeRjic2TFTLpAC1MsdrBImJzCK
         r/ug==
X-Gm-Message-State: APuU4Z+n2RhBm1eOEvgLBk4bTdC45wAZW6R/tMzNlSynZQ3/UKbEG+Bh
	/oV8l6PfJz6aawdZvvqDzKAzpACUIIvfdc4EMLjPqA/Fie0tFzu3Tk+Xt+9OGg==
X-Gm-Gg: AZFdTZdvooCYyGtc4tR1yzQCc0ufk+GMWvjQV6+Ll7dmqpEzCJC4prKcOgQs4mvt0f4
	LFhWm65Ik4HtXSPgGTIrcIGvNu6t6RPPYN0G51G857AvnOTmuu88xdPaJ+mRskmtwadTUZtMCmp
	naVqe4/QvgUOSd9r/++I79aAduJ8KjXqWwmnuRNsUkpkLuyxvQj+JD4NS4h/HEgq9VRzz9BZ6u4
	3uWbbxr25Fk/MWquYHZKpCkAZkviPB5KzEsIvn1Xf19MHTIYlfCVs26yKB/8HJKIQyRXZtCQ4e2
	atm2HdLGowg5x+AI1ctM7ld74xZQQNTeLk2ZdFvIBDQefB/q4Xk0xp9laMvi0wTVFaUvTW1f0UV
	BQmbOzmfNLLVn4WwaosMk1NWm8BE5F+f9xFlYML/sCcsrkeKVVl7R1d/4zzyjdmT5fMnVRdhn/2
	gtsUXDG/dzz6dTWGUQVy+dhEAaVmbkS0ww8F/L2vzpmn07H/U8/0wKd/TD4qoefrUQP0qThrCFF
	vG5AD1sVdLoblQPiSJDCO5T92ZIPKA+Fxwu5skFXf1yM+CBrEzOZ+x4Zdx16zM1ueO2wVOiQPxu
	McbHYfxwXkyaSSth3A6+JCe22DrfzzwyJ4r8CkdZDI+ZvAkgnN6dO2ieSC0UtIQFOQ==
X-Received: by 2002:a05:6000:470c:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4abb73b557amr47485289f8f.47.1795810342549;
        Fri, 27 Nov 2026 12:12:22 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm51460047f8f.29.2026.11.27.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] paprefs/pavucontrol/python3-pulsectl: remove the recipes
Date: Fri, 27 Nov 2026 21:12:12 +0100
Message-ID: <20261127201213.914864-3-alex@linutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201213.914864-1-alex@linutronix.de>
References: <20261127201213.914864-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133388
Content-Type: text/plain; charset="utf-8"

These all are pulseaudio frontentds/bindings, and can't function without it.
Pulseaudio has been removed from oe-core for being obsolete.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../pulseaudio/paprefs_1.2.bb                 | 19 ----------------
 .../pulseaudio/pavucontrol_6.2.bb             | 22 -------------------
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-pulsectl_24.12.0.bb        | 13 -----------
 5 files changed, 56 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index adf9db1793..169f5a8a20 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -668,7 +668,6 @@ RDEPENDS:packagegroup-meta-oe-multimedia = "\
     live555-examples \
     live555-mediaserver \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "mpv", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pavucontrol", "", d)} \
     sound-theme-freedesktop \
     v4l-utils \
     wavpack \
diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
deleted file mode 100644
index 6e4321dd7d..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "PulseAudio Preferences (paprefs) is a simple GTK based configuration dialog for the PulseAudio sound server."
-HOMEPAGE = "https://freedesktop.org/software/pulseaudio/paprefs/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
-
-inherit meson pkgconfig features_check
-
-# paprefs.cc includes gdk/gdkx.h and gdkx.h isn't provided by gtk3 without x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/paprefs/${BP}.tar.xz"
-
-SRC_URI[sha256sum] = "b3f21e40dc3936d15e3ffc910fb0c07c14b88e8c287715b456a948c17638f633"
-
-EXTRA_OEMESON = "-Dlynx=false"
-
-RDEPENDS:${PN} += "pulseaudio-server"
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
deleted file mode 100644
index b6b9a068a9..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "PulseAudio Volume Control is a simple GTK based volume control tool for the PulseAudio sound server"
-HOMEPAGE = "https://freedesktop.org/software/pulseaudio/pavucontrol/"
-SECTION = "multimedia"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "gtkmm4 pulseaudio json-glib"
-
-inherit meson features_check pkgconfig gettext
-
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
-
-SRC_URI = "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[audio-feedback] = "-Daudio-feedback=enabled,-Daudio-feedback=disabled,libcanberra"
-PACKAGECONFIG[lynx] = "-Dlynx=enabled,-Dlynx=disabled,lynx"
-
-FILES:${PN} += "${datadir}"
-
-RDEPENDS:${PN} += "pulseaudio-server"
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 376f288db3..afbb204f09 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -299,7 +299,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-prompt-toolkit \
     python3-protobuf \
     python3-ptyprocess \
-    python3-pulsectl \
     python3-puremagic \
     python3-py-cpuinfo \
     python3-py-ubjson \
diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb
deleted file mode 100644
index 43bdbd34d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pulsectl_24.12.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Python (3.x and 2.x) high-level interface and ctypes-based bindings for PulseAudio (libpulse), mostly focused on mixer-like controls and introspection-related operations (as opposed to e.g. submitting sound samples to play, player-like client)."
-HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
-
-SRC_URI[sha256sum] = "288d6715232ac6f3dcdb123fbecaa2c0b9a50ea4087e6e87c3f841ab0a8a07fc"
-
-RDEPENDS:${PN} += " \
-	libpulse \
-	python3-ctypes \
-"
-
-inherit pypi setuptools3
-- 
2.47.3

