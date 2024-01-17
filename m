Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55921C47DB3
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.1321.1705454005610883401
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iuJjCVb0;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff4b02a187so16234927b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454004; x=1706058804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHucFTkyYKio8M6E+RlZpH+M9hlIHS82gCrKSOW0t9E=;
        b=iuJjCVb0X0Yt5UAzvQaN20RAjknHbM2PwGt4pqodnkqhOJyx7I4709auR6i6l1Q4HW
         iTkQby9ZXdHKxNFYlcWVqt9qO8ru/mOed4cvzQHC6sDUnmYpeFn3d0eaO39fN9IhzIQl
         T5iXeiB7F3ulX0yzFPMiR2xooe/PT3KfB9gJjaaTSPdGCQqP5p6cpF0NlLahLRYTa2Bl
         SAuIipicxwjsIGF5dUtyqXOocv96G2LoilG59oLWiF9NjxiYqHkbXpxYxhKgshwAeoYE
         gMJnpDzZjxBFok4SjglSnl03VOMZ6LZl2UZwD4rD6Xu0Di6QOryTj7ITjCu0xPt4CEsT
         7tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454004; x=1706058804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHucFTkyYKio8M6E+RlZpH+M9hlIHS82gCrKSOW0t9E=;
        b=sz6Gw04q/CXiU07RtpVvH7kVHUPkS3KVCsk3sWUIgzHVV9maoA1FzZqbLwiKtZr8SE
         niexk0Or0n2ydNYSWujz7AYueTlPRWRPTpeObFll8K0yCWpWiktzhQo8wbuBvvtU+9yP
         Z3Ao0yAoKqtpEdB33OUhKAvc15J0XYEbyzTwLyzciaalwv9KfIRXqUuv5Gx7LUaKqF9G
         ioQjze/9IiTezXawH8C84+fptTXgpvfp6ide7/tJifaf+nCZfC+IdvKuORPhSXD0KD0m
         nDnXf20kzk9LsG2NfRV6is9rq/HeF1Qp/FSNkq67kWRfYRul7EqIxNoRBgvmyrA8T/ms
         pMUg==
X-Gm-Message-State: AOJu0YwJ2sr3A31trEDWMNYxq1drsHpstMIT8BeP2/fnOS2cHWnbsTSJ
	zfxj3wlbsvgOTxOGEdTG1RZma3UZyY/Viw==
X-Google-Smtp-Source: AGHT+IG5uF7Pipc0cm+XJwtx3loLAc++mAbW+sGdibiMrSu+hSTZ/DkhkPfipl0P9O/DK2fQtJ8OhQ==
X-Received: by 2002:a81:4f02:0:b0:5fc:7fc4:c46c with SMTP id d2-20020a814f02000000b005fc7fc4c46cmr4342468ywb.9.1705454003630;
        Tue, 16 Jan 2024 17:13:23 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 04/11] webkitgtk3: upgrade 2.42.0 -> 2.42.1
Date: Tue, 16 Jan 2024 20:13:13 -0500
Message-Id: <20240117011320.1856392-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108315

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 32bae13bb8b8edf6b4af12ee7057493101c5fb14)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.42.0.bb => webkitgtk3_2.42.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.0.bb => webkitgtk3_2.42.1.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
index f682cd9f03..9aabfb123c 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f73070813ad64ed1b"
+SRC_URI[sha256sum] = "6f41fac9989d3ee51c08c48de1d439cdeddecbc757e34b6180987d99b16d2499"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


