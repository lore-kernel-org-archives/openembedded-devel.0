Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.5636.1617634471959153735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lKcZqLrs;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id l1so5769425plg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=caP74htydCSHMz23eRTI2pgEDxG9OS61UwvqjbG4XKM=;
        b=lKcZqLrsfuPfGHb2rSK/qE4IiMIBqvK4WC2H+YeiruGlv8Le8x+Rg1M+sDyL/BQaRY
         zG/oyHkF4W+qbN6A/Elknl53cgjfKhjDbVBw4Ud5rEn5hgClXBOvJrXtd27g5eeiLq6n
         bWDQRGpMJ0QGtdvr4NQcMP7VxbRe6R+EstoT0Xa+2wTehWXtH4/xwclixfgUu8vAoH1y
         z8y44aW836Tz3L9UpglJhUWbzhRLBTg7NbycGxQp7hk55fyKPET6jxSHyKRnGTtvz+F3
         zX5/4uHxyssca7v7JhYpaJkDFQfk9V2zYd4BR6Djg1oLmXtoFLitoecc4+LLEFd5NwXV
         XkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=caP74htydCSHMz23eRTI2pgEDxG9OS61UwvqjbG4XKM=;
        b=K3LnE0OrJ99R/SjuAhK35+FqsBKzoYPVVQoDRpASFQLow0/EKN9yIHeMujknz8Dwqm
         G98dWVjTNuH4T7KkcVViKKyNttTQDTEDhr7436DA7BgtQx1q68WE7x+2kdVIREz+h+d/
         5xoWtgk2t12fpTNmYWn21ppzS6gd5Kp5TNGbTuoNJqSeZVrjrVsRFujbk2Xezx5VrsRh
         QNkMipPS7rilB/Wx6Ovs2luwrXsuFTIboARoZc9NLlyqTpW8wXSL8N10G55a4wNiS+kO
         U8TX/FpoJIlR1hLvfHyeRjfFAUsiU/s4Hgpnv8AMAJbBsLqysYnOAf9gu3TVSAf0SQIE
         V1Ig==
X-Gm-Message-State: AOAM532R78gRwwPezH5qqUd5CNd1oB8kmDEEtFJYzFaJJguNK/6n+GY5
	sR2q3Azxlms2PHgDnjMNcc0EsKzfx18=
X-Google-Smtp-Source: ABdhPJx0p83AkSxxwxrs71DRXMDV6kpqjNHER4XyIaezJKtQPlNJK1Qh3F8yD4rqAZs5lG4k1lV+jw==
X-Received: by 2002:a17:90b:1887:: with SMTP id mn7mr6325114pjb.39.1617634471428;
        Mon, 05 Apr 2021 07:54:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 02/11] freerdp: Add missing libxkbcommon WL dependency
Date: Mon,  5 Apr 2021 07:54:15 -0700
Message-Id: <2bb5f52be5a68711cb64da53c3ec623debc26851.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Marek Vasut <marex@denx.de>

The WL build depends on libxkbcommon, so add the dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88348389707b488d5fa8e81f91267874b2fb82c4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 7cafbb7993d..82ef561fbee 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= " \
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
 PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
-PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native"
+PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native libxkbcommon"
 PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
 PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
 PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
-- 
2.17.1

