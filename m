Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEB5CCF9F1
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.33910.1761574567717422293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EAxQwodq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42701b29a7eso2459486f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574566; x=1762179366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JWwN/PtZkYrFMcKrsHSmwkboTe/MpyZvskWm2MU5cA=;
        b=EAxQwodqwoV2OVD2BIIBJjCv3HDHYGKt5RGDjZeT5UJe48PjcPnO3tnQV0t7cNv0uq
         6eH1yTBnOTMlmZAcbGfCR03GXf67aIKQKs1FF9StDadAjtOvQ69mkfYQ2KSdrJ5QIKfx
         INtXzlD/7Wa71aJFVJVHoa3luoMYBJ9eXAKRSYc0tEcL2uoJ7xrATXaNFhjt7dqb9Qvh
         Htu8ByXmez5w6nl5OPQUfQ6Jwt9mjuJLQnJayb9rqlWEerLrN8wkWuLe7OBV9L7MvPut
         FspaS8py9caI6h5G8W8Zv3+QzcJz7oGADvMTaSyqqSy7eAf12MQobqXgxFgHV9yRnqR8
         FcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574566; x=1762179366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JWwN/PtZkYrFMcKrsHSmwkboTe/MpyZvskWm2MU5cA=;
        b=L8MqY9AQXXBgJWbU6SNbfW+KqlV1i+b56mUJxmlfzid8o8cVoNqUUrffI1MNOj3yeF
         O3LMvoJxFD1X5tVw9p1s7WCwJ1NyZd9SP5b5O8BLuWYSSWxW2olkqMskEbqFD9W9ABao
         kXdGw9BmMYt1pGieVjBr0vo6DvCIEcUbBNrKIQ1RSc10uC+65h4nbv/o/FRjessA93zy
         jTsZlY/rsOSa3JOlebzBYxEGB3lBqSqWC1p5XY8I2D7W7j0DKNSvbA7U/Uji/4GBV/OB
         B+3S6p8DsqPIDtEKUXu0CUz7vW2s3StwaeOi1LfMueILV/7juGCddvdnce297sQdRaOW
         jTrg==
X-Gm-Message-State: AOJu0Yw3o8Pinc0ublLI3rZv9txYvEsP9e30MjAP+RSHSz/CBDyryMy8
	wMsWDhBIOZEFnPOUlKADTJslesYL1rqLUbbmFUOYNnHeTlICKj+mDrxrk5zVLA==
X-Gm-Gg: ASbGncvvJYv8roonAPAkwOh/IwdzcuE2HRZjtYhv8RuhcQf22816Pn4dKkxfTS78KZi
	YpXu/wRUaQuX12PPZqc6SugtgqftB4/Iya4i8NjHln/hfayx3bcW8Ldep/41g2v7qF5sXS9NAi9
	/0gG8x/axjddkablg91gjYNJNAvAi8hemQGdLIPHPciPOvsKc++7piQoBswkMNrbn7QlMMCXAbu
	Ld442Io91S9W1CTO/tKQ6tPca3xipHNSdyiRur+cs6ZU9zLQ4ek3aOLNObfOcvQVSPlGEJo59wV
	XLmCoRclT2XlB0ol7hBKEnP9HI36m+C9at1bxUzQdeuA7Q2MZsFM33h/UjK8NlTysQRhkRYn8n8
	O39Tw7wp1Cn+1fF5kPDw0W8uz8uXiGM3W/Lp0DkYTzERtqnlbcvvuMVXvO+ZdPTubx8Ge0JhIig
	==
X-Google-Smtp-Source: AGHT+IG9WPgFI1MPtLzFbHlJXQuElnj/R0JxDKig2I/eVhMjKPba/qcWrrnzG1kg2i+nEJ2BZwX75A==
X-Received: by 2002:a05:6000:2209:b0:427:67b:b385 with SMTP id ffacd0b85a97d-4298f5284e0mr10243462f8f.11.1761574565948;
        Mon, 27 Oct 2025 07:16:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/10] gattlib: ignore CVE-2019-6498
Date: Mon, 27 Oct 2025 15:15:53 +0100
Message-ID: <20251027141557.1893563-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121046

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-6498

The used revision already contains the fix.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 1ba7dd4afc..c6fbf77ca7 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -30,3 +30,6 @@ inherit pkgconfig cmake
 
 FILES:${PN} = "${libdir}/*"
 FILES:${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
+
+# The used revision contains the fix
+CVE_CHECK_IGNORE += "CVE-2019-6498"

