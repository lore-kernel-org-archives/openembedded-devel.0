Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A60C7EE2C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:13 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.69124.1683477188999494246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZPYqP85J;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55cc8aadc97so54829487b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477188; x=1686069188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piojXadiPBQs4IrqRZO3XrFraoy4r3geiCpfyY7+8vQ=;
        b=ZPYqP85JYGTao0qLI4JoefqSS0Df5id2uqubwwYfoPeR3eCj2ztv9mSwh9QFDhscI5
         UgpdxGz1z95q1+vnLJbFK+lZoOjvvk6vdkyCqDLNHAQ3k24yIC1km/VwFtA/Ri/ICNu9
         JxZbs/BIOv4XNG3azeYDwRt70J/FJgm8JoRHRQ5KVOl4yX4gANxVq1RNb/ZVgVTR01uQ
         3ssXr0TJfYJaH3Aev1dAzF6fMoU3m99NiH97pRjfIWPLIR0Esll4Hb4vMS6+MPzzywvX
         mdNaXw2R5yTnvFbMtUrr/NC6RCjguBNRHLxjhvy/DkZGMNde/noe6M5Hzn48HSliTn60
         pm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477188; x=1686069188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piojXadiPBQs4IrqRZO3XrFraoy4r3geiCpfyY7+8vQ=;
        b=OLIMVQsMtJ+F+zoip4vso3hmxLKxqNl/eDcI4/OqC/+5GK8hkVXtsbRs0nvS98N7MH
         etEmi4LQAuEk0O7OKVjEfed5yy5hNccs5vHC9gLNeJ0lgmACrBgfJGlOp2l+ds/hjmwZ
         ssoyUF5/70IAJIHmYQcaiJvEIxJN/HWjyo64CDWreXQJN67PUQ/6ZGtZZtYGM2JRrma0
         1rVgkzgdQm695mflI7KpgZmMmR7OJw2MXqmq2GKjHUccyj+zPjixi+JP0K+f7OiUrpwc
         jhPDEvFHQhJIynf8JvSt3PJjpDCQORSQUjvPMe1TnQS8Eize82PcTVRRpcscSN0YT0Yd
         h/WQ==
X-Gm-Message-State: AC+VfDw5ICcXukq863NB8PiZTKgHalA96IcJRM9LZGNjcDV2WN1yNbAC
	+95MHMiKhfXbodGt5tacKBl1OmiAigA=
X-Google-Smtp-Source: ACHHUZ5CidzZ4PshBdcJqw7WYi/+r65QdudJKaEYG5Ry4zkiLs0oeHhV/dmdjAIgiXCwXBwiiU66vQ==
X-Received: by 2002:a81:9202:0:b0:559:e54d:4dde with SMTP id j2-20020a819202000000b00559e54d4ddemr8088176ywg.8.1683477187902;
        Sun, 07 May 2023 09:33:07 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bhargav Das <bhargav.das@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 01/29] pointercal: Add native & nativestdk package support
Date: Sun,  7 May 2023 12:32:37 -0400
Message-Id: <20230507163305.3261044-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102331

From: Bhargav Das <bhargav.das@siemens.com>

Add support for building native and nativesdk variants.

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f3cdc9d7ee7e6a65f409e51a7a6a809ed7e96c6e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index d3e7973329..9b72ffefe4 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -20,3 +20,5 @@ do_install() {
 ALLOW_EMPTY:${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


