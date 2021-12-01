Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4A3C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 18:20:41 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.738.1638382840409947709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2pUXqaa;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id z5so40480027edd.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P3jaxj6YjbsIbC1+pJibPQVQbhsS5eepZBzvYRcmHd8=;
        b=h2pUXqaa0RtZ/j4Q8b9cnkLjlckGfunNPpVewCgCamz6Z2lpZFFhpEQNrvkg0gdT3u
         7M+deLQaV76hUTETR4ArVhQctV8yxn7DzCyVcJS/XTySOfNRbY56oY50XXboxFscAIhn
         7yu67llwIwFwG6P6f5OCrvj7bQGFmQIeswwZiezBOFCAv8Y0yCA985L2u+BdY3XYQ/LL
         SS9m+9Je7Vhbyb6I9aJDyR7xVOs5YDuxMUpCIa1slIpwb9TjIquv/kfzt/aUh2/ilqP5
         4sdL5ILJbdbeskLH7szIiu05k7kbozPUQPnB8sT/c7jp+PlB1lONDwA0M/35G48ofsYM
         It3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P3jaxj6YjbsIbC1+pJibPQVQbhsS5eepZBzvYRcmHd8=;
        b=yowQejPzDzKgjbuMcoWPRQGTGGg85O/tfMaW5xVtAxYVLIDjPRX+wJhrxo3XnRFzat
         naWuxk1bPeVzEAqm5irmvxlsDY1/DVfw/6Ra7Gh3itRQgjnOwe+yve5GI6SFqXRQvIRM
         TUFSKNpsG7KPnTptiXFEGECrTJ2HmcdGu9cisPlv75NgXg3dRMXaRYdAwsdJPI4uX9iv
         MTsoG7EYzmvgg2bi4D11sEb34IToZN1A2meeb/z5Q9Bh/4Tt9Z9a7lhG9qv+Ts9AtCQ3
         82TH8LnM/YcYr0GyLz4LkmSIFsKcelYhY3vWkyYhuLtrmR+Ymc0SsZuPPb/+AMOQMn9k
         lodQ==
X-Gm-Message-State: AOAM530TEFhK3bX5KEfcz7Cj8tlQsietmoqwnhtU/Nrvf7vNMVGSz1/3
	g871zUA+rybCbQP7pUOuQrUY+oYqv78=
X-Google-Smtp-Source: 
 ABdhPJybxuKSIGqmgsvAcs90lqcflKwkyrFy25bxQRSq+uf9683ILsnI9k76o/256L+V+sM7UWMsqQ==
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr10722192edd.362.1638382838328;
        Wed, 01 Dec 2021 10:20:38 -0800 (PST)
Received: from Unimatrix08-Focal.lan ([158.148.34.55])
        by smtp.gmail.com with ESMTPSA id b7sm347003edd.26.2021.12.01.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:20:37 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: drop md5sum from SRC_URI.
Date: Wed,  1 Dec 2021 19:20:34 +0100
Message-Id: <20211201182034.108959-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Dec 2021 18:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94164

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
index 9bbc9b427..099d82ae4 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[md5sum] = "2e408e56e92cf778eb8722dbbcb5c357"
 SRC_URI[sha256sum] = "3c60a29375549ffc148aaebe859be91b27c19d6fa2deefde1373c4f6da8f18ef"
 
 S ?= "${WORKDIR}/vbox_module"
-- 
2.25.1


