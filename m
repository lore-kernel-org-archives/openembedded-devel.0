Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F021DC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:38:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.3759.1655195912104450469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DgMUb2PM;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id gl15so15764014ejb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CXv8siMeu7kW6ntajGNK/SPz9dJorarnAg15qUR7fs=;
        b=DgMUb2PM21scG3SwYdmDjrB/HZkNQi6BcGlWjlfvu3ldl2JmBAKF2zQraOs5EeqKQw
         xTbDXaEj3x+yB6wK/QZO1oKiruAU6SK4CJe3BVWDrdGkwIxOins/vRIQj0aLGEDzMiV+
         W1v2SGYX7+B4tH8EHV5YYK+ig2C1ORZbD+VTWDS47fq7qYEcs93MyJEb1bj0TeeZCSUA
         3vEgIf9gIedU3lGilaZuZzhfCTZCVMepWM2JP3zLSdlm4m0psJoLSVx2eIS874R3tk20
         g1MTCTal3MCEylYTjdZ+o3HiY850X3EPaVh9GRANDymZXDwWkM8YWzvF2frkza/CdMzq
         KGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CXv8siMeu7kW6ntajGNK/SPz9dJorarnAg15qUR7fs=;
        b=FNOMJqYpoSBPGiI1M82teF5Z6uYbzeLN6lw4kaGXE3jbpMuanacl55OXATEd7oJ1TH
         bUAPsVIYt65aUXE73FkR2il2cCRMNXfBYCFX/6GJ30CDFp0ERM0roxOf48CA8S4uEVSL
         Aw3MiyFK2BOW+VyYJOKfK/ZYg1C7H+hWKdh2Z6+Ekv8ZuS5LezR8icWd/uDDJYT9Ra4l
         /rMkzE/j30DAAbGCFtVn3YkGXGQQpoI/GmlbVnz7BW4Z7JEPHMV56hRpKIBm/En1mIXB
         8ORq9FcNTyIL1ZHzi14k46GE0XsIk3ZtMGrlka+744SG+gh4KA0BuRh5YmpcULeBACMI
         8uuw==
X-Gm-Message-State: AJIora8Sf6lQfnfdB4k5IIfvbcYyKwrUOb6XlPV0b/G775Ns9jORMzH3
	/KrBPfAwWX3bGc0yRcS0iaoZ2ba4gcU=
X-Google-Smtp-Source: 
 ABdhPJzqr6/itbKtX+4T2icO4t+nqfkeQfPcLyr5XJzBeswS69tBUxDML2Y52mwiZX4QZ2GggDfz/A==
X-Received: by 2002:a17:907:c26:b0:711:ca03:ab3c with SMTP id
 ga38-20020a1709070c2600b00711ca03ab3cmr3197766ejc.654.1655195910694;
        Tue, 14 Jun 2022 01:38:30 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 v20-20020a50d094000000b0042bd6f745fasm6602570edd.92.2022.06.14.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 01:38:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] tesseract-lang: switch from master branch
 to main
Date: Tue, 14 Jun 2022 10:38:24 +0200
Message-Id: <20220614083824.2508739-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 08:38:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97508

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
index 7484c054c0..9fe61ae9c1 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
 
 SRCREV = "590567f20dc044f6948a8e2c61afc714c360ad0e"
-SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


