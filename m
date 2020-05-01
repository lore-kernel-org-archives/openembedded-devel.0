Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.8196.1588332956078965023
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yy2As+H7;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e16so6095351wra.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SKclVjP8nRg+2nM1MulQc/DpD9cj2blR1HF9FXVSDpU=;
        b=Yy2As+H7d6CjSbdEvp7p6KKXt934xLQFVpuqK6nKmj3Onysmizx3VXCXJ7pT0wtHcx
         gnLuHpoNXDCIN5ag3v5W3+Uq7yKJAJIDM7bCI8hU2WSDkbToA7QWhG15bx8uDrSOfp59
         mZlJc5rZro1DWZIlhFym5Y0aTI1dQu7YdCB7VNY5pnyYuCuPBjp5iP+sGZcuR++I4LaJ
         bETeKxBv2LNrtEY3bCjPbY3IOSiC22Ep7iDqtH0C34/hrrkcsiPMuBbvNUNtl7Al99q+
         6UtCqECn6w6qw8wiM3l5OXMC0zRryFt0FQw91rtkGcKkIuhJM/POJfC+JqkCf5kqhH+q
         Ufkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SKclVjP8nRg+2nM1MulQc/DpD9cj2blR1HF9FXVSDpU=;
        b=GrBAvgLHo0gUOY/4WfcXwThh3fKVvELvyAiogt6nFzskqA2Sk+yBGlCrpfWNkvpvfG
         exMIPDf7ryFc49YUSnWDzwuSFHsKheLxonFhJySGx4g6Zuw1jNsvqFD/iUCwxrNe9j27
         438oyRPxAn/cBGJlBgfE6kNFZ9GwnU8ti9sMOPWCXyPMs+OL5TM3qWjqsS9UgQhb2CPx
         zy4Qpqy/MMfzc8UspDcObO2clglXlEZpU5b/lQrLcqAlisWZec+RowcluzqfvCgyAcU5
         QmFLeSK5t5EAuplFJbSYmOmK6FFWF+5Nbfoar6oLLLYrDG0Tc1PfcS0XVxdtbP9AIMuY
         5Qtg==
X-Gm-Message-State: AGi0PubLseEUifdJuzIcX8T8JheV28QIr5ir87iDeMvF+tm5fhCIJqIe
	dbp5q5i2zl6qLqRBpoc3IkKRAQ4F
X-Google-Smtp-Source: APiQypJvQAdTj17mCKUiDz0lrHs7GqP45UTV8eCqul8XT0ghsI6kVpL78cuZ99wjxK8CiYBNIXnWDg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr4117771wrr.152.1588332954269;
        Fri, 01 May 2020 04:35:54 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:53 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/10] xfce4-panel: upgrade 4.14.3 -> 4.14.4
Date: Fri,  1 May 2020 13:35:29 +0200
Message-Id: <20200501113534.16030-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.4
========================
- Fix panel build with vala 0.48 (Bug #16426)
- Fix memory leak in panel plugin wrapper (Bug #16640)
- tasklist: Fix crash middle-click-closing grouped windows (Bug #16410)
- panel: Make sure "span monitors" is conditionally sensitive
  (Bug #15169)
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Belarusian, Bengali,
  Catalan, Chinese (China), Chinese (Hong Kong), Croatian, Czech,
  Danish, Dutch, English (Australia), Estonian, Finnish, French,
  Galician, Georgian, Hebrew, Hungarian, Icelandic, Indonesian,
  Italian, Japanese, Kazakh, Malay, Norwegian Bokmål, Norwegian
  Nynorsk, Occitan (post 1500), Panjabi (Punjabi), Portuguese,
  Romanian, Sinhala, Swedish, Thai, Uighur, Ukrainian, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.14.3.bb => xfce4-panel_4.14.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.14.3.bb => xfce4-panel_4.14.4.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb
index 76abef054..73cb82a15 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "177818d4a84633c1d489f703fffe905d"
-SRC_URI[sha256sum] = "ef22324d26e5af735134bb10f85b6e16525ac9f48be8d2f6b634142fbfcabbc9"
+SRC_URI[md5sum] = "76efdbf7fb461f3058919c1309da67ca"
+SRC_URI[sha256sum] = "8e5ea79412ba84cfada897ff309cbe2cd4aca16b9bd4f93df060229528576fd5"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.21.1

