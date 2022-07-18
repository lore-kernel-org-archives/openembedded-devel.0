Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98254CCA481
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.25820.1658142460212197569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ENEoviIL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id l23so20545082ejr.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UW3TeQem5g3ZE7MVcDlODbAwtM0+MWSosj+BkHhjycU=;
        b=ENEoviILWaKzydyUJqpWgXusyg08ZxrQ6yAHTHwc5tmZ0zgt/5qbehaI/iS8L47oY8
         b7+7KSZXuLWv7w5xMr1Pm/LYqc6OvFbDye4e00bpmVzPELkHkkQ+jV/X7tp8VRXpOfZW
         RsJb/J1/r8kYOjq/qpzmxwvUoCELwoVtYa8FUlgl1CNE5xrQtMixjjdhYTt7FHiPhA5r
         NG7RFNCtRc2up3gprjwYo6bEMtix3nMz7pAYPPKpNUs+HosyEIYA35sFdZWd13dp9iYJ
         W4Q1TCaADX64UTrxUuoTA2K0KdkRUFZO/uWikklVUfEtYsf1152P/KOg2lyEGuO/bUbJ
         c1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UW3TeQem5g3ZE7MVcDlODbAwtM0+MWSosj+BkHhjycU=;
        b=cU8+Kv8ulnciDTTvuHGEIBFaoxOqopP8KyvpsBskzT6AWFS0Qfcpc0BfNLMOfV1a3V
         TapNNF5TYX9Zj8vRa+51B87rJ+MQ8HEwuopLaiMcQBHYLAVi7kmGMuWB8ztxh1YhXTfb
         yfERVqQ/WiD6fhqlnfJE95az0E9CFerEkxz90lN0W/BwyIm13u1fcMhI7BROOLdKGN/8
         ZkL0ApGh/gWRcR6Cld99VsIrOiJ09gfJSZFO2AFt+0qNyc5ZExKJ4dcnfCCtL21JG6/G
         y3qRUfGBArBnUpS0m+02N+vu2aI9kemyO+XrvasiJ8nGyEQEDYUDbFbtFDfHMFHM9zjN
         nsmA==
X-Gm-Message-State: AJIora9Xu4OS8HAlLqtfSCFfmhmimkOsPyiImlv0IfxjGS6tesTa1Gzd
	Kp4/zGGzJ46Brz79G7K3iNKUQjI1GR4=
X-Google-Smtp-Source: 
 AGRyM1uQU5kvlTvijae5zgtEfkAGhKBqTngwR1e0KRyLxjjs/T2Ng/7Z28140ONbtLNgrO7tA2uOwg==
X-Received: by 2002:a17:906:8a79:b0:72b:871a:57b7 with SMTP id
 hy25-20020a1709068a7900b0072b871a57b7mr24076833ejc.602.1658142458570;
        Mon, 18 Jul 2022 04:07:38 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:38 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] postgresql: ignore unrelated CVE
Date: Mon, 18 Jul 2022 13:07:10 +0200
Message-Id: <20220718110710.303475-6-davide.gardenal@huawei.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97874

CVE-2017-8806 doesn't apply to out configuration of postgresql so we
can safely ignore it.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index 01a6ee635..64e83b2cd 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -11,3 +11,7 @@ SRC_URI += "\
 "
 
 SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
+
+CVE_CHECK_IGNORE += "\
+   CVE-2017-8806 \
+"
-- 
2.34.1


