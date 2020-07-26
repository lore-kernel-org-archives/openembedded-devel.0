Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.40083.1595802912308566881
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VMoEQIqK;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id kq25so2209449ejb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oIzeq5H1I5b7PX09O2XVNUgDVDll9wqM8Nc+GwWreW0=;
        b=VMoEQIqKibHCafDdOqnx4x6YZNAE4hVltonFfM7jYKYs5DaNrnHEfD/NViEU9jjp+E
         DNPW+EAhsQxZPfOVTOHvvDZ1zdMRZYaJR+SMOwmkhXzPy6gIvPzPi1suX2y/IHzqLsj9
         /PEjhuB48yHZeua5vyLvFNRRnzg3h0dloin8T5yxC4Hw6cyOylXy4hHrtcjiQhGRPnIm
         YOGeEpK86jCxLgWZoZU3MvOTfzM9klZd0kdAbYfNw5VRusQPIxwRdrCc9XsTpewEijYo
         Y+zfqyt05g5tB9bTQxlqc+eMPH2Grvxec93fLLx8vMUG3ubEgIvbdN+VS+iqSRLLpFpo
         CH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIzeq5H1I5b7PX09O2XVNUgDVDll9wqM8Nc+GwWreW0=;
        b=QnvacXoIUtXtKm2lAO5EaQawZ/ybGcDolONXw64sPFveUVVMV2fC/iR/Y5qwXG4+qZ
         v2aIvoq/Zc1E7GTdlpa8/rLhuc4tY4oE3uGxUzn21rG/9VOwc6SIAWbqPh1blEfkjzUa
         LNI8B9Nq06achEPl9CcVdGUmE2dSB1b/rvnFb9YfuYo7ZueAI7ohVbwNscnMKgQZEEmV
         ipkvMhEKvlfqxwAUS1+jt9HXAmgSXRT43nI+D4UW1E/UGn9/62WydyFuRATkqbu4P0qN
         m+TszID9x2r3Il4AoyhBcLg8IKDa2OnY+8KzYWkznxgnUNAuVsPEk2vgG2DuzeKuhPHc
         +hnQ==
X-Gm-Message-State: AOAM5323WSpwIwHjjs8RNCDObmJa2NPsTCUB0EN3eKQAsVE2ntNE7o9u
	8Ul76MwGHzqufhCScQB29xbryg66
X-Google-Smtp-Source: ABdhPJxTMr0OaGHSGGZIR0lSP4zTo0eoWdGSyhTngVjY2zh3upKoOpcO2OHxMKtbqZrDyD+8MpbDWg==
X-Received: by 2002:a17:906:819:: with SMTP id e25mr2695718ejd.95.1595802910675;
        Sun, 26 Jul 2020 15:35:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:10 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/10] gnome-control-center: upgrade 3.36.3 -> 3.36.4
Date: Mon, 27 Jul 2020 00:34:51 +0200
Message-Id: <20200726223455.333001-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Version 3.36.4
================

- Updated translations.

Sound:
- sound: Stop non-interactive profile changes from triggering changed events.

Users:
- Don't limit the number of maximum fingerprint enroll stages.
- Don't use sync calls for deleting fingerprints.
- Only load the fingerprint state once.
- Make the fingerprint operations cancellable.
- Don't wait for fprintd on initialization.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ontrol-center_3.36.3.bb => gnome-control-center_3.36.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.36.3.bb => gnome-control-center_3.36.4.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.4.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.4.bb
index 81f42438e..86b8304b6 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.4.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "fd99a8df0cc656e971415f2a1b310019"
-SRC_URI[archive.sha256sum] = "bc174d970dbeca3ee19c26019de31e9edf78dc9c4abde16e763566ee38c3691c"
+SRC_URI[archive.md5sum] = "16c228d7de4e9d2d57550791fbca3390"
+SRC_URI[archive.sha256sum] = "ac02346bcf3391aa5c86ed857d76689fdb6e43c2b4b20d3ec6eab0ea9fecf754"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.26.2

