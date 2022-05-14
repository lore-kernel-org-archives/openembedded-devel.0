Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A41EC433EF
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 07:51:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3936.1652514688288270162
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 May 2022 00:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yte9ntrW;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d5so14036418wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 May 2022 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SyCmtkKkxD2tm4frIAArdxjrYu/Z1YZf+QznpPpVt9g=;
        b=Yte9ntrW95Y5h5ydqZKgBG5KIHnE5wzthrFXsN1fgqagtfYz6P7Sc1CKjZu13JZ3Ss
         Ks+W9uUEaJdESJ97iLaV7v/Zf+zquqluzxcVm5LlSbV/xALgPoRhFe2aoEro1pqaipEs
         YUl0VovuQ3i6f3NBuTECZDZTTg4PvRalCNqkSdU8G38J8CMtAx426ZRxvzTHPEKCNf3V
         N+DHjTnKNhKIYj8lOwxNRVjdZBjgpoUZoRCILFa7g3Ydy5JC7icaEqQUxwaKJIhhf8TP
         CRasw5FCipU5dYSF6H2ZZcvFQZHmn6JTv4ttrSQUOEiiRF2U0Bua7BPJf5ZrR0kVwP1H
         F/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SyCmtkKkxD2tm4frIAArdxjrYu/Z1YZf+QznpPpVt9g=;
        b=J60Nb7jziUqjK92a1rea228TSPAGBccN/02QFavYzG+mgQDyy3E0ewuWSUQEv+eO7t
         v8GnNjkhVGfK3KKYBPcHAij4fv5U2n1//9lV1BvxlsSdwWgFCoHQ7DtnBglOcXscoGOo
         NO+LVp5xlqjalPRuUEOMGlkxxZUR4z4KSkBdjdsmoRI7gUOLV/liRFCx+OJb1jRSAS3J
         FRJUj5h5aAqYjmY7TokuD/168hPkmFAoHBe2s1iG2lnXFNR+KjRLNYUCzv7zB2G41CPi
         K4dfNrILd7FlRO1rFobi9CJ0XhuYd4CSF+NnlUZ4869Cwq65KUc+GDWlisuS6eb7jTUt
         aShQ==
X-Gm-Message-State: AOAM5330nD2qIcog2oNFCKlCFULrnwWYSBTimQErRjOfZHguuyQiYI2M
	dYUggTQ9m4T9YfEPGbcPcuXOGHfJ46w=
X-Google-Smtp-Source: 
 ABdhPJyDlL3NKgt01F9Ae9e8WzBaAXdVAFg6ER3gCGLrKxWlgrLb2g2vKjiSPHTj1Mz/sxFDL/39PA==
X-Received: by 2002:adf:ecc1:0:b0:20a:e019:e184 with SMTP id
 s1-20020adfecc1000000b0020ae019e184mr6639290wro.99.1652514686495;
        Sat, 14 May 2022 00:51:26 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a7bcc85000000b003942a244f33sm7313242wma.12.2022.05.14.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 00:51:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] ostree: prevent ostree-native depending on target
 virtual/kernel to provide kernel-module-overlay
Date: Sat, 14 May 2022 09:51:20 +0200
Message-Id: <20220514075120.694645-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 May 2022 07:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97094

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2022.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb b/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
index 24a7513188..50d0548cc7 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
@@ -201,7 +201,7 @@ RDEPENDS:${PN}-ptest += " \
 "
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-localedata-en-us"
 
-RRECOMMENDS:${PN} += "kernel-module-overlay"
+RRECOMMENDS:${PN}:append:class-target = " kernel-module-overlay"
 
 SYSTEMD_SERVICE:${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE:${PN}-switchroot = "ostree-prepare-root.service"
-- 
2.35.1


