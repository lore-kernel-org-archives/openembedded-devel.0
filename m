Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D36C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:30:31 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.51944.1752388228921833046
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=necdrBSV;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-75001b1bd76so713559b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388228; x=1752993028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pfS+DaMhVY3jBoDhIyy8SDNbjSib9jApi/i6wovDFM=;
        b=necdrBSVYQ6Fllt68Ibs+37svENgjGTvb3feEZzcfXItRN/rY3dtDynaHLGWVKF8p3
         u6UGUq5i69UgNrbgd9OD/jn4QO70aJybpG4Z/1oMG80Qkmqd5hR+5ANsTd7IRHkAnBL2
         RGH1HPsIGCn0pSzJvD0yyVx29we/wssW0Mcimtz7tovVl5NetsxeShSLEoawezQisZDu
         Y57aCzHrdf4Ypc2/WcsclbzAv5+V6R3vPAp+CzW7ROEMgBYWEOLRT5dpssirS+kZfgQ/
         oRl9tGu2qwPKdk+hbzMjkq7MCyt4XgxLRJ7cH2kBL7v3ov/3mfkiH4DiGPYp8TUzIvep
         TTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388228; x=1752993028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pfS+DaMhVY3jBoDhIyy8SDNbjSib9jApi/i6wovDFM=;
        b=kQsCBY/ctN7PKNjx77/VKcFyw1lmoqXIx8tm0YeRGX6W4ScNPCOZUKE4zKaPvwWp2A
         eBRLfa3qho0pEGEvWBhh3riWDEFpvH7YkW5IVgLG9/4cf/Uro28YcPULKexY8kGP9xAj
         rKNcsRzohFbvpT5tS7BFCSs9BjKAUc2vjy0rLTW1MoGtzXYH74WhlVrTFptW0iHbvwiK
         UOcwz0Jfl0/ERkxQ60ycuYdpA+LbReYxI4vDNKVEOju5NvNZWCb4GNS2NSAs392kYCTn
         Q9VIpjxdJCf2Sr1jLq0oyMuqZozkGILqdr5asKpmhY0fv8ZdhZ4wNkj34v2+m5lDlRpr
         p3Tg==
X-Gm-Message-State: AOJu0YzU+IyQTC75Hhi4u6ea325gpbgydR02MG7Yr1pMkHo6pxiVKuyD
	HKc8l0ExoyIkfNBNVQDKOjv0CMGPUCbTe2V6FDx4EWWiYWt3fHTEDQ8m8+nsQqJb
X-Gm-Gg: ASbGncsH539NomUVSJmRz6CNThflSj2aHjA5uPrUIKYHd9sHXiD35qJ32FM+Fe7PQHP
	Jr2bUdAh1zHusnfe+y6nZr3MPDTXiOW9FfXkYFvUnZNzyw8otK76WfWS9b+sLF8/31yj11DyBwL
	i1iXbt8+wWgUDtDCbxI9Epx1L72Cfsr7VRKD+zd24dZvQX3rrBfZz2p+u3L0caDGSrQVJhZr6wk
	UcXWD4rF6FIYCTbUP52W48aFp/dHkXaQcU0VC8keENijf6AANLF3LspjmAYuITkpY8by5pfkKO9
	/IJT+Yr2LWEVEgL0cy+MlL/eL7lA+4vime6CNzYULxLkE10UCtH1rHICVZfuSz+11O1qaQZiGxY
	j011eQ6yR6AQ4MOUtjEdfLYbw
X-Google-Smtp-Source: AGHT+IETRUm2w/uHFNhrUX4nglzngYV+h18HK0skgKBShH4ltT0xQj7DFh9EXfJ9zt0gPpdzjrt41w==
X-Received: by 2002:a05:6a20:43a2:b0:226:c273:1882 with SMTP id adf61e73a8af0-2313504f542mr13996482637.12.1752388227745;
        Sat, 12 Jul 2025 23:30:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] wxwidgets: Enable webui and mediactrl packageconfigs by default
Date: Sat, 12 Jul 2025 23:30:17 -0700
Message-ID: <20250713063023.3538218-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118494

these are required by default configuration for python3-wxgtk4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index bfbb49d226..ce45d366c0 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -46,6 +46,7 @@ EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
 "
+PACKAGECONFIG:append:class-target = " mediactrl webkit"
 
 PACKAGECONFIG:remove:class-native = "opengl"
 
@@ -70,6 +71,7 @@ python () {
 PACKAGECONFIG[gstreamer] = "-DwxUSE_MEDIACTRL=ON,-DwxUSE_MEDIACTRL=OFF,gstreamer1.0-plugins-base,,,no_gui qt"
 PACKAGECONFIG[libsecret] = "-DwxUSE_SECRETSTORE=ON,-DwxUSE_SECRETSTORE=OFF,libsecret,,,no_gui"
 PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
+PACKAGECONFIG[mediactrl] = "-DwxUSE_MEDIACTRL=ON,-DwxUSE_MEDIACTRL=OFF,"
 PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
 PACKAGECONFIG[opengl] = "-DwxUSE_OPENGL=ON,-DwxUSE_OPENGL=OFF,libglu"
 PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,virtual/libsdl2"

