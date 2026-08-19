Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1FAC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.909.1787117811081921604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PZdkUaK5;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1047519a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117810; x=1787722610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDVCBJ3/YqnmQtIIXp1oN57JeNtCMbQCar6TleuR19w=;
        b=PZdkUaK5rO7oVPYbfQA97J+jl2OQ/QY/rELGa0DVk7QpBJilooJxyvo9ECrJ1sWgQW
         CJQTLqFcXVkUFNymtAlQj6s2wGr9Y8dqkF+vWFriGPBq92GYKDi2F/4qBra+2YiWmwcs
         Ck3rN8SobxRCbpuL9YeYzvwCEcgwlEmsPN4Z9t2zo2t9mFG/JXP0WPkzQ7bzCqfD8787
         B0oZWU3HDi0kCF4WVZh8c+mtTcv83NxxM1YQekko3F4yWoxrQjRx4O5jB8sxZGIvdODC
         R6YAnsa9e1BcugVuiJG7QjkkrPVYVqSshVZcy/uzj/LREwOQk93vlC6Y6tWxv30dFYdg
         l4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117810; x=1787722610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDVCBJ3/YqnmQtIIXp1oN57JeNtCMbQCar6TleuR19w=;
        b=DHrvOerASzJpAXkhTNDmzA9bq9J4N06YgfSKSaQHdfWzqqdYg12MdIQyCzbqF5k52V
         Q4qvUTFuL0Q7vPL7P+bMuan8s3GX7m2wlc/V8eCHhINmGf4Jo14srKQO1FI+nLsvkAXC
         rLEpzcV0Ah7OanZnVJ5F0DJZZ9pIZ88pwXT3hl1UvczfQOdqCPEjj7fgwcTMXfho/kjO
         EHEFZx8/O09GdYwCb38tflvLZbDQwLi3+4w1Pl/Hp9SPnWMYWMbl9mbppTo0te6041Lr
         7+eg1bJIrEOWxTJhUgx1w5Yljp4wzXaZGwGrTgJFLY9pKrxRvAmNv7CHVIZk4R+2qBri
         Zu1A==
X-Gm-Message-State: AOJu0YxlgCiQqwdVtDeG7W31IikDcfGw4HqQUX4xBp7Q+ud6ekICPwV3
	8vTtSHJ5I+QQ5ma+0u3I+YuJXlb7EKWXT5vR++S8RIJPEW1p+8G1qH8XNrGeOQjm
X-Gm-Gg: AR+sD13af+F2/2EE+kYrTnM9ytTzjB7oBBPtbzbr6tVlEchlwHlVTIxi8Oo02WcbJXg
	hniztzvy1T6CANKI0zkWUPZmqQY9MCh7VIjBfyjIcxnbqASK4TgYKNhh3MYbaIaQXhC05yYWoLv
	89QIAcIQDQmYi71urKU2vCy61Tmy4s8leB9okG51Q0G/q6fGI9VUPkcfWB+CVZwM+Uf/zdRGf0n
	DDFEgdvzcPgReFYHd4y6OCsUL+I3lvQpQUR0MXx1lVhXCZ+Z5b/qwl8v2yHO9PReYqXc8K4kN8L
	PXptdUglnKDtd7sOI9InuOP2q9FArTHI3tvToKwSqKp1ZKMJOA69Ioo361jFy3WZcHmfdxpZ9Zo
	lQeSoAjYW+SZh7z0n/4R60/BXvprcEf6YqPn/cfPFl+LH/rG8NRZyGz7JDSroTbWpRlX/3l/0g+
	q3kWYQVquCkN/oZRhlfixcJG6yzTaNMU7OajHpccubsZjU0b0qsT02kHvNpMt/wAHIGPOQGPMAl
	A==
X-Received: by 2002:a17:90b:2f06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3958108a0f9mr4264329a91.9.1787117810498;
        Tue, 18 Aug 2026 22:36:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/25] coremark-pro: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:10 +1200
Message-ID: <20260819053629.391864-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129250

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version coremark-pro
...
INFO: Current version: git
INFO: Latest version: 1.1.2743
INFO: Latest version's commit: edeac7e2e11e601d91728e346c19abe3b68f1cbf

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb b/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
index e917d064f9..e20708ece6 100644
--- a/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
+++ b/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c84d8f508b20d579641ad151a79a8bf3"
 SRC_URI = "git://github.com/eembc/coremark-pro.git;branch=main;protocol=https"
 SRCREV = "4832cc67b0926c7a80a4b7ce0ce00f4640ea6bec"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 # Apply patch to allow cross-compilation
 SRC_URI += "file://0001-allow-toolchain-override.patch"
 

