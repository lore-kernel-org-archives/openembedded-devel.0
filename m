Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8137.1794465767417097637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TLXy9Ovf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2235789a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465767; x=1795070567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNJbYVp6r/n7FBlW5TFi1a5IygPWLqkHb+y2JoAej94=;
        b=TLXy9OvfsrIByaX0gAEa1ljSgseL/GoljcQ2sPj2BUQ+NiFq7PNk6c2Kd7ompqYF8l
         eojH84L8BKr99+xNuOK1iTQ+5dZx0DXuC+5PGwJdxiGHdvS+s+G4aLsj0oHZB18ltJXF
         8MNHFkXt8oVzvnz7IHCrsHDpZyKT1OlzsMUwPLlOsyp2wVlxraZ5X/mmLA1S6Q2j8eHt
         EoAqrZoz/QofB+X9Ai/ivqxIs3+tIgBbVEyLXblz1P6tTE0POowyD3kHxAISNnz9QCT5
         gg5IeLTwos2fJhTdYnUwv/8YUEVb/3UsOC8hyUjMV+Go/tmEkKjBlDYdPoCyX5o4+0l0
         aHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465767; x=1795070567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNJbYVp6r/n7FBlW5TFi1a5IygPWLqkHb+y2JoAej94=;
        b=OfruLCqpe/FsyUnUYX8w3wZBwM6vKRlGE0qM/S08tpDy4arJjeKlBZ5VvmcZaXBmQw
         OrVfJDu6DKY34eU40os6D4wyDuHfPGUWu40JXg4YzpI7XxHaRU7L2Gbqjn7jRWyq1bvo
         vzT1j37/vx9wKuRuEUyfyZWY6tKFJnrNC5N0WL0Qqp4X7AskpgTWM1OZS2j1nmut0fFo
         o10jiH3K8jpMCWhfjw5fIWIRZF7oS4Uip9g7JU7JiMzgpoN2mM7pRC7mXhBj1s31qTZF
         RGd67wPeIezkNJ/X9jy30ExoBlvcxaMJvZ6NU4d3ToB0GKs+qTSwZKoG2ElmcwVHWNfF
         uM2Q==
X-Gm-Message-State: APuU4Z8yhP9zgek3H/0hhC2J2NG0tFbh94LApersPeGHoSw23iWM5Po1
	TzyT0CKvG148GuEvJIz5ICjqsyGAixooe8YlmnfEqL5fVTSMAU5EY7u0ixNODs8lQ1s=
X-Gm-Gg: AYBFou1IBUGyS89C9ZbjwX8mDGMVOvMcgB4TVX3P35h2VuVQqUX4pmGnJ4jIYPjB4dF
	b/rAD3uq0WsBV/rHyDbpbuna8fo7DXe1M3h4vXzglV13CUNsQq1HjIh41jCDycNHlQpyCEvy5Zv
	YIewfpAihHfy0ID9iijeFlr5dHKvuQHvDR/ST0FlGY5ICaZTy+YW1vFZEtf2kI+3SoyAUpsKCyl
	wvneglBGc4llPY0TyT9EQ0XknhpQjmc5sJUttkDeaGCb6IQGK+YNVm+l2kK0AgZkP7pUfepn+WS
	h6g1XgPibwdGT2PjUrAHIT9pfZi7MNni+VRPEYf/5EdDiou4d+vCeG0202p5jM0aMQZc+zB3A1n
	FJ/mCQmnvFPw9C9ZqbyPjO2msSXJXY5kfnmzM0nb3ZHNLDog2UwIGHGOyOKImMd/Zv0qpRpqwva
	hBvuPLlnF1ZOMgRjxQ/3fEbPZ3wd26B+ol5OVWjF6zo+vL9ugZFR2I02G1M9VuFKT76Qx6IfI6Q
	qMGUI0C1/Px/H9ZpJmIID2HfpftzA6zE8+rlem2lOUD4oU5DShkR62NS0tLU1RKN/CvxTvgWzyq
	zHxdd54P/MBKaHqOogsM13hSndpuYliN0gUehbiADbESUrE2Gu54Bctv8zCCr4Da6i/gbIyLKty
	yEVw/IM+OBIthjYIYhAeeLZVYccnY71/Yz6sJD9uFnrzNCb+wV0TuWXMD7Yt/JQIZI3AZAX5JOb
	DNZB2Z2kA9Ms3vcYbbGd0o2e3LlNydWDD9bn8M38m0QmeNCJ3ZMeJVTLBMicDarR8aHVKf51955
	73RFeskPZdvRhQmAf2OoJybCPjFuBfIZm36w73M/U2K74v9FcQlFI1cKJ+WMvOfhz4r2EGUyZEl
	2bit
X-Received: by 2002:a17:90b:4b0f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b182e12794mr4877655a91.1.1794465766736;
        Wed, 11 Nov 2026 22:42:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 15/24] phodav: upgrade 3.0 -> 3.2
Date: Wed, 11 Nov 2026 22:42:15 -0800
Message-ID: <20261112064225.2410019-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132184
Content-Type: text/plain; charset="utf-8"

gtk-doc was replaced by gi-docgen, drop the gtk-doc class and disable
the new docs, introspection and litmus options. Set the new sysusers and
udev rules directories, and derive the download directory from PV.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/spice/phodav_3.0.bb       | 24 -----------------
 .../recipes-support/spice/phodav_3.2.bb       | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)
 delete mode 100644 meta-networking/recipes-support/spice/phodav_3.0.bb
 create mode 100644 meta-networking/recipes-support/spice/phodav_3.2.bb

diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb b/meta-networking/recipes-support/spice/phodav_3.0.bb
deleted file mode 100644
index 08c65eb259..0000000000
--- a/meta-networking/recipes-support/spice/phodav_3.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "phodav is a WebDav server implementation using libsoup (RFC 4918)."
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = " \
-    glib-2.0 \
-    libsoup \
-"
-
-GTKDOC_MESON_OPTION = 'gtk_doc'
-GTKDOC_MESON_ENABLE_FLAG = 'enabled'
-GTKDOC_MESON_DISABLE_FLAG = 'disabled'
-
-PACKAGECONFIG ??= "avahi"
-PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
-
-inherit pkgconfig gnomebase gettext gtk-doc
-
-EXTRA_OEMESON += "-Dsystemdsystemunitdir=${systemd_system_unitdir}"
-
-SRC_URI = "https://download.gnome.org/sources/phodav/3.0/phodav-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "392ec2d06d50300dcff1ef269a2a985304e29bce3520002fca29f2edc1d138d1"
-
-FILES:${PN} += "${libdir} ${systemd_system_unitdir}"
diff --git a/meta-networking/recipes-support/spice/phodav_3.2.bb b/meta-networking/recipes-support/spice/phodav_3.2.bb
new file mode 100644
index 0000000000..0e0f31d6e2
--- /dev/null
+++ b/meta-networking/recipes-support/spice/phodav_3.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "phodav is a WebDav server implementation using libsoup (RFC 4918)."
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    glib-2.0 \
+    libsoup \
+"
+
+PACKAGECONFIG ??= "avahi"
+PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
+
+inherit pkgconfig gnomebase gettext
+
+EXTRA_OEMESON += "-Dsystemdsystemunitdir=${systemd_system_unitdir} \
+                  -Dsysusersdir=${nonarch_libdir}/sysusers.d \
+                  -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d \
+                  -Dintrospection=disabled \
+                  -Ddocs=disabled \
+                  -Dlitmus=disabled \
+"
+
+SRC_URI = "https://download.gnome.org/sources/phodav/${@oe.utils.trim_version('${PV}', 2)}/phodav-${PV}.tar.xz;name=archive"
+SRC_URI[archive.sha256sum] = "93c993066ab3aebd5b539bab9d731eac43abbb750109c895f151ca3c74a5fc82"
+
+FILES:${PN} += "${libdir} ${systemd_system_unitdir}"
