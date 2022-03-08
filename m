Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089AFC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:02:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.9898.1646755334366074287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V5fE1sxt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so2583800pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8togOX7WvcIbAc3eNcRkHNDfFGNGXFp7BrnK9LNjNeI=;
        b=V5fE1sxtHhHDA03JpoEOs36s9Rl4UGzQsAa5kvyiYXBFQ/ekMrL0wnqzDoOf3uhVRZ
         bTm5uk1LXh1kfP9Guba9jjh7GvGoP1gbE48F1UAPY1MesDPmJvMOVoFRFT1nLu3E81R5
         eUZcy29tJZjs9s9d57sMmJcWaVVbP1k/4BhXT8zySQ8+zMLhSBWQRh7cp19Ltd+EtsEf
         e1nnSd3XTRFE1aF4bnRKd2ah7YCxxd9AnDGivnxm4134gIVLU23YEldC1LvKtv9VFHIV
         nkAMlj7f9bxXiYM2B6mybxQxH8l/w6rgnr97rNyBYV6+MT1+wuXASxg1POb86+fBcbFc
         bzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8togOX7WvcIbAc3eNcRkHNDfFGNGXFp7BrnK9LNjNeI=;
        b=7uKEMqpdjj3cSYzU+jfWkVQztDGAdyTFQdLlZlLsTYJJdm1kiQ1HHjuLHPFJqIyBPx
         TzAaXNDrS1dew0OELiaChUZs5ffsjRaWLBqsUHl6mvmVSsO7LADlCdV7IXfLB6e/KHtJ
         UF/PQqIq15Vs7Ad9icvfklUfEOKUMkcYBl02EyGdb/ygQB9oqQzoiGAeQWuK7ltjo+Qe
         m2NDUj/7HA2v+61k5IuNhS9+kIAQfp4OHuHqkOLlpIDecBHuiA3kwATIjv5MtqTWfiVT
         C5Bh1Xs08r6DbGCPL15qTPs50q7V3z2NsbIvfeO19vDdMIJP0VBXY8fmZjZ05ejsf70K
         RhsA==
X-Gm-Message-State: AOAM533NVBKDxpdLV3vFklyvMX3CxBCXct/HkmpGoLFOTEzqPuBrlGmv
	d50Y87DwXDSLBhnrJgIdtVZ31b4GEUP8nA==
X-Google-Smtp-Source: 
 ABdhPJzHUxvWf/moEDDjv4RU1XueWG9My2v6J/xOMLOegODQfzlYfu8jCn4FZiwIPJ6nY4ZtoMJGAQ==
X-Received: by 2002:a17:902:e945:b0:151:e7b0:4e4d with SMTP id
 b5-20020a170902e94500b00151e7b04e4dmr11850416pll.168.1646755333600;
        Tue, 08 Mar 2022 08:02:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm3533737pjf.13.2022.03.08.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:02:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] libsdl2-ttf: Change depenendency from
 virtual/libgl to virtual/egl
Date: Tue,  8 Mar 2022 08:02:09 -0800
Message-Id: <20220308160209.2585680-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308160209.2585680-1-raj.khem@gmail.com>
References: <20220308160209.2585680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 16:02:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95885

Fixes build on graphics drivers not providing GL implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
index 513b411448..0951d721ba 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
-DEPENDS = "virtual/libsdl2 freetype virtual/libgl"
+DEPENDS = "virtual/libsdl2 freetype virtual/egl"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e98cfd01ca78f683e9d035795810ce87"
 
-- 
2.35.1


