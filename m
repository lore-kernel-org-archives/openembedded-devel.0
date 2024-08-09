Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A029C52D71
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:54 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.79761.1723193565645519125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xs3s2Ooc;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a843bef98so202380966b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723193564; x=1723798364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE4eUkp+nesYBS+stQ8/8tPZXAXECXwCpJP2cPKYroY=;
        b=Xs3s2Ooc3djHslStuutSKLIpCcEtvtgzC6mxpxemREmwVQ5tAiAL8ZRrX21cFty1Hs
         qBjvaP1tnjI5cJ/DAXw92+ztJMjeay/Zn+rxj1M5YDqJjmJKmQ/pXbdPgTKObios/bjz
         fBQTYmSB9n8xqpvjB0NQEelu9rw9ANPqFqoBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193564; x=1723798364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GE4eUkp+nesYBS+stQ8/8tPZXAXECXwCpJP2cPKYroY=;
        b=TqdfGYp3sp2oW6PlTMC6K9dDT8GTZLmT7vxMA4ptKU/I2CEascqPOdJ3MPgevaU+M1
         pr4Ch1inNZDp4D+HkJR2ezb7J7v1p4hUbsWzgiy8PcnEyrQS+353y+tu4UnuqMq3GGsa
         2Ntvnh/Hl4vPMPJDzdIfF12l0DToXsHQF3inln+tcEAKGVoCYhCIOIqO78yBpbZflyfp
         IT1lgORzQzVOM/XKMAJYY+S+NX0G/mV8YSqzyWDsPcE3TelbYyD/67M0CA1S9/owtpKD
         IYfy3/LgizF1/CWIzCszXAR3mcEVShhKwKOC5kq601+e3vYVwbaZewcOgULuK3iV8TlC
         mcsg==
X-Gm-Message-State: AOJu0Yzt8d2/s89ZB+mm3o4SxOGwITFSEldUzb8Zu+OTusm9yUjSoGpx
	dcmAnZQhMteyengwdir43/1q/hIh4U5FnaMihAYDrvAqFLnmcvORf5vPpb4CrOZI7lPNr0MtQdJ
	y
X-Google-Smtp-Source: AGHT+IGC/cXoKYd/S7eElyVeF7ValjqD89l3pvPitnUP+MCUfuOaxeh2wkgky1dC4N5Q/veYeIXeRQ==
X-Received: by 2002:a17:907:f723:b0:a77:d441:c6f1 with SMTP id a640c23a62f3a-a80aa5dfe49mr70842866b.33.1723193563764;
        Fri, 09 Aug 2024 01:52:43 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c4fsm823286366b.33.2024.08.09.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:52:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-argcomplete: Upgrade 3.4.0 -> 3.5.0
Date: Fri,  9 Aug 2024 11:52:36 +0300
Message-Id: <20240809085236.1828180-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809085236.1828180-1-leon.anavi@konsulko.com>
References: <20240809085236.1828180-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111690

Upgrade to release 3.5.0:

- Use project.scripts instead of setuptools scripts
- Test infrastructure improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-argcomplete_3.4.0.bb => python3-argcomplete_3.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.4.0.bb => python3-argcomplete_3.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb
index 90def16a6..a5cf6298a 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9dace8d085dcad6eded88057f"
+SRC_URI[sha256sum] = "4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.39.2


