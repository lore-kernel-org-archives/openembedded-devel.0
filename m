Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42897C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.69134.1683477204636856567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nXOv6niG;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-55a26b46003so54837077b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477218; x=1686069218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGvoYFp45codDCn53FYHCELGPq3Fd7vqOyGQ2WjZbmc=;
        b=nXOv6niG/rYL9eAogimlEYOGiYvsUEaJlhcj0Z9ocDizN9/LIJHhzcCSU028kg2S8y
         u0FYXLIN1l2Gu4l7b+re8K+auwkXahuvbfwrlJMrNJZmWRkAaCHy37lcU2gVbSaApc0x
         S0Tf3EY7KghgEnNjrTEPi81OUHr9MqWhpFvXwXhsem0O3rXusBnj+HhWg6r6qh9el9XL
         SoC/MMVFzWSufgOZ1PNCkXE6JILjNWdOKOZntaeEExs53O/NhVFTNdnjyMpMj36n+vYD
         CuKoC8A5rCX6/a0DClb/AaG6DLXhwGRy/DB7Om4EoJLBtRiF1c/BicI1TVYUHJ16eBYm
         IHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477218; x=1686069218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGvoYFp45codDCn53FYHCELGPq3Fd7vqOyGQ2WjZbmc=;
        b=TFhH7QO3UE9MvxewQX0FabHtUB+hN7pOcBwuhLsJOSZXQWJdTFGHqHvDHu/Azr3uAT
         yuG6Oy7eDoawnwq5SkOulbpNUnUiF4jofwIsBQtO3iF/e64VBziEZj0cWU2z0ncOWI1b
         OjYuMmVUa3f8xoK05hgPYji6OJc3E7faUvKqGGV3XHGKuLWbolS4YN8TfQAMUAa3PFw3
         wJ9TLgAJrFmVHLndFEc2zanJUAHZ0CJPzdUp2fbSw6gtATduaC3tYcfPXk7B9HjQX3U8
         QSTL77SBN8PYKAfDBLe4sz8ehTK9Yvn8Wf9eKxA3d1g1VkjkU2DHVUsMpBSMFtD6Wxs7
         nUwA==
X-Gm-Message-State: AC+VfDyMa4XS91QcCSQNPbFFAkr9PXwvJ+ve/YhWn5hEuOprVGHY4jJm
	O38+zf65M7STzFCDgD5WGGXHr1bULxg=
X-Google-Smtp-Source: ACHHUZ7khnQzfdV/CBjszq+a+OHDXwp2m1Pq3zoVa8YLVkhizQNLDOLjc9+7Aoqib8UjbBRRltAwzA==
X-Received: by 2002:a81:73c3:0:b0:559:e8c2:6a1a with SMTP id o186-20020a8173c3000000b00559e8c26a1amr7856989ywc.18.1683477217898;
        Sun, 07 May 2023 09:33:37 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Bergin, Peter" <peter.bergin@windriver.com>,
	Peter Bergin <peter@berginkonsult.se>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 29/29] freediameter: fix typo and old overide syntax
Date: Sun,  7 May 2023 12:33:05 -0400
Message-Id: <20230507163305.3261044-29-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102359

From: "Bergin, Peter" <peter.bergin@windriver.com>

A typo that probably caused a left over from override syntax conversion.

    INITSCRIPT_PARAMS$_${PN} --> INITSCRIPT_PARAMS:${PN}

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77f031776ec9c9edb18e7323b17b697f5c52d5f5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index 93a607d3ce..44fc46e3a8 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -132,7 +132,7 @@ RDEPENDS:${PN}-ptest = "cmake"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "${BPN}"
-INITSCRIPT_PARAMS$_${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+INITSCRIPT_PARAMS:${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
 
 SYSTEMD_SERVICE:${PN} = "freediameter.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1


