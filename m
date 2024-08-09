Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B935C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:44 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.79757.1723193562358681199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dKLE8qFY;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a728f74c23dso207191466b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193560; x=1723798360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPLbhL9BuG2PxhFwH/L7ymrJeV3PUGoEsy6/V+MA6eo=;
        b=dKLE8qFYPaQfKHq3J8HFexw5jdEkYz2+NlpIFMdyqn9bfiiK4PJ5VSfYgGAHZDHw6N
         Bjgmr+ex5nQZAQXiPzTFMeZn2KVTNVuInxys4yFZy+V79QAs/ET3pBMdl6KaTNNTGkyk
         ADUeGUWzo4vB7crK0umbNDMPsgRvgsXBGbNXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193560; x=1723798360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPLbhL9BuG2PxhFwH/L7ymrJeV3PUGoEsy6/V+MA6eo=;
        b=Bm28F+m9HTKm8PAJrNUOuwJEhZesx2a5ExUIQSBmA83/XqN3yXHJTck9vkTGx2csq9
         9fpJ3QeFbvjcJRT3aSGQkMU854gRmUp/sC2TbEc8TJOLtCNMWBt6bWMXVl8QxHaJogK5
         YgGAoEZhH2eGGqY39QNeJesTcm0DUT+DIfVDwymAhKPaEsocauz1qF+Ls97/FsA5yps0
         JikLyEbwmZpx0i6Ku9tX1NVPOSEe/dK8q3sbRxBwIm9FEkaz6tWzoHs1qvHAoDOhQOCz
         aetfKgfN6l0ByVFmaRWn7LqB8JvOSyVVGyMAHjCaZjxhe7OwXG9Y+iB6dBB8cHEjFC5f
         wITw==
X-Gm-Message-State: AOJu0Yyp9fnS5Yk78VCTVkjg9ulNsT7TDuP0IZstKB51cBv+sRgFnyFz
	uojMsTH6E7y8udXz7DCwM2pVEU+NV5Ee8D4Rn8bWasdFem+mLvJLzqplx7w/J0Pushv0YVgTpvs
	g
X-Google-Smtp-Source: AGHT+IFnFCJreoG34VAY8AyuuirMFwtAPJS8YKVTflcmIr5anq22MhHH7b4D6rbzvZu3tP9JHV+TTA==
X-Received: by 2002:a17:907:7ba0:b0:a7a:c083:8579 with SMTP id a640c23a62f3a-a80aa675c71mr62414966b.62.1723193560444;
        Fri, 09 Aug 2024 01:52:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-sniffio: witch to PEP-517 build backend
Date: Fri,  9 Aug 2024 11:52:32 +0300
Message-Id: <20240809085236.1828180-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809085236.1828180-1-leon.anavi@konsulko.com>
References: <20240809085236.1828180-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111686

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-sniffio-1.3.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb b/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
index 448ac34f5..746e4185d 100644
--- a/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101"
-- 
2.39.2


