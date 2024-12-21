Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1DBE7718F
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:12 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15946.1734821885859550805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZxHlV5ny;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa66ead88b3so575118766b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821884; x=1735426684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ldWNMNnkYF7Rl1VT5T04eI7EW9vJmp3RKtytIMYXLA=;
        b=ZxHlV5nyMllNjptod+at7Z8G/3MPrep5LaZ17ahzAF0fD0IMWgwtUfYS5GlA0y1eHY
         LO+GyQzcYEabpobMDNB2o53VKfEVNUNx2ictJmZ7VMSB2IhmNHOxZpN4SrTDykuJCr1r
         vbGMvYy+Y8pEI+MhpdZCV3ImTz6mJnmuFMpW8/G6ZYZH7TAGhab1L2jbm5wWcWs1It0e
         IvoPNubWJXOjAGOyQ8mb5atmpSZ4vI7VSTblaAVmAQMvM9Y2tegL8wI72KcyX20T+oWe
         R+u5vPHVpvm8lI4PPMTW978rtaKkxKSn7Xy8JShYQCEdGGZmQF6+xhTgnd2h8neddxE0
         IJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821884; x=1735426684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ldWNMNnkYF7Rl1VT5T04eI7EW9vJmp3RKtytIMYXLA=;
        b=tHBB7BI5DeNXZBffJjx8gKIaXNbxCFplqZTPzgt1vjtyO6UC7u9yNfoV7RyI9bE3vZ
         Nqj7ZpeGoZDS2WcjAeQXgabM+/bolXaf82kny8NceoM8cTBk1t3FFNB3U5MDdE63K1pd
         3aeV7J6LJgyCIGHJT2YNDHQ/dPiPsKU+w5cYOGITh8I0lKB8N/Wg+oC5+Fvso+YGuj9y
         krYw08paXutPcMLLkYvR0ouQndYE8UQrq+ne4Iw799/CI1ObY0XZz7cSxVAUoFLutoZu
         mLQbeVg9A/UUMU2rXXVHiYit+f6LMDgcfVaplEoG5de7EmK0xzi7TdJDSk8ivqGcZjcI
         D2Qg==
X-Gm-Message-State: AOJu0YzPy41RlMKVMzlLFvzRltOLfrebnfRxpsRqhROx40yjYI9HHTTZ
	a0NIBWqNJs+VdDs5HwVlgfDcQEowuDqQqvI2ncHD0iYrYTs8ApcmGV9pyPxy
X-Gm-Gg: ASbGnctANA5GC7GgigH8vMuPNIub9Obxp/EsqEUZ010AqQD6EzWjQhP/Ea42x+6diNo
	Nb7JvUQBZIz21cYFmZktdaoSqPHJ/VIoXxLM+sgD8n4JsiWXhwg82gCXdxcxzHW0RjPa1VoLw0W
	hm4+qqIumqbMNC1hrfB2i3V4HnEma8JVSHkWI2mfInOJgNBk/hApxaugCPF7/PI5iyEpexIFRbU
	eecIkwHhXK0ZMktLYO9/advUqKKbWE5ZvbyBZP61knU6IyIhMZPfxbuITH+lKq6f/QLZnPyMEl8
	eulFjZT27QkPAABkF9+LOVYdwWzWahIC+38=
X-Google-Smtp-Source: AGHT+IEQI2HTROO34VqCW6MLoaR2aud1+jHRvvYBdWnR9ofx+bOCYx/YCiuk3Z2eRG5ZponReguM9g==
X-Received: by 2002:a17:907:d08f:b0:aae:9cfe:4448 with SMTP id a640c23a62f3a-aae9cfe46a7mr294744366b.29.1734821883661;
        Sat, 21 Dec 2024 14:58:03 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:58:02 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 6/7] python3-sqlalchemy: upgrade 2.0.35 -> 2.0.36
Date: Sat, 21 Dec 2024 22:57:06 +0000
Message-ID: <20241221225704.2712991-9-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114456

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ython3-sqlalchemy_2.0.35.bb => python3-sqlalchemy_2.0.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.35.bb => python3-sqlalchemy_2.0.36.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb
index 87d76e9e33..058d90bbef 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db237cff59586045ab9f"
+SRC_URI[sha256sum] = "7f2767680b6d2398aea7082e45a774b2b0767b5c8d8ffb9c8b683088ea9b29c5"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


