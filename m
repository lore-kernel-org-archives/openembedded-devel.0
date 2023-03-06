Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EB1C6FA99
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 05:49:12 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.27215.1678081750816252314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 21:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oFkslPB/;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id x11so4513345pln.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 21:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678081750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MJ6qFJ9PaKhqb8/UHOM4eieGYlksi2t47+/OJ/H3ik=;
        b=oFkslPB/7q+irtOmKL0J7rGhjw1lKC8NH+b1S/SQAgSgkAsll861DOZc/LCvaiE04U
         Uu4XS0BDB1W4wm5t4FTZ9BO4DdJhEyMqwE/n8B279UMdNx+Y2Ohp/RTI2/3KAQqdag+O
         NPwjkZuLSkqpMtp7Pd5VHLy2jD370Xg/l+2GZbSEBbRPNJ/shtC6yEOlLVAqO4/vy/8K
         DwU9CRkbGV7lUHYc8dYc0bfnhQ+IYgl00/2r0EmI4t7H+JaPFGjiRCD3Kh7yLV4gFOYu
         SLbmbT4WJQgeQVct6oVPG1FJ+P55B5oz1uMbLrzOGrM7SIyIvtjSfDW5ECfNsHVPNyts
         A0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678081750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MJ6qFJ9PaKhqb8/UHOM4eieGYlksi2t47+/OJ/H3ik=;
        b=A5glXv2r9ObzoKVxp5NIIHzta7te3CLs6HyKwHr1ZBS7AdiYg5H4c3n9NKU2W4FdO0
         u1QsnFlWT/l2gTrlO0fKJTF1JMLaRxlJjH5m2anKNBB+nyy2aNsFAMyrIMSyZsMkifRi
         ozB8m095NVsLrxPwgNmsVKlq807Ws2+Naj0TGq0bGzkEav14s01QbcL9q3iDBnvb0fTw
         I1vZjInwlq5U5UrTDhjCoJdDF9q7l/UqBl6vLMLNmoNXL/dpTRgOyY+xc/LjDZuYCeVy
         zLXTQxArGmnRMRGaD88nYHoBt2ZYp7AMG1aPRJk+8L/UDYn9HE6ce+oBdJBK8VPvpjuR
         xfBw==
X-Gm-Message-State: AO0yUKVYkkf9891NYJurRF2IQl2SfUl9V4KW0aVTYizJl+X+HBQAXB5v
	TkpTLvUI1GKA1bnApFitIW1eA7pND0s=
X-Google-Smtp-Source: AK7set9KyEIXNl0tFdk3s0Ej1B0S9nhWTxw/6LqRlufBo2OwkiOBXh1rEBtl2z8xZznhfftePHAfNA==
X-Received: by 2002:a17:902:ab8e:b0:19d:1a9c:34dd with SMTP id f14-20020a170902ab8e00b0019d1a9c34ddmr8425168plr.17.1678081750015;
        Sun, 05 Mar 2023 21:49:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::c80d])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709029a4700b00186a2dd3ffdsm5673753plv.15.2023.03.05.21.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 21:49:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] redis: Upgrade 7.x to 7.0.9
Date: Sun,  5 Mar 2023 21:49:06 -0800
Message-Id: <20230306054906.3334993-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306054906.3334993-1-raj.khem@gmail.com>
References: <20230306054906.3334993-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 05:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101392

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/redis/{redis_7.0.8.bb => redis_7.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.8.bb => redis_7.0.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.8.bb b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.8.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.9.bb
index fe1db9f986..423bc21998 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "06a339e491306783dcf55b97f15a5dbcbdc01ccbde6dc23027c475cab735e914"
+SRC_URI[sha256sum] = "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.39.2


