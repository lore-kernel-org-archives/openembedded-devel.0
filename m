Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07116C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 08:51:18 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11993.1785833476195592980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 01:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Pio7Wyq1;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80e2cfe6918so45984627b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833475; x=1786438275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8r9EBBvXYUkUD7QQkmZWZuu7AasQRQ+yj4LqpdZIH8=;
        b=Pio7Wyq1g/Vc4S/zvbTUY6Yy/H1C20ZgoiarbVYp+tBvJu0SJdY6YTvUK2JgVPv9x9
         2scM2gVPjN4rrRrfeqnqqVGDP+oCCW3yZF3F8k9lkpSG0sj+DF4fPfP65oc9Ak0lM8bb
         +rTtnaAcD642qkPEXur8DtFwzSCj3LL4jDBsZda+ZDqwYeXyJxaEVjQMbmE6wHd80xgV
         GIQPkmth9ux4Np5YEoIf2NKOvln9WPPTYjdTFkRluZtGh9JLOMhLPfikDDGMgZ+3lyYE
         5N5/itzQ2MqzZovJ1cu03fJgYBV03DMwrJs9d16SAZkDkjXUs7ET06J/g/ulyxSTz9jC
         jZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833475; x=1786438275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8r9EBBvXYUkUD7QQkmZWZuu7AasQRQ+yj4LqpdZIH8=;
        b=D9dSZqWd8xMocfDqg6Aq+cTvpUkWFQBzTf512m7qdnJOxqZeK2CIzwee3470zhqOE5
         wdIv2SKNieaEqiKtXN1krj/H+H+H2L9oYfhsRMFkTO5yXfsDphjF+zJk21CX+JXHYDGi
         /6KH5IE1ZXmS1F8kPTqCwVsuWpa03YpjPN5ZeU6GKDFvovrE3YxZRRaC/DwKBShBqqL4
         1vNte1qV50wYJvdMtNB34xHchmngWuiHUXCJnCm89RPC1A/Js/9H7FUHMre7gDbGa2an
         xL5stSjEJYtDbOeKZe/7Dw4ZuApYj2xT5K1XPwAyctFbBH7If1J9KPZGNYqT0mHklV77
         HD/g==
X-Gm-Message-State: AOJu0Yw/B+y0pGapev+onR/NFxn4A2R7zwCJm4WNtPYSHAl5Jm+YPyP9
	jlBzRYKjr1XftGFU3DHJj/ChKY51zI520Zm55/DqLd8GmK54cXLSAe3cQRs8UCBV
X-Gm-Gg: AR+sD12K/7YXSRaNJjj0/FLXI4/tv4iFTOGSpPAueBckxNwrSdgXy44EVloiW7DZ8t3
	R/s6aZpH7kWJandxpq6fQPKThqVE8te7kRjoBrTzZFw1UMrrPDH5lfdO7y25TlCpTxwXlYycVrj
	+r3SLqah6UcTzuu9noFdf60uwhrc8kplJZO/3CAmYUWOBbHtQPqjsSF0aW9nUfTp1OcP6s0ilMZ
	58EYjR5nwd0kms0iiMQAirMKdJPTr1E+WJGwtmuMCx6TsFDYTUQa2PU2p5gQZ7QzxFfLbHhV6do
	yXAjGDBlctHpZFuwwvH3SGAMjxiqBvynq1VbXEs7lvDO/f9YfQQBCmglrfWhrWFcGEOSCYkmMFr
	6x63zNcKgeaR3/kgudingKgQ/QJwyTWg8UL4B3D51yRmxWOf3M11GY649GTd+EaeZqG6oX9S3PE
	RQwepdp+wcXbLcQ1nilZyxwse1lpIbtX7ia/eQ8AM42Q9FqFUGyMQVjTzjGrG23BgTkoU9rnC/z
	S3cq7pp8qEiGDprFa+uL1HO/6i+mK7SaaJSj8KuTWJH9Weml5h+kiSie88L7MsdKGpzVetJAd/y
	iZcDeEsiwltd
X-Received: by 2002:a05:690c:10c:b0:81e:893c:2c23 with SMTP id 00721157ae682-81fd4a379femr139120367b3.11.1785833474984;
        Tue, 04 Aug 2026 01:51:14 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201341c6f5sm1650497b3.28.2026.08.04.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:51:14 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar: upgrade 4.21.5 -> 4.21.6
Date: Tue,  4 Aug 2026 04:51:02 -0400
Message-ID: <20260804085102.2850476-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 08:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128740

Drop backported patch which is already built into this new version.

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.6x

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


