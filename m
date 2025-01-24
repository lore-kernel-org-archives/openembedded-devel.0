Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3B4C0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:46:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.320.1737744397323935486
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WR03ldKz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so15936205e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737744396; x=1738349196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SFfyOHUqbz2SQlPo9/a1E7NJ6olIGA90Wy+H0WxKJI=;
        b=WR03ldKz99JhR73sbthUmiC0KElwcH63fKFFGdDLgtAHeNkATlgVUh6lR5KvFvmYgO
         uJQVyL/HuljBQw1UCs9h7S9PN8/cOfLFHVgQA7xhJjqUXmznrEi1NzsyKuPpZp3a69iV
         kLNLEf8LHYxErc4rRU27zbYStIB8PFc7WDTcd1XcP7oruOSvBa6v8QRky3Vb6Zu4lsWB
         KSzb8N/0Ru02vGEXRaFVxYO9ok5Sb0Joa4/NUWHw/cgzBlsvwrMs2G41bN2K2A0e09JC
         /taHtpJcM6tMpkntexR5tJn3R/tXeQM0bOgW5kfN/LA8pZKDzXHKozJWD+4odJY8qi86
         YDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744396; x=1738349196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SFfyOHUqbz2SQlPo9/a1E7NJ6olIGA90Wy+H0WxKJI=;
        b=eY/0umPNfdcW0xtAjy7+pSBjtpXicSZV0KKPXVaIFFtHHYpHHJIl9cHyAIoJueg9jd
         GwNZcHtHRZPB7qTG/taAYhP+t4gObnvJox4KHt9A5O/n7OnZEG5+dLs4HKPZTx7EJHBO
         BFheP5q0HHfZsXlPzmd4RtVstIO4JOafaPIplSxShuAMrUf5SQuuxmKwUa0R5PaDU1TA
         P0qCn7ZbD7MzhRqIAqESqL84AEqfX6mqu3wJtILjQmuS759bR+GmVJNVcQ8HZ4ShFkxs
         OfF/ZQwTjEOw6S5yhgXNhrA7X45tcysH6a5qyljwZAJWYbIElOdlDJW822SDTHutxxDm
         i8zQ==
X-Gm-Message-State: AOJu0YzrW1i+QcrW2uoRjhPNzfrX/Ia8fMpCV6r4Cd0V5vkuykN0Pshl
	Ur7QLyGN1Tb5Hvy+uT+gRYdvRxXuLFMBD8VW/eKunoQPJSF7WpjdUjlDXQ==
X-Gm-Gg: ASbGncsdFcD8u/XktXKGqaSaezB99VbBVsbrPiDNzcMcCbMQPwzf0Znhr+9byjQu/HV
	MlbnBgj7wiQ3zmeJuMKVnMo6ZNdeGWrl8Bw5UmTxlSYcBlldF1Vtpb4CbVsQR2qMAXohlTaZKNs
	aGrqhWUzcakzdL6UGoqVbOFQ/4fetUN+2k4yvD2pwyiK14uvrkrd5hoPNBZjAHkQb/beYfLRW+W
	rWxXoKKWPZ2EVcfyQ6BB5WFtkulY8cxX/gibetlS8400J0RBGeZG7RtF/li2K5keo4vUwF68DzL
	J9d0PI1SX+Mi0stRsSxM
X-Google-Smtp-Source: AGHT+IEEKDrp5phdUb5FWKwLX2iWj9kKnUwdushjQ0AZhnLieKnBshtsD3s1vpFlL4EtVn3QAxcfEg==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-438913e024emr333214175e9.16.1737744395490;
        Fri, 24 Jan 2025 10:46:35 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa46esm35676385e9.1.2025.01.24.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:46:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-cachecontrol: correct license file and checksum
Date: Fri, 24 Jan 2025 19:46:30 +0100
Message-ID: <20250124184631.35956-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124184631.35956-1-skandigraun@gmail.com>
References: <20250124184631.35956-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115071

The PKG-INFO line referenced in the LIC_FILES_CHKSUM variable
is outdated, and points to a non-license related detail.

Instead use LICENSE.txt to verify the license.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-cachecontrol_0.14.2.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
index 2687eed75..6a239c06e 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "httplib2 caching for requests"
 HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d"
 
 SRC_URI[sha256sum] = "7d47d19f866409b98ff6025b6a0fca8e4c791fb31abbd95f622093894ce903a2"
 
-- 
2.48.1


