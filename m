Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7141DC433FE
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 02:38:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.71215.1638239884525935994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W8rXb0Nd;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id n85so18974309pfd.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvW5zYs7pIHashic8EAabKIGaU8qVv5glV/K04VR7jE=;
        b=W8rXb0NdGXE7Cs7myDrVKbLQ5yO/rAmccSlwnIdNT06d/A+jjXqDtxxCSWQusa5z35
         o1kGjJqHD/hCFeukXaixj0vhW08xM9CFj4Li3r4mhyYxtjuM1987wtWX1JM+BkYVoIjA
         190Q2A431qF4pKJBMWVsbPiziTUEikDHXXBYxc4WOWrR9QvcYiBfSFduM3xOxPzybgNg
         cNIw8s8Mo4zOQ2EF02UV3Ry2HAYvI/7nxBMt5D8rqfb8uNv1oc71P9O9r2Vq6d0pD5vb
         itvt/533UVHiGXXIu74NXAzclRHNR1f3RgT2HleSLD6jildddFmJiqx8xhjOgnwchfgt
         /5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvW5zYs7pIHashic8EAabKIGaU8qVv5glV/K04VR7jE=;
        b=XlXR1EBAKD4e/1hd/erQ+uj5CGhPyhCLPilHxNhDciyYWikAg10mHvh35pMHXyCLse
         AC4QIo1p0uVP5ku4sRAOikH2DaEG9IsofvK3zaNNSqQIApaWVynZuqhfPkOmlcLjP+vp
         Zxt1qdG5pdKqlCTB5ED5uGwFMwCrMx2U/1jryu/B5dmytZLQI8eKBWErkBipuYqb5Yk8
         nH+VSDKaA4AWg4rZnnpi9mqgfVCRhiH0iQBnn9Zze1FTTwUHL2DWZYJqRte1rNCunDVy
         yPd8BqJQZCDpu5mXarJF+W784gpX6oQRqwZ6k2P2BMQzR9Rw+pOE3PgG7ka2+0VEbxuy
         38Tw==
X-Gm-Message-State: AOAM532i/bhAH79l+z5QcEYI94smhBvueCDK9ENbQPGfaDujNG9AfoVI
	jKWQJChNKe9AJLkEvuBDtYHcPye5lAKnFQ==
X-Google-Smtp-Source: 
 ABdhPJwXTFsJZyosL5ZvQTI9KJ9YmtJgAnrJZoUXQ+q6v4Z71DoZouBaD2/K75xCT+n2KNmygzdGlw==
X-Received: by 2002:a63:8749:: with SMTP id
 i70mr31918218pge.379.1638239883721;
        Mon, 29 Nov 2021 18:38:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 t8sm15009760pfj.26.2021.11.29.18.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:38:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] packagegroup-core-clutter: Mark TUNE_PKGARCH
 specific
Date: Mon, 29 Nov 2021 18:37:59 -0800
Message-Id: <20211130023800.2910556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 02:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94144

libclutter is direct dependency which gets debian renamed so this does
not qualify to be allarch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-clutter.bb                | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index ee528f75d2..d4df611639 100644
--- a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -6,6 +6,10 @@ SUMMARY = "Clutter package groups"
 
 PR = "r6"
 
+# clutter-1.0 gets debian renamed to libclutter-1.0-0
+# clutter-gtk-1.0 gets debian renamed to libclutter-gtk-1.0-0
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup features_check
 # rdepends on clutter-*
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


