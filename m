Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B39C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:50 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.4299.1634338669937397307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=xzOnwfn4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so48026264lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RkppfyvifHFkb73sRFkCXS63bdDGawvExgHWmTLcJa4=;
        b=xzOnwfn408OUSx1dPdyTnn7WxD4evQFCYEF4wl05iY3YS8C1mwo6JlB4d2yfaxJk9d
         e3e6yD69VE3ydDvl0kdRIJsXjPAErY1XGz2L4k19WH9PRFSUpvAG96f7rn+O/tT3ChXQ
         0FHJaPk8ll2JklCeLrpst+QP6BDD39xz0aI+501w3L6d4YlGn6SnIvgS8V1wXII0T2S/
         G8JCBm2JIKg2vGxX/Gr5vGnvwLR5jP2Rbf2U0sp5ugDnn9NF2oxn8kAMVPepk8ADGgZg
         WLFx8YP3LBcvB/Tn01lUnhm3Ezot81cT11c0eVgdj5dDQ0AqeGYnfaaGr4CZM+610/bk
         39aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RkppfyvifHFkb73sRFkCXS63bdDGawvExgHWmTLcJa4=;
        b=VK/1IfEoefpQUqulOSMHxdlDmn4RQ1syycRgoS4cQx3VfFPCCN576Xlwjzg3dxFqTJ
         4XikXkjhvFZ4hIrOw/V3gSrc5EdItEcZJ79/+k/NNyXDR92l5bLbhfrsyGtKflQKHyvN
         1BtC0Nl/OXaXOzUWW5S19QU9S2f0F2PEIJAs6oHHbln34EsM8nERNy/kUm3/mO7tEmY3
         nKahU0JbtXvx+GsinzFcQ7Kod5YGMim3lhA9yzXkaf+aD6+Vz6CJyzlH1BrgCs47knw/
         /lBAmS6zzVRWuK7YBxBE3ZmjYbdelknzG9WPYgWucGiO4Pl4sfDPFbE9Gk5qEf9OQQsy
         wRMg==
X-Gm-Message-State: AOAM530gIDOMoep5H3XbpRan79QbbOGscdOqOPqVDIKg/waikjCVntqv
	qLia0uUmBfIzIZF/tnR8XzHqQQrMdC7ouT5T
X-Google-Smtp-Source: 
 ABdhPJwoUzJ2kO0YYBQDFqBwe8GQVnp+nnYddsi7ocZJt1oVt34zylM0aIUXX8Y/arRiy3caTiL8mg==
X-Received: by 2002:a2e:90cf:: with SMTP id
 o15mr15329049ljg.241.1634338667989;
        Fri, 15 Oct 2021 15:57:47 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 a16sm654217lfu.274.2021.10.15.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-grpcio-tools: update to 1.41.0
Date: Sat, 16 Oct 2021 00:57:43 +0200
Message-Id: <20211015225743.4164025-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93371

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n3-grpcio-tools_1.40.0.bb => python3-grpcio-tools_1.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.40.0.bb => python3-grpcio-tools_1.41.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb
index f86bf008f..55b889099 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "d440f2bc089ff628618c536904d5bc39d0b44f7afdda4c4c1ecd15fcf385bfba"
+SRC_URI[sha256sum] = "3891b1df82369acbc8451d4952cd20755f49a82398dce62437511ad17b47290e"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


