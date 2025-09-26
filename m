Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD55CCA470
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.18549.1758896372824288629
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GE4ctEoy;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so3944966a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896371; x=1759501171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3Dc8uj4Dw/PHYXfXk6jRJ0GJ7WRPcwuBljStv0YtwU=;
        b=GE4ctEoyVN35CxTChzocvYBTq0+t3HomQ6Dcipgoa9hi5NPPs55TcURGTkMbTiIvQg
         zrcapSWBhShnkGnsixFvSqhQ694xrh7pLM380NdbLDD8vDCCJ7NANREswGSBIG9cZ11E
         AFSWqU+ZvkHqcrDpzgCQRVyK58KdwO0PemAx1N+jgeez86v560CCnEYdQE/WdZNdo893
         S8MGBkJnuTz5mEK18slEwzlVYnWRon5PayWK2nhDykXyof1gwjhK8ODpTdpFeDOkTNLm
         gmGKTSnSpK5hu4TabM5HZPM4SL9saBCl7ZTOvnKXsWif1pQhO/1TLPHvC5sC6np/RKRb
         f4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896371; x=1759501171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3Dc8uj4Dw/PHYXfXk6jRJ0GJ7WRPcwuBljStv0YtwU=;
        b=S/XbXfaEEZilgqoNe074oZO5HSHISjAnHiQ1n2/lU+Pb0lg5V9sAfNWzH+t3Ongx+z
         xaoxRPOPC/iDrB1eBGXSBJRvo1dJLlrXaPsFdbzM4Id5/5zcxJ+ME2UNa+HyxXeEI6T/
         oFwbMZfbVAYeMHJzwJYS6gqRSN3O8ZRC+mzZm7MyPm16rVtPLIPN9wN5YgVq2DayLzYQ
         YgABFmvp3qQtRBdIKxgpLQ4OkR8WNn9JA+JXPdUyFjd1AiiozRbPnyjNPINSxPTjsMga
         2meT+v1wJS5cRXzMQrkX73xnE1qHJYQgroF9MvehnmiG2ga285fht8V8a6lNaV+Ja9BZ
         51+w==
X-Gm-Message-State: AOJu0YwS/8iNQGaCX5QJS/2b759qwI01n/Vd4A/h3ZFP4Vosn94p52G9
	o9l8x2EgN6GQNFrt02vtUSQCuWW66EqUnEU9XtBmVmqlZcdszgpTRXHbO/i2og==
X-Gm-Gg: ASbGnctD/j34L7YM+mS060T+j6bXEBZoBPNMwO2ZMLeG0fAeXRdwXUoiNGf9jqDmKfm
	Fo9gl2iNtQeEJSd0afLqp+HOhSpaPDN7foec7sfbt9f+vRk0iqZOiEJjO/ZlsO1YfAppfgChZeG
	tmQsoqeSzjb0wR290Gh6BCIl2IowWVd1bsI0V6bC33ZGhBxSpsR5iIBwP5BxEvTg+iGsBKGRVYD
	z3YcSFpKGqIVrkcb9r6F1pqtbFRDJXutVuAVQC4/RsAQVkyBelW71ur43Zjzvtxq7whmkksFEB9
	TsBz7s9C31zAgz5nnLzcS2slHFm9iyQ5Ye4qZ8k1b6BUAC2Js0n1NVwYzyoiij4hknfyeLCKxoE
	ibVz57X7LhSaKcdTV2E57
X-Google-Smtp-Source: AGHT+IHP8pnJE/6IDWHN0dPkgQnQAxOLey9PRj5oMuQf5nIU2aVng1pUwowGZBoPyPkqZg0MSGSPyA==
X-Received: by 2002:a05:6402:14c5:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-6349f9cbbfdmr5196221a12.8.1758896370970;
        Fri, 26 Sep 2025 07:19:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 10/20] libnftnl: upgrade 1.2.3 -> 1.2.4
Date: Fri, 26 Sep 2025 16:19:09 +0200
Message-ID: <20250926141919.2010846-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119919

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9afefefac5dacd113bc3c21c055fd9aa3e802d00)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libnftnl/{libnftnl_1.2.3.bb => libnftnl_1.2.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.3.bb => libnftnl_1.2.4.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
index ab55767fee..ede35e7624 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "817c8b66f1ea8c223b7513d4cd7bff525d8a0a9f"
+SRCREV = "141cc997755dd91e94dd64c5497f2a23bd9a894c"
 
 S = "${WORKDIR}/git"
 

