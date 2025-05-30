Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5392C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 09:41:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2789.1748598107627279277
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 May 2025 02:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=itCwhCUC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so19462445e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748598106; x=1749202906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84LJzPq7YcR2y/qFSNuDVjGmvNclD8cGlBBuzdXk7PI=;
        b=itCwhCUCil0BkuzcD7GHhmMqMZP04d5x9s0AaEtZQMfcS06BYOrswa5GOX3+gO5n5B
         4HdMlzNT8Blmkn4EKDdZzFwFC0fzUEQ3mNbIZ6Ks8hNGVUoRRnexhUP2AdBVtH9LZ4y7
         xld0D4fImUq/8J/cpq1OnHxGoVDkcvINakSWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598106; x=1749202906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84LJzPq7YcR2y/qFSNuDVjGmvNclD8cGlBBuzdXk7PI=;
        b=IKYcyoM+BkM1PIGt8yOASyIibjJcYFJeMv1Wocg6fyNoO4HJP57dENIC9ys3cOkAnD
         b/+cY3eDquwxR/4HdpICi+bV8qFPvbZiZb1D9P4T5FRAjfrJjWifqOEVDGD3MPdOQvmM
         covOjVjxB6MaPkT2ZZTNJFRG6VFL4sR31SZObVYLatBWhizzj/GJaAJemBuT4UkcpfBn
         RcqSPaHVMTt3m+dP3er5MZ+4XcL076DKIAZDHYpyTz9Xi23LYDn1CdVzGCeFYE6afxvv
         Uu6KQMLiPrPbSZCLr5vXQqpWkhl+92/ixVq6V+NZI5B/MIZCshFg9QADXmNeUFDI6+gV
         ZpOw==
X-Gm-Message-State: AOJu0YzO4pPMYBX5O1H8e2D6/VENSCa+dNUd3mwjATgo86WHBjgY3N5k
	TD54Oa+efQICblIkyUxgFBqpkmdfm657HudKyKwsA4lzBmofXtrTZPYxtiBVYlKwC+YAvhK21ru
	arPFt
X-Gm-Gg: ASbGncs96jHH20j/aazFp/U/sS4FIqSpdJB0FMNIQtodCcsnyfZJ+fpm4w+0zVon3uu
	L6mG2IoHRrvNCJSAj0fP2H7yyRak7wcE1UVPjeu1f/gcDoN0lB6lO2UdEc2L97PTUmfRubk46Vk
	+9L1VFscML8xIQfz72/1ck1ylIKYDnVR/llCM1SU7NwYnkfC/I8pKf5wNfX9oZRYz2ZWicIq0S3
	rsoQ1Ppc+sOUDKZDOytm6yffFTti3t1UZq+lLnMhT6kbb9S7ma/xKIOPq2CgWyZW7QG78Ixdvot
	MsqOLvMv4g/ySDnM21KwnjWnxc96+RD+jE1M++eQIsx7J1TeNyV0JW9l4xYqXO3nfw==
X-Google-Smtp-Source: AGHT+IH0NkfmKU7Q//9zQsaBgb2x/fvDdbeWsYcbHZz7rIMvVAhIw7BJzHXt22OZVCX9wUN3cuigxw==
X-Received: by 2002:a05:600c:3551:b0:450:d01e:78e1 with SMTP id 5b1f17b1804b1-450d64dfffbmr28491535e9.9.1748598105789;
        Fri, 30 May 2025 02:41:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm13149075e9.18.2025.05.30.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:41:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-libevdev: Upgrade 0.11 -> 0.12
Date: Fri, 30 May 2025 12:41:41 +0300
Message-Id: <20250530094142.2158572-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250530094142.2158572-1-leon.anavi@konsulko.com>
References: <20250530094142.2158572-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 09:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117673

Upgrade to release 0.12:

- Fix intersphinx mapping
- setup.cfg: Replace dashes with underscores
- readthedocs: fix path to requirements.txt
- docs: install the rtd sphinx theme for readthedocs
- doc: add a readthedocs config file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-libevdev_0.11.bb => python3-libevdev_0.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-libevdev_0.11.bb => python3-libevdev_0.12.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
rename to meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
index 8c05df38e3..cabcfd8df6 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d94c10c546b419eddc6296157ec40747"
 
-SRC_URI[sha256sum] = "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f"
+SRC_URI[sha256sum] = "02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08"
 
 inherit pypi setuptools3
 
-- 
2.39.5


