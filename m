Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8CCC88E50
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:12:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13880.1769407969847534573
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htgrep+4;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d21c411so21199735e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769407968; x=1770012768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAbkIDS6PZo9G4yFid/WXo9CQhuh5XJscuicH7cggVc=;
        b=htgrep+4xEMKeT2ID0kkl9oAJ/TR9EbqG6lYHdv4N8EpZoPXk4SC2523ycd6nFBT0q
         ar+kIjJzKlAhg4r00gK5OUTVphnAo4tGyR8KpWf7ezsm7xxT/Nk5Ld8RYceqXpJB8TIu
         vYN15kiTtkNOiVi94bhBlTgLVq0cxlhZxwD6KYvwUz5hKXncsJJltRZOjmJCzALe5MnO
         PVy3iVfVIiQbbx2UwVy74BCwi5IPQDAtCHnrFZu6JH8Uq/xLSAM/PWTUe/UWWT1W5GS1
         755rB0hNv6pDK7BFH1vqQKtQMx+zdlIMq8eWThjmLE/P5WrUX26KZRREx4Es66NekGxP
         AuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407968; x=1770012768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dAbkIDS6PZo9G4yFid/WXo9CQhuh5XJscuicH7cggVc=;
        b=L6Ssn44tJN/yyzTS83UqCnHs+Cer8095qd/fKKeaUoGLDAKDITTySwU0Pa0AVFI88n
         8ij/ALskaLBqVX+QSVxsPwfJIwZSwTSnpTbCiAYdSkpYSGmEXGnGm5nICzuCjRx/rBV0
         dgVvX/oPcANOLg+TyDNSWYlINliTlg2IFlP+N7Tjlmw2ZrIuRixa64TpeYWmCADSnDE4
         +gl1aEiHVK+Vdpqxw80x8416ixAHst9gbmZy1C2VKynBuYZm7c3xA3pILtrxFas+jWCH
         UMelxmVAFYUdNXXZC7JxE1s+rv8peSKI0lHWjo8GI8ZFh8R5rJGHOXvEugV0NCjQU1WB
         LvnA==
X-Gm-Message-State: AOJu0Yx4zSz/9JvG8xcPsE5js1NbaFxiGKZUA8lP83HJfwodUNudIeg6
	qoYlocYRGuXg5I4kadqMjqViYN87Y+Rf4C6yVnfcxAQk5Cj+5TZiFFiaa2e5nw==
X-Gm-Gg: AZuq6aJWfZKlkdKNwH7Eb+q2hBuCiAlQUyZZhgIYiILNikU/IJ7gSNCpFTF3iivsjUT
	8XO+A++6d/zABAKVXc2FxWfwFR4r2giSToJ2kYeHyrfDu29jSdNIMa1SqWox/3qAr9AmulM1faH
	SdTyfFT+y47nF0GKzb/CWt7Rf8HVBCiyoFwKyOzaCNCMVrcCb2pnNo3G6RqBKe9O9vBHhYTMKJT
	OTGhlKjZ2jEBuT6RyU16VYRXfCzH1a6YkNj5yCkqaz/HBheZL4V+PqHsGgXdo6rjovxSowzuvEO
	NqSkiJHlhh5uYNJ66+4LBIyTo24K7OEZL2NO1jTzNC+uYDViChfCCJimrHbqL55B3k9qj48wZOb
	V6cYBz4TXADq4/lFFgddaMLvr31Y3RrcbHaehHpm2BuvB93mZXmJgKr1vSa85Gtcq9l9+/cEOfu
	nuK6BKlMXC
X-Received: by 2002:a05:600c:190c:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-4805ce67d84mr58205035e9.18.1769407968072;
        Sun, 25 Jan 2026 22:12:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm97454005e9.3.2026.01.25.22.12.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:12:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 5/5] gnome-tweaks: upgrade 40.0 -> 40.10
Date: Mon, 26 Jan 2026 07:12:44 +0100
Message-ID: <20260126061244.3386739-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126061244.3386739-1-skandigraun@gmail.com>
References: <20260126061244.3386739-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123854

Bugfix release. Note that there were no other intermediate point releases
between these two versions.

Drop patch that is included in this release.

Release notes:
This release includes a fix for the broken GNOME Extensions link and
several translation updates.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...eson-fix-invalid-positional-argument.patch | 33 -------------------
 ...e-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
deleted file mode 100644
index dfa4615a3d..0000000000
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From dc9701e18775c01d0b69fabaa350147f70096da8 Mon Sep 17 00:00:00 2001
-From: Mae Dartmann <hello@maedartmann.name>
-Date: Wed, 16 Feb 2022 06:08:41 +0000
-Subject: [PATCH] meson: fix invalid positional argument
-
-Upstream-Status: Accepted[https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
----
- data/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index fd6d5da..74f7e82 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -1,5 +1,5 @@
- appdata_file = 'org.gnome.tweaks.appdata.xml'
--i18n.merge_file(appdata_file,
-+i18n.merge_file(
-   input: appdata_file + '.in',
-   output: appdata_file,
-   po_dir: '../po',
-@@ -8,7 +8,7 @@ i18n.merge_file(appdata_file,
- )
- 
- desktop_file = 'org.gnome.tweaks.desktop'
--i18n.merge_file(desktop_file,
-+i18n.merge_file(
-   input: desktop_file + '.in',
-   output: desktop_file,
-   po_dir: '../po',
--- 
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
rename to meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
index ffdf2c9d38..ef6eb8af93 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
@@ -18,10 +18,9 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "f95f3fe031b0b01c02f79a1659f889152d3772ae3e44df8403d1460ba5eec36a"
+SRC_URI[archive.sha256sum] = "cffd3b33a399577fbb4491ce8fbd02f54c5924f1056f30114e8d420290ef23fc"
 SRC_URI += " \
     file://0001-Make-python-path-configurable.patch \
-    file://0002-meson-fix-invalid-positional-argument.patch \
 "
 
 EXTRA_OEMESON = "-Dpython_site_dir=${PYTHON_SITEPACKAGES_DIR}"

