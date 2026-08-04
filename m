Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7DFC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 11:06:51 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13804.1785841601326245588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ACpeYSpi;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6689f36ae56so6958705d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785841600; x=1786446400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FV3tQxJ0vTincE0pewggijmAr50xIV416MFtIu8X0qY=;
        b=ACpeYSpiVPxO3JDUCMmvR7r83XukQureSm5A2bhyQrTEPD4KNAFMbqYs0gYfynxXrb
         qNOxQlxhDkoCVS4LalO5EUd/nxdDp+3bk+BewNgLhNSnxLavYYjZuGe7y8qKx1uTiIaK
         IpNXLknY7Vr9pBX5ZU8H1su0GgCUGVYivu3OlGlpJm7iGSL9Maz0xNJI9ewcLwn7Ue6N
         aT8+pznW2bIdoy5GCzXH731J3+bqy5f3vnZ2rTYeZFgHtQMQz7xqdsO64o1t1nrYHYbf
         +LHHIOi8D7SikzTpc2bpm2kJLoEm6ZD8PUXiFMVf1oW/ZIw39hXGc/BYIn5LQlyJaPUT
         orYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841600; x=1786446400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FV3tQxJ0vTincE0pewggijmAr50xIV416MFtIu8X0qY=;
        b=EHC0s4KSupHCnmF12LE58FviNqshrcEtCZL33CWrK39WSy5Q2HAjv75jgqMRLyxRde
         DK/95H8L5uFxPtoNl7NLt3F7D4xYfWMCv3w5aFN72gPepp3p0AikWApcyMYAZDnsDs06
         80OmfSdN3uYUSy7HmSNF/MOCvO4cLtXWQpqgi9aCFHpG4btauISRQE+wQdHPHZ9ixVJP
         Us5Q5vpIKNKlQR7cOfHz38fYaBYe/be8o9tCr8+5rhYoClOjHdnA924DZI+tJU267qyv
         r2r0lr9f8wm+njXsRyN7eye/dhBgjGcxDNpHiP5oqMrzo8KrurTF/Xq3hZHCmi5x35uR
         rtgg==
X-Gm-Message-State: AOJu0Ywstgkg9LxhX1jzqNmh3G01VjEhlwHR1X2szDKWiZMyzWRrz36F
	cfvmUrtJjYYCeuNonXPkBlyK1W4P9davdkhF7UCI+3x0Z3ErWWe7+PydJeUxZNCb
X-Gm-Gg: AR+sD137v5uK8PV1xJMwl9b4aobtakFYTjR1WGf30ytXxc+yNHHhTneDpdzCrUojln7
	eRoD5m4W3Ka2v9eyMwARLCIVf5FJa4BfoKm8fYFLDuO+6DyPMhA0U5urfx7DSselO2HyHsZIJYI
	p+9RJzQlxGWmGHoZgesTtdlVpXHlGNQcSDibmiXTCg/ZQ7CNfeMdTZ8aCTmliuYaO2hCDMDYqge
	IaGAmx2j5TAGJhtPyZ1bE2HaX9bvqSqX13Mc7MK+sLAf72nnZ59EW0mqk1xRkIij5Ja6F8GXKz1
	5JIBtJHenzlXJkjr6fLEb5LbfWXqddhrOdtn7X/rYbbm/P0eDzfTuhE5hAJA0Cl2AliUkEDb/3e
	d0R714QL6+XcfuyhA9fik368H8b9CEfofuy9VGMlT6ywU9sp4muCfpjuWfciWyktEFC+kd7qc4C
	awKaY1+rwqyo5r1uGe9jLnsQ2W8osmB6S73D9QG/oE+0CyD7NADoZ4c99h1DF0xwlaCRaYJbDKb
	XJNz1He7WlFGVRVkQZS52QWEoYEHsygtIef4RvybJWhJKSJMeX6c6FCr53tEVyqgPuWIj6epdzD
	01o3Y0Tv/OUE
X-Received: by 2002:a53:b41f:0:b0:668:171f:824a with SMTP id 956f58d0204a3-6694f098762mr12121615d50.22.1785841599910;
        Tue, 04 Aug 2026 04:06:39 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6699163afc4sm391379d50.15.2026.08.04.04.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:06:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v3] thunar: upgrade 4.21.5 -> 4.21.6
Date: Tue,  4 Aug 2026 07:06:28 -0400
Message-ID: <20260804110628.3439-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128744

Drop backported patch which is already built into this new version.

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-Properly-guard-gdkx.h-include.patch  | 37 -------------------
 .../{thunar_4.21.5.bb => thunar_4.21.6.bb}    |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.21.5.bb => thunar_4.21.6.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch b/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
deleted file mode 100644
index 9d4afc7167..0000000000
--- a/meta-xfce/recipes-xfce/thunar/files/0001-Properly-guard-gdkx.h-include.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From dd7fbf4540891053a4083228aac2485e6c469199 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Sat, 11 Apr 2026 18:07:05 +0200
-Subject: [PATCH] Properly guard gdkx.h include
-
-Fixes: #1820
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/thunar/-/commit/201f8ca0c3bc7b5e651201526fc3006a130718eb]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- thunar/thunar-session-client.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thunar/thunar-session-client.c b/thunar/thunar-session-client.c
-index c36719c..2832818 100644
---- a/thunar/thunar-session-client.c
-+++ b/thunar/thunar-session-client.c
-@@ -30,6 +30,7 @@
- 
- #ifdef ENABLE_LIBSM
- #include <X11/SM/SMlib.h>
-+#include <gdk/gdkx.h>
- #endif
- 
- #include "thunar/thunar-application.h"
-@@ -38,7 +39,6 @@
- #include "thunar/thunar-private.h"
- #include "thunar/thunar-session-client.h"
- 
--#include <gdk/gdkx.h>
- #include <glib/gstdio.h>
- 
- 
--- 
-2.34.1
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
index d8e9edfc25..3ccab0ad69 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.6.bb
@@ -11,9 +11,7 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gobject-introspection mime-xdg perlnative gtk-doc
 
-SRC_URI[sha256sum] = "eddbd4bab29c73718734e0bfcf650ceea8b4fcc8cb2cbb0b24fe22b286a2be00"
-
-SRC_URI += "file://0001-Properly-guard-gdkx.h-include.patch"
+SRC_URI[sha256sum] = "5412d3feb14b4c47ccea8b00e9a9e3dcc1ea0e86e305abcee344f2fe82518bf8"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-- 
2.43.0


