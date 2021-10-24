Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A08C433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 14:21:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.19148.1635085307864747270
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 07:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=OAXzFTG8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id l5so8447467lja.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=woSFrSi+Qa+V5snQ8WpUtwRaIzjCWH7qLPTN7SrauTU=;
        b=OAXzFTG8+AYa6fAPJfvB69E1jLhbTBwHDVo0MBtXqSAaKoSmljq8WTRYBTE1/C2a0Y
         Uj/QwgiarGUtjHxsfwGcucIVx09poNa/WmWiy1PrsBeHuf1XxRuhQSaLgoFfWqjOEEPF
         lKPsS2cFum2KVOgJPe0M8/QeIOyRdEnkf+05/l4KorKPjPtWf3LuJoi+ARST+CUFZiJc
         56xjnSImUm6b1ogQ7WFbtqO2Do7hvcAAiYrV0su2QPlNa/FAGU9Z4WNzMK1nxTKxodi6
         6vMzGQQXSOSZgNF5aCVMju3P6WKmHNdTXgYIyyZesSlazyI14IcT6LXqUNZSfy0mKCUL
         H5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=woSFrSi+Qa+V5snQ8WpUtwRaIzjCWH7qLPTN7SrauTU=;
        b=niSv5EhDd9vIuWXM90ish3prpj08Uk+KF8ly3g1Gdih6si25SjdOVprOOFAoOqMp6N
         OinhwxMMVakUqQ2Z0ETYKcBLm4ucFd5bMe0Z9v5o8GqXnNJcpKWePuh7OXd38bCx0/Rr
         yuVSaVSRE223W510zkxkiGmiwZRZLFtvDsH6SDQcRt5BCqDVCVGqVo5R8vJB9dyrJSx8
         OSbhnXi1ywosSqLh0Cc4hq9DFm9zPD9NGbEr3gRb/jEhOrZiNIF5TRjq/S22OG3YloP0
         jSxEpA9vkBykNZfg0Er1FoaWayW6UjNN4LRDfUJAYs+W7p8qH9CzrAxCJFWpxBCxIPo3
         NB/A==
X-Gm-Message-State: AOAM530rl22PAG9RsmyRZHTjim2MP2obFgIBft6dURMYQ/3DampyyqP/
	FxQyBG/PBv0OvGh0tJWiBwNmBRNJnO3n7A==
X-Google-Smtp-Source: 
 ABdhPJw8uHkg5cGF0qfiUZzwM7FwaMEwceFulxA5xFtKT6iXF8nlEiVYb6eWN7w35YOhb6aSBQjjLQ==
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr12474438ljb.145.1635085305609;
        Sun, 24 Oct 2021 07:21:45 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 w6sm1347409lfk.242.2021.10.24.07.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 07:21:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] leptonica: update to 1.82.0
Date: Sun, 24 Oct 2021 16:20:05 +0200
Message-Id: <20211024142005.1889342-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Oct 2021 14:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93554

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../leptonica/{leptonica_1.80.0.bb => leptonica_1.82.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.80.0.bb => leptonica_1.82.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb
index a861bba5b..c0a2b45a4 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=809b282cea2df68975fbe0ffe02
 UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[md5sum] = "d640d684234442a84c9e8902f0b3ff36"
-SRC_URI[sha256sum] = "ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4"
+SRC_URI[sha256sum] = "155302ee914668c27b6fe3ca9ff2da63b245f6d62f3061c8f27563774b8ae2d6"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.25.1


