Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E46C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.23742.1746331469891352165
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 21:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9JafXO5;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7394945d37eso2825817b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 21:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746331469; x=1746936269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PW/D2jzQwegeFkao0XaTw8GmtfZ8m4MiIxvycJaiorE=;
        b=O9JafXO5Hy4QpVhmFL1Guaeg2yDqDBezUNDAgoJl+hA+w78bKESfQl3PP+/v/SzDq0
         uC7X6prceQnVIj2eYpo1MIceGrp8ikfBPOgZRYZAoZoLBS/lr3Bdtn8o7dwYX4a3cHJA
         dPVOhPgGbNQxBZyPqHou8ntUD7XW6Q5qWJJtbo+XGnAiDNS4dtY0sTxhh9VoyBoPnkAD
         v8miUP8JNgSlzGJ5YrX7Ax3GkJZx3RD/wRzav8wSOnOHv8zfAnY5q8A2Mb0k4zS5tMUU
         XTqZkeXzd/n7SbkUNiqJRYvqdJS/AS+H9vL4hwfjpWj6ooz7iBv+blWQaFx75hzIBUNT
         JiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746331469; x=1746936269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW/D2jzQwegeFkao0XaTw8GmtfZ8m4MiIxvycJaiorE=;
        b=vVoVcpT0GxDcGYrH14OwsjdMmOTODi8Ph8aPeMQVlcqvjStEvHGgkP8A1KjUR0lCQm
         PQPY0xF6NBjduCnCyPjLHr0sDekF23gBhe8SDCJDyU2WYu4Te9GALXS5n0eD5CZ/vSPN
         XuXTahp9qkEDa/C2HjbwrSF8PmbQ8B6IJOmuj/sORu4uAvogefbxZRx7w0oT17n6ilOm
         21aA4braOB5Cxh/UmjdZjC44/aFVhOk/JZhKtuJP0+/sfjmHsScTuKkBtnpSVeNAwq7G
         KgDHvSQUCjPoZoBVpVszzeuAhDX7sdEGIfH5sF4GhxMrjV+8ivS9dhAVQsjIPni+00yz
         KcZg==
X-Gm-Message-State: AOJu0YwmE8xIFDigky9Y7m0sMYZ3BgNPHqzfFwFKT8e+gUG9+1cQrtMF
	++bkTcJcWovlmFTP2NEvnFpeE9oKldtGwQa/F+wbjBtZmXpHxlVntZkr6g==
X-Gm-Gg: ASbGncsKJ5LJbbxANWVhmTBgec2Hhr7kx2JnRYzyxOxRJk+TbYyU+aBe/tYZe85CwbX
	qKe+K4nV8tCQqooDhFCkoDgDYhLZPIUudl6FQ1bOreItg0s8cDrawyFu2PRPABr3QRb8hO7h8Vp
	QNd9qRJFrtcB8dyoUX6AQZFOMeI1219gMpFmhS8e8Fp1ZxYsKIUcTK6pnonm1lNNZeNMDhVJfyY
	PEkPfxINOCRgPIXIlaMtBJ6ez2ulky60Vj9hc3S02iYeBWotAxy8Y4CLmO8TP9XdCP5MJmnBapX
	oQ6/wj9G4CpMVVtAnHFUPCimWFpUigmIM7gn26vcQrkTZx7M4m8botjnX9hnqlTwuJUtIEDZOkZ
	YdZ2H
X-Google-Smtp-Source: AGHT+IEJF/LiCTWdVDwgsu6pmdH7Kha7CzYq6sEIcTXoLLb8HjJTrkQhO+fZk1EKBTk/XQkfS1JKuQ==
X-Received: by 2002:a05:6a00:44c6:b0:740:6630:633f with SMTP id d2e1a72fcca58-7406f0adc51mr4452044b3a.8.1746331468662;
        Sat, 03 May 2025 21:04:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbc12fsm4272257b3a.64.2025.05.03.21.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:04:28 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Date: Sun,  4 May 2025 11:04:17 +0700
Message-ID: <20250504040417.5733-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117303

- Move "libsimplelog" to "recipes-support".

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.0.6.bb                            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-libsimplelog => recipes-support}/libsimplelog/libsimplelog_1.0.6.bb (100%)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
similarity index 100%
rename from meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_1.0.6.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
-- 
2.47.1


