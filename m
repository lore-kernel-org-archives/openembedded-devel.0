Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE416CCD19A
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 22:50:28 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3925.1763333424796750331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 14:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LVMwfqX8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b72cbc24637so631837466b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 14:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763333423; x=1763938223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEmhm5jNyO6M5tKgCCzXF5kMsBR27yn1X7cNksuB13A=;
        b=LVMwfqX8a2XDDQsPjPLSTchyyydvCVxQYM+v1ADCqoOk0vSKPf6ngnkfT6ByF/O4yV
         bF0CXl1U/jkq+ukI8Rll4CbHy5T+bODeIYFCnG5pyhO/vox557GFnGRnr14NOJ//Rw+b
         ciUJBFTyqNGihce5NGo6algoPBO0ISDe/eLs4jx/eeX1a3tW9QXCiCHC0WIhjBcNgKsp
         wBgjuq6meTYiKDQIlzCqjg/tZvJNnav96kbn8iHCIt/G4uMGrQ1tWABkaMV5Bg0oEEzW
         m7L1/l2MUJsvBwuYUqsFEKF6YF7KApL/NYS+3UI/WVj4BC/rhTcSqLh2crkbQiSyRzsi
         0k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763333423; x=1763938223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEmhm5jNyO6M5tKgCCzXF5kMsBR27yn1X7cNksuB13A=;
        b=bTqloOUaai+UsMIH5HXcAjbgN4Co/JmOGQWxi7JZ9w7QpSZmtNFyOG2YwdHsDJk9T3
         RiuLLdW0c2iiqz7JaE/+m9l4z5QnZFptK35OSbKxhJWpPFsHDSCMlURUp0jx+5ci8P++
         DHhgeLSgYGjJDIK6+GIVCZY8uPPfWarPbYMWb8gideT5WRgW6u6rFgQpeZUn4iva3tnP
         0uabkXSK8oA0YJHvHQlzRGUw3ptPFc35yLJZugeSBO4vbO2WB1VSWIchVI4TSwxUZJFB
         oELd6worBtog1UckaZo6cSFz6dkStbKKoLouM8tbv0RfdyRVpuk6QCyJWsPsNldOjDby
         4s7w==
X-Gm-Message-State: AOJu0Yy33s4p7ZG3+7BxTc6sWAowLEuUGS8XjcHsCpyjUOqQhSHCgJ8+
	Qg3AdXb+ZzoyGic3DiauLUfCNQl8P/u5sparZA0IO05cjCGAN6DNM7AFytvjQQ==
X-Gm-Gg: ASbGnct9vVHXHYLQpMF43gSHqAgguqovlvJ2MCcr5do8M/1LUitmReeFXiEGdwlO9l9
	NMhYzhpWGRPuB94LFbcitEOYcMUUKHktw6TzTqu7MbaCZdgbnVhzELjxPLx3rsAKmUBsABwyJfW
	Y8ufLi16Hm5NXinQqw6RiL0TWDSvakwTFS8tMwd7VLzF3JZD7Getqj6Fbd/kEbynqjWPkySepYC
	uzpTK6TR2gVQzsX9PkJh68AqDQ9gWBGP3oj6yh5ZtlEd9BCrKE7pRaUvRPKfEKT5rQR4nlzI2tK
	fQUvETLvWdwtwprGFrz43XkfSIwHzKh7cYr+Ktgs02wVvk5uv1YG3ENzIl42T5/VtuG17GBABex
	k5N5EOY3S8xv7XnK0IRiyKGXDHT+FKG/fmvuKCw9aNeKN+GMdTb8K7HtliIY0DeVTC/S/WCtLAu
	43jQ+PzN2ElqMjED+aXrO2suDi9UB8b89CBzDoAqp27W4kDn9fv8Eh5KUeE8A2OM8X1q2WpZaXQ
	Zh9u4t2NvO2eA==
X-Google-Smtp-Source: AGHT+IEFfnIuNTdbI6KOSegByyCl+aoOe1zxJS8WWTJ/n/8CE6KUp/bmOtYhLRRMTXN0WPe7A1+M+w==
X-Received: by 2002:a17:907:980b:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b73678be1admr988256966b.26.1763333422678;
        Sun, 16 Nov 2025 14:50:22 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa811e2sm942983566b.5.2025.11.16.14.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 14:50:22 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-orjson: 3.10.17 -> 3.11.3
Date: Sun, 16 Nov 2025 23:50:12 +0100
Message-ID: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 22:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121749

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-orjson_3.10.17.bb => python3-orjson_3.11.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb => python3-orjson_3.11.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
index 7db76c9415..7fdd0fef9b 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
+SRC_URI[sha256sum] = "1c0603b1d2ffcd43a411d64797a19556ef76958aef1c182f22dc30860152a98a"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


