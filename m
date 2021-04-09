Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.3675.1617934874235125196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bbk6oDPx;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id w70so4351113oie.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GO/TADxaXCj54nGCxO7xU/aO/T2I5reA+CN1SlEk+SY=;
        b=Bbk6oDPxukxEG7DbOVWf5Kux46kxbbHhfaZeczunD1qbIhO3wORE7zYEVj6SoB+AxX
         hzzm0fl4q7yYAm4ViS48m/yMohyDWvRuFf0sr4CrxPAMTbDq2mrWixTfsyGX6LK4+wI5
         Fjesyyyww9lwaXcOocH3KJ7+J3mteRxA/08cvpmxhmsR0r4aYQWn/bYCwwRiJx3lHNrG
         xh7Zu367AFTJAewWyWyZ5aTcCCyf23gYX6tmZgYJETA9sTP5e1xbs3OETdSjsFofCOcl
         Nt60iscH44AHYdarPEByCyXmD2IJCTmsZfu6BAg85C4YhnxsjmCecTND8Qu5+r8JcoFw
         Ou0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GO/TADxaXCj54nGCxO7xU/aO/T2I5reA+CN1SlEk+SY=;
        b=rkrCqFRN9OVa5d2B86qusCf0YwgZXTIljcdyI2xLodtVl/XTj7qHRaAWHR+W/43Uoq
         u5tUcyJO0WYUo9dU3fBKclpfexb2qmTWvmwg8N7ceHGgLMMePe8apN/5ccfIYDe7SJ3p
         dpy+ZM+OiqOGJIgMDGwJ7+M87SlfLUaG9c7sSbJgpCgvnG5/N1DsiR/1SczJXRUl3bCm
         dLHK6lDfzQ4dzFBf4XdefFzqSWB9GmuKLJogTtX6n4mKRGRLFAFzT+1ERyLAHTvPDOpy
         EnJi4ep+E/z7Kvps8xna/mTW2CeC+AdIilxz8LdddL9kQVz1yQMhKVuz55+W0Lepo9hT
         P0Uw==
X-Gm-Message-State: AOAM532Di1BqtDCKOOGWIwK4pBChwAMjUp+1i+Raxe1QBbciK97qcoBh
	JWolujiReyrcipRJwSoZyMsxIyGKFGQ=
X-Google-Smtp-Source: ABdhPJySm2iEJIh3n13QJtaQRqeQYH29Z9I4xW2ZkwwMu3vF42opxvPigiAg2hkVEGZtreR20O536Q==
X-Received: by 2002:a05:6808:94:: with SMTP id s20mr8291984oic.25.1617934873492;
        Thu, 08 Apr 2021 19:21:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 23/36] xfce4-battery-plugin: upgrade 1.1.3 -> 1.1.4
Date: Thu,  8 Apr 2021 19:20:36 -0700
Message-Id: <ae5e1301ca6461e12e488829c218f0d5179ca0eb.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 1.1.4
=======================
- Add help button to properties dialog
- Drop subtitle from settings dialog
- Fix labels alignment for very small panels
- Fix compilation warnings
- automake: INCLUDES -> AM_CPPFLAGS
- autoconf: Some updates
- Remove unnecessary boxes
- Remove GSourceFunc casts
- Add new README.md, update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Update URLs from goodies.xfce.org to docs.xfce.org (Bug #16154)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 745e253618a10224d653f6c0f0eefb1e11b5a87c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...4-battery-plugin_1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
index ecbdc265e48..9e65cf688a8 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "9f82c7e77de0a417716d68d33367973b"
-SRC_URI[sha256sum] = "12be0a44d16bd1e1618513ee64f946814925872db7d1c1188ab1454b00d040a3"
+SRC_URI[sha256sum] = "107df2a837156c010e1eab5430bab90c77f0a3dc699b5937678c8a9c5e64c222"
-- 
2.17.1

