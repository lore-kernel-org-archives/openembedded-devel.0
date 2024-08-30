Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D025FCA100C
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 18:31:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1573.1725042668882923873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 11:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgivupDR;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3c098792bso1619332a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725042668; x=1725647468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IshP+OkGEeWZPWpC6sTjw7nl3vcGBkZKRsT/dgW1RCo=;
        b=NgivupDRy0MJQp1LghQHl/u4SN98g3dTK3xzrZh/6BdE6BbhGNSugVbfTQWUkoSwRs
         goQAUnXfkdi1dQWh1Tf91BoDnCDa2jfDCv6dg5Gw9hct5pU8GWkaStvShuC/oHDX7lID
         HhbSvasuIhrgRvk2zFF9b7/oN2mZchpogiyv/Htvx8NXoX1toofoJXDXkY1SOnmtZF6s
         tG7I7hSbKv98rZICmDzfac5NZoSC1iuzowGy4nhwmt2EVpvWK/NoIXmNZqG8dWwyrTsM
         0hyXerfQrL6ho7rEi0n0L8YtihsKRPBl2gdtA6x5zd1ogg50Jv4aRuSxjmKdNDsDkyVr
         2V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725042668; x=1725647468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IshP+OkGEeWZPWpC6sTjw7nl3vcGBkZKRsT/dgW1RCo=;
        b=YHGuKRl6yPeNknqQsnKY1M16hkf3u1kxFjFp70x3xs0kjiw65C6VI6NYoEYCXfvX0z
         w3H4o4Di8GXyXtqJU0JVn9KJV8Sl1nV2NYbPIoQydHc5aClb/19gAyLdLr9WMYOMTweA
         Aii8/W28Lwy98Zag1kxSaJvVOywedfse9p2VartEvwhpEWkBg+7Md1za+F+LO4iL172T
         U66fGPBExkzdhT8SCf2Qq2hd4P7rZLJVxZu6cSs9JirKMahO1EGrCn7rbiTNi96nZe0I
         GKpTUqasKQGfA46ZAVdrg7siz+TN+PQTUHO4/j2vKF9CD/NkmVA+4ghRl3QvIkYruKau
         blow==
X-Gm-Message-State: AOJu0Yw1myRI5Nu62+LZ9K/umre0ZrrU1XqT2uocZ+/2UV3L9pH2lC39
	dhHv9ITVD0G+L9FZVoPDnvsDc7I1UiLW76frOqTWfQdGIGtlp9N/VfJ3zA==
X-Google-Smtp-Source: AGHT+IG79MtkHJLM4/xosT7CybtAG10X9q22Pl2rYd3qnoH81VJbTZ7sGGNQyuXOEPC02kSZjesJNQ==
X-Received: by 2002:a17:90b:180f:b0:2d3:c65c:eb91 with SMTP id 98e67ed59e1d1-2d856391fa8mr7805794a91.32.1725042667417;
        Fri, 30 Aug 2024 11:31:07 -0700 (PDT)
Received: from L-18010.kpit.com ([49.36.33.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e801bsm6664967a91.15.2024.08.30.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 11:31:06 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [oe][meta-oe][scarthgap][PATCH] python3-flatbuffers: provide nativesdk support
Date: Sat, 31 Aug 2024 00:00:54 +0530
Message-Id: <20240830183054.2827576-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 18:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112058

nativesdk support is needed in some of the projects for codegeneration

Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
index 5d3c73fd9..1fab01358 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
@@ -12,4 +12,4 @@ RDEPENDS:${PN} = "flatbuffers"
 
 inherit setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


