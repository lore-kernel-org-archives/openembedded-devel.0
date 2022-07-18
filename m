Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979EBC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.25664.1658142451858421737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k4swKs9F;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ez10so20473707ejc.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b6Z/Vwso2M58dluJelHuuBuW3KtzLiVY4pN2B+LGhcI=;
        b=k4swKs9FRCgccxDaIriI4B9qMi6j2MLrQeVLBV/0ue8i/psdI58+mseucj0aaJ+b/R
         o4fYYDZw3TdPx3AO0t/9s7smW+U3pg4EVEeuuzzuV3b2qMdYBTsjdQjNeqsY4bp32z8t
         MVODhF4yOr6NVl2JIjb2P/GcljF5J+vBSQ1D5jkUkmpfBgi3eWEwUeypV2SilYoKocCT
         qL3V6TuUpKmgF82oo5dcUQZrOcB0Lxq1kgtCCkdCYxLt9T1xdJyqBfyfMsJNbWxSNsBv
         q6BYgHIsMBm/4eye8CiRKgW+z6/LVFk4hO+tuIH+NjH6by1im6Z33p4xO7DdPkYftqvq
         91Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b6Z/Vwso2M58dluJelHuuBuW3KtzLiVY4pN2B+LGhcI=;
        b=PqrR5u3xcWqVoFalyWMl9GJef/ALksa8Ao3UpYi/bCwSx+SFMEIbAaEux1ipemtD7E
         TgYDsQTPDMhdutJU/yST3xWbTfYejL0guJKhNJpmzutYbc6+pmSusYaaR0s0BPhNUY9y
         m0HAB74apaA5eAUD9TIOSh/5LBhJEB0jCEummSM6TK8owiyB0jajvsj8iRlBfXHrkjWd
         18N34pdVsu0Pjp6VzE+dPCblDGxuBy4hfX/XHp4MU+WDC1pTp46aIWxF/r201SXmJqTF
         9TNyJbApGozW5uo+HXduR93pN+3I/N6seyyD3zyYsZB3S1S6W6w+QLTb+tttJl+Z+Vcd
         JzUA==
X-Gm-Message-State: AJIora9dcYyZTd5ySnqmS3htkVm2YdKpKfFe5zRRh8/VDmvFHgnwtVao
	kVr+favh3nrgaVJ24cMnrTuT0tSaqz8=
X-Google-Smtp-Source: 
 AGRyM1t6XAf+1/zmPJ8wk/puPNQdzMHsiZJHOvJrft6d3dh8+mMvFHpxCrjd89QlxhQf4xzgkA+F/A==
X-Received: by 2002:a17:907:6e13:b0:72b:509e:bd6b with SMTP id
 sd19-20020a1709076e1300b0072b509ebd6bmr25292536ejc.202.1658142450095;
        Mon, 18 Jul 2022 04:07:30 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:29 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][kirkstone][PATCH] openjpeg: ignore CVE-2015-1239
Date: Mon, 18 Jul 2022 13:07:07 +0200
Message-Id: <20220718110710.303475-3-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718110710.303475-1-davide.gardenal@huawei.com>
References: <20220718110710.303475-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 11:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97871

This CVE is patched in our version of openjpeg. The NVD database doesn't
include a version range this is why it's still reported.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index f248619ec..42d2b4efb 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -15,6 +15,10 @@ SRC_URI = " \
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2015-1239 \
+"
+
 inherit cmake
 
 # for multilib
-- 
2.34.1


