Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E868C531DD
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.116214.1723697133842203583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b32p6q2I;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db1e21b0e4so344701b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697133; x=1724301933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NkspW7nErQg8HNtHysocEaFEPwjZEM83AixPi3/EQ0=;
        b=b32p6q2IHU8jLN28V7oGfIgS/M1hsvlClQNhUeppOE5Lfz8kIQY8tAYUl7DJSNqeGL
         1g09yIY3G2Ro57UzhXUXFoPhucYbBD96WACKQQWRp9tb82GdChi4rXwf9acsQLsVgLO8
         g2aP+pX1M9hUCTcU2o7mMfpOHB2OUy5NKdhmGolMN4shkXbIuwO214VuDtABGzRT8GZL
         77elqcK13aX0WOMUyWO9vl6VqJargf/Yd8zzVPYxEbyMiTpnaMQqOKoUTxQFVxxLl2wv
         0z17RDG20bHzz38RR4eFILDZYQXjsidQ/xzajaWd7YPjXOy6wIBjccYklSW/VlaA1/xP
         8G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697133; x=1724301933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NkspW7nErQg8HNtHysocEaFEPwjZEM83AixPi3/EQ0=;
        b=vmehvHeDy9lpdMQ6dRzuuGn1M9tfKiqM8TZnZfbbnmAIiNTWo3XlIw00b4n+4HUsxd
         LIb4hoItgUr8sGd43ftkv/GVw6kcOqpe7YPkFu3e5pFFnD5vViEubc1uoak892kICXis
         DC/+KPKOCqrCnAy2D6CFHIL2QkSOi9k7g39aNZqxxxpOfTPiNUdj9vAn2aq0bhRVQpcq
         EuvqW/rhbSV4K8GjUA++d2MzjUDy8IURKhucHGdjh70DjnWQxcwXCNT6+5+DobjdXSkw
         8tgwaAfnj9MCHRWGQlcuTAr03gW/ToND2HxqUw2DArVhBGxqTuYvol8P7ntY+hcC0fW/
         4v1w==
X-Gm-Message-State: AOJu0Yyl9UYJH5qRgnx2mIY6VrZHgDXusEcqWtKI64yZJOQUXJ6Vc0i+
	0xJsxvtjDJzlCOCfCZpF+f6gdX2w1CI5wHL+M0FtkRgO1sZAN6yrmUcpEg==
X-Google-Smtp-Source: AGHT+IEwUhSO62OsB7jzfyJ2EVs6ZSA+HooCLZCoigI5y0Mk4z9o0DF4qXmdP9249MFVeDzlgB80SQ==
X-Received: by 2002:a05:6808:1391:b0:3d9:28cd:67a6 with SMTP id 5614622812f47-3dd298fa00bmr5549524b6e.15.1723697132909;
        Wed, 14 Aug 2024 21:45:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/9] python3-pycocotools: Use build pep517-backend
Date: Wed, 14 Aug 2024 21:45:19 -0700
Message-ID: <20240815044523.1030831-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111813

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pycocotools_2.0.8.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
index c9968ae379..47c750104e 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
@@ -3,7 +3,7 @@ SUMMARY = "COCO is a large image dataset designed for object detection, segmenta
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb205e0a021e1dfb8d"
 

