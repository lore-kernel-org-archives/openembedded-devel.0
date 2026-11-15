Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3851.1794729095907796544
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C71DWPqR;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so7237464eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729095; x=1795333895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmrQsnURBa5Cw1X+Ge37Alz2em6nJTi+2WQwjZgNozs=;
        b=C71DWPqRf65n3DroxI8peIzZqP6FIu+FZN988BStz9vLHHJ/AeLdCnp66ppLxYNmZE
         vWtBRl+IfGhNh0utZy+Z0DmoPpMJit0vFKNgz3DmB14zSp8/EPCoMI47k2seQj7b8wfD
         JOSO+9HzrtVkRuyinkBpV7xL0T2v8fP8/9jHwv71qkS5uuYtaH9xi5PeWfe2aFoaM1fu
         oeHZf0j6kpyWk3lNEarOgm9p+mnGpu1zfdJLeNwOWJnc+S8/uEwi/fBKomaJO+4Arnsl
         LPc4yfZPX0uOINJlW+hsQQWWLDKL70eQxnthMlGg2IxvzUiW7ck0zwnVfWlaFgxt0Z/q
         yUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729095; x=1795333895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmrQsnURBa5Cw1X+Ge37Alz2em6nJTi+2WQwjZgNozs=;
        b=UuhNAWEPW/ROr/GA5HtkUTJ89BKiHV+mKSS7hDxD1CZUMunmrKZ2dMTvYYaIW2hHuK
         C2jJ9voS6ltIFBwyWHzmOgDMs4sdjJTtAa6eMWHgSHxqE0LvVJX+f7HGWy7wcrZpxuQ4
         gKCB5fRX2GQPIKgiiFzlSr9ZhAc/TP1lH+nWTKoJEC1JTgfG0jP1sfq/erZTuk3hyKJZ
         AuAgaol28ZwkZy9KnqY5xEhqpNg6QJt/fQgKRFCicafTk1Ikub44UbG7Zc3XR5pCEQ9O
         SXobyovN0JkjJgJBEfQatIk01foJYik599M2N9TEGgXXQEwHZLNZpL+yKzlWSWourT9b
         5Q+w==
X-Gm-Message-State: APuU4Z+d/unJ8ykEPuYTzVDxcDbI6GjpKfzjeuVPiDxx4zipnFbMCqit
	F4OKRJv1iapgSAbM078LxGHEkCjsA9wRoHOSUF5EYxUHhWlr0YheUFYlSHlU9JxW
X-Gm-Gg: AYBFou3YC7sXs/H+zT6jIy8FmGMqxKyLdWA+T7nT7K3srz1E2jtQvfXeV/65tK/ZF8M
	mm6LEaJGhX3dCMW6WOKa5Iv01zxkHH7h8EMgpztc1JBNZRSEb0WZj/YsO/rXOQA49iTGtIwZave
	vTsQGapggTUYxV7Yhql4SC8RQ6czpXQc5xfC2tk6yDtmjbi7vC5e6jW30j5fXG41vVlDbXKrDfL
	IeLoZ/EQj8IY4X27jThwf+yOEDkBMjJUZMy6sekp8Rvb6drHEXlH+WZYH//xD2TA30kGAzMp3jQ
	q65E45jSpFUnI9mLcHJPKJsvkEHSypnVobGMXWzxZlcFkzFir/ibaVKWiKP7qFwva4ZJIRh94PV
	23losT0RwUZyekTo2MdQVgQSFvFkCh+uJCkQVSbnFpAkAyD2NJhOLI9nRaeyn9MrGWR+aUxE6Is
	rmwhO9Fi5yfDQ2YApPxHYci9NLMUnrX5topNk8XWOvpmMYyKfwe+LPPjj7LpljvxMdU/2reVmf+
	8LaGvLsh5wcWzDovYjUoU+V9P+IIa/whXZZk9Ipe/pYNLAx1kx9TEDZKzyUQvOAcdarhgxVM05m
	SVMLS8MQYUQmcVs6b98S67JyMCJiiDQGzgWbWO/RyFMRSQiwG11S+dEEtdOWj8R7fukXQhWjWcm
	3K1kqT6BBHFyomzRvDSe6pdOWfgqiCb7YxZ+tcvI/HuSVMD0wtkTMQSB2wqNK6BOXxaMP2xlWIt
	QRcKIILpej1JlDiG9L20tYKSX+qzNjaIGVkMuehhomC5gdvLUCdvfo75pwEPnZTycosRuFoly4I
	ocKNrH/0qZCNQWmKcbpzednR9PwTTSgud/E2V094SeV5KHCm+OY2KWHwXNgIhQRwFveRnPDnJo8
	eT07s/jqXvk0HU6+fIH1nlbQTQ==
X-Received: by 2002:a05:693c:69c9:b0:368:2548:c08b with SMTP id 5a478bee46e88-37966e3a0fcmr7449622eec.21.1794729095050;
        Sat, 14 Nov 2026 23:51:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 82/96] kmscon: upgrade 10.0.4 -> 10.1.1
Date: Sat, 14 Nov 2026 23:49:00 -0800
Message-ID: <20261115074918.2932593-82-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132352
Content-Type: text/plain; charset="utf-8"

Drop the three backported patches, included in this release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-display-controllers-as-primary-GPUs.patch | 53 -------------------
 ...x-build-error-due-to-logging-changes.patch | 32 -----------
 ...on-after-label-for-pre-C23-compilers.patch | 31 -----------
 .../{kmscon_10.0.4.bb => kmscon_10.1.1.bb}    |  5 +-
 4 files changed, 1 insertion(+), 120 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
 delete mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
 delete mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch
 rename meta-oe/recipes-graphics/kmscon/{kmscon_10.0.4.bb => kmscon_10.1.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
deleted file mode 100644
index 88a071f542..0000000000
--- a/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 92b87c18f67ba9c01b23b50d014c5c5cfa72717e Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 7 Oct 2026 13:09:58 +0200
-Subject: [PATCH] uterm: treat platform display controllers as primary GPUs
-
-A GPU only counted as primary when its PCI parent had boot_vga set.
-SoC display controllers such as vc4 on the Raspberry Pi are platform
-devices without a PCI parent, so with gpus=primary kmscon ignored the
-only display in the system and never showed a terminal.
-
-Treat DRM devices on the platform bus as primary. USB displays are
-excluded: on these systems the USB controller is a platform device too,
-so they would otherwise be taken as primary.
-
-Tested on a Raspberry Pi 4 with --gpus=primary: before, card0 (vc4)
-was ignored as "no primary GPU"; now the terminal comes up on HDMI-A
-with the drm2d backend. The USB exclusion is not tested on hardware.
-
-Assisted-By: Claude Opus 5.5
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Backport [https://github.com/kmscon/kmscon/pull/551/changes/e8d5af950b1046f060604932440306dd16c9039e]
----
- src/uterm/monitor.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/src/uterm/monitor.c b/src/uterm/monitor.c
-index f2141969..ccb5e422 100644
---- a/src/uterm/monitor.c
-+++ b/src/uterm/monitor.c
-@@ -244,9 +244,21 @@ static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, c
- 			log_debug("DRM device %s is primary PCI GPU", node);
- 			return true;
- 		}
-+		return false;
- 	}
- 
--	return false;
-+	/*
-+	 * SoC display controllers are platform devices without a boot_vga
-+	 * attribute. Treat them as primary. USB displays sit below a platform
-+	 * USB controller on such systems, but are never primary.
-+	 */
-+	if (udev_device_get_parent_with_subsystem_devtype(dev, "usb", NULL))
-+		return false;
-+	if (!udev_device_get_parent_with_subsystem_devtype(dev, "platform", NULL))
-+		return false;
-+
-+	log_debug("DRM device %s is primary platform GPU", node);
-+	return true;
- }
- 
- /*
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
deleted file mode 100644
index 63db2e5297..0000000000
--- a/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 153db63d679df719a99dd36505f9c2f55d9c59f6 Mon Sep 17 00:00:00 2001
-From: Jocelyn Falempe <jfalempe@redhat.com>
-Date: Mon, 28 Sep 2026 11:46:21 +0200
-Subject: [PATCH] vt_libseat: Fix build error due to logging changes
-
-Commit "efda2b5 log: Simplify logging, remove timestamp, and level for notice and info."
-changed the log_submit() arguments, and this was not updated in
-vt_libseat.c
-
-Upstream-Status: Backport [https://github.com/kmscon/kmscon/commit/153db63d679df719a99dd36505f9c2f55d9c59f6]
-
-Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
----
- src/uterm/vt_libseat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/uterm/vt_libseat.c b/src/uterm/vt_libseat.c
-index 4f65c84..2097628 100644
---- a/src/uterm/vt_libseat.c
-+++ b/src/uterm/vt_libseat.c
-@@ -260,7 +260,7 @@ static enum log_severity log_level(enum libseat_log_level level)
- 
- static void log_libseat(enum libseat_log_level level, const char *fmt, va_list args)
- {
--	log_submit(LOG_DEFAULT, log_level(level), fmt, args);
-+	log_submit(log_level(level), "libseat", fmt, args);
- }
- 
- static void vt_libseat_input(struct input *input, struct input_key_event *ev, void *data)
--- 
-2.55.0
-
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch
deleted file mode 100644
index 8bfec26d4e..0000000000
--- a/meta-oe/recipes-graphics/kmscon/kmscon/0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sat, 10 Oct 2026 00:00:00 +0000
-Subject: [PATCH] font_psf: Fix declaration after label for pre-C23 compilers
-
-kmscon builds with -std=gnu99, where a label (including a case label)
-must be followed by a statement, not a declaration. Clang rejects the
-"uint8_t i" declaration directly after "default:" with
--Werror,-Wc23-extensions. Give the default case its own block scope.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
---- a/src/font/font_psf.c
-+++ b/src/font/font_psf.c
-@@ -394,7 +394,7 @@
- 			case 0xff:
- 				ch++;
- 				break;
--			default:
-+			default: {
- 				uint8_t i = utf8_len(code.map[0]);
- 				if (i) {
- 					code.val = ((uint32_t)(code.map[0] & (0xFF >> (2 + i)))
-@@ -408,6 +408,7 @@
- 				if (unicode_table_add(self, code.val, ch))
- 					return 1;
- 			}
-+			}
- 		}
- 		ucode_idx = 0;
- 	}
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
index 3ece44b175..65db5115ca 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
@@ -21,12 +21,9 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "68fc8e1b2601e816e3a4ef95e3d8e700677509b9"
+SRCREV = "55e7127eff12608f1ea52eb456cd982c94bcd5ce"
 
 SRC_URI += " \
-    file://0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch \
-    file://0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch \
-    file://0003-font_psf-Fix-declaration-after-label-for-pre-C23-compilers.patch \
 "
 
 inherit meson pkgconfig systemd
