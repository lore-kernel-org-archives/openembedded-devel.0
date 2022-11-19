Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E909C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.23277.1668873500241349036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZUumKboz;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id c8so5325480qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBdrAZxaNcIiY/4jUaWYr6xTRl1pLE13KBpd60xPsqo=;
        b=ZUumKbozVjI9tGm/4U+fckULBdKrjHv2OXDTYiNN0MizM4vJPmBLtNMnL/3R5J7UYN
         3b6Siul9fOiQX1preHTfQwnUiCj7AMjQUnbo+Qte/P8SWX6INZGtVru7S9Hk9UUzaM61
         Ni9q9LC5euSe9mpJDyFkq6AA72BDoE7CxFG0KHdmIVPTdwq52PThSe4Nk7z2CTb8L85Z
         i58wN1AX4mkcgR/X7qc8qBLZ4Y73/tLke8YgvOQbPQMFULCfpivYIYUS2BQOYnNObhzn
         vxTomKdl9DwCGWWEe3F5xfE09tDns6eqGkt4AAbwhQ2pZnYoNZjOxFRcwrvrNxXOtWYR
         XAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBdrAZxaNcIiY/4jUaWYr6xTRl1pLE13KBpd60xPsqo=;
        b=xclQp3KXpEPb0f94yChKe7GDzUl1zayjwW27g+58DR16w/KMQ/bp+WVMCw3CjjNwTB
         I5uhv0iX5x5W5tbM6FCO18ghtgF/WpSijU1z/rZ2eyblZLw6kNxYZPwk9Rnvsz+Okisy
         +Cneb+daQ2dmdqXeNIuK8YCcfAIxDkKFp+MphpDlBUZv9MXBTY0PGsCRH3nGOflFRgiJ
         kELw3Gk3SWaWlcbp1JTnJYk6pEVzAgU/w+PamvUwJpEQnSt6cyRu+9BlWInS/txYwBEL
         qvfGsOsxG/by6ygr1clmwwwIqoMBS85XInt7AJqeYFBny7m91WtmceyfNWYHwFaNPQj7
         qpbw==
X-Gm-Message-State: ANoB5pmhXDtcRb4JQtmrn4U9/lIRK4PUHI4QAEh6Ng9IzkiV+t3UbEqw
	AZJphgLwfcjxpK1AaacRV01CgXAKqIR/mg==
X-Google-Smtp-Source: AA0mqf6s9+QEA8N2VX0hiBF7insWVmx7OEiIjEvy2ZYoMjOnSpQyAQ0jNOPTIRIrzHhfYw7bTpvRIw==
X-Received: by 2002:ad4:43c5:0:b0:4c6:a5c3:3a7c with SMTP id o5-20020ad443c5000000b004c6a5c33a7cmr926409qvs.63.1668873522425;
        Sat, 19 Nov 2022 07:58:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 26/35] wolfssl: upgrade 5.5.1 -> 5.5.2
Date: Sat, 19 Nov 2022 10:57:50 -0500
Message-Id: <b5a7f4e5aa7c1271596c849c5ee0e75e9e4e3827.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99665

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9334a5cba6d9e83f81f036e1d92aae584ce3dbc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wolfssl/{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
index 790fa68b33..aafb6d370f 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "f1e2165c591f074feb47872a8ff712713ec411e1"
+SRCREV = "0ea0b887a51771cc1668d71b9113bbc286dd4f8a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


