Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B92D40CEE
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.30687.1730839773745232874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgyGlukM;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e5cec98cceso47537377b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839773; x=1731444573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9OryDL4nsJCQgEZbin12BCb5WTrA+yAI/5X/dOuzz4=;
        b=SgyGlukMTLEBaRxYT5644mqPmyY8nzaae2WwzjqeiGx7qvSVTEnE2oCcfF1v7xr9vy
         BDZg1D1EAV15xo9cNsufPy4aTzy2Nj6vcYMON+Xg/67v7DY5USFB4lbcJUdiw/2jITqk
         7zut/VKvFHaI+73gDaKK7IBY8j+3NkR9TXj5VkN+w4d8xOTegt546EUs6yReWW6+oUct
         hpksPNoM77iVs2ZRGX6QkVm9+xHSvF0g16V99KBG7agJUcdQhCjXldmfO0fvmoIPqL2q
         pLED5TsCWEl/ghe8Btp/Gp5y3jtN0PyozhqeaxhiAcghxLgPpuZMXyvBlFdCVKg+pqoO
         Y+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839773; x=1731444573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9OryDL4nsJCQgEZbin12BCb5WTrA+yAI/5X/dOuzz4=;
        b=qBwmMK/Ycj6DbO9fxai7NmaAbAzmIg5xeBqlreQVJK4YIVgznbbx78dCfdihsEwnc5
         V0r/BFix2c+IWPu+IqVjDvGtEadumi7H8GnLcWMHnTAgp3QYqyStSjUp+giTztAW4ve0
         D7/KJrMtuidgzS/WqtIvcpiwLiWr6psYIjDcsgEIUZkTZ1TSzolz2+5iArvgspvJJvdP
         MRw+7ANlbPY6jMFLptzZU81z4GIehM2jgtjKZ1b0t/4nc9NmYrRIjFaDBl330kGUTXnN
         IOW5sh1QGXCPreTEhhP62DUL+FfG3Z8DDssGw67KFXTqdQ3wcK7epZb9tWSssZlAh9bc
         Pkzg==
X-Gm-Message-State: AOJu0Yw1cuPgCUfScxV9hP1kSu7Nn28LGBKSelMR8UQtj4Da3qc9Jp3V
	vmnsI9JXc1HkBPGCo9olbHVqUIpsQpnZWvSQl9O92ikT6vi1y4mMUWBV5U0h
X-Google-Smtp-Source: AGHT+IEQw/xm6QD8OWqOU1ZlErCfoe5S+omVeUT0FqUtOSUdM6NS/UnLuPB8JAwnKFa3rHsGeBV07w==
X-Received: by 2002:a05:690c:c:b0:6e7:e340:cd36 with SMTP id 00721157ae682-6ea52551ff6mr207900707b3.40.1730839772383;
        Tue, 05 Nov 2024 12:49:32 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:49:32 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 139/161] mbuffer: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:45 -0500
Message-ID: <20241105204707.4155-139-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113655

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
index d0e7e3920..01e7645ef 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 
 UPSTREAM_CHECK_URI = "http://www.maier-komor.de/mbuffer.html"
 
-SRC_URI[md5sum] = "9937d7f666c19a2e6b2499b04dbecc44"
 SRC_URI[sha256sum] = "ab90b6fdce16db2bf08bcda0bc5d2bfb053a9a163d2a24f95fbf246460549b99"
 
 inherit autotools
-- 
2.43.0


