Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1311.1597271983540916027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fk/WsfzI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jp10so4056543ejb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Ve1sM6T3+u/7TCefJA9umtCuYkybWOGRWpJEE0jBTQ=;
        b=fk/WsfzI2GUu+e4aZDF8eBGpcqk5mWrPb4LpABNtx2TXpbt0dmtGHHWdGrRZAzJLZY
         HVdrA0I+/PYlwMJK3HbqP0r5vArMjNNfnJAV1fUynVdHKoTY1Sbg9+F+xdbfWsYVaPfO
         zGyo23rJVURNvUAI2yMeffDvaUwfCHj/A0nIgdtwuofFLN2YSXxD11xzRRtbW5zd5+NP
         V9eVxiAIhXTs23CDyxDSgSqrRWsSc1vJ1Pzek7QeoV8NzzoP7uDGFNd0xEmxpwmgYQeE
         eos7FeXnkfx/0ZPspYoBq/5jQULWPvMvEnR+uoyx76gyskMmkdP0XJ2OmSM8HK94xSTd
         Ztvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Ve1sM6T3+u/7TCefJA9umtCuYkybWOGRWpJEE0jBTQ=;
        b=GLDxTwthkj/8TJQrZrzu6lS6ZaOhmQYUNSPuRT+LmZl4sq8Evh6paMju0XUCYarHlR
         Udtn7ttZf+TuIcpzyWqMflcyCqi1x0NEajp8Q4taZ4Ub9LG5mCTm0IQ/3S6lqXm02ENt
         TAEraWxpvmODtEqBR5HAm8dCeyM7o9qhTLir8yDeFqJC6z2JPqJF+ynHaVy157M8x9vk
         t4Sfiuwh50f00CPWaQKSLK4nfV6lqFbN4yg7RQhGJLpQW7BN2IjTVPDDWKR/PB7qcMTp
         MqIHz0/1AulkZuso+0GzEaGw7GnIhblnV0RuXq6R4vS/uSPp5KnFMw490ROy2+VNWn2U
         bTRw==
X-Gm-Message-State: AOAM531pOUEFybJ15uUYlJ6VloXv5zzXcSOTSP/Lve0WKnOG5yFQtFQN
	KIs0FPI++H+8DtafeWmclq3Snona
X-Google-Smtp-Source: ABdhPJyyFdTUlmAGN35FT1ylz8HahX3rRCdTIDCQwh0I88WeE3XwgzudCXS37VaSjqtmK53XymTgew==
X-Received: by 2002:a17:906:7698:: with SMTP id o24mr2149803ejm.182.1597271981436;
        Wed, 12 Aug 2020 15:39:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/8] udisks2: upgrade 2.8.4+ -> 2.9.1
Date: Thu, 13 Aug 2020 00:39:26 +0200
Message-Id: <20200812223933.1119785-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Seems they changed build so we have to build in-tree. With out of tree
autotools build would break with:

| glib-compile-resources --target=udisks-daemon-resources.h --generate-header --sourcedir=../../git udisks-daemon-resources.xml
| glib-compile-resources --target=udisks-daemon-resources.c --generate-source --sourcedir=../../git udisks-daemon-resources.xml
| Failed to open file “udisks-daemon-resources.xml”: No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/udisks/udisks2_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
index ecaf01e71..196198c52 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -3,14 +3,15 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
 DEPENDS = " \
+    glib-2.0-native \
+    libxslt-native \
     acl \
     libatasmart \
     polkit \
     libgudev \
-    dbus-glib \
     glib-2.0 \
+    dbus-glib \
     libblockdev \
-    libxslt-native \
 "
 DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
@@ -19,13 +20,13 @@ RDEPENDS_${PN} = "acl"
 SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master \
 "
-PV = "2.8.4+git${SRCREV}"
-SRCREV = "db5f487345da2eaa87976450ea51c2c465d9b82e"
+PV = "2.9.1"
+SRCREV = "95444ab6bf2b8d8c205b540dded4029fcb15f91b"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
 
-inherit autotools systemd gtk-doc gobject-introspection gettext features_check
+inherit autotools-brokensep systemd gtk-doc gobject-introspection gettext features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-- 
2.26.2

