Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EA1CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33227.1792042979098052013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MQ2Cwcze;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8246b13cbso36311265ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042978; x=1792647778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kakb93U1OD84xHRnqJXsVmDbCF8ULncwq52EJhNmAWo=;
        b=MQ2Cwcze0nw2nUIKFdvrXQsl4Z82GsiQQ+vEOlYvl09enyzdJyQl6sHicg9jhuuiVC
         uzxsxm34PaCPFEMk2oUQ85Q/wwhsXDEALJMo7gvYlrEWzkisfb7hXmgdoxACKBko0Xn9
         m1tHdToC1L9dTntq8qjoeJzox84GgdRFqoSVNEPDlgN9RedY+Li1eNzjOhXqyNsMbYfc
         WE1La5fZuEp/r+i/heSTsNgfRnxC2Bn++VPBjlVr4ehaxzA8IWDZbRDpkLmTvd40tddG
         QaWA8BuDFay1AZWwTlk/3tsYQj7Ou6qm0DP7v0a8SRx0VxbvR7UtlSPVqU2RrZwtkTn3
         30kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042978; x=1792647778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kakb93U1OD84xHRnqJXsVmDbCF8ULncwq52EJhNmAWo=;
        b=HDzB0tAUyJeT+CLntasMiXBH+H5k2QAKLPZe+FNM2EgV3P+vCrodSVkURsZ7F9plQA
         4JXHtc03IipDW5qbDZQZAWSXmdE0VQiS0CJ/bFd6O+dKNzd/Rznrz0DaGOoKj1pi+72H
         Z2sYgmjLuujheKlrcJqnUop7skn5d/QKzbH9pShJqPTe3EPpdnnU6qgoe2sH0DAakTKz
         jdpLSPJddfhaI5/jgjQBBoKnQPsT0g4gkmVbi1w78XausJbjWNdY732/9LPEFPZ0lSex
         yYPj3WTxr2+UWDNWO1gJfdh4Toh0txIR2EGIkyA6YK/jzALnnS0Z5tIlzWjc4/RKDT6R
         Zw5Q==
X-Gm-Message-State: AFq9FYJpdkDZfOauDhWBDQffpyaSIkbtMpp7So6AexW3mATT7PtXWRfj
	qKbQbULMAWRE68R8QZd26r2Y1pzPHSW8uUDsbqCvZL1bvzcX5k+Klr8eIHdgGA==
X-Gm-Gg: AYBFou2o900UlW/IarHSnV3eLxasJ+nFhZ/Tk2zj3SYTsc+A89kuXCkoS28yUaSDtgk
	AIaTUDZvJe+0wzGXY/Vi8oI/ZSAldItMr98K3NJwxcATVYlkLAKUDEJGYiSMAzydVGu8v8kM3hy
	FrO64bxMLRyI9qg4Q4XUF2yohCyfniXLy4lfzbgut4/FddkBeHLR5D3RkZilhaJy8MtFS1DKY3q
	LmAd5DBMfNslm+gxPZ+LHqGAYx9GksN4rfdNCYGY02I6hYbd5oG1qYrIjdAXYm/xvKYS+99bbZV
	U0HkFzBI/fwBs4zAsiRfJldwtS8wm6UGZHsJ/NPs93CuDCsCrA+Yj40Ot4ohBBxklR0hItedBTC
	Lace6WrZaLSqHdGf1jbrFlGr5BiMUUGgrDpr8tFizXplOAKP4C2lx4cfWLaiDLnnlWB7Pm37kKz
	bVcgDXXmHi2dOthDh9VqlMjA1v81mXcI6OYYAq6bbymfIx1vbi2ARMF74dFXh+hLdJRk/00CWnd
	6QK0u7+AV9UPV+6zu/S6Z8=
X-Received: by 2002:a17:902:f609:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2e95b4f1282mr11278645ad.55.1792042978332;
        Wed, 14 Oct 2026 22:42:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/82] Revert "gnome-shell: upgrade 50.4 -> 51.0"
Date: Thu, 15 Oct 2026 18:40:53 +1300
Message-ID: <1e695e01446fec3ab11fe6d9b685078a4198ae2f.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130925

From: Markus Volk <f_l_k@t-online.de>

This reverts commit d22efe5c4c2252226b8644ee805863d3c3b5e446.

gnome-shell 51.0 needs mutter >= 51.0, which goes back to 50.4 on
blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ver-Fix-build-failure-with-libical-4.patch | 44 +++++++++++++++++++
 ...nome-shell_51.0.bb => gnome-shell_50.4.bb} |  7 ++-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libical-4.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_51.0.bb => gnome-shell_50.4.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libical-4.patch b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libical-4.patch
new file mode 100644
index 0000000000..d64cf38ccc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libical-4.patch
@@ -0,0 +1,44 @@
+From 91eaa9221b45b506d7a5d84a9ec8c204b5c8c34f Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@xry111.site>
+Date: Fri, 8 May 2026 13:13:37 +0800
+Subject: [PATCH] calendar-server: Fix build failure with libical 4
+
+Fix the following build error with libical 4 due to function signature changes:
+
+    error: passing argument 4 of 'get_time_from_property' from incompatible pointer type [-Wincompatible-pointer-types]
+    note: expected 'ICalTime * (*)(ICalProperty *)' but argument is of type 'ICalTime * (*)(const ICalProperty *)'
+
+Link: https://github.com/libical/libical/blob/4.0/docs/MigrationGuide_to_4.md
+Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/4215>
+
+Only the gnome-shell-calendar-server.c hunk of the upstream commit is taken;
+src/calendar-server/reminder-watcher.c does not exist in the 50.x series.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/commit/b34766f3992c7616b7816a47249fb463c053e5fa]
+---
+ src/calendar-server/gnome-shell-calendar-server.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/calendar-server/gnome-shell-calendar-server.c b/src/calendar-server/gnome-shell-calendar-server.c
+index 0b2f88eb7..622c16181 100644
+--- a/src/calendar-server/gnome-shell-calendar-server.c
++++ b/src/calendar-server/gnome-shell-calendar-server.c
+@@ -112,11 +112,17 @@ typedef struct
+   time_t  end_time;
+ } CalendarAppointment;
+ 
++#if ICAL_CHECK_VERSION(4, 0, 0)
++typedef ICalTime * (* GetICalPropFunc) (const ICalProperty *prop);
++#else
++typedef ICalTime * (* GetICalPropFunc) (ICalProperty *prop);
++#endif
++
+ static gboolean
+ get_time_from_property (ECalClient            *cal,
+                         ICalComponent         *icomp,
+                         ICalPropertyKind       prop_kind,
+-                        ICalTime * (* get_prop_func) (ICalProperty *prop),
++                        GetICalPropFunc        get_prop_func,
+                         ICalTimezone          *default_zone,
+                         ICalTime              **out_itt,
+                         ICalTimezone          **out_timezone)
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
index 549a3d5971..f39d72532e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
@@ -31,7 +31,8 @@ GIR_MESON_OPTION = ""
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 SRC_URI += "file://0001-shell-app-usage.c-only-include-x11-headers-if-HAVE_X.patch"
-SRC_URI[archive.sha256sum] = "2179bab13af353427065096af8bf3d30da7b86e0c516e5ba86a14998af9575f6"
+SRC_URI += "file://0002-calendar-server-Fix-build-failure-with-libical-4.patch"
+SRC_URI[archive.sha256sum] = "c531939539db316a41aef23670370abd1330d3254f84bcb0f9f4dae5d6e362cf"
 
 PACKAGECONFIG ??= " \
     camera-monitor \
@@ -43,6 +44,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
 PACKAGECONFIG[camera-monitor] = "-Dcamera_monitor=true, -Dcamera_monitor=false, pipewire"
+PACKAGECONFIG[extensions-app] = "-Dextensions_app=true, -Dextensions_app=false"
 PACKAGECONFIG[extensions-tool] = "-Dextensions_tool=true, -Dextensions_tool=false, gnome-autoar json-glib libsoup-3.0"
 PACKAGECONFIG[nm] = "-Dnetworkmanager=true, -Dnetworkmanager=false, networkmanager libsecret, networkmanager"
 PACKAGECONFIG[portal-helper] = "-Dportal_helper=true, -Dportal_helper=false"
@@ -96,6 +98,9 @@ RDEPENDS:${PN} += " \
 	librsvg-gtk \
 "
 
+# The extensions app is a GJS application and pulls libadwaita at runtime only.
+RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'extensions-app', 'libadwaita', '', d)}"
+
 PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"

