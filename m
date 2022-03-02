Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFA0C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:22:32 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.2757.1646184151812512717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qD9jWOLA;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id e13so247677plh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwibLU6hnJOQvr9baK4KtBDl4c5vRdVtWhjVGsXCOWE=;
        b=qD9jWOLAbboB22srjVOAujPJA0EINoDXF97DipKmrNXOae6+sumY71xvga0vdNzNcn
         g9kv1G9q2CepIdIoVHOGj0jS3HCMeRu/WG3dKwE5DgvXZvcxWD2wEr8JX6lJ41o7kbVs
         hwzQs9gG38UBpJEM0mlTFe4htOLk5scSMSKLw+sOCJ6H5E/8kWwkzWSS7H4QgPTMeAcy
         FHY8vb7tzajvq4tlCwK82RoW0MkS+kzV1JS3wVz45cHkpXev2sG7BG7OlRw9BPtIBgnw
         43pgfoxLYiq+1NTptaVYxDgnh6Lguvqaz+ecHPiKCgoRkXukICKlAF9iWdlE/JMpr9+C
         kmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwibLU6hnJOQvr9baK4KtBDl4c5vRdVtWhjVGsXCOWE=;
        b=LalR3ObKFs4yNLURatJO3Hyt1K70KKrwHjv6eRN4OxGONieyP4vaWkY8YbtDkBLCIX
         4NEGzLqrjVgyWYrC3HGdKs/FiNHP4xTWwXMwpVHkFeiEhJ+RaHI5gfmlqvdAgg+dBD6b
         4obej0XOCaUAEc/0FnZ5LtLxPyG57OrT8+4sgKeR6XxIbo+IAT6agB0nHXqGjsdO00vR
         UyEVtduBdn1P3LWQIbZEhsV4kQAplazcqJhmet8N9LxliiVcKwe182M83quRnn2nEkf7
         cHd9FI5JyJjXG4fk/N8uE9PmUXdvMQ2Wo6sP43ro9EbtcRVq/kAMa3b40vvciWz1AxtC
         yt3g==
X-Gm-Message-State: AOAM532PWuRYD/2/KOE7QZB+HcQH3WCEPjj0ZXxhkp6V6MhprDw1u4TK
	FeFSrdnSlKTHY9tmmiw2Q6NjCWQxvXhilw==
X-Google-Smtp-Source: 
 ABdhPJwj7UMBp4FEgmSIQJ2kTXW+2dCKufE0U9mQKGF1ePICoD5hgHsRRMnBS5j+bj35Alqv/+yhcQ==
X-Received: by 2002:a17:903:2308:b0:151:8b3a:e43e with SMTP id
 d8-20020a170903230800b001518b3ae43emr3972715plh.30.1646184151088;
        Tue, 01 Mar 2022 17:22:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a056a00218c00b004c3a2450acasm19681487pfi.147.2022.03.01.17.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 17:22:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-setuptools-rust-native: Define
 PIP_INSTALL_PACKAGE
Date: Tue,  1 Mar 2022 17:22:26 -0800
Message-Id: <20220302012228.2337827-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302012228.2337827-1-raj.khem@gmail.com>
References: <20220302012228.2337827-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95673

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
index 1afb3f0e0f..73dcbb26e6 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -19,7 +19,7 @@ inherit cargo pypi setuptools3 native
 
 # For some reason the wheel is built in ${S} not ${B}
 PIP_INSTALL_DIST_PATH = "${S}/dist"
-
+PIP_INSTALL_PACKAGE = "setuptools_rust"
 
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
-- 
2.35.1


