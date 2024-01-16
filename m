Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DC0C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:10:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.21903.1705425051623068482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 09:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=tPKPljf9;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e857ce784so6769565e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705425049; x=1706029849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poFsFPz7p8WUFHVabQpSghuPx6d2Bnb8myhgBX9CS1A=;
        b=tPKPljf9TzRj0OviDnLJxAQDwUOnWRj0+DBoew8BId9x+UVnigLDcq4xWyppfmwSVd
         TNeZ0dZ40qXTWCENy0mEhFHlT9YEGCNtg6pJJd+aeMovEa0YjnuBl6hH0RU7GYo7v6qE
         f2Z/6UJ0gvDd136UJ+O/rQGV1myrgPhT2uADNhLQOVwmmQbZ3DZS54H56+tSkdh8+WN7
         7WtKJ/8vNOXOTzH6l8+qg7UUvlPUV5XLLEZT23hiSrnTEpiByNkKnCKZePrKmZYurhsD
         SGcC4sbzxa+KibQmT2HMViwfQODW+f5LIsVHrQ4icvZf5fbDaZAm7kEwX4bdORlKvGXh
         03Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705425049; x=1706029849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poFsFPz7p8WUFHVabQpSghuPx6d2Bnb8myhgBX9CS1A=;
        b=xCv9DFQUPcIr2YDiMHFJTS1WgKlUfahn317JHIAvbHfRRrJcmAkR3y5IMi3pRvhXYv
         fz3C92jeh3jYjytGxj0KF8pWdTADvhdGZEG35ieLzd821HT6RVSbOZg5Y+NO8NbeNzEj
         TVhsf6hJMds2gdj7+BcEi9fW+fhUX1SRVTGiystHjYTH+Y3H/Nh6iPzaJVaFz2KP3hAi
         rXRpDUxbQz/LDqs9hsd6FVsNt3c6M/M0YPSX2VKtmS3QjPdTzha9FtXq9TEKp7FuPvyA
         G3RU5xi2VwrMy1UnhuQ2OUQcFB1KoMhkTEgRfUoBjoqD/GZmCQqGS1EnoHx2xCd+a6lv
         2Lag==
X-Gm-Message-State: AOJu0YwfxRGVgA5CmUgEsA6BLgrgKEc2Aq7S3E40s1NtjrFn7QfHFb+M
	XWloJQEDWdYRD+Q6kJiTzaLK7dL3BxxQYF7xAJL/vwfY4eMNDw==
X-Google-Smtp-Source: AGHT+IEAo3nw3XMue6BrLc+YLeYw2jiynUMMfS9YbX8kI9t8y4lpiJMLrT2Z/oJDOHhCtgjXV53Cog==
X-Received: by 2002:a05:600c:491d:b0:40e:3ab2:3cba with SMTP id f29-20020a05600c491d00b0040e3ab23cbamr4197381wmp.158.1705425049113;
        Tue, 16 Jan 2024 09:10:49 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b0040e3733a32bsm23658741wmb.41.2024.01.16.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 09:10:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: remove mongodb
Date: Tue, 16 Jan 2024 18:10:31 +0100
Message-Id: <20240116171031.3015154-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108306

mongodb is skipped pending a port to Python 3.12. But there is no plan
to actually do this port so, in the meantime, remove mongodb from
packagegroup-meta-oe to avoid an unbuildable dependency.

This patch may be reverted once mongodb has been ported to Python 3.12.

[0]: https://lists.openembedded.org/g/openembedded-devel/message/108300

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index db1813189..7fff849ec 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,12 +1,7 @@
 RDEPENDS:packagegroup-meta-oe-devtools += "\
     python3-distutils-extra \
     rwmem \
-    mongodb \
 "
-RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "mongodb"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "mongodb"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:mipsarch = "mongodb"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc = "mongodb"
 
 RDEPENDS:packagegroup-meta-oe-connectivity += "\
     lirc \
-- 
2.39.2


