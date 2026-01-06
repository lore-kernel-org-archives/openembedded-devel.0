Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C67C9833A
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85414.1767684818895888073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C4cGs8n5;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43284ed32a0so264657f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 23:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684817; x=1768289617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+C2luxz2AvIUghWKCFX03/xm4EGZ2ZmZDGVCbjHzjo=;
        b=C4cGs8n5ciY8FjmJiqhci316Ef7PkZMDhX8uJ1RnxipQWoeYNCC/a83C3jHEby0RRV
         Srkgki4yhl5E8rtOPNl0Tkw6kmgGh48o1JOW5pmGsbc3HF6X67WNE8Q7Qfu3Aw3Q6TQz
         DvbrnMkCgcjj8dG86ZQ1GHb+87xNsm5halQPbGvqWOd71rbBxQM/2rDxGkjBXkNd94Jd
         xNS+U11J9fj+ZJaUar2mnK6Uwu2nOsgLCp92ZAUjFXvqTzHwGrf4LQLyBxEpm+r72xtG
         cysMPFeTfmJ6OzSUM4KhzjmZsMbgHUP6vKTsJaXAhhkHw7CIxsOzAFUvijStkZKDaWbe
         9qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684817; x=1768289617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+C2luxz2AvIUghWKCFX03/xm4EGZ2ZmZDGVCbjHzjo=;
        b=aG1g0oRbFnkP1vKxwy6w1KqBPR3wmvV15xZYpJklRLYY+ucO5VHSykyc+Lz/GuHopQ
         Ilu0SZnS/mxVpU1xGb20CXlcsnSmVtl4DJOZyNtIk7RNC9TeiD2dO1U0k+GvLrNjK3Lu
         j/s9D1sne7LYceP0BUJrAqzeNzL6QBQL2haptBrjPmcKA/FxbqzM7VkIUAIKtM7xo/PE
         kCORFmGdX+ePf/P0L4HqNMEA/somdl/rk6R96DO2YN42JCXInwWFbFl4Y3yEItwwYtpG
         7tadJbUpamqPkQQ3MA9dZ4iNb+4/fcSQDcisz4ss495PJDH+1x+LAhA8paF9EANH3zav
         yjTQ==
X-Gm-Message-State: AOJu0YxnwyKcRFNjs2yP9i6SeZRku8KKq4KQHpIbdsxxj2v3MpUOOUoM
	ag8qePslDZURvnc2cPJXeSTXd0K9gRR7vgf5hSYtQcW4CNQbODtoN7AJYAXJtw==
X-Gm-Gg: AY/fxX7KI8N2wmvp593a6XX5Tcs5tPAJb7TSmDg+bWdqJcd+PIb/54nEd3agqUuIT1K
	P6B4X8nF6dria0WisHctO7Y6nwkz8OQe0Y2bKUyE3cLjFboIGkk9+/ata83oZP1XuygXy05w8dY
	E9PI8nmDQIUgw+YDycdDOodV3Id6R7nOk/SmZQmlcwisSVPDRh+MBeuju44S8Rr49vh3k8W7QjJ
	yiIAuhGolbXNhp59IME4sde7d7PtESXEfEI+DBTsKznWxI21OvkovRHGJ02+x36xQRSgnAC6/JL
	eUnBTxPH02/pfS3e6o00KfyRimgW8J9UE9nJf98z0y0jaOEx2yztFm61BYICCrpF4UjT2JaKkDv
	7nsRAPsXGYRRYnGo0oJfQVEwxNv6uXdkOX1H47B9/z3x7tlZAeBNnpcBdE00JiH+8CJqxSG8lJj
	IpOKqmip3y
X-Google-Smtp-Source: AGHT+IHyQHeZ3rWxhkILZAaBbVURR8cDIVrZorJOLGkx50P8M5z6OYyANOR0Uddu4oiTB3WL2jRFDQ==
X-Received: by 2002:adf:f1cc:0:b0:432:5c43:53 with SMTP id ffacd0b85a97d-432bca4feb6mr2091483f8f.36.1767684817200;
        Mon, 05 Jan 2026 23:33:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm2811251f8f.11.2026.01.05.23.33.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:33:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-joblib: upgrade 1.1.0 -> 1.1.1
Date: Tue,  6 Jan 2026 08:33:27 +0100
Message-ID: <20260106073334.3462222-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106073334.3462222-1-skandigraun@gmail.com>
References: <20260106073334.3462222-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123165

The only change is a fix for CVE-2022-21797

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-joblib_1.1.0.bb => python3-joblib_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.1.0.bb => python3-joblib_1.1.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb b/meta-python/recipes-devtools/python/python3-joblib_1.1.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.1.1.bb
index e69cfefd1f..0ff6b643a2 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.1.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "4158fcecd13733f8be669be0683b96ebdbbd38d23559f54dca7205aea1bf1e35"
+SRC_URI[sha256sum] = "301f0375f49586a7effee3f6348c419d5765fca1c750186b20690a0d90b82900"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \

