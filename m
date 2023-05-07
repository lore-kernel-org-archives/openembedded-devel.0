Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D63C7EE2A
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.68999.1683477193085198587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Jrz9nzxf;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-55aa1da9d4aso66142037b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477192; x=1686069192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIqBctr/TV6eYfPItvcLYw5MaBjiwwy4u0fRDuOi/AU=;
        b=Jrz9nzxfBlTw1jKhBNSAw0A3RSde8XW5Ds3FHk+AlryFhrUd4mJG6dJKv5pO199Bve
         XyJp466fev/M9/7hcjLwe2IR43RaEJxq1YzNu8S+J3nmsbPAOCp2oSTQM1PgipZkfJCl
         l/jIm5YFXqe5/2rVLPAnjFrB6tFww6HjIdGzeGctiqZWU+XGZ3FpHokmBX8L0wdUEdlv
         HIkoW79iuNGJvZ8nVjWKi8wk/PqtNXsT8dkIXbpjzkQ/evhps2DTvsYIdXIyGz7oAU0a
         c4s+7v9kkmvXUMN3FnkJAJp8fyowW2j4BSSng2L9/TVQXBd1QRBWfgv3DNRlzsMywkuC
         DDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477192; x=1686069192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIqBctr/TV6eYfPItvcLYw5MaBjiwwy4u0fRDuOi/AU=;
        b=ZmVlAvI5kpLkpqb197/Cvc3Qgxqp2LHcHDF1srY2975LYuOqpT5gQDTbwIZCR5P16n
         MlU4H2wRE9Lya6Ge27izjH2JLgkf3mPlncKakw/NKWm6m3rtvz4Se/jRu3ISHIIMSptX
         TxwLCqbihSXUDwYtv12DiniqAJOFGbstpE8Vh2JCuLSuKUFVro0Cd0EZ31hnHQEBBeq4
         d0o1Jzxso+DLmyhwyCyonD/FGoI9x8DBjoTw7voxb72W9Xadi6XWqYcLy8AUnykzHNxi
         NfUYqr0oE71ZfmcCAObdZXyYckF6RbviKvvEju49X7ZFNUk34/mryTNHVN62g0sAOn7F
         l6PA==
X-Gm-Message-State: AC+VfDxilnIly3rD3TVfSNh0FTffxvHdxMUVSLY/q8Ft2DD/SESvtJN0
	p5GdAnWVEr2Wwbq08b1lvtTkKvfKDvA=
X-Google-Smtp-Source: ACHHUZ6T9he026NvYV5t8ta1vrUa1oPRekW5gdRBZXP0Lm8J7AwQg5LjY++mMlOOOF2QHQ/cc4Mqcw==
X-Received: by 2002:a81:7d02:0:b0:55a:88f0:a49c with SMTP id y2-20020a817d02000000b0055a88f0a49cmr8795906ywc.33.1683477192040;
        Sun, 07 May 2023 09:33:12 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 06/29] python3-gcovr: Add missing runtime dependency
Date: Sun,  7 May 2023 12:32:42 -0400
Message-Id: <20230507163305.3261044-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102336

From: Jasper Orschulko <jasper@fancydomain.eu>

python3-gcovr requires standard python module multiprocessing as runtime
dependency.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5564dbb8ff22d9ca4296a68f92f3c9d05fbdf99f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gcovr_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 901d0017db..21c36687e2 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
@@ -12,6 +12,6 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "gcovr"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments"
+RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments ${PYTHON_PN}-multiprocessing"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


