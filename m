Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CFACD37AA
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6296.1762976148181842640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8G+mROl;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2dc17965so33803f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976146; x=1763580946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3bh8P76OnuHY0aaufAQj8rX20zMQzGZgLKyBy01C6A=;
        b=K8G+mROluJwpZIvPFvYVl3a5+7j/FcvSYOLN9+L7CiB7h/USN0wwDfADD7JNy18qXe
         0cvV60L3szoUw6Oeh2G/WT7/a/jUA8vekpbXjf3LRv1iqDvJVRQGfLh/mRCj7ZAwEzun
         mBHGXjRMQ+9L2nW+zGh44K1hhN6YBhtTVhMlF84ZYQrzZjFMmhKe3lLGQ968WJ+BNGOV
         4cDePZA+A/hqoTXXuOy8zV9EG97CmQS5GMxZ0CyqWguHFZl34rhtNOnMR75vm+Q5LQqY
         8xQC2S5kM58WwHQlAMGVSTUIK6kqNMX/Z7xOXp7quzI7B6/cPM57qNsovilq7hbP73lE
         EzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976146; x=1763580946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3bh8P76OnuHY0aaufAQj8rX20zMQzGZgLKyBy01C6A=;
        b=WIqzPiOgPxsFeDhSbw7HwJ9U9vanJghu/A+XTObvjTgoT5cNwZbE4KDyLXUm5PbRLJ
         RxkK+LYGHMM98FJTwIiY2s6Xz6Eoz3kNhG04Ebr7qkFnIxVxRq3pibdew2i22K5oxg13
         LU7ZSlj3WjMnUihW9MmEw9NNMOAD2qk+pvXCR3P9RT3xIuyDYm6amEVQhN0ekJdI1OXK
         7luL2tft7u2fMAk1pPe2mjnSIX8marWOAGRcKOlDK5mbULoZxUMFBUySmStnivam1OF+
         H7vti6+N7v9zcQNc4B/zz93ocrjW75NWJ4qmVHb4quS8rNfRfut/8yfHcqE28YnUOmH0
         E4bw==
X-Gm-Message-State: AOJu0YzEBwQ3BuDFhpZKWI8DWX7fDB59FzJkUJAm+zi9B2yB/bC+Ipl5
	hgOy7wRZfCjp2xhmE24ifvagI8XESb8OxKD0lZXQh7h6Kf9Gqvig44WnqtSBdQgc
X-Gm-Gg: ASbGncvtpnmd3mEt0KR86qfyIKmB0JoLcl505kFSHcUk4u1kCgVR5i7fPnW6Hu/1ptv
	no4be9TBUPFDkSQjrXBfrvN7fcMHHioMUoFrvsGsxMZsTmQ5SpPSGKoC5lf+1YSwIaRzlG/dMW+
	4Zj4vNZb1sLJNJWFpQkCzR+tvV8wHJACgw1q4oNPQFJ9bjo4E6B+7sP6kIN7Sjz5nsfyrU2FdXO
	vBAXKAQyBI9/gLD+mkAUhnivDvSoWlxb8dvFpSD6lKi3X9LhBi17hsrOjd8BZG6sxCiU1vm+XZI
	wIjuxZWg9AybrvV2lC1nZx1k7HajGrhGWILIpiGDoxhjxJHjl33GpJ/ZL/71bckqbGYzHt4ddyX
	vV1Qeo4i+7RnucwRmTVjtnB4t4Lyu3Ap3pQOSKKAWtojC6/q3sjAMI5CtYFbuA+35DB57PRovkh
	KY1OtlIrBY
X-Google-Smtp-Source: AGHT+IGoaxEGjK4mibMCiqi+SOWPzY386LcocZ35qBnz/h2zn5snNxf0Yw/eyC5hQO5qT1qePyTYKA==
X-Received: by 2002:a05:6000:26ce:b0:42b:2e65:655f with SMTP id ffacd0b85a97d-42b4bb7cc4cmr4087153f8f.19.1762976146552;
        Wed, 12 Nov 2025 11:35:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 06/21] usbredir: update SRC_URI
Date: Wed, 12 Nov 2025 20:35:26 +0100
Message-ID: <20251112193542.1589821-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121567

The previous git repositoy was moved to freedesktop's gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/spice/usbredir_0.9.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
index 452491023e..edd8aeb9c3 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
@@ -9,9 +9,7 @@ DEPENDS = "libusb1"
 
 SRCREV = "bca484fc6f206ab9da2f73e8a0118fad45374d4e"
 
-SRC_URI = " \
-    git://anongit.freedesktop.org/spice/usbredir;branch=master \
-"
+SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 

