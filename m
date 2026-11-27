Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11797.1795762954428387401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=b+Bggj7w;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso10942249c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762954; x=1796367754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJOKMODiBUh6PKMiqgsR3dgJHrNx3gismcr025S54lo=;
        b=b+Bggj7wSFV2zfatWVW3LuYwRagoOnYvNUQE2JGHbAy0HfUeeeHjtwpBwa8zsXUwgg
         y8RwTgArOgm9f8A+ULiATfyS09Wd2qbS/N4SCCoRH86GDCGSslM0cO3GXym2CbKwYWX2
         HaiL7XsJos7ZU5cvnHb+9a0AnYCl1mW4ps+rpe9qrU/LTFYHzyMZX+55kJFHWpm3nRvi
         +oKPU2puSBgseU7l6XZUEKrLYSnu7mCfP8Yo/+4WPGCDgLPD50c66UgUfV4NgPWScmS/
         DeGrj5MaymDHiy6V82oX5bPm7v9c1X1c+SOfO8L4KROIPu9odOIVM+HT2wFbORgs7ywG
         DAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762954; x=1796367754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJOKMODiBUh6PKMiqgsR3dgJHrNx3gismcr025S54lo=;
        b=N66r0XltamqJ4AMgAg2c7WLnHAyUSe+JXfhjs+uj5f31sUg13ruHcGY8eJDWOwnFs4
         dzuT2dYrsOiukWI/4zAGmxb1//weqN4CMnY8xx/2xpY1gVU0d7EihDrNfYwWPzsTz/ah
         EFmjVv9kpeNFh95wdMCGzzT4ZbhvST7+glqZJbcxYOxhNshC2CEFuwW6xbLrPfv9WAJV
         /fkQlN7H8KfROQJBJ4o1ToPvWqpHEwEyJINxiEGInCu4lU+uFh68frO9+v/kzmMGvvA2
         TkjkFEWySIxDxPUXygSZjFr0L+qS+uj8FOHWQJDswrfjjmVTvp9czcb90ZauHcZKMmwy
         AJWA==
X-Gm-Message-State: APuU4Z8p2l1HySv1p4hbYCD2+H8y7YRaB3a1pGOHTHmMDnXqK81lo2or
	D6kZmExhfFvmc6KkI3G0cn8MnBHGGkuGUBSv5c5oC6TV5OC34OsTYiHvYJWgIyeV
X-Gm-Gg: AZFdTZerqLd8ZcI5caG9il3Coj01nCWSXNEP3uSJfY//NYiWBiC1oK7arlYCr4B0N8t
	WQ3X67C3Jx4UlNOu9yNQKvP2sgZCHerS6dp9ml+hByYnVtT5TbyZDce4UrGZZjvA0rC89t7Kt4C
	8RroklTNOBRO13wA2BWsKSpG8boeVULlLsdUvnEP/CnfacIvFBwHe4GnDCGQ4lBRrHOljOkSKDm
	dXMU0CpcIazCsx3ifozu4AOHOyjLisnof9frAiqqSSGZY6i7+ScTMS210+OHzTNLKFRzhHDyBd+
	yvqgP6wNYKw+dZHhl4src4/4Qmz46jEdorsr5TORsEro8Y3L7DjlFE76L4NVih/dW+ggYFgbSIz
	F7cLma3kFZf5FdqEr3XJ0otKdYSkFwby/pVTe7tbgPZT3Tt/NdBL8DObitpZv3+5AGn3hXaQzAP
	H7Ja+vREbS/QXjuCq6HXIDO0g8MDEFUVVkTtv4WjXNmOspaTo9RcXL6pwVoT/qWs+UPOiV/EI/S
	aFKLDjFVMWvO+SPTrGHoJGPWMBIFhs54qdDZ7w7jGZgl3BTJkpwCf+fpc9DTiwfv5yYixgglq10
	NvSyxVSnjl28ezuEDIK7poXnnfNXtFbfj7ZORuWGsM9ckl4UfDBObgxR7CiMvsB+WG1xdXD4KXD
	ki2uw23TgSvFutA4Sx9w08mmfJPAKpyEiQH+cvA3wr1bNbE3HBH2GL+LKRMlr4G5XgWpdzVpHUb
	rmiDwhgTlGO+TJIZOo89GcfAvOeKDtCIWgM4glvfB6wBGpBuHQwYhyISPZS0XPpWfVgNjJ+bi/a
	Xo5oFDHO06UFB+FMdeygmNLBBzXnLKdUmdQINPfpJ/ZZ6zKrop8H3Pb4VJ/6b1upPwE/1EAgjND
	mVzA
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr27488968c88.32.1795762953266;
        Thu, 26 Nov 2026 23:02:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 17/21] gweather-locations: Add recipe
Date: Thu, 26 Nov 2026 23:02:05 -0800
Message-ID: <20261127070211.2329979-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133344
Content-Type: text/plain; charset="utf-8"

libgweather 4.5 moved its world locations database (Locations.xml and
the precompiled GVariant Locations.bin) into this module, and libgweather
4.6 finds it through the gweather-locations pkg-config file.

Locations.bin is generated at build time with python3-gi in host byte
order, so the package stays architecture specific. glib-2.0-native has
no introspection data, so the generator uses the target GLib typelib (as
libgweather4 did before) and the recipe is skipped without
GI_DATA_ENABLED.

Tested by building libgweather4 against it for qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libgweather/gweather-locations_2026.2.bb  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgweather/gweather-locations_2026.2.bb

diff --git a/meta-gnome/recipes-gnome/libgweather/gweather-locations_2026.2.bb b/meta-gnome/recipes-gnome/libgweather/gweather-locations_2026.2.bb
new file mode 100644
index 0000000000..ec878e9a2c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgweather/gweather-locations_2026.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Locations database for libgweather"
+DESCRIPTION = "The world locations database used by libgweather, as XML \
+source and as a precompiled GVariant database."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/gweather-locations"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gweather-locations/-/issues"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
+
+inherit gnomebase gettext python3native gobject-introspection-data
+
+SRC_URI[archive.sha256sum] = "e7570a3661e0a752a06387b2032585cf588fc56770b1f9f39f1a55d17b2835fe"
+
+# Releases are numbered <year>.<n>; there are no development series
+UPSTREAM_CHECK_REGEX = "gweather-locations-(?P<pver>\d+\.\d+)\.tar"
+
+# Locations.bin is generated with python3-gi, using the target GLib typelib
+DEPENDS = "glib-2.0 python3-pygobject-native"
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0"
+
+python __anonymous() {
+    if d.getVar('GI_DATA_ENABLED') != 'True':
+        raise bb.parse.SkipRecipe("needs the GLib introspection typelib (GI_DATA_ENABLED)")
+}
+
+FILES:${PN} += " \
+    ${datadir}/gweather-locations \
+    ${libdir}/gweather-locations \
+"
