Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C468BC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 08:11:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.40590.1674115896082229432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 00:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JcjGqeND;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u19so3537010ejm.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 00:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cSuUdGdHp5VojUolbP6MUt+LkFa27qmh8IiXWlFBVg=;
        b=JcjGqeNDVBrIUS5RiWLZ4IQDyp0VfkAicTi1cIC/z43K0JsrunOHKVtupkEDr2MohO
         caMNqQ6fBRs5kQ4Og2U68xohaP95ELF7nu37bT1ruC3jnTfYALSa2avwuJg+Czqoiw6O
         cTdGe3UqqQHjJlaK2dlMgVsHi0YhBzxWaFoG7EMljhm0RrqgubXVbT+h7F+FcNWfSjPh
         nm3a4Zv11pIqeQRGBsJ+w6tLLm8t4p8yhxX9ooM6iEp+2KlkHyQ6rPuk+eMGB8Dn6tp0
         mwOgk91+qBOt2B+nGJH6v/PsQUFstz2/3UWBLEGdKzYNPPvoKQXeY9+4KzGFmqY8a2Gx
         T3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cSuUdGdHp5VojUolbP6MUt+LkFa27qmh8IiXWlFBVg=;
        b=1IaKh4Rm9/1MrnaJeOaNEixmpfrP8zyiDUpC/SN/PEFUYnftrkDJ47OLZDissBfiJP
         bmnYV6ucqM3rfQFG9pUvBCUKkNmgWMfC88jnr3dydWEeMLWJfvgliq3sGO5S9PMkQZJs
         SZnTyTAvyTgPf3xx9kAWSO4S/JfzJUhtFeGOtnbkQ6dlVbsFE+6t6z8eEYAN4JZniKoD
         hhev6uu+1xUTLHdkJg16Fjw94aC7NlpKqsv1A474MXCnDBvnZdgp13vqdzGMEPMmHxJJ
         +MplcZT158P5uYI5e3LsNVKfyA2FnKgD/pbPjK/19VsNNniCnzHjFJJ367afFp8xmL/a
         pQdA==
X-Gm-Message-State: AFqh2kq/kD7uB7eT9uvXMqySZDIfb4NKc6at9bF5BM89bVZAGgkoDW0N
	YvX6faLjj+0gYJA7GxwsdSEjCqAF5Eo=
X-Google-Smtp-Source: AMrXdXslHK37924ssh07dh16txvYWHFFfSUnojerhbOb2H0JWSJBxaAU0JSoiuKWjMXuKEilpEHFSQ==
X-Received: by 2002:a17:907:d401:b0:872:1b27:1a43 with SMTP id vi1-20020a170907d40100b008721b271a43mr10911618ejc.31.1674115893731;
        Thu, 19 Jan 2023 00:11:33 -0800 (PST)
Received: from Unimatrix08-Jammy.. (mob-31-159-34-138.net.vodafone.it. [31.159.34.138])
        by smtp.gmail.com with ESMTPSA id fs37-20020a170907602500b0086ffe3a99f9sm5624522ejc.82.2023.01.19.00.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 00:11:32 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] boinc-client: Update boinc from 7.20.4 to 7.20.5
Date: Thu, 19 Jan 2023 09:11:31 +0100
Message-Id: <20230119081131.2241803-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 08:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100652

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../boinc/{boinc-client_7.20.4.bb => boinc-client_7.20.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.20.4.bb => boinc-client_7.20.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index a16117b99..4e35283dd 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -29,7 +29,7 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+3 wxwidgets libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "1eca0c7931d0409d65a1254dc5d5c46abe058daa"
+SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-- 
2.34.1


