Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B50BCCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 18:36:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3462.1762108590131644528
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 10:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTR93CW4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4710022571cso36507965e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762108588; x=1762713388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wi3QL5r/P8UNv7aswH7zfc0/0gOBX+zXJlkd5Mo0C50=;
        b=LTR93CW4k29iR7QvRiZIsj0DPMVIXZjccXs3PgSrilLgeMTQ0sqJzzO9uZo0YjDQ9b
         q5KTPyE0MaCAUpv4R8dn9XLbXDGOj3EUcqNc0lTYtqUAU/Ng94O4UUYUgPGL2PCgwPBn
         WP2Te+VxqzL53IeFCvMdDIQFG2A/T39xoXIlvBcie1woWLfZoayjCmFStiCt7JmBAqti
         dPP/8Ig79pEA3Ny8TbvDkQheDHnXnFtqUCwfIwrIXe7WKLGOBS6DSKISnq4F+YUebuLQ
         62HMVUqzRyz9Unq6sFCYdlYdPMBFRSle2/nepJwM/v+IQxMJziEf0kxMIOTRo45OKKCL
         bZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762108588; x=1762713388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wi3QL5r/P8UNv7aswH7zfc0/0gOBX+zXJlkd5Mo0C50=;
        b=fddD7XxEV7jz+WFB8/zEdwtFLTm1ucSzjike7l+gNnMsN1qa4e5Fw9VVT0x8ig2too
         HNq+KbbQKhisqAN5+VFNQXpVXh2/mI7Kk8bFe7jZCfti5d8iaM5iBlYUDdvrpasgIRLI
         9in0JO16nVIGo3umpEZb8uCEvJ5y7Ts7+pBJynlqStGCP40jIGcc5QWlUYvWV+L5ac2I
         EmwQZdFaCFueSQ10jrjZX/qNseGA0BmMNYc7wYOvI4k1h/D1w6VjOXpTqAQ1xbvM3e2m
         O2vjyAuRKO7px6AIY+wEqiCxRXZUIa4osKYUkiN/vCDAUpDXV8veFZDLrxnhgPJeFa0i
         Kw5g==
X-Gm-Message-State: AOJu0YxoNuz9Lj4ZGq1in0eUqBzldbZcVJLE4TbcgRxyKKRb8Bw2GA4Z
	a0+8n/DaeqZJ3L3j5GIXabGcCHGsDXpxk34x0NcCIIWg5tMWRP+kS/s6DbTIOpSA
X-Gm-Gg: ASbGncu4WSL0VuE1x0qsGqUTyu1yFewM8jrfBdMyIYfX0JFT3lkaIfebI4AYnEeaQXU
	wTUyFYGIhq2a2BoBDsg0cXZOoLLP5bWkUvlyAXmhkzuIlrI/BuB3I4umYQcJzJZ0vjXeE0J4AAp
	Bq8ekg3mC3Nj3HJ5YUHjGadKuDkAr+ygJ16w+gz+2kmlPpoiVHvZhMnw6E1J3jcM4ri8tUsM4e4
	0XGPkRDNO8tvbdJB+nXbhO/gJ6d8eqzt0UgDmjyi7BDtUJ+x4sLCkcfIynr1jLMNjjF6ycE7nf8
	cGTlxC/QGMYGg5cYizdLOXEHnbrsBF9fw+GbB6SdQX5x0wR8x22gw3oDMYtyJA29Kq8ND+YamT3
	VTOSmlChjjtZY24u+o5eeOa8ytrpPJq/B54amGAmQrI5HtcNZpnBc6N/+3qSzQ9TIWRCQ4Do3fA
	g5lWlGoF3x
X-Google-Smtp-Source: AGHT+IHTWNY46tebBmrw1VfXnppHwzY4Wd8n9wlsOucpFrKlRpjXWslQPMIm7HUG9XvCfZr6kNomYA==
X-Received: by 2002:a05:600c:6692:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-477308a2814mr82295605e9.33.1762108588216;
        Sun, 02 Nov 2025 10:36:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c2e6771sm110887525e9.2.2025.11.02.10.36.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 10:36:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: move from PTESTS_PROBLEMS list to PTESTS_SLOW
Date: Sun,  2 Nov 2025 19:36:27 +0100
Message-ID: <20251102183627.4052101-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 18:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121260

The tests are executing and passing fine.
It takes a bit more than 5 minutes to run them.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 580c79d6d9..78ba1e228c 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -63,6 +63,7 @@ PTESTS_SLOW_META_OE = "\
     c-ares \
     fftw \
     libusb-compat \
+    mariadb \
     rocksdb \
     re2 \
 "
@@ -72,7 +73,6 @@ PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
-    mariadb \
     ostree \
     poco \
     psqlodbc \

