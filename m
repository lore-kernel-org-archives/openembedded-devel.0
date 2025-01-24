Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74EAC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:46:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.337.1737744396761261814
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B83+Tq84;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso2148658f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737744395; x=1738349195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHI8itXC7ILDEQnkNxYSks1P8XIZqa4JWJ0iKATDndM=;
        b=B83+Tq845cpH7+vkYfN13owKuv0k2xgtFVdVt3t+cuC4foPLCgsLo4X7ZK/jeHyejr
         BcI+40cZcxJmpDuTd+USTh4w8o+g9QD7dkO3pWIf5qtHjArFM7Ujig1Aw0wLDn8X9P00
         iZ8bTJPd2o6QY3+B3dRPPQiWZgpveFpobf78T/SDRca4QIIU9tQ8b//BCrgQSrMOXJwb
         S9QAd/RkHdaMMFX1LPe1/PwCGmND5B2fWE4OnUaQZ5ZMaWV/J41WYOFVAjNsGp8whChL
         lJfx9Xm85eEf7Gz/Rqwh1ebzmULePXWRCrDqyw2c3i7huuAgdTtOTt9c411YUtgNSsit
         ibMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744395; x=1738349195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHI8itXC7ILDEQnkNxYSks1P8XIZqa4JWJ0iKATDndM=;
        b=RlKjHNxskhkvuu9W6NlxHKVGl8zBiv8QbB+jv2bGmECyw+AZtsl9irxkPfJvhzUwSB
         UfkCLZMjfiXIa7RZPQqThwI298gQEOA/FzTZNtEcIxQ/Z+U/UDYC+zCUccAfp8ym5xKZ
         KIhtKQ7vqryFy441dzFJPEPhPFrsBc5H9fq69JB+bwV8BuYinvLuQSrPe5ylzUDbnoyy
         Hb7IHgyA/dpIqZu1MNVGtrxTseu8ACApPn7cxUATtqX0kgy8jbHqW2dI+e/Z9xXaYQww
         CfbJfpTLnxt02NvV/KXcPYPwCozXnCbGWQBXr+nsJMlx/jsjQr/rxgKZxXsTdO+ElfZX
         ZZtQ==
X-Gm-Message-State: AOJu0YyGTtudDxBBDRIbp1uBdxcgqB8f8EdW2wzfjnM87mIJAHK1ZapE
	/5oKzhJKWB3icWD8PugHJZWTXbj6qfDE2hOd7d0JyL/VVoUIBAZE2BJc9g==
X-Gm-Gg: ASbGnctBHG9+/a2apFjh7fy2D+p4thB/+KxER/9TRZ6/CCvgyeUoi3TSlTwyKGTfHlY
	RZHplQ2ijZLxLte6rfZtIP6XoasveiLQBC4g0lc4aBlLD5AcZBpfXAms+Q8kfaGpPkx2VOsxoyi
	9KtQjN/6Xfmgwyzp/G4gQrWFjmbBtIZUfm+kTo/t6giisNncBJ7oKzxnDzDa7F5jT1VtXdCNgxx
	YPq9PLkFgY6l3aq7HT0amYmW+LD40lMePz+Iip3YXmc6ixHpS0Ha1j+d7GP6l1UdfMjKeCxpcbD
	1py2aWqmIAOWctncdQgU
X-Google-Smtp-Source: AGHT+IESHxzb5B6cP3jATh9ZKqxA6TErOqQN9JASTKUpwR4Wn1ABhBg2931dr5v6m5ARLQAGVpqz7w==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id ffacd0b85a97d-38bf57b7fbdmr33095416f8f.40.1737744394879;
        Fri, 24 Jan 2025 10:46:34 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa46esm35676385e9.1.2025.01.24.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:46:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-oletools: correct license file and checksum
Date: Fri, 24 Jan 2025 19:46:29 +0100
Message-ID: <20250124184631.35956-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124184631.35956-1-skandigraun@gmail.com>
References: <20250124184631.35956-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115070

The PKG-INFO line referenced in the LIC_FILES_CHKSUM variable
is outdated, and points to a non-license related detail.

Instead use LICENSE.md to verify the license.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
index 162ebcab2..991d0d1ba 100644
--- a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
+++ b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python tools to analyze security characteristics of MS Office and OLE files"
 HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=181754d317256f1b037529d3e994e1b4"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=062477247e75fcb78ae3e1280be9e4e1"
 
 SRC_URI[sha256sum] = "ad452099f4695ffd8855113f453348200d195ee9fa341a09e197d66ee7e0b2c3"
 
-- 
2.48.1


