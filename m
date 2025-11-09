Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9C6CCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27289.1762704029604446972
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kejLU6fy;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c7e438a8so1990241f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704028; x=1763308828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TZGw3Su3PLNxZu/N/g9/BpMC0KDuhZR8vZ3/j8Zx90=;
        b=kejLU6fyPfdIH31jI7dxDFaqZ7Xfdkb9szwWdAKKV1mFWoP25idT3aIGomT/Jb8pXy
         sZY582Chxepefwu0T5maiR+/cPrrxFqUKEQLgcUkXMv8HWmL16eVyu/NSGOWi2vcaU97
         VcVc2xwFB9LHYT5cV1QAfQcMtYKnosGnR32LnElT8y5o3/fr4kVkz/a0Vics4JfoOBsd
         B5gEAd+4y0jnre/zrbzr+/6wVlLHGSzV8/YUH9hOa66SuvVfARm+3w715PQGKXoMzDzX
         DmkMqMLNlXSuFeJoDsNCV1kH9H4XKu6HAEV5AQZZPe6KR5z/cFD50GOmiZ7fyHmqny1w
         0Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704028; x=1763308828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/TZGw3Su3PLNxZu/N/g9/BpMC0KDuhZR8vZ3/j8Zx90=;
        b=gyYEFuaGiMhQm/r0iOrpRyDCS2Nn/ULKR870xw72d2QEMo9yZJDbWdeqAQhTGK5Q6u
         V6HLI2B9ChjUk8yd27BZ9SbEsBpuhQK4hJ0YK6P3V6ZOfQ4e3G80Lhr2o0qIcXsHZNtN
         2z3RE3SouMfhuHG1SM+cLW0YDhJRKlS7EyLCdzj/4fsMV/w9lyhUNCDRxvm/K1vICCRB
         bIgJ+fckc9mCRnempN2aiWA7g4FKZaRh4E1RoW5AXrKHndUOOVDr7I8fLiuqIe9Zf8E1
         2/4A4Bv0TtUccc5cycsJgNDBtepcyhovL2+zLB+GqIa3JsVRQ4HUwS4yj5/1oYISGGbU
         11rQ==
X-Gm-Message-State: AOJu0YwjhTwhQiKd3GZr0nTnlxwLPFOL6xMKRZK04uk3DOugApQuAfx/
	AilHFEVoK4Hae9brH8qrdx+mpTepqwjEdM+5gZmQ+e6s/8OKmsHF3BF8R1Sitdnb
X-Gm-Gg: ASbGncvme40FVmqbDCYVxPmczi3ynPBI/JyZf4tKCzM3ZqKrkNiLCRZ5UHXJ2C2WbFy
	IMK93tN/pRn9alQcfVKsbgaVB3fEAhIg+dmWf5mjUH14RoEnrFfl5bgHZ3LODFlevVjcYZ8nTS6
	QWFYgBPvd1SVm61bgYI/0l4EHKY/mPo2D+EZFAshL4NeWsxG7AxoI8uUqQCTSEvs6rvO0aYUQJv
	2MiOo0GVTCix6zj0RyFMbPCsMBrbhlqi/ZJnjtC5NOIeqQ9lHUJb/TIabqbYIwNmsro0Ef0342h
	6r5eY90bOSCQrNAJxYqJ33ktrFW9roDhNyadGVDQ/L8gsmYGnfIiItq+o+RzRL1yQny9zsmX1+z
	q/yb4woBR4lEMBee+JciFWOPquWqkOENSSfGJ8tNvihoxsV09AziuLyofr25O/fbC+HfzYNq8uw
	==
X-Google-Smtp-Source: AGHT+IF1cQjWWjOdg3ERjhiEBLjPsPXy4sT5AOqMmaC7ZLDRhKlY/4XeUzt1VwK0k9h4o3duy1r8Iw==
X-Received: by 2002:a05:6000:230d:b0:42b:3963:d08f with SMTP id ffacd0b85a97d-42b3963d385mr1411785f8f.26.1762704027962;
        Sun, 09 Nov 2025 08:00:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 08/27] netsniff-ng: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:00 +0100
Message-ID: <20251109160020.2522353-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121424

Source branch was renamed from master to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 341eab015c..5a7d86c4ac 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -6,7 +6,7 @@ DEPENDS = "libpcap"
 
 SRCREV = "be3e706f00295024ebc199e70177343fdaebbc9e"
 SRC_URI = " \
-	git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=master \
+	git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=main \
 	file://0001-Cmds-automatically-create-folder.patch \
 	"
 

