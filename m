Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D1DEE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 16:19:15 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.357.1692721153022020021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 09:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jLQ4yv9P;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64b8e1c739aso25441286d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692721152; x=1693325952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fz6p+wKRMn2hXMDBQuDnBBvB4xtnsC0cbR+Zvq3gdk=;
        b=jLQ4yv9PuB8mN9vLCoP3NF5ahhQBZdjpu5GgtsAp2ABFlFaOmbqJ8/bZJ4MqhKKFiM
         R2ROmFi6+Jt/2vciXYq+1x6aBHfSS8pMY5S0U9gDP6fPch8McQrFLCnu+4TeD35HVHfN
         z1WkWKSy8WbGJsrJdGeiDcLB5pYoj0ZC/dVepgdzERvUZ2zWbTiK5hgP8BYDEwtD70yU
         E9mHe87YQYfS2D0GxCWm09RZsR6pcjUPj8D1BhaUZ10RBIbrDTmHn15L+z+XeGo2sfwb
         oSNyDnTllyUB/E9G7Cc9sGNFyW1uLlBXjhUywSdL3knD+gcDQTvLYSpMNjA8ff9yrtQq
         mVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721152; x=1693325952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fz6p+wKRMn2hXMDBQuDnBBvB4xtnsC0cbR+Zvq3gdk=;
        b=SopUEqXbSayjINQUqmahqGyG4t705H6wrx/TnKC6F+TFWxh3dXqgTLZUQeLzKvrRLx
         48464Ll0ndAMMX/BQ8EsLTQhTQ0XlFOhlNqP9TPtyn8Lqc5ggo/QHhqnTlE0zIYEDXGy
         Uw8q/BJAbqx3wUBq5Be239qypNfkZwnmW9YLv8RsckDnBuynnQ2MVGcLL0lek6p3NvYc
         OvA+4szpFICJf/Mmh7/GgHDMy2rAfoqJS+2jCMS0oIhhM8p2yxEKyPHqriHX9Zc2EtTs
         h91AUFcBJr/W53FqjIj9OlaqTnM+J1Di557Fzwy6SDEWquHYqCucNfHweE/ExcBDo88A
         0qbg==
X-Gm-Message-State: AOJu0Yx8xQ4TG0l1/knYCeGOttJHt6q1BPD0fFEH1PlHMtjVEeO94LA3
	hBaJAgyzrJfyxdJGoBqafnVR/t0oVj6RkmFueog=
X-Google-Smtp-Source: AGHT+IHkczoX7TFFcxxzFkUnYanhUnLBPFFAcMIEGt7SZogWN/4fMMX0t5UhVRxh9SH3PevH5UTKuQ==
X-Received: by 2002:a0c:f5c7:0:b0:64f:4041:3d67 with SMTP id q7-20020a0cf5c7000000b0064f40413d67mr6720192qvm.15.1692721151825;
        Tue, 22 Aug 2023 09:19:11 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j2-20020a37c242000000b00763b94432ebsm1850814qkm.18.2023.08.22.09.19.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 09:19:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-kivy: fix filename
Date: Tue, 22 Aug 2023 12:19:10 -0400
Message-ID: <20230822161910.796713-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 16:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104519

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-kivy_2.1.0..bb => python3-kivy_2.1.0.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0..bb => python3-kivy_2.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.1.0.bb
-- 
2.41.0


