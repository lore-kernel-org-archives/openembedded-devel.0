Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67F2C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:11:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9495.1744207856724084437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=I0/TZxya;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so62003865e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744207855; x=1744812655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOooS7kH1qHmnQwsYlTDefLuvutF0iK/qoYmVnbCgeM=;
        b=I0/TZxyavrYlzPsQyVItvDlGVQigha9lh3at3xVyikrC+fJvVyv2gwPteWTzcMhyIQ
         MdjUibUlkCGmtkV+aFU6u5gfXhYIcKQD4yEdvV75DGNBcTcqS5Was2EqCSa6VDTfKfJs
         6HWkiVq0jECZ1vp1hlMcsG4TFWhSAjZd7MqlaZIyTheot4TWFiOKDTYDQWGz+VfttIPO
         kor66tj8DWxT0SFWyN1zwFGrKMocvyh4nX/jNBUTqnaVOF5TvTB954bchuWQDOANDe4a
         ecswxM9Q730Z1/1nt8B5aZY/b5fAMvza8I5rVtpxROKAGAe9PVUVFgBDT6PWf/OW25KX
         s3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207855; x=1744812655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOooS7kH1qHmnQwsYlTDefLuvutF0iK/qoYmVnbCgeM=;
        b=Mm2MCtJQu99h7rejbF53RuOkkkKdp7Cbb8qnA1hkMM6FaydYjuzusDu9FFeWZDFt+z
         tEmrr1QWR4/hUDxOqN/1ffPzTcPPJDrhjtxgHSNzJ00RRN7CthERSmN7sj6J1h4XfO8F
         1B3hRaO6gwlam0cTCM/xs7VbJrPBb/8j4G6SB19GwuZ6Ex6dkQ9iRKKgkCgSsq7oQxWw
         eiHzIiyc7PjhBDB85evE7RJLdyF9RRRJ0BRt82yrV36mhIim9SKD3iWe+Gynz+Tf1gZ0
         Duy1m8tpU1JBHapX47Mj+ZTyaQ4v/9PbhejQ28WuRexccxo5SNI/0W99rATdAKgq8rpq
         obCg==
X-Forwarded-Encrypted: i=1; AJvYcCWQJB6/IsBWeiWtR9IYHlgnpZDHQheVxfzUFc1CevxvzmpcVQ3DKYYSrElQtQ5gj7p/nVrNCrWOk4E3tU9O20AEl3E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmRueQk7faqIEZ/1sd69uhFYRGhYb9mfb1g7veLiA/ZqpjQw61
	9mEuKyefWS0Qlq0k6/rQDGe37KnOSokscq1m2SPJld9L0m6aQpydz5VJzP3BMM0=
X-Gm-Gg: ASbGncvKN0736BKwkY+keb5dsjTpeOZuKiuh9LDGRfcGDBtAGzE1Ldv5TLte8aS2/36
	th5aDqWMWavc1G8BCB1h7gAgpow4WOnd0qTBjKVNg0XnFziE1CqZYq0f7vXCqvtVyNZtpLcpMUS
	WveQkaJKUrUWGfxjALu1EvsE8xi63OZabXx9W1DkgDEl2PYraXZHAyp5gd9Xn9R9xemu3nYgW27
	i+QJb82mhDiBa3y9p4mrD8NBEcI+PzE2EGntpyP1pUbOdnwvfncuDaofBiRFZPO+1owcR2Q7OY6
	y4wGhUuJe6r+/G5FzYPLdSlew77VXZS1Z5d5/sC5NGF7O98f5/4=
X-Google-Smtp-Source: AGHT+IEZj7ho0Evgf2+gxVhBwsfpSFaqTBgsSe3Rlwiwrnu0amSQwqNh/WlkMp4nzm783stdyt9lYw==
X-Received: by 2002:a05:600c:19ca:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43f1fe16c95mr21236145e9.11.1744207854828;
        Wed, 09 Apr 2025 07:10:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d004sm21736855e9.18.2025.04.09.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:10:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] b4: new package
Date: Wed,  9 Apr 2025 16:10:51 +0200
Message-ID: <20250409141052.61936-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 14:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116743

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for b4 - a utility for working with mailing-list based
development workflows.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-devtools/b4/b4_0.14.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/b4/b4_0.14.2.bb

diff --git a/meta-oe/recipes-devtools/b4/b4_0.14.2.bb b/meta-oe/recipes-devtools/b4/b4_0.14.2.bb
new file mode 100644
index 0000000000..794e1d24dd
--- /dev/null
+++ b/meta-oe/recipes-devtools/b4/b4_0.14.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Utility to work with patches made available via a public-inbox archive like lore.kernel.org."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit pypi python_pep517 python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "4f835b6e5ae30eff6004bb25c15fd8f4f6ecd1105596e86db1871fef7d18113d"
+
+RDEPENDS:${PN} += " \
+    python3-mailbox \
+    python3-requests \
+"
-- 
2.45.2


