Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A24EE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 12:22:48 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.19009.1736252561238996654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 04:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gG0ZblyV;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e4419a47887so19507592276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736252560; x=1736857360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVtRTvV/ti+hQS/fHtftHeMKja1HEmFcDYFxQ4UaJaY=;
        b=gG0ZblyVZwa5pDothkBJyh+26aDqpL1/2DZkRoNyaUGTTQ7Z1TrypHRLwkFnUBzsfv
         0elA9akAVz6ESnsINnx2GTqQTavw6xanJPp+kw0TuyRaLgAaECWKtaVlesKuDK2gpOZV
         k91MgNg4EI1R82xzcKDYqxPG9XdWMskyG3e/6xCnSujpCAzvUzE6QOg5uQZLh5ivUuOv
         eHJ3qZOOF8LsI6Nk59ayrNUo37D9YBJTlJZbqEOhbDkeUAWn5i9vwuzKyQUeTHUmaZB9
         hVZVGRpMJgs846tQ3R8tLLdHok0Fa893/8gSUbasmok0b+6EsaNxX1koMDMxNUp0k9wB
         kXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252560; x=1736857360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVtRTvV/ti+hQS/fHtftHeMKja1HEmFcDYFxQ4UaJaY=;
        b=jD8UCotdSRwahNjMSEu3OGItBVTlBr8eEUg8agV8ZxyfEDWH6gAY4v+ov3KEUflNzX
         GP/6JBQaGI6VQYr+SY8xCTh5IcEkRxS4k1o2SnCM0QVojCWDM3aS1bJIy6jSybXZSmuC
         beP+aIq1oY8ACq0EaqSBqAO83uuMd0xtWOCLxXAiqY69tMZnq15zb+XALRVGH5DS8QOJ
         bvsWsuaRcqCAk1uiemoij5Iv4ZRlEVtmYNhw7Xsmyv0SwiTWjQ6dI7qlGH2Xb933ULP2
         KBR6grunzJ8QXUtaQa75KO4wj1WQskqf1Wow06u2Aw4if8owtF7vQf4dUCVUC0ZRXCRc
         3N7g==
X-Gm-Message-State: AOJu0YwZb0v8Ev2c1pXInbSGMw23FyLjKHZ7xjcmf1nBwWcs5L9soUbT
	JIAjN5wO71hH0QR3eoerm8rz2A/AEJtmB3h+bz4BAb23X8y0EJNrTSo3MDw6
X-Gm-Gg: ASbGncs2ePF7QDQM89M09ARgaxDBXbOceSlCgTgaZjX3BUkvnOmc8WqAI2Bs3G4qQsj
	JZmW4fQZff6ckjGEWjVnqTD01udmNSNj6Ti/m0krTB9saKboy/pkLwa2YAgBEsFxFTz+Njq2Gud
	Nt2mY/hZYtyVMmPtLHe7hxcRLpTaGaxXD06xIXuGob5RB83Rn7wynY5YmzOAeCQWKZ7fNqQjzWj
	s21+Guq5EJE3n5P/b+rsPyT1h/Ojzk3jCrzTZsgqcfQroUjf0W5lguJ5WN3n+9IYDxxx8Y=
X-Google-Smtp-Source: AGHT+IG35pxbuA8Une7A/6XN3J46OFo7zpvvMLGjQH1A3Pd6ZcHqCJbpNLCBBOM5pDaYJc4HCxXdLA==
X-Received: by 2002:a05:690c:350d:b0:6ef:6646:b50a with SMTP id 00721157ae682-6f3f81344b7mr440865707b3.20.1736252560363;
        Tue, 07 Jan 2025 04:22:40 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:c122:4970:902f:30e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e73e7c05sm88318047b3.15.2025.01.07.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:22:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/3] eog: add itstool-native dependency
Date: Tue,  7 Jan 2025 07:22:37 -0500
Message-ID: <20250107122238.1517492-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107122238.1517492-1-akuster808@gmail.com>
References: <20250107122238.1517492-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 12:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114695

From: Markus Volk <f_l_k@t-online.de>

fixes:
| ../eog-47.0/help/meson.build:45:6: ERROR: Program 'itstool' not found or not executable
|
| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-poky-linux/eog/47.0/build/meson-logs/meson-log.txt
| ERROR: meson failed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b523303f785c459e2f9232af45504863564ad7b9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/eog/eog_45.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.3.bb b/meta-gnome/recipes-gnome/eog/eog_45.3.bb
index 00fe266698..f3892f824d 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.3.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " \
+    itstool-native \
     librsvg \
     gnome-desktop \
     gsettings-desktop-schemas \
-- 
2.43.0


