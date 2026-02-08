Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C776FEF06E4
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 20:03:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32807.1770581028039577853
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 12:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVgUk2Cs;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so44555785e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 12:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770581026; x=1771185826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQWIOn2AEOJ75db3Bu0OiBVZzNQ8P9MuIRbZSpelpZc=;
        b=ZVgUk2CsXEWpxsxUHIFCjRQo5T0nXlcOz6vKVzNf0RMg/+vcRuEHy0n6EOAahIIifc
         CT/PoUDCr9fGJqZKhceoq+6eDVwPnX8jbKoWbG0/5bK0cu/159KjM0TWWugTQWmIwK5H
         /ybTVX9guMJj1brMmt/OsiO1C65IZPL+PeDNiaU5MDVwZ9G6a4M7nAVGUXRayl+Glgw7
         5Im13Q1I9+M1y8y1oZOEek1ayDx4Ca5CE5p3L9Im1xM1hyqjQMwPwMVwXAuw+c99uzf9
         5Eqk09vUJbso0c9xvh1MA+9EbcZMMzvL1N95GqzQNuPq48u8ecg7EYMFez8m7o/muUUc
         ft1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770581026; x=1771185826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQWIOn2AEOJ75db3Bu0OiBVZzNQ8P9MuIRbZSpelpZc=;
        b=w2cvuBM+XLX5Gpn1XyeZ73ygsa5lAHkwPaDWzcgR266+umYARXOT1yzeQU0G9xivC+
         vucWUwcvSzcR6BBbGA/AsxxIXfNxuNV9kXZhbuM1J5cYXAqeRrPr0Zntp+F4J7iOjmcg
         tyw8J5sdtxJmpH3oIlwl5YpPNRtI9XxNMRJzRGIg6pAmTF8TKCsyea5IYa35nkL9lLHO
         UH80YzFEUIJIlASDaD3RAICXgmsKsqsMH6UIC364Y5sfk9nGD9my7u8yrNvJ/0P51WIr
         x3PSDMCKMr3+VD3VKysxLfyyUxPjgsyLjh9lsyfahfou4otwXOX+MPpw0/i4Dx9yV8DJ
         2czQ==
X-Gm-Message-State: AOJu0YwC5LO9DZ9j7DWZW5F2zR/SKQoyWKIxVWslyGCEy7JSmHjQiL3l
	+IyoddS0qELKdI3ywo3y2cowMC4BREsjnl/X/OJEQurB4R5h8NLwRz9EKiqjAw==
X-Gm-Gg: AZuq6aLFIvk8RySuMRAX4mZKtniul7QPy0RFbLQpcq3NqqXffDSiT8gmakGfIRo38eF
	RZtaRi5VOySMKJwhwy0j8Gd2MLZqVcTeI0g6F/Kx89IyJr662uj9vCudE1IEfCrHx2QMNsH75oY
	EOzvDGC4C/s9SRQMSXLiLga3V2/tfDLB5j3LRg4o8zZSHAskH85Qg/utDNaj7KlAjS1ATy3hz7u
	xjDdoaLZZQlb5bgrA0bMil6hwl7RUVil56mCXNCU2MLl7qlBCzGWMAcZ0/5f0tXFBtRLx9ZuhUg
	4pz1jtAyVPDwZ5Av2zJSFTU+euLT1PEuRmp9uWJ8d4BV/N4LWdZH4v9/HRZOD96iknnw7ULTzE/
	cMoFuDckJgDbsfIIIATjIRsaP6kN4Pwm/q++7M2bO/Pt3OlB+ExAND0ElwxZYhUv7zGiThLQyJg
	cUD5JaQaRu
X-Received: by 2002:a05:600c:45cb:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-483201dd216mr120563585e9.1.1770581026267;
        Sun, 08 Feb 2026 12:03:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8e8d4sm278069555e9.15.2026.02.08.12.03.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 12:03:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-tweaks: upgrade 40.0 -> 40.10
Date: Sun,  8 Feb 2026 21:03:44 +0100
Message-ID: <20260208200344.3917693-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208200344.3917693-1-skandigraun@gmail.com>
References: <20260208200344.3917693-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 20:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124286

Drop patch that is included in this release.

Changes (note that there were no intermediate releases):

40.10:
This release includes a fix for the broken GNOME Extensions link and
several translation updates.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...eson-fix-invalid-positional-argument.patch | 33 -------------------
 ...e-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
deleted file mode 100644
index d921ff3308..0000000000
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From dc9701e18775c01d0b69fabaa350147f70096da8 Mon Sep 17 00:00:00 2001
-From: Mae Dartmann <hello@maedartmann.name>
-Date: Wed, 16 Feb 2022 06:08:41 +0000
-Subject: [PATCH] meson: fix invalid positional argument
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69fabaa350147f70096da8]
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
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
rename to meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
index 498d392e89..d0f00a85e6 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
@@ -17,10 +17,9 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "f95f3fe031b0b01c02f79a1659f889152d3772ae3e44df8403d1460ba5eec36a"
+SRC_URI[archive.sha256sum] = "cffd3b33a399577fbb4491ce8fbd02f54c5924f1056f30114e8d420290ef23fc"
 SRC_URI += " \
     file://0001-Make-python-path-configurable.patch \
-    file://0002-meson-fix-invalid-positional-argument.patch \
 "
 
 EXTRA_OEMESON = "-Dpython_site_dir=${PYTHON_SITEPACKAGES_DIR}"

