Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ED8C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:36:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.23447.1704461776719068481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTqss4iI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e3ab65709so2598605e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 05:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704461775; x=1705066575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiInaai25HFDpCF3wHCPm4kpFnmdcEbEXzAXJ4eL3Xc=;
        b=VTqss4iI7X116XOZekMgULoJJ30G3g2NGngKopzx3GCwkuCs5wpafbjASxsBB/MduY
         UDfAVa+pvJFucZ/qIOuagJLONfz97j1xjcJD7t/RbbzINhC3r/Hxk/nmwWu6dS85/ETJ
         rha+3B/ItKv3RYzhvXO7gwTDIbs7G80H4LiYXqRwXtAHbpRy/EdPymqDrz0MBciE1xNb
         kLxNXuOtDsY3qvHBuitYsboY6ascwBoXkIzjgfKj+lCcf+yY468X4J+6xVejIlo72MYM
         7TMnm20kyQtu+XN14ECxugSYAldfjZJXPkOy4wUcjDx5vD3YF+F5FZanrHY5fjc11wja
         FG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461775; x=1705066575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MiInaai25HFDpCF3wHCPm4kpFnmdcEbEXzAXJ4eL3Xc=;
        b=vw7PY+iKV2OMHCmCTqXamiZrWSSSPwQbpZQI2W+IV3eDvs72prvhdO9QTVG+04qiJL
         /rCKIpAq8pJfE8CIgBleCsF83AEtzd7TZk+p2Mi8uNJA00L7iAtmC5bCukiidnCTS3nd
         6BqBrhwFv4w/Lk2+IBeTOC9b/eO8KJlJTTw/2ucE/gXK0T58bEJzGhJDj4B4LFkQqYn6
         TnYlnAgXGmD/Wbw4uTQcTHmfL9L2yKRC6YTygxwETNLpEK9QEGCj89YeGWGr4mEn0Jxt
         1gUIn2CJET9HHUrbcZ2DWKg2gOM8eK9j6aJHFwFqXRjcOkMPAjpvp0UisnnGfyS++Yit
         9Zvw==
X-Gm-Message-State: AOJu0YyLduU9chgJ1sxcUcCfMqRAPupW6i9c/3BV7y/xkfdmahTecglv
	xJ8BB4dreCBG4LQF2brMVxGvy+XHz44=
X-Google-Smtp-Source: AGHT+IEGku5G0jFnPUuMz0RuEWKt8q1vH4NWMJfKFjTkZGnNfF9KPL8MFNhZ4xNEcAeGwvk9Zjxk5g==
X-Received: by 2002:a7b:c5cd:0:b0:40c:30fb:60ab with SMTP id n13-20020a7bc5cd000000b0040c30fb60abmr1362023wmk.134.1704461775065;
        Fri, 05 Jan 2024 05:36:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o16-20020adfcf10000000b003364a0e6983sm1405804wrj.62.2024.01.05.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:36:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
Date: Fri,  5 Jan 2024 14:36:11 +0100
Message-Id: <20240105133611.3018041-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105133611.3018041-1-alex@linutronix.de>
References: <20240105133611.3018041-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 13:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108048

License-Update: years, mention that it is MIT at the start.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-kivy_2.2.1.bb => python3-kivy_2.3.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb => python3-kivy_2.3.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index a72ee14f6..0d4a1207f 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5cd0f2cfda42852c332e3b88c85fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d3bc49400e35d5a2279d14c40dcfb09"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
@@ -11,11 +11,11 @@ PIP_INSTALL_PACKAGE = "Kivy"
 # and mali-based OS's. We need to patch the setup file to tell Kivy setup
 # that our machine has GLES libaries installed as well
 # Also, if using SDL2 as backend, SDL2 needs to be configured with gles
-SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
+SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=master \
            file://0001-add-support-for-glesv2.patch \
            "
 
-SRCREV = "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
+SRCREV = "9ef218027178115a66b417ae34b21f488bdd3617"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


