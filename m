Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2BFC48BD7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:28:00 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.12808.1700054876760286112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=feKj5MVx;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5afbdbf3a19so77431667b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700054875; x=1700659675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBRYou0YJ65GAa8tYL8wiwX+w0WXyyecG8s7bj8v/Jg=;
        b=feKj5MVxbpdbWFFsSF5vcetQEvEhYmb+92k2HlcYALEP89i4tGHvmFRWJe3pPaeaen
         0IN8BFkezuAAwGAXylFHVHHTbuwpu2Di4RPaSD9eOAjDeEtLaMysogZXyjC9SbMjN4K8
         sClU42t7aVNEowyrS8PLbvVWOloYhuQvWAeyWRQ/qTjhNYXGYxoNzYZaWUzVXmyxvWp1
         s+qJPE1Xrn/3hVFg4HAsI36RkXUBZSAJil24+FSPYLoaukqk4lQSZfPQGFaVApHo7Lb8
         ohTEo/noGQvnWdvxusPXX/NPaSSQiiKt5ucAWo74hZ1zsMZIRG8G9PPy44OVTxMamEwl
         sjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054875; x=1700659675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBRYou0YJ65GAa8tYL8wiwX+w0WXyyecG8s7bj8v/Jg=;
        b=Z0UZ2JB4y4u9DezoYClbCMKS364Fl50rQf3Mv3VbMKPl/GQlh0nkssjY7RiIIR/X2I
         h6nlbK39zvfMW93B8oDL29B4qHam0DXrjYkGymA58U/LOLSTyUSAAbMWthoy8KJ8b97/
         aEF3WPiH4flN2X5p4c3I8e2luALIRNQGqnc1DSK042YRFTlF5irarrhSFM5NnZiLy9WY
         rfS+gp2avV4MXD3mEdDJeCJYCT+YvoJT/u39W9S0jcwi8WtsVrgNABtfe4Mvq4xaPfhR
         eBt8q3F/JcdFnv467FwjZ/YxfDJPgx9McmN2qT+xLUbNVr3KGYJor9TMOVb8xhVOWQNp
         yPHA==
X-Gm-Message-State: AOJu0YzlIboAvsvQFkcIkqiVxpb1ItEo6IeCVNU/KcYSO7N7WmtEmZAS
	KjDrfqLN6L9otn77JWKoVc6w7YobAos=
X-Google-Smtp-Source: AGHT+IGSoPxr2XiESvRpuXOLUycCPc7H6p+nBQDqjI7rUXF9SWhL+xdJf5guCBjWf28rQ2QvpgDQyw==
X-Received: by 2002:a0d:f347:0:b0:5be:a458:1f37 with SMTP id c68-20020a0df347000000b005bea4581f37mr14358531ywf.16.1700054875706;
        Wed, 15 Nov 2023 05:27:55 -0800 (PST)
Received: from keaua.. ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id q67-20020a815c46000000b005bf57ef572dsm359045ywb.140.2023.11.15.05.27.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:27:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] pkggrp: drop netkit
Date: Wed, 15 Nov 2023 08:27:54 -0500
Message-Id: <20231115132754.16679-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106760

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroup-meta-networking.bb             | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 7be8261164..941efedd65 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -13,7 +13,6 @@ PACKAGES = ' \
     packagegroup-meta-networking-filter \
     packagegroup-meta-networking-irc \
     packagegroup-meta-networking-kernel \
-    packagegroup-meta-networking-netkit \
     packagegroup-meta-networking-protocols \
     packagegroup-meta-networking-support \
 '
@@ -26,7 +25,6 @@ RDEPENDS:packagegroup-meta-networking = "\
     packagegroup-meta-networking-filter \
     packagegroup-meta-networking-irc \
     packagegroup-meta-networking-kernel \
-    packagegroup-meta-networking-netkit \
     packagegroup-meta-networking-protocols \
     packagegroup-meta-networking-support \
     "
@@ -134,21 +132,6 @@ RDEPENDS:packagegroup-meta-networking-kernel = "\
     wireguard-tools \
 "
 
-RDEPENDS:packagegroup-meta-networking-netkit = "\
-    netkit-rwho-client \
-    netkit-rwho-server \
-    netkit-rsh-client \
-    netkit-rsh-server \
-    netkit-telnet \
-    netkit-tftp-client \
-    netkit-tftp-server \
-    netkit-ftp \
-    netkit-rpc \
-    "
-
-RDEPENDS:packagegroup-meta-networking-netkit:remove:libc-musl = " \
-    netkit-rsh-client netkit-rsh-server netkit-telnet"
-
 RDEPENDS:packagegroup-meta-networking-protocols = "\
     babeld \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
-- 
2.34.1


