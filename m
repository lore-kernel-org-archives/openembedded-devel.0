Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007DDD2A01F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:35 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9354.1768395690279493738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WxhAhnw6;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso2767877b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395689; x=1769000489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTkH+MnqmYa3zd2DGQdpKHSmKqcbF1PUL0GsezUwnys=;
        b=WxhAhnw6MhBuTUpLd+npvtoOe5w5XIKnz5HqjAsCuuZruZiLpyc24tyl7zbpUtsz8Y
         F/vifEryfHsEUlMcadQ2Ot98fSB/yme1dYpATWB36pPoFOUVTL5t65Qmd/AvUq01Wuc2
         xzxCuWEubPuJQB+mnJxHeYID6nH+rNNvoFtsakOaOj40LreZdQehh+fY4YR6yTLgkG2o
         mogufJs9nJD7qw3ZjGWqBWSqIYBEBcJFY5BH6KaNMBk8/YnIvJZa3eMUc3/N+R3ww4CW
         yBGn+fYwMZ5a18ZzRFF9n2+5zlupm5l9Y6eq8KRiDVCl88yXDun+S0aipopeCjvEpRiu
         vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395689; x=1769000489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTkH+MnqmYa3zd2DGQdpKHSmKqcbF1PUL0GsezUwnys=;
        b=NuR9rElGPtBiDv+ekanQTxp5sfyjTB390ndmPglnSAwoo2neN4vQqOmiUdcdlTACX6
         Rs6PMGyk8GdIIepz+CcG89Yz7dlwGV2zGyAyXNxhZxhXkjG3S6TTQ51NqigdPTG83Xx+
         fPxa3Vv8/vi2Y9YseCqqThSyVoA07hUkHsu1ty0DGangJaC7xsaCQPYnFHt9RhS4TJy+
         B+lro36CJu3SMBePGi2RjsJckTUQ+maIH5HcUCk14+iEsYhlCxs9uyGHneT1B5PKKAgn
         rHvGe2MGdRsrWETBYFd2eACnbNu7t1D2NPfUJ9QtZfik1wuN3Wv6EOFeBCPQJuxBLMki
         ripw==
X-Gm-Message-State: AOJu0YyaEveGqw1uvhbOP1VAziOiXFKXbO4tD6vaHSwpuoi1YGpoHjV0
	WwivMllPsm1MYIn8PcGqDa0fsN4VzfKdPvaBq7+2pS+7ubsAd0tufMOI79/eig==
X-Gm-Gg: AY/fxX7Tlf6o9Ia3BytJ6PwbF64XIIOSCjEJaKQg6CqMBSjefZmbHrcih8PdW6sChTj
	e+Ux6+MqlYi6EYMVKKEKb7EX6jKpQ0UXmLVqD5fzXiDYl6DgJQoUMH5fa9ZzIzgg3HNPYuEPh/Y
	PKmmAQERbIiZN3yJ8qS8eQtuNEa4Hi5ZtTI9VzhrcfYRQytVHi2bf6F5bpMGBbGGwdJmwr+a67L
	QCY1+GSJwDfYMhZ5Rbz07YB/3Wq18WzoGo4YkNwkxwLOaRdhGZkRWSxempMtPSwb/A2UiqM+yAG
	Y8278dTK6aTO62NKCbR4N1nAjfo4r23490AUcWP/nhy1qniwVrtxw64r8iKY2flpcL4JVqeWPzy
	8oBM4iH4IRukCBFEJ6Rnfgdc0malMPW6dYqKJ9BNwriY3U0PRg+1dmhjvR9z8jftAnPFuPkVtJ6
	FTdw6F2uKDtcoeaiwX76Pqt9M=
X-Received: by 2002:a05:6a00:27ab:b0:81e:a228:f0d8 with SMTP id d2e1a72fcca58-81f81f7724emr2275294b3a.34.1768395688950;
        Wed, 14 Jan 2026 05:01:28 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 10/20] python3-marshmallow: upgrade 3.21.1 -> 3.21.3
Date: Thu, 15 Jan 2026 02:00:47 +1300
Message-ID: <20260114130100.1016416-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123463

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

3.21.3 (2024-06-05)

Bug fixes:
- Fix memory leak that prevented schema instances from getting GC'd.

3.21.2 (2024-05-01)

Bug fixes:
- Allow timestamp 0 in fields.DateTime.

https://github.com/marshmallow-code/marshmallow/blob/3.21.3/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hon3-marshmallow_3.21.1.bb => python3-marshmallow_3.21.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.1.bb => python3-marshmallow_3.21.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
index bf1d8dd290..9c29c810d4 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4e65e9e0d80fc9e609574b9983cf32579f305c718afb30d7233ab818571768c3"
+SRC_URI[sha256sum] = "4f57c5e050a54d66361e826f94fba213eb10b67b2fdb02c3e0343ce207ba1662"
 
 inherit python_flit_core pypi ptest
 

