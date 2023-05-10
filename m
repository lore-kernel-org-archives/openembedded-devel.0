Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAFCC7EE23
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 03:25:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8126.1683689108880206989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 20:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MxEn7XkT;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ab1ce53ca6so48468945ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 20:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683689108; x=1686281108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwJ/XFzSnvIvD8RWdC8YLxH8jM5+giP6Zrw14M3s2bg=;
        b=MxEn7XkTYetZO3az0LqwL+vHgbUQ8S2/xYhyQIPvBXBrlT4jPHIT6JorElh4MFWFwQ
         y5oHrc750UEiLELZBe2xWZK0ZcnA5NbxHgABIrEM/R0cnsEiUHlJ4xFMMfHCb5KMOG47
         5CanRQt7yhLI9BNQGLqQgZqsJ2qRvJhREtEbCgg8oBSdgvYnz+fnqM+7fq+vKAaO4Ymi
         NoSFg5qBaM08Z/68mmrPt73eguaKl/edxwdZj/P+dwwyfeBaNx8Y1XvDXmSwCc/DuCkC
         YlfQFRvAlV4Qs2Hl3oZIVqjRq8Io71rEno9UGcIzpHoFHVswdIoOnjB7UbPUvI4Ph4+4
         V8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689108; x=1686281108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwJ/XFzSnvIvD8RWdC8YLxH8jM5+giP6Zrw14M3s2bg=;
        b=F+xzeOrvwwwP6wSQLq/0OtdXghe6lpz++d0QmeIMEuKH5w5Wb77MjFEQ4G4CWojdfG
         1ZBVw4+gGWw3ea/0nb5FeIthTTsEG2ksezZ3kjMG2a83A+o9GU9N2EYx2QR0BXsql/3u
         uCc7Dp5FtkqbPivkvZ9LNdZcEkTD3467mBbU8vjgdJtZmBunA1812TKLuKMtZCSNHDgQ
         Ne1ABFQk1WIDbL8v1oRqznuaGeGh9/rE7e1Q12xCJ402B39X0/KBDWPdrf3jd1rDojeE
         ihkUgptpQdI+OCfYzSa3y3KnICRhaGMTf3XmIZofawUAPvysTkrj1/hn4TlNu8tWYAd8
         4uvQ==
X-Gm-Message-State: AC+VfDzNyhINCb+m0Y47qsGlPFVgCqbyPpzT8WvCBiJIZjT1sNMAqozj
	xhS8n1YM11lY74KF3+zTsxDiKf2WJs5ehg==
X-Google-Smtp-Source: ACHHUZ5Beo7Vv6DbKpDUSYfBRCadJFF3OhIgVEpOJmvkOJ53Es3GnvfJl2I8bHZff6V/lsXJBaQtIg==
X-Received: by 2002:a17:902:e741:b0:1a6:77b8:23e0 with SMTP id p1-20020a170902e74100b001a677b823e0mr20345485plf.60.1683689107950;
        Tue, 09 May 2023 20:25:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm2446100plr.190.2023.05.09.20.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:25:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] libimobiledevice: Delete recipe for 1.3.0
Date: Tue,  9 May 2023 20:25:02 -0700
Message-Id: <20230510032504.457574-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510032504.457574-1-raj.khem@gmail.com>
References: <20230510032504.457574-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 03:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102524

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libimobiledevice/libimobiledevice_1.3.0.bb  | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
deleted file mode 100644
index 41b8d94a03..0000000000
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "A protocol library to access an iPhone or iPod Touch in Linux"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
-    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
-"
-HOMEPAGE = "http://www.libimobiledevice.org/"
-
-DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt"
-
-SRCREV = "15f8652126664e3a4b980e5d1c039b9053ce8566"
-SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master"
-
-S = "${WORKDIR}/git"
-inherit autotools pkgconfig
-
-EXTRA_OECONF = " --without-cython "
-- 
2.40.1


