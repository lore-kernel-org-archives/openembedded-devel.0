Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.7216.1620698859660329052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7mzVhkz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id s82so10195140wmf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z9ULDfIddMqtN8r/zXIEn5kduT0YLLaqaqF7IoJj8PI=;
        b=Q7mzVhkz9XqW3tc9/VJM1n5C0clOH92yDfS/Wqb23/hGpXJ4jy6Dcn5uj6jb8J2ZkF
         DRLQTZb4mQbY5FSWe97qcvQDp2sgECMnUuVUpLtHDFPfqnz6vvaAygaZZvHsLjifCpsk
         mhkJ3nqbeCZZSgTM3GEEO5LMobZ+fXfLQ7Uj+vaYlwOSbmVXJ6gzy/7DItpGQCV0mrqK
         rdpFwHG9OZgIKYepTZwfiQunnVbgT+h9P1X8g8Xvt7CmmCCvOpuGfPnrT2zLx7LEjj67
         WN7jm4owhZTnu6CHfIoiAmoVnFcGRF8PBxkDuzGAr5uRc/NDsHzT3PRfXigPXfCtFZ5S
         bzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9ULDfIddMqtN8r/zXIEn5kduT0YLLaqaqF7IoJj8PI=;
        b=LEnt/v4rM6SAbTHAQE+dfSMaDWhI9CMghS1h/orpmBM16HjaHsl4WiFqYEvf/Jcldo
         fOxmrgg8hK2W9sDmllR2weuS8D9N0wyyri0tTeXY17BQm+QTGpeQwdVgpIvbJXPMCQTd
         ONOL8xaMQdv15gIibaz2GkoLtsOkWG3P+X1yoZxSY+XjXGpgr15qvqkQF0cAnYvDe59+
         WBWOxFKTkkdjtV3iLXb/QDAniiEdEj0QwVuizIr7rtmZC+P/uacCA8622FyeWMDyG2y7
         fswmnbUoIfVHpRDGVqIKHCpOd4hFdO4UECwTVRe9bupnOWz5ejmadAYGajFFVn+WtWXl
         F5aA==
X-Gm-Message-State: AOAM532pb5Khv1d/r2CHGFTJuzaMfbOTrbyeBilUgTpk5z4pxomWUFMV
	65mDB95Bqcxd9niIM/c9ffwNe/SZySE=
X-Google-Smtp-Source: ABdhPJz5D7wSSJ+FBmUZaizIZzKchUVOhAPwU19C3dlG941BZ2OXE26SVgWv3ZbJhq/nfq76kNbH+g==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr2343824wmh.174.1620698858065;
        Mon, 10 May 2021 19:07:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/7] xfce4-clipman-plugin: upgrade 1.6.1 -> 1.6.2
Date: Tue, 11 May 2021 04:07:21 +0200
Message-Id: <20210511020725.346160-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.6.2
=======================
This stable release targets Xfce 4.16, as it relies on the same GLib
version.

- Add G_GNUC_FALLTHROUGH definition if GLib < 2.60
- Remove obsolete GTK_CHECK_VERSION checks
- Fix function prototypes
- Remove GSourceFunc casts
- Fix compilation warnings
- automake: Enable subdir-objects
- autoconf: Some updates
- Check for `locale.h` required in release mode
- Update `.gitignore`
- Require gtk 3.22.29
- Fix GCC warnings
- Fix return type of grab_keyboard
- Add README.md
- Avoid deprecated warnings with Gdk >= 3.22
- Add basic GitLab pipeline
- Bug #16717: Move from exo-csource to xdt-csource
- Make settings window title translateable (Bug #16625)
- history: Re-enable singleton
- menu: Indicate primary and clipboard content
- menu: Indicate the primary clipboard item
- Speed up shutdown and paste
- Correct location of appstream info
- Fix a couple of grammatical errors
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...clipman-plugin_1.6.1.bb => xfce4-clipman-plugin_1.6.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.6.1.bb => xfce4-clipman-plugin_1.6.2.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
index f2a145f5c..631702667 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
@@ -8,10 +8,9 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[md5sum] = "c9306940c0ca7abd838a14c9d19b3a7e"
-SRC_URI[sha256sum] = "b3e8317796289196fa78c4526626fe061fd35d11e848cf300ca1ace47febceb4"
+SRC_URI[sha256sum] = "ab8a5fe6f68fb1789190e498243a1d1385de3f64e984f470cbd3d1eb779399b8"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
 
-FILES_${PN} += "${datadir}/appdata"
+FILES_${PN} += "${datadir}/metainfo"
-- 
2.30.2

