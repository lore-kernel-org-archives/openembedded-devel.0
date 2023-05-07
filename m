Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E163C7EE31
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.69134.1683477204636856567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ym/8EU8N;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-55a26b46003so54834587b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477203; x=1686069203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOY/fuVSc2D/ykyxxg49hJ5P8EcG7bZbwrMKCVW8kb4=;
        b=Ym/8EU8NNxTvOtVx7ctKVj1bV9rFcTK0tjBeX/Pdm9ELBkTnkMMrScfUXsVaBODcd5
         4kB1PLi3R9M0ItgC07WDfyvrajAwOdOITEZA2+sJtr2Q0Ba258Z4ybkAwk4ksFu9HnA0
         DjCEcXQBLino+asBM4KrAhZmHvGt2KNqAgUsA5VSM9zuQQHpjQInieraG7pXpuymSxZi
         ZgfpYSQ9xN7/w0CBuWuls8G9BJbWfdLPwQAig0juDpPln2Jy/iM2LJc2GtRgHu9YA7b5
         sEbyd4sBtN2od9t0CluoXoTDEmIRNZ9b9nKL+Uz7HaBJ2YKj5lmTqaDUWDcPzNhKlo6x
         tczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477203; x=1686069203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOY/fuVSc2D/ykyxxg49hJ5P8EcG7bZbwrMKCVW8kb4=;
        b=QoO5hczhzUR892NQu2uSvwsGwdnYtjKP+3d0wQEaXydQPpPwHAgVFdE2fuMKgEvTnS
         BEohhhN+XSRYXzzxaxOpGfzfwVajzHb3VIY4/rernn7zQxjU131JyGomRcPEkVOyns93
         bHNDa03s3JgNE9Gym3zrNegrMosAbCL6UT/0brvILX/L43e9AT8UyhbXCJFmaTxfTSLl
         elPKpB/6HImWTJus2vV6xTW5kjhl73zuRFe8ecAicHIgFW3NMtZrQEMotYE/fYXoMG7U
         wcetaFioS7v4Ivbrjl4NanrDc+Y1nJH+zZZeAiIkAdSuHI8KYJkAs3JzwSBvzoG9jTCT
         gTvQ==
X-Gm-Message-State: AC+VfDw39xN2jMVi8EsyLEQXmTNy5g70hvmSyWxsX1FkHv5mI9AiWe96
	iTqrhUdX2frH5CPdVR2eScgzzOfOuwA=
X-Google-Smtp-Source: ACHHUZ7XtubY+v27XKYSknHXbnsvX5vRfVVPMwxhyipRJuliPvHPj+A0Kt963Os1qFF8zAflIMVgfA==
X-Received: by 2002:a81:6c4a:0:b0:559:f7d4:661b with SMTP id h71-20020a816c4a000000b00559f7d4661bmr9087899ywc.14.1683477203624;
        Sun, 07 May 2023 09:33:23 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 16/29] nicstat: Use SOURCEFORGE_MIRROR in SRC_URI
Date: Sun,  7 May 2023 12:32:52 -0400
Message-Id: <20230507163305.3261044-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102346

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 256ea730b030ec18871dada8953cf5f40e6fc4e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index 3875f0f605..bf742fa062 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://nicstat.sourceforge.net"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 
-SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/${BPN}/${BP}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
            "
 SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
-- 
2.25.1


