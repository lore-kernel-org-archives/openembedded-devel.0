Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66278C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 13:18:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.11828.1678972707493667932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 06:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mYihtU2U;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso1109979wms.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678972706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7m0R1MDyRz8CHohxZ/Wbv23jzkTCvVRlNlrNu8mpJo=;
        b=mYihtU2UJy4H7p6t3RnQXFQoTlnV0BqP86/RIEeOzvPsfY66lfFr4iYmPB8F/R6/2I
         wdQfiidrax22nqYOIUJ18izAybuJM0tvwmHv2alXrfn4o4BqJmgCVObpg7D3FJln/gge
         a2zyZY+mxkfpCEfWdE2/NFLKEq2K3fTW4yz96LfSD4cWOysJFYIwv64Du9PKpVdWi4TQ
         FWHIC6Z8+k+NYhc6HnQ1+MdI90CRpLihsgMuHNzeAfJBkXQ9U2XFaYSEXfoT6Z4XbmPp
         tqZPGTndzrJs6Vzoc6c4U/tuxu+7TJyvNyWnpHjdafPUUhVZb5mVDOtH5OFYCaQw7i3c
         IGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7m0R1MDyRz8CHohxZ/Wbv23jzkTCvVRlNlrNu8mpJo=;
        b=TqSTD7XUW9rq41tnPhm+axsdEFw1nx1+LMmsLjDul+QPn04Oe/YWc5ptPYuIaQz2RL
         6qnFlHoNlrOTbe3E+CemohGy7+DxX1cHhLdPot/9MFOj/S6EvMKI8kSLm/efGeEPN0dK
         /07yMb5xC8RqzND+w1kCoAuJcoVfFj3iP1k8r/Ee9wiZAv1M8xtT78BjCCL7CP+vxBO6
         T+n4jXcB+65feWT9qarpik0RJDZBIdzQWQJnI1Oyhct9CCNnG54Y2xn4EybQL8HhR1/l
         809zhSqxqmu3d2FrAK68GO4d3DIwzl9O8RZCKyW9KXYFja/1e6IfMonhpaXM8+v+v5er
         rjlg==
X-Gm-Message-State: AO0yUKW+YHZ+5ArIxfm6hMSDgAkTTqQQQ0LgDYauMH7OrGDGKyTvbhVC
	I6uAD8vpA0aCc6z3yM1yE2aqPKAY4bA=
X-Google-Smtp-Source: AK7set+6Ql5dJHiI9z+M7vjuTbAPVFQerWRVQKVGL+N2eXZ2F8uRfkO6PdkFzktOq0IQEfGGzEvS6Q==
X-Received: by 2002:a05:600c:1548:b0:3ed:252e:869f with SMTP id f8-20020a05600c154800b003ed252e869fmr13179328wmg.13.1678972705625;
        Thu, 16 Mar 2023 06:18:25 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003dc4480df80sm4853877wmj.34.2023.03.16.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:18:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [meta-python][PATCH] python3-click-repl: add mising prompt-toolkit runtime dependency
Date: Thu, 16 Mar 2023 14:18:23 +0100
Message-Id: <20230316131823.132874-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 13:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101576

Python3 click-repl package requires prompt-toolkit to be installed.

Add the missing RDEPENDS to the recipe.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
index cf5ba988b..c8798c5e3 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "cd12f68d745bf6151210790540b4cb064c7b13e571bc64b6957d98d120
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-click"
+RDEPENDS:${PN} = "${PYTHON_PN}-click ${PYTHON_PN}-prompt-toolkit"
-- 
2.34.1


