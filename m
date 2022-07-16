Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BFBC43334
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 18:54:30 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.8459.1657997667650410146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 11:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9M/lISx;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id z23so14390299eju.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mErltRgoIKE6wzM6X0X9/ZY8UX3pxILqpjMNU8Okc8=;
        b=H9M/lISx0k4v+VV14M9JJtUiDgwvVAp0DEczJF6AAueSyPPloIrdJ3LWlS8uvbEUWS
         xQ9SQPaK7W6QlbMfUAKV6XpoN33prksWn7jHIwVaMtDATiqSE2hw5DxpelH/JjuB5bWc
         1rqq1sYCJ9xZzEJxUr8cV8PX8LBMcH+F2u+2YM3ANSnm1hNJjYs2pWgeKj6cETkqLY0P
         BfEg2Jo/mL5TgRzR70e5s3s5iFMNmC4XNieBP0Cb5fCMtdFOWtikEcOwqbLiVYZVLcVq
         bG4cs0q/0pU8v8+fnuU/9thic/Ctp9YRAsxNfJvjTO4lbIOrzfaQ03hOnlAMrOWnQNqx
         RBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mErltRgoIKE6wzM6X0X9/ZY8UX3pxILqpjMNU8Okc8=;
        b=VR2rIqBO+l14sMLOvkSnV0xZ6T0oa2RBcCuC5rLHiD+g2n4bXIFHAbWaKLP0nG0/16
         mMijMYrTDDe7gWPbe+/eJZ+84WQoigvTo53QIkIZgtQjYCpENrpqh0mUYXslNNkO6Ftd
         5b5CPvEY7BTio7ioz18yBJdt02JYaUInG79ap6cflTNrZIeQHoB65oiDvmigYOoViuMN
         WC/aI/b48fp3ReOz+SpglgnyOoYR3zdQlW0npbFQBpVYYgTg2NEuYGfCNlgIkyUonJVS
         YZ6fW5njIpn6fMDTsCCGbzQnyKbAeeVrh3aEmlbmE0y2fMCHqHdrp2rrROdXDxbUtRaY
         C5Ew==
X-Gm-Message-State: AJIora/5XrbAtI4cnmqBjrm8FQbYXExVxhte1+Ata3PMPFO1zOyCm8OG
	OXE3rNcfOXwGm/wqbFMW1ZSYSODMi3s=
X-Google-Smtp-Source: 
 AGRyM1vjrFDLdoX4FMb+zKvszrTTjujCNOuvTEnjCFpInH/KIEse+b+dJs9161Qu0y+I3raE88gotw==
X-Received: by 2002:a17:907:2705:b0:72b:4ef4:2d91 with SMTP id
 w5-20020a170907270500b0072b4ef42d91mr19121082ejk.95.1657997665830;
        Sat, 16 Jul 2022 11:54:25 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45qxieo2wjdwi378.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:4c17:e8d:6153:84b4])
        by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b0072b3391193dsm3504990ejy.154.2022.07.16.11.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 11:54:25 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-aspectlib: updated the summary and added
 a description.
Date: Sat, 16 Jul 2022 20:54:08 +0200
Message-Id: <20220716185408.2427586-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 18:54:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97856

Summary was ending in a kind of cut off sentence.
The text for summary and description is taken from the homepage.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-aspectlib_1.5.2.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
index 0cbeca21c..71f3d3594 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
@@ -1,7 +1,9 @@
 # Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-SUMMARY = "``aspectlib`` is an aspect-oriented programming, monkey-patch and decorators library. It is useful when changing"
+SUMMARY = "An aspect-oriented programming, monkey-patch and decorators library."
+DESCRIPTION = " It is useful when changing behavior in existing code is desired. \
+It includes tools for debugging and testing: simple mock/record and a complete capture/replay framework."
 HOMEPAGE = "https://github.com/ionelmc/python-aspectlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d58b3f20fd10347a9458b8a03793b62e"
-- 
2.25.1


