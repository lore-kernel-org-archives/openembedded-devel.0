Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.891.1586895478369691048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dKYkGESc;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id y24so15795439wma.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+EyXixv0xWAyCSj7ktJPOSk5Y9a5khW83TURQD03T+g=;
        b=dKYkGEScSD1CeyoPLRmHXz0Cc+qRVklifpYL8weX0A/iUq53kL1rezALdLcT55o/7w
         BVY1Hv4+ozwA88giKpBiUjgW4EUgy2cysYQl/R7cDpYGpgrekxcvHWXlrpRregMKSkMJ
         iGAZmimUoZwOlmRYZSSrq6SFLb/Z49BNQcblLLSUE6Fx3jUUF0+ePuhQxTfnmcAjmVIb
         GZ6VQ3Sc9eRM4IOjuFnA6Ql2HjgBLDXLp2pq5Yahl/ziaZxzu2Ehz6OOzNsDRE6NCfw5
         m4oRG6C6vTrMIf00QfaFRch6yO4VqciqQTDJKCbY3MUPbDVCMP36qgyWY7SrQiCna7g1
         v0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+EyXixv0xWAyCSj7ktJPOSk5Y9a5khW83TURQD03T+g=;
        b=PjWP3glW2NfMdTQmvTXHSGtZxKUZGCoZA/4Fsra4gb0CMCHnSyXwr0dXzydQjvRMZO
         cmgJfb6qimpG2CTYgw0AdqvWEGE8RsOUuaNxksktskjeSK8uLo9mhF3PbtdJz1bWZ1b/
         JZWZEUmO4mbb4RC3cw9XEmMd68xNFw7SsBpyIfDkSC9KKMQ+Pdj7O66Vo+Pho3VHU7iH
         n3Atrh+fRS7/fhHgPYuRV99no0B2aMmto1edtWieYoYfJGkzKGBD6VRDFhHp8dAWiURp
         7i1y1Cv9Edl8OVtKZV3MsGfCZ70dY9fWYyXP9a1j2wMWX+EEWe4qX7Lvs8el5SZBPalM
         SkiA==
X-Gm-Message-State: AGi0PuZIeAbCL3sHeGK7BnrBiqodeiJPM42cDvjZods7/GZhgU6R+fM3
	5ZSmfyzRLNDYyTARIriBwtMaN+za3HA=
X-Google-Smtp-Source: APiQypKCntcL6f/WMiI4j1oZSCNq6ct8S5ilJMdLn3jAPDBFFXQr+0ErDWXpZIZoUBwKAazoz4u/Xg==
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr1659066wmd.106.1586895476607;
        Tue, 14 Apr 2020 13:17:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0C2E51E8849BADA5B2D5E3.dip0.t-ipconnect.de. [2003:f0:7f0c:2e51:e884:9bad:a5b2:d5e3])
        by smtp.gmail.com with ESMTPSA id 145sm21115425wma.1.2020.04.14.13.17.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:17:55 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] xfwm4: upgrade 4.14.0 -> 4.14.1
Date: Tue, 14 Apr 2020 22:17:44 +0200
Message-Id: <20200414201745.19390-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414201745.19390-1-schnitzeltony@gmail.com>
References: <20200414201745.19390-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.1
========================
“Easter Egg”

- Restore “Always below” menu options (bug #15884)
- Fix a crash with GL or high CPU usage without any monitor
  (bug #15852)
- Fix raise delay (bug #15974)
- Fix translucent wireframe repaint (bug #15966)
- Fix hostname not showing initially when running apps remotely
  (bug 15984)
- Avoid drawing server-side shadows on maximized windows (Simon
  Steinbeiss, bug #16381)
- Add keywords to settings dialogs desktop definitions (Yousuf Philips,
  bug #16621)
- Fix Dnd of decoration buttons with embedded settings dialog (Stefan
  Berzl, bug #13861)
- Blacklist SVGA3D GL renderer (bug #16274)
- Fix window title alignment (bug #16067)
- Restore window state when moving a maximized window (bug #16348)
- Fix pointer interactions with clients grabbing the pointer
  (bug #16347)
- Fix GTimeVal deprecation (Andre Miranda, bug #16644)
- Fix window selection vs. hovering in tabwin (Simon Steinbeiss,
  bug ##16382)
- Improve vblank mode auto-selection (GL/XPresent)
- Fix transients pulling their parents from lower layers (bug #15891)
- I18n:
  Update translations: ar, ast, be, bg, bn, ca, cs, da, de, el, en_AU,
  en_CA, en_GB, es, eu, fi, fr, gl, he, hr, hu, hy_AM, id, ie, is, it,
  ja, ka, kk, ko, lt, lv, ms, nb, nl, nn, oc, pl, pt, pt_BR, ro, ru,
  sk, sl, sq, sr, sv, th, tr, ug, uk, ur, ur_PK, vi, zh_CN, zh_HK,
  zh_TW
  New translations: fa_IR, ka

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.0.bb => xfwm4_4.14.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.0.bb => xfwm4_4.14.1.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
index b77e619b3..617e14f8e 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
@@ -9,8 +9,8 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "c33847836958d540e3ecd0a27f131c0f"
-SRC_URI[sha256sum] = "b4182bf8dc63d092f120a51fcae0eb54b9bd4aa4f8486f47e5a65a108322b615"
+SRC_URI[md5sum] = "b20bd22bdbe1b17f76a139fd74e072a9"
+SRC_URI[sha256sum] = "100781a18070762e8f34c1d450e767586576753d567f76a8c32818284f511428"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.21.1

