Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC181C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 17:17:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.55685.1699723035219223195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 09:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CiaOx5Ce;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc131e52f1so31144765ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699723034; x=1700327834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQUg5xtbI0M4WmMaMl1vHg07wWMqVEBG43rie2ELmls=;
        b=CiaOx5Cenk8CuNL6xLeNvJNXAyg2DeoI4dvtPfcDJgzURMpuggjRd2KbfMRpK8rHmE
         qp9XxdBIX1BdK22rGE/NxAr1Imz0OM3Gu34sRqSXy48C++70Gug5NQ7/XNJeBpsSpIkp
         04PYP7lQu0YJgidDJdeYHCOHIwBedc8UmOwYA+qQ6AI2xIwtVnccehqDL46gxVJwZTkZ
         9sRLuJyqHVY1jMpZj/RYGEsxj6V4QVdTscIs5ir5yv3gcKCPwEfuZKYZRhWp3y7u1+/Y
         1AsGHV4K1+wcTfqXed9KzVzXdkouhNhjnthMoEAg+QVoznCjWeNC7gPjfXJHftN2Zrin
         UF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699723034; x=1700327834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQUg5xtbI0M4WmMaMl1vHg07wWMqVEBG43rie2ELmls=;
        b=SNQRnYWoBFQI6xo5pZTb1hSSpVpRbffMy2uMuMTXtIY4mUcEYO9pJM1Quz484bBcl2
         tNhz4zdtFenDUXfaAT3oIlrwnI1i44ydVOWBu2yfgANY4QqjttLIC68lwCcxH8OG9K1S
         8TlG0Xg8Br94RL8Kc5/lvwraQhkB64sRXm/OaFD/f3Y/tsABtR+BHTkAG0mYBS8987oY
         DwdypDeCEIDt+S3YETXri7y35Jd2aypx3QkzdiJO8aPA3AFxdqMEkM6lGx8XlVE9+7hy
         PW5bm8rEa4jMzQm+ibaeVRxGRnSQOB/qq7YlAYThorSP7UoNLygre4Naa4WU2QxKUTri
         3unQ==
X-Gm-Message-State: AOJu0YwKq9gCarQeqqg3sQi8V3wtNOKwjnWuku/gqKSAvBbgxxNr0zul
	xF/+1e3jMPF0oz9yHBJ0XaJX8OQtmE/bAg==
X-Google-Smtp-Source: AGHT+IGm0qdvCi9ZdhD6tLsg/WfSBoaW+rf1JmNzZ5ruOwHYC4kZ/FSKjhGL3hCffRTryxSxsxW2hw==
X-Received: by 2002:a17:90a:ad8f:b0:280:4a23:3c84 with SMTP id s15-20020a17090aad8f00b002804a233c84mr8412520pjq.22.1699723034156;
        Sat, 11 Nov 2023 09:17:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a1a1700b0027ced921e80sm3716010pjk.38.2023.11.11.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 09:17:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] vte9: Upgrade to 0.74.1
Date: Sat, 11 Nov 2023 09:17:09 -0800
Message-ID: <20231111171709.649035-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231111171709.649035-1-raj.khem@gmail.com>
References: <20231111171709.649035-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 17:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106557

License-Update: Switch to LGPL-3 license

* Switch to using meson build system
* Merge inc file into single recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-gnome/vte9/vte9.inc       | 18 --------------
 meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb | 12 ----------
 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb | 29 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/vte9/vte9.inc
 delete mode 100644 meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb
 create mode 100644 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb

diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
deleted file mode 100644
index 2a165391b6..0000000000
--- a/meta-oe/recipes-gnome/vte9/vte9.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Virtual terminal emulator GTK+ widget library"
-BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPL-2.0-only"
-DEPENDS = "glib-2.0-native glib-2.0 gtk+ intltool-native gnome-common-native ncurses"
-RDEPENDS:libvte = "vte-termcap"
-
-# help gnomebase get the SRC_URI correct
-GNOMEBN = "vte"
-S = "${WORKDIR}/vte-${PV}"
-
-inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-EXTRA_OECONF = "--disable-python"
-
-PACKAGES =+ "libvte9 vte9-termcap"
-FILES:libvte9 = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES:vte9-termcap = "${datadir}/vte/termcap-0.0"
diff --git a/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb b/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb
deleted file mode 100644
index 72bc9ec39b..0000000000
--- a/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require vte9.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI += "file://obsolete_automake_macros.patch \
-            file://cve-2012-2738.patch \
-           "
-
-CFLAGS += "-D_GNU_SOURCE"
-
-SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
-SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
diff --git a/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb b/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
new file mode 100644
index 0000000000..30319ddd65
--- /dev/null
+++ b/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Virtual terminal emulator GTK+ widget library"
+BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+DEPENDS = "glib-2.0-native glib-2.0 gnutls gtk+3 gtk4 intltool-native gnome-common-native ncurses"
+
+# help gnomebase get the SRC_URI correct
+GNOMEBN = "vte"
+S = "${WORKDIR}/vte-${PV}"
+
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
+
+inherit gnomebase gtk-doc gobject-introspection features_check systemd upstream-version-is-even vala
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+GIR_MESON_OPTION = "gir"
+GTKDOC_MESON_OPTION = "docs"
+
+PACKAGECONFIG ?= "gnutls"
+PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
+
+CFLAGS += "-D_GNU_SOURCE"
+
+PACKAGES =+ "libvte9 vte9-termcap"
+FILES:libvte9 = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper ${datadir}/glade ${systemd_user_unitdir}"
+FILES:vte9-termcap = "${datadir}/vte/termcap-0.0"
+
+RDEPENDS:libvte = "vte-termcap"
-- 
2.42.1


