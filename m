Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB08C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 19:29:47 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.36126.1747596581638027521
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 12:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=OJFIKGrT;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.128.65, mailfrom: dimitris@siganos.org)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43cf257158fso26364175e9.2
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1747596580; x=1748201380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=OJFIKGrTDi9aZfqueifZAqTVx8jqQ5ZX98Atacyxyp04O7WGt/G5VvNbvJtgTD1qUM
         MkFTp/58Hh6CL+uMU1KFZkmAM7qMP3NGGEImbYjTaG+1FpEc+9oWOrmK+SK/UDmdczXZ
         49NUk697embQUPApGIRkjiPDlIH9hQBjiPOGhAvRaaVp2zYcyysyQK56LPFvVq1JAdlG
         h94HwQzQMgaY/b1jSHYIL2FO8duRfZowNzGxQQmvKJ/IJyyaOJzYFHlXRj6cecij0wXM
         79xJe/2Pe8j7c6ORnSlV/9A0v7jM17Za1RqK4XudnA4trWuLJnSR83FeWeWrppj2RZWY
         SeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747596580; x=1748201380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=CdCUt81FjnKyGUMDajpDXRWL3V/msYolTpocMvs7pEWfDeonRdnsFA2Kd+QRHDVHZL
         ZC2YUqzbkXX6QXfoyCeztGCIxpp9i/sBNw0Hz6DJnR3yYLpi8om+RAgr3aOxT89a310R
         H9BejCJNZo9FdHUr/qmkLP6MfDXk9JRbSxZZQrwyfhXIGGrW0gCAIiYNrUoCueyZYBu0
         YXR57T84bJH2zCdMTQlYiTIjF6HCV5I1j0i0KS9JkoX66ty7B/W8RnQGwda3cXNOw2t2
         OwxwC8IQ5xQGL0JE8LP1YJyzOtUu0iX1GoLSUx48d/XXa6X1tytE5qvAeHHtbd+V5SLs
         EHlQ==
X-Gm-Message-State: AOJu0YxwkMV9bkpuEN/hfxo2r+qUujyQK+OWnz8nhcm7trGltN5SpVqY
	ToQwY/P6ULZ0oCjX8c1psFeyESIXPHvB5zU2b1dqd7ehtMXjT6aq+/Jshv8dyabFE37R7DVhCO3
	2JEzJWt8HzQ6r
X-Gm-Gg: ASbGncsdandsh1i73+D1CEO8hDXvEpyEOBPVo8Cg8GhVd5gqP7nQg61fcF3T6AYDdNh
	e/IlJ2cLVQLv0L+YC0FNf+1idfFnlhdwJO++EUmYreKewt5ZeXUoZAbeZbsA2pwiQq1Q/MIQnwh
	sPPXi/GYwtkLgXSB6pgeDlQ8O5xqGr3SAmg7awMEnOLNxoIMaAV8jzbSSAJ4sxyrQmu65Ohqeef
	s/kls/KXJMZb+aK3WD98mNg6YXHp4LRUjx9E8FsjdmRhRcuHFBONxQOZfVmvUboSKHvZlVnNkX7
	zdg01jE5qE3aG8bQRJnWzPbtghpzt02FAdvQdkjJNZA/ZtGo5YlmWPS0LETwmEwEBrBrDRv+RzK
	uAVcotddiCH/ut08xBEJT
X-Google-Smtp-Source: AGHT+IGQOpFgK7QDP4G5qT/HDZZ+CD4f4nxmypjMPZXih4IMq3bEjOL58GK3PJRcI2OVfkGiDad+rg==
X-Received: by 2002:a05:600c:3ba1:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-442ff03c1f7mr72037475e9.28.1747596579745;
        Sun, 18 May 2025 12:29:39 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f338050csm182596135e9.10.2025.05.18.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 12:29:39 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [meta-oe][PATCH] bvi: add new package
Date: Sun, 18 May 2025 20:28:35 +0100
Message-Id: <20250518192835.229015-2-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250518192835.229015-1-dimitris@siganos.org>
References: <20250518192835.229015-1-dimitris@siganos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 19:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117462

bvi is a visual editor for binary files

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
new file mode 100644
index 0000000000..e6da1efd41
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Binary VI editor"
+DESCRIPTION = "bvi is a visual editor for binary files."
+HOMEPAGE = "https://sourceforge.net/projects/bvi"
+SECTION = "console/utils"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
+
+DEPENDS += "ncurses"
+
+inherit pkgconfig autotools
+
+# build inside the source tree, bvi does not support out of tree building
+B = "${S}"
+
+EXTRA_OECONF += "\
+    --build=${BUILD_SYS} \
+    --host=${TARGET_SYS} \
+"
-- 
2.34.1


