Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97226C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 14:45:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17161.1750862729599183230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 07:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=miFoKUct;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3992459f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750862728; x=1751467528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd8vXY8KS8gBKV/7q6Ft69OdX7Q6MCNS54ZNVCTQ6sU=;
        b=miFoKUctudemEGJIVLicHSaBsgf86yM5+sX+W1+Jt0YnTMwznYKwLkrXOyenaNFRkC
         T9/XZzxuKb9rQIROSghQPgZC1/MlDpBjx1EhjiPMSvJ31J1U1r8n5uSWh/iT0+5ytpqg
         lN8OZiLlUAAOgu5FPeYGixR3xdk6Rj8c8r/N+ambqsBXTNmkTG1cWuy/xF+3axzicaEj
         l/EG+0689RPjWF3JU01Bu+bzuwHr36Gts+WekMp6jj1An6jptAuA5zIiKDpQtXgbeVt9
         x9mrUqMvIFjuUovj2lFF+Qc/Nx+i9sy3ZrEoyWrxM1FpJOosk67E9jb0wtpANoojajF0
         wsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862728; x=1751467528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vd8vXY8KS8gBKV/7q6Ft69OdX7Q6MCNS54ZNVCTQ6sU=;
        b=HW2vyaRtJIQGWd3drTAyiECua7RvWJFdV8+tKqI8Di/uTuP8Lc/LsIj2jUlrTtUaQw
         LIAu3jQkCmLe1ZNN61wJjCu1NAdKLN/Ee9AOuGErYldHqvT3qLVyqPkSMm5/o/OVhJWo
         pU4sJwPAknkf+/M9KPHfJ4ovNwi0andu/iapbf0mnrCEd3AJmWh769aVoVMTvAs9vEWI
         UHB/qmhbhCyaOVz0RAPsLnD+V5+LADFsJbWwXBAt8pKCXjgvsQIjap3KZzdbFkJUTcgn
         21w8dn16/H6nOAlht7peGIp+MT3ioRRGozpTRqoEaCFFcJYH3b9gcalasDpZV6iHg7mQ
         pd6A==
X-Forwarded-Encrypted: i=1; AJvYcCVcYgQd8dgjJkNFE8zeFp48lG9WHLrDf6s97zk94xGasKGXQI88Dw51zMxOenF32PSZ1znVQ6p8+Ipo6CXJ7YbwoX4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNdLvCa5xfsh+rDN1lZInxdKPNJLDOUPePRJR9ljZ6hQqJzsP6
	KzdV343uKzi7jcp8yqEEpyAxfJXLEMr4bG/2+AKlfcoSpbt7YX/VjAzV8Gkom9da/HM=
X-Gm-Gg: ASbGncs8AN735w1C39kZAYWgrmgAVYcV8AGJDHXu9jOGotfzeihi98AOAbpJOnN1/4F
	kFij7Q9QCT+a4b9DYzGE+n94paAEaoQfQOAS84SzBIweIc6GdJoMk/t8GDMtCzcftX6cY0q/CMC
	3AhyG0jsL5aIA1Hzoh82j/eRT5rhJ0DZKxv0lG9jXQL6Ogo2L1YPuUk0PPd/aSQlg2dSayjfD75
	dQYjP+KjKnhmDP+9Lz/TVOLJvMarTZi8Uo71u4MtQbY8dgNtqyREhUTVUXOpqF1dbRBvuU5co3M
	OvefyxbGPJ7q+F0wIlZrQmVyVAT3ClM9tUsEf6lmCbEGmqieE8GWDSdjYjscblw=
X-Google-Smtp-Source: AGHT+IFCs4OFO76wNnBJjiM6FLeO6j73MY0BgeHlcYzDBUOJ0Seivi8mUgmgUqw6pWW+jbUB36tUKQ==
X-Received: by 2002:a05:6000:4411:b0:3a5:8a68:b81d with SMTP id ffacd0b85a97d-3a6ed646bc4mr1994623f8f.43.1750862727633;
        Wed, 25 Jun 2025 07:45:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d0f15esm26282745e9.1.2025.06.25.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:45:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: update to v2.2.2
Date: Wed, 25 Jun 2025 16:45:22 +0200
Message-ID: <20250625144522.189693-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 14:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118110

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a bugfix release addressing issues in tools and core library. No
API changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
index 93c3e3b92d..09b0928dfa 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18"
+SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.48.1


