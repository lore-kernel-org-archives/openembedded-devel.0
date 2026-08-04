Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E2C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 07:00:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11039.1785826845720751014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 00:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XDncRrBW;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb85186d43so2041638a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785826845; x=1786431645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTut7JsgX4PAp9yia7owWt1VFDzlW5rqzW7LKl2bXCw=;
        b=XDncRrBWqqvKnWRwp5LGOMr07V0CktDWXKrPoxwWXc67iJbfs1JYIZevmi+WkYuUAJ
         R02G8mEkrth5OiVSPCxFa2BHSvvWKZAyf+gN5BvCb45liSnSejasjnjtLbMJYrTprL/S
         sbP5RODHWIaht+vsvntgRyCLmJg66xXKwBOhUpjAkMO4s8g/0fC1iw1jJOuMR6VBxfon
         NITAekQFulMnrbvAvYT/Nauanaub7mWe+pnzTjZQj+xTxFxB/h2pKje/0tNB/p06Ng6M
         yQNjQRFrMWOn+we0BPY2fVl460+Zxha0c/rx413tZuCE587YwAdfO4kpqOQttSM4WhWX
         zv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785826845; x=1786431645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTut7JsgX4PAp9yia7owWt1VFDzlW5rqzW7LKl2bXCw=;
        b=LPI/VyU0ANIShvF66kp0RzeURQ6lgEbwoKMhQ5NPseGmns6ROPG2NEkQ/2k8ycIsZT
         UicvA7bDvvC0k6dWqyo6CxHZVOXx2fY1a5/O5DtzdLpGLoK3W3UQ3UA5A6BwUA6w9w9u
         xsyQBJhh1KED0+vO0x9+bjBXMxxAS0zlRbiY7cPSuzKQX0GT+pY3UxCe+cgfEDlMLx+6
         Pt6ITIgluvnV8xZUnPyiCaz46gD8ou61cVKs9ATClK4dOiJDGfdcX+VxDv9hNZC3/fVy
         KyRWuJxVM47eP/HeDUYsK+pViKXbhJXy5NO5kqDLhMb+rIHDJfXl0aKsMKjwsxC35qTb
         Z9Vw==
X-Gm-Message-State: AOJu0YzanfnRuKlkXwLNL9/QM3syA5eGz0+gcXrGeSwtSfcw60jwYpuL
	Fzo62Fq8KQ9s1nOSBH/hAvo6V0+2Nui43AeueoAIsTQTqezyE3fN+0A4Pu+M9g==
X-Gm-Gg: AR+sD12jF9hiaMao6vlsnxR723JxuLoV6I+o+gsCl7WZiIDOswh3udizFSVa+Tq48YX
	3iQH+8Dh97zroEhUo3ToG5IXCUFNLP9CYrKyTwToVFVkz0dNHGhxlI8xB4FnZrNN3tYQZvfkcz9
	z1pG/9rZyQCfe3ZgAiKdAzDTlVY032vHTOYy9xl9Q9aYhcJDSWr6HZrhoL2/OHBpzCwhhI6w9ik
	jJYHD3dOnyu5NNbSCymCBUJFBRwWSJcHEOeeGvu5giwzm3eDle9SCD/Rl5fJPPclfFQnRjyd1v8
	mKccDu7Na6f+9RCANtL1QoY08kegTE48WQHRfXfqWASdg54LbvC7cJYAwusmqTkEF6OW19HRvaU
	Tod/Abgxu6C/Kjx4U1nTVt0kbvifbjQGfJ58M5uPIixRKSbBvGM9TWG0706qboH4k3oQeXZNl9u
	8YjJJCD7K7fCsdQ2kAYBjuFoVoK28CtiRnwsbbdXAQ1A1ZkdXGoev+NipBwxNH4BUOABKdLaJyA
	Q==
X-Received: by 2002:a05:6a21:7489:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c92a89c7d4mr11546377637.45.1785826841573;
        Tue, 04 Aug 2026 00:00:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm916034eec.12.2026.08.04.00.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:00:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/4] python3-charset-normalizer: upgrade 3.4.7 -> 3.4.9
Date: Tue,  4 Aug 2026 19:00:10 +1200
Message-ID: <20260804070012.3171225-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
References: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 07:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128736

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch as upstream[1] raised upperbound setuptools to 83.

https://github.com/jawah/charset_normalizer/releases/tag/3.4.8
https://github.com/jawah/charset_normalizer/releases/tag/3.4.9

[1] https://github.com/jawah/charset_normalizer/commit/6f7eb9e42afc9d555b53a3129e94b0508154d4ce

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...normalizer_3.4.7.bb => python3-charset-normalizer_3.4.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.7.bb => python3-charset-normalizer_3.4.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
index 52c194626b..70dcb9e158 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
-SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
-SRC_URI[sha256sum] = "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
+SRC_URI[sha256sum] = "673611bbd43f0810bec0b0f028ddeaaa501190339cac411f347ac76917c3ae7b"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 

