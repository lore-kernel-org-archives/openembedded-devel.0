Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9486C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:03:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.206971.1672329791328673366
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JNpQfd4A;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso11362466wmb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 08:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cbncVoFV9RLxOzDd8FKJO6GuOWCee3yKvBJdIMEL40=;
        b=JNpQfd4A1OXuFiIB9TeC773KP4Yr0GLbj1HArcg/16t5E7m+jOen/g3qpTkq2H7vs9
         cXPKFOuLAlqzO4pgRXCWOC8vHzar9nSRs4zxEeRMxbvQX3uQt+xUP+413A0+fDCec/C1
         rskVgi+iyLeoAepqgV0uIiQnUnzwvDpIDKiF+jna58liHZtXEhLJWBPhgDNa5aUprRRq
         /2bbWG/KELdo9Mmx5mfriEbiQcuy+hBAAdA33sxs5B+MDVVMBkT+UPcae5Yx+VwG48Xk
         Q/iN3841rVZAGpIL5lfxpUEDHnw/MR3Gv9ub5IfsIzUPegcD/EIzmjzluQ59z8HFecEX
         j4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cbncVoFV9RLxOzDd8FKJO6GuOWCee3yKvBJdIMEL40=;
        b=2MGqRndS3HzdzTlhy5yBXUBbXAjxyfN7v9VdmiWMH9eFpif2lUccVlQyaJW+fMDyD2
         sQg8/FqefqyVtas83KV6mWtmg+aVGfXSEc2gJbfTCpZVMWbhzZ2gAWlZULSq7HF6kmwd
         uV51uRlnjqHeqJsdTI7p75qBYbJ6cXyNCpICsVY+sy9xOZnyQ7aC3Uw0L/6kVKMfdJH5
         CIRFbpyy7S1ttmrC3j8+aWkbhSz1jZQhTzMtP+e4ilWyp0eOwZTJyVCsi/ZAWqyKdzUE
         0jovVt26WE/JN8MLkH7ZtsVsxBC7Q4spD+z/4rG+tmWUWZJd4zmet/Q+W+2gk7XBQbNK
         iDMQ==
X-Gm-Message-State: AFqh2krxUv+rDazbaHALCLHZ698IYydERdp/nep7tOwMmw4QQvewhRn0
	JyXrYwLIeBzEdDG28NFJv4KfVr1qsq8=
X-Google-Smtp-Source: AMrXdXvLTbgGqp6ORWxFqeIncKo+Md2YrPY8lv07MEYdYI7re5Lb689mvqRQQzqqJDAmFo3u1908CQ==
X-Received: by 2002:a05:600c:15c2:b0:3d3:5132:a637 with SMTP id v2-20020a05600c15c200b003d35132a637mr20452381wmf.18.1672329789804;
        Thu, 29 Dec 2022 08:03:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003c71358a42dsm39181934wms.18.2022.12.29.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:03:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libportal: move to oe-core
Date: Thu, 29 Dec 2022 17:03:05 +0100
Message-Id: <20221229160305.255840-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 16:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100303

Epiphany now again requires it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-gnome/libportal/libportal_0.6.bb  | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libportal/libportal_0.6.bb

diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
deleted file mode 100644
index 9784f0481..000000000
--- a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
-DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
-with a familiar GObject API along side the D-Bus API"
-HOMEPAGE = "https://github.com/flatpak/libportal"
-BUGTRACKER = "https://github.com/flatpak/libportal/issues"
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
-
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
-S = "${WORKDIR}/git"
-
-inherit meson gtk-doc gobject-introspection features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
-
-EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
-- 
2.30.2


