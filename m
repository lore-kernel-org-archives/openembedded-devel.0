Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB8DC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:45:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.65916.1722012313870068487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MaMwaafG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so17638835e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722012312; x=1722617112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCz5Lt5negpohH0VzzkUEEHIaDdqABbrh58BX/4vqe4=;
        b=MaMwaafGTfmMd9G6bq7A2wLQ61U+wvAgarhzwU/9yjy8GVx6GHRTUdNhmX9uolvgMq
         tMJ3hH2kTuNNC1sY5hW6ziBOA2eCR2D5p/lXSa2ZaXAGBQikXTilFr53+d473+CSMq8+
         eNIfcpDmavmmNKnoL9s6xR68LhXVBbwgZo5oeEX3iugditbjHX+EGZAw9aDyGZMLhxKb
         sZIbDJQL49+Qmn+mAtpzSb+Ytx5DMHohyOAQ21lZMX4uF3yh0dv1cfG4TFE7ZZU5n9kS
         bhn2lRQG08HgQEzCuvQ6ixlVuTq7tGamTDIuS7s4vibh4pHbQ/X+kaBcuIXA+N1csTcq
         mLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722012312; x=1722617112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCz5Lt5negpohH0VzzkUEEHIaDdqABbrh58BX/4vqe4=;
        b=uOi/fmJB4igNIAgxGh/kQRlipyXvIJv3biL6v+gqM+J9I75g7Bnh2+7uRP69gbEfp1
         Ao3S1K55S7OtvuaTt2hcA2Wgd1ZHoRynwyEv5HAfNJ5wOvoNZQpZJraGoTsjepF4lf5C
         eaqRdVB7UMPFoeI33Vscm/Jp+WyNXamihIq876PFg/TOlsB52OgKpj40hAdd5Dx5uNAH
         a6xx7LB0SdQSoqw27j7FnF+D1XaM5J5EmPbKmumrWhlb4+5rKe9QGSwgLtofQzCg9voL
         9F8A4pGcCDKGXQvPL2VoxhXBVu+Cg3kV5Ou0Azk5zUmU9vVjnKI3SfrV8bRaM97Kwx5n
         mK1w==
X-Gm-Message-State: AOJu0YwOJZNTVYru52n5mLcTGE9ISTGOv4i7apKU6ZJvgHkDPZfHA5bn
	NdMfrZ2LP5djY3XI/cvtYpTWkAV5+MF5dcrKZKXS+v+4SIGkRxfs1eRPAQ==
X-Google-Smtp-Source: AGHT+IFDWQeNQhESaihdpOZP+JswvdfhYfvZMO2VKqdCtrjYPVfxf9ZAwfjRI1YrK2/vwTQQEgbDAw==
X-Received: by 2002:a05:600c:46c6:b0:426:525d:ce3d with SMTP id 5b1f17b1804b1-42811e42195mr1126365e9.33.1722012311794;
        Fri, 26 Jul 2024 09:45:11 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42808473208sm68666195e9.42.2024.07.26.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:45:11 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] composefs: the srcrev hash was the release tag
Date: Fri, 26 Jul 2024 17:45:07 +0100
Message-ID: <20240726164507.1731632-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 16:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111444

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/composefs/composefs_1.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
index aaf33b40e..7b934e4ea 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-PV .= "+git${SRCPV}"
 SRCREV = "7623e4dc89f62ada5724d4e41d0a16d2671312f5"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
-- 
2.45.2


