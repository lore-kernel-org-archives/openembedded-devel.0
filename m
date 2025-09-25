Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB5ACAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9938.1758801832560368222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKbTgfYB;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0787fa12e2so120611866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801831; x=1759406631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AUlYRo6zVKu14OxahTmFKbKMx2eiIKDTTCsAmyNppk=;
        b=IKbTgfYBseAaOnawUrFw1Sk9nDtC5mZAACeGAryzpcgntObdiZ4gN2KbpseBd6wKOu
         yM0rDaenRmIGjPWgAFbAXrV1WaxgSqOtqz6AnRcNuh+xv/4u8t/M2ELLS6Ls7wrPfEOQ
         gwEJROPVb7PwTGgWsfhBwSmYLyliWbc9RiAJou2qSAHc/3Av+8xpVcEXpmdEW/q1UqPF
         4AvQ/z/A5RNXyituXDg7AO7nhGKaVAXVCvqlux+nXV5olEjAolp0I02KLfgr0R1ffnvt
         f3PJxxDtpuIHaNYK3f19JKbljbeFVJRCyTJMSqjpJs1oIv/uKpLDYepvaG2cDqYK3mFU
         vfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801831; x=1759406631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AUlYRo6zVKu14OxahTmFKbKMx2eiIKDTTCsAmyNppk=;
        b=GbvHufMiqpCg+bPlPJymKLHKFfidnZmuORNglJRhvZgUM8vuYjFM0Q5MKFj32jiwk9
         1gg8NjROKTdHq9lULbZE72wVHmLCRcYGDxXu0iYwxqRSCUNSN+xiCBcIfZPvquKJGGfD
         Apd75D1uId2svsMJMFm2lxq1j2LMHQfytVrZHfGabYCQ5jwFaMEoeEJvfa12ozi22bBg
         O3AonglUsnozdTGup9vTodR4gKR89mMPa+Zy+5Gol68fPnm6wyf+H9O86bouifPC7ftX
         9OG3vDKnGtxVmftBp9mwWGP1LcaOLzUpBDnk7FpF+w/BtF3wbXQ87UBMUGPZBDeNyPeQ
         ML9g==
X-Gm-Message-State: AOJu0YwyPyC0A02UHkyMlz/w2u/fz7oQ1H9d6obFTjzJitrMl0g/K25r
	Xm0pUhj+bXqFHTsc2gqisV9q5muaOEVgvVBfl/MxnutNY//7d13Ib3e+5IQMMX9y
X-Gm-Gg: ASbGncuo/xucR3dkMnehw9FqQFyLZGYN4TjA2+z49Z+8txs2yh5Yl7omJbV2ELbksC0
	/xgE18gYloLYYQZj50sQ20E0LbXbyfqYsiFAHkdVYyN/tR4sNxRVBmLB1SqB4E2aJRSuLuvsCXT
	ZB/A3zetQ8VVMItiv6ufoz6aDQKA74SFcpU5Vb5UGOudyPttxxaJlLmLnUlyfshpfDika4AvaSI
	TlJsF0hj50/FL3H+zyvkcW5uo4IFfS3Mz82mhph0xXzxikzco+iG1jxo6/wJEQIM22XSvH0eWkr
	wR2lGo0BD0Y6pYK6WMSwdb6fJEzRASjqDIu2846BLw5NGnjOfggrjvhxyDj029u4/fxHq3fYA5B
	dFjTQJvaEHkqEb7x6miZC
X-Google-Smtp-Source: AGHT+IE8WZxR1XL/DwgMLYneEHIzaltKFSNCt231FhiTcREY65TLTnvkwFB9x0/uur6HcSpQYg7lWA==
X-Received: by 2002:a17:907:86a6:b0:b28:6440:a85c with SMTP id a640c23a62f3a-b34bc9720a6mr351698066b.50.1758801828597;
        Thu, 25 Sep 2025 05:03:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 06/21] colord-gtk: upgrade 0.3.0 -> 0.3.1
Date: Thu, 25 Sep 2025 14:03:18 +0200
Message-ID: <20250925120334.1670367-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119868

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Fix the callback signature to fix a crash

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4ccf3d41ce1c83ac9cb3d68321a8fef24a5f89c5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb} (89%)

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
similarity index 89%
rename from meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb
rename to meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
index 0e86d781ce..1c6d34e461 100644
--- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.0.bb
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.3.1.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "http://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b9466656d66d9a6ffbc2dd04fa91c8f6af516bf9efaacb69744eec0f56f3c1d0"
+SRC_URI[sha256sum] = "c176b889b75630a17f4e3d7ef24c09a3e12368e633496087459c8b53ac3a122d"
 
 PACKAGECONFIG ??= "gtk3 gtk4"
 PACKAGECONFIG[gtk3] = "-Dgtk3=true, -Dgtk3=false, gtk+3"

