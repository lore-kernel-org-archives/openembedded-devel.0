Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.11274.1622894997161121660
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GdBfPpDa;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t3so14223991edc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0wMCArO6z7Uei0FqtMl0/2iXfslWlrclc7EyMf1wKBo=;
        b=GdBfPpDa8Lrd9i3pGMOAPcPsg8xLAQd1KIe5DD6ZX9x1XT1Ie+R29aG3gH83JvRF9t
         zRpsatTn/qNSk3S9qJdHnQrVOvKed35pKU0Gtomb7tuPSQ3sPWVZB7MPojv2KahPubpo
         as5WdiyiTh/DpDlhZW3okFFJc2i4Elk/dmkVewqXfnX7cEjU9M3ntm9hAIqLA13NRShA
         JJ6Te7X55iLhszwA7VvRXDW8pEkfzXdsHrSfxoYmYO5jRUwguLkMXL3nR/lZC25K0KVl
         H1e2FEZ17mcw8+0dvX0YbmXWSTVGUv+nZ0NIHz+Dco3NaDUJV5uiJuo+Z4/xf70aaC+K
         3szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wMCArO6z7Uei0FqtMl0/2iXfslWlrclc7EyMf1wKBo=;
        b=JrDzV17zrfq6rgwxprv7QRRsp4r5sWPBd7r23LRrTii9CPMLpiM9dxugm0zuxN6bEO
         F8uaX5f0PeGF2gxZ0XrqpQAgYgOAYc+8aojKLJ7zcm8KWbiSHD8rNQcwqf/wSyXgyp/D
         Nc41epBe424JKtwPwbdRDaHM3dq1hyQocAoAnG2ffNu9zlEBbpF0s8tm9q6/7F8QfkOZ
         R4P3FyQiOD6DgUZGUElkG/BVfHYrN2Eg22+DcRBl5zsFgMzKSXSQMDCxRawP1GZYU96o
         MUpKwbUwMb4ghv4Xk+7UVyCTj73ekcrW6C3rJgx8vC204IwznWzOOTj2kwFxDfVf9A4B
         g2bg==
X-Gm-Message-State: AOAM533e3YjugfPO7x3fktepZ0xb8gnXLPgTWoRghWPvoyTpsJLPlRwm
	kOffWCP6kWDSgJGusJ9AGfMtvTvWRFHPbQ==
X-Google-Smtp-Source: ABdhPJwGWc7Vry0MjgDWJjpIRrAmhZmtI5zlwXQFoWhD/qLs3PqC4YdWU/Sk692Tl0JI5n8nrZUMVw==
X-Received: by 2002:aa7:d305:: with SMTP id p5mr4302816edq.167.1622894995479;
        Sat, 05 Jun 2021 05:09:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d25sm3994489ejd.59.2021.06.05.05.09.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 05:09:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] gnome-font-viewer: upgrade 3.34.0 -> 40.0
Date: Sat,  5 Jun 2021 14:09:39 +0200
Message-Id: <20210605120942.1080733-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605120942.1080733-1-schnitzeltony@gmail.com>
References: <20210605120942.1080733-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nome-font-viewer_3.34.0.bb => gnome-font-viewer_40.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_3.34.0.bb => gnome-font-viewer_40.0.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_40.0.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_40.0.bb
index cf202256b..a2f0af679 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_40.0.bb
@@ -7,16 +7,16 @@ SECTION = "x11/gnome"
 DEPENDS = " \
     gtk+3 \
     gnome-desktop3 \
+    libhandy \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "76004a8986ea622b09c408b01a6f42e5"
-SRC_URI[archive.sha256sum] = "aa6f0583e5f93aec095e537f0638b29de3d02491f0131ef584a7c55d39d6b98b"
+SRC_URI[archive.sha256sum] = "d2cc7686946690dc274a5d0c72841d358d0ccd42d3f34993c698bdf13588fe42"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.31.1

