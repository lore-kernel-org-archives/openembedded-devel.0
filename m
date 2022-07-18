Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EC9C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:41 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.25665.1658142458490151149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SGUW2sBR;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id tk8so9165560ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rt5xaHJmZ41bed9X5Y9krjkhK0sVEJQ0ZNOJVsMkxv8=;
        b=SGUW2sBRdoSG1Sze0YjDCqQvlL7CmiG94Iqfo6i1kDqad2/rnQaE9MtPx4OMcGs5+A
         d9w4I2MxHIibRTmkY0HJyTrULi+xDCt5Zian9cKULLNDLkAauv5UwK2pr/XVga7UxHlE
         EHsvX5LqSgchTg71IOfQVUN7IRzO2+WxuogsiqUJ2hdu7TWg4LmoBtBIWDquJe0zD+tn
         dOrMSD+lVEE3nmWlvgTJoRNhZnFPL7P9msQL1yO3qPOGxU5wre3BKzPhjkskYfRf/5l3
         FRU45l7gK4wwiqWQVYut//BvyLWjixr+7/WqWmnQyTR4tb3EKVouho41cp1B0zBcqXqR
         +oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rt5xaHJmZ41bed9X5Y9krjkhK0sVEJQ0ZNOJVsMkxv8=;
        b=2aeXp0g++N5jBKUI3AByKVDG1kkRRuTrpw08cefUvP5FjZ/tEr6XxykH3tT98c9Xwd
         +fdkbk/3aLffutxhYoHqEGHFgYKQoEmmCJJyNAIrod8srK7b2uOtx005mcTdJggwdclw
         IWqwvHfulcSz0+RjhNsUWbgkIY2XFteGhkPicmwu1wzboXX8abgM+tUdyVelTP1w9amT
         hQaY5Ud88suzgETRt5/1zYigqcudzjAH8jO6wb3A7xnjU4awoxK2rnwO2cLFkUjBuvcB
         uQghZ0V1NGmvHLdhoRT90zJlltPNq3ON0Rku4ghvhEZON1CbgRhuD08p5twfp2sVAWb3
         2piQ==
X-Gm-Message-State: AJIora/XOKTHwgCJUiAdp19eWuvd/roIatXfkmF4E4Wbc4MxOUyLWyv3
	M/SyEGGSK1exhO0xDNEBGA/ssJVVSy0=
X-Google-Smtp-Source: 
 AGRyM1vXaRMJVrn31LZhNnqVxUStb6WcuUGhKUXr7q1WXrWl1wBGlnhZ0xsbY5c6o9wZIJ8HU1GbrQ==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr25169385ejw.282.1658142456599;
        Mon, 18 Jul 2022 04:07:36 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:36 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] php: ignore patched CVEs
Date: Mon, 18 Jul 2022 13:07:09 +0200
Message-Id: <20220718110710.303475-5-davide.gardenal@huawei.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97873

CVE-2007-2728, CVE-2007-3205 and CVE-2007-4596 are patched in our
version of php but they don't have a vulnerable version range in the
NVD database, that's why they need to be ignored.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-devtools/php/php_8.1.7.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.7.bb b/meta-oe/recipes-devtools/php/php_8.1.7.bb
index 043f3a81b..963ba6f27 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.7.bb
@@ -35,6 +35,12 @@ SRC_URI:append:class-target = " \
 S = "${WORKDIR}/php-${PV}"
 SRC_URI[sha256sum] = "b816753eb005511e695d90945c27093c3236cc73db1262656d9fadd73ead7e9d"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2007-2728 \
+    CVE-2007-3205 \
+    CVE-2007-4596 \
+"
+
 inherit autotools pkgconfig python3native gettext
 
 # phpize is not scanned for absolute paths by default (but php-config is).
-- 
2.34.1


