Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32460F531EF
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 05:58:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12520.1776146273009017446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 22:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rgSEbIGQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so45712455e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776146271; x=1776751071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26ddMp+83NoY18Ig2UH0pyAdRwfsQFN+C7PEyyHo2tU=;
        b=rgSEbIGQAFbecC+CF27G9c1GmleyefSMh7llWnsDEBBEXEyK5bMI3gK86JEvPyTPgh
         +rvf0lSqZgEekQFFryGs0WhsgrnUXgQh1LJLj6U/5Nm0Q+BZB57VWkdaTtQaORL79xfl
         EZVUJkvhE/LjeCujoYdql8fwD7ShH7CIk0N/0VtEBVCdcDx0a44T9DejdDPyGjLeiTeR
         mzDaABS0SX6ggGhlo3y/Izyi/VZTKKiQzdltdoXdv0uA4xtxGAtSSqEE2JdxFebRsTiJ
         MF2c7hZmkTmLFzm9rLv6DO/jH978mJDmSjLuQqCEKFpocTtY3A6LRGqIdmXPhrDA94sR
         158A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776146271; x=1776751071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26ddMp+83NoY18Ig2UH0pyAdRwfsQFN+C7PEyyHo2tU=;
        b=noHx84xTSHJlN80zbk0CIPgKpo2stDr1+9DgGWIoxYX+GekSe3jxqXxZlNjEcfw0w/
         SzId0boZ+yZ1xxhOU7ER6rhckqet2ofvgCYFeWAo3Un6OpjrXjRtEeGN+AlV20RRw01Z
         YZg3Lblz7kHsV9eqvpUeZXaGPoWjFCDxSWimiWVtXmdfScj5L4yUn0+fYDDMvaIyJ6Hb
         McGyDHpWpN33EaXQTf+JqMsfp37/nDIYrOxR8/W/8e13shKXmoSNaqqCNhMeKpaaKEse
         rFyZU/uhmqYBAsLkvaJlIPU929Y/PuJ7fdpxj6X0CNHKAnMTmK/RKCPb5mAIgE2qEUqE
         57Qg==
X-Gm-Message-State: AOJu0Yzv1gnNMlWjofeIB77YPyisbh9ut5fLmZ/vCrueXVTyIjXCmuzC
	TiWzNqlwQdDD4Ku2sjslRRUDK8bYoHqIFxUT8TaQxxhxvvItYshBh6WhVdpL7A==
X-Gm-Gg: AeBDieuVOV4Ep/KIS75m4fAOcDYk4hoFx+qQZU3mklh1TBRknq9CapMur5qnFnp57GZ
	1crisGQUTYM/xTx1wTn8IC39HW69FKl8W4NpTJBTxegOlgFwzx+OFG2Zg+C3B7H5tJY3vbYOxAM
	4/hTpZ1Sp9NSbJRxvMTodfLHYCzHJjM/VWfPNuHgUYYf0an2w178Lr54NA4VEWxP6aNwR1XIAC2
	uTtCAOxEc9sulW4QYA8Op+TfgGIEXphrBtjVZhNwTzwdnoc+0pE9ez4RKdoHEwOKLhwQXk/PAxS
	49FIDch4/3BXTntWM7d0szwlv0W6RIqLlf184DQ/GXKhirBv/mq6KpeQLNXR56dhQMa3VVVfA+y
	dIRGe5TkoBiOnY6Ngaxr1ie65Jl5tPRhLNwtScExpjKMRY0BmD9OSjMf9lsuINilv0ZN902nasg
	TJlWsqzkdAAcYMtgk0/MKuUJRw905o4lg=
X-Received: by 2002:a05:600c:a408:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488d68865f6mr168901775e9.28.1776146271258;
        Mon, 13 Apr 2026 22:57:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dcf845sm113184355e9.11.2026.04.13.22.57.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:57:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] xdg-dbus-proxy: upgrade 0.1.6 -> 0.1.7
Date: Tue, 14 Apr 2026 07:57:49 +0200
Message-ID: <20260414055749.1163036-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414055749.1163036-1-skandigraun@gmail.com>
References: <20260414055749.1163036-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 05:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126296

Contains fix for CVE-2026-34080. Since it is tracked without version info
by NVD, mark it explicitily as patched.

Drop the patch that is included in this release.

While here, also add the recipe to the ptest list - it's a fast one,
runs under a second.

Changelog:
- Drop the autotools build system
- Unbreak the CI
- Prevent a crash on disconnect
- Fix building with glibc >= 2.43
- Fix the eavesdrop filtering to prevent message interception

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...b9f68664166badfdfaa7e69efcedf750f1e3.patch | 33 -------------------
 ...proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb} |  7 ++--
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb} (83%)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index ca800f12fa..0e63c6af10 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -58,6 +58,7 @@ PTESTS_FAST_META_OE = "\
     uriparser \
     utf8proc \
     uthash \
+    xdg-dbus-proxy \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'xrdp', '', d)} \
     zeromq \
 "
diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch
deleted file mode 100644
index 5ae21b5989..0000000000
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 99f9b9f68664166badfdfaa7e69efcedf750f1e3 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <listout@listout.xyz>
-Date: Wed, 4 Mar 2026 06:27:54 +0530
-Subject: [PATCH] dbus-proxy: fix build with glibc >= 2.43
-
-memchr() returns const void * when passed const input, but the result
-was assigned to guchar *. This triggers
--Wincompatible-pointer-types-discards-qualifiers when building with
-clang and -Werror.
-
-Make the pointer const to preserve const correctness.
-
-Closes: https://github.com/flatpak/xdg-dbus-proxy/issues/70
-Signed-off-by: Brahmajit Das <listout@listout.xyz>
-
-Upstream-Status: Backport [https://github.com/flatpak/xdg-dbus-proxy/commit/99f9b9f68664166badfdfaa7e69efcedf750f1e3]
----
- dbus-proxy.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus-proxy.c b/dbus-proxy.c
-index 53d5c01..b32df34 100644
---- a/dbus-proxy.c
-+++ b/dbus-proxy.c
-@@ -133,7 +133,7 @@ add_args (GBytes    *bytes,
- {
-   gsize data_len, remainder_len;
-   const guchar *data = g_bytes_get_data (bytes, &data_len);
--  guchar *s;
-+  const guchar *s;
-   const guchar *remainder;
- 
-   remainder = data;
diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
similarity index 83%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
index 617d29bd84..a8e0a651ad 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
@@ -12,12 +12,13 @@ DEPENDS = " \
 inherit meson pkgconfig ptest-gnome
 
 SRC_URI = " \
-    git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main \
-    file://99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch \
+    git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main;tag=${PV} \
     file://run-ptest \
     "
 
-SRCREV = "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
+SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+
+CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 
 PACKAGECONFIG = "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"

