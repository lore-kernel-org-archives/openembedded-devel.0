Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B71AC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:09:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.14470.1708006153151964111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DVyf6mwE;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so176282366b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708006151; x=1708610951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n6i7YN47kFMtx6YqQDoWjLLpqmfc2O0oEBI1k8UNHU=;
        b=DVyf6mwEhi+5/sHBVuo6fe+gfWOlopuEsVTLPebSfaNE5KM9ZYzgezMfJT5Xz9ykCr
         8oySGVDyM0yvxabJXOlWmmP1AkbD8PVPQM06etNqan0Z+Da8acSko/Fct8jE3v438eTE
         d0xXflBChHtonYFBlWuwCRpbntMk/nLpRt1NeF3p3aUwQm22GYPglywIov8GP4CU+llT
         QLL/VPQJcV/prjqFMMlISe4MioL3Put5vlSCFgcVrEBjlt4k/zANkTGvuWgLE6wXwKUU
         L0zQmF1lLEWiv1x1pJfOt2/lU5tOXmRgXf/jv/5VjiSlLRznN6uCFnmXihLd8yiidXcX
         4jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006151; x=1708610951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n6i7YN47kFMtx6YqQDoWjLLpqmfc2O0oEBI1k8UNHU=;
        b=fHQIV5CZlQsTRWbacK752tLgI6IV+Eo2jt4Q7yvhrte+bTXyuoPlVX/BqiYoIUGQZ6
         s3xusLD7hB5+q/K0xO4iF056WWU5NEgnESYx9MkJjyIXBkzW5uV9yI9j7UN7kPx2wVUU
         nFLgv/DZibaBwW37cCsnsGYy5caJzebNuRRv3UHPze1TXH95X101FXjwWEi6VOwrDMVx
         9qytP+Tc/7FO+rtkfyrJ88ZZYGVWge50eTfJpIudSrP7RpPUrJM646PEJHXUtHmdkENW
         GJHksRAWSGTX6VrJR5zuerZwxspYQbLS7X+mcI5ZI2tbqMuzE3Xdn8tbNMOtE7rIAIgF
         wtGw==
X-Gm-Message-State: AOJu0Yzabz+msX5RJeCXfNoI4QuNB8jnXzzrGydysFDsW+fa3FDEzyZX
	0OCQXw4DX5UjD4dF/Yg9cYvfroC0VI8xiEf2RyhtQTJGQnz5CkGpyGjUxVKW
X-Google-Smtp-Source: AGHT+IFL8Ldat8Mt9FTdyVLHla3H6SSZ8wY83T/U8WNZfNNIr5G3riuu1xSNZgWIQpfQq8onB9uYOw==
X-Received: by 2002:a17:906:ce2b:b0:a3c:1603:7bc6 with SMTP id sd11-20020a170906ce2b00b00a3c16037bc6mr3833819ejb.36.1708006151436;
        Thu, 15 Feb 2024 06:09:11 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id p19-20020a170906b21300b00a3dad483948sm238238ejz.182.2024.02.15.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:09:11 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 2/2] libusbgx: uprev to the latest commit
Date: Thu, 15 Feb 2024 15:07:14 +0100
Message-ID: <20240215140714.2106808-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240215140714.2106808-1-max.oss.09@gmail.com>
References: <20240215140714.2106808-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 14:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108752

From: Max Krummenacher <max.krummenacher@toradex.com>

Uprev libusbgx to ec0b01c to get following fixes:
```
ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
cbf1750 uac2: add additional configuration controls
81d7c05 load libcomposite kernel module
caad244 Fix: Memory leak config label
51abbfd Automake: fix distclean of tests
3cc5af7 Added printer function header to installed headers
adc45af Added missing extern C closing brace
```

Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 484110561..a20ff4eea 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 PV = "0.2.0+git"
-SRCREV = "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
+SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
 SRCBRANCH = "master"
 SRC_URI = " \
     git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
-- 
2.42.0


