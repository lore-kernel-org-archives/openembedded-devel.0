Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36EC04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 17:00:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1701.1690995643351043605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 10:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L0HhcM26;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2bc2702cso883535e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690995641; x=1691600441;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R1FEpejOPp5U4YFFZSYCQ7Ql1aWyeLKoCorLd5mcIU=;
        b=L0HhcM26BtGeHmqljj6lvpikleT5WcOzW9e6MAuR0fQLKOm7oycfWGZNDeVwWukSGc
         yf/AC6wvrDSam/VaNZxBpDXjqbd8w6HQoGhpcy7Ego9ezdzdwYRCfu/CFfZNPO5rAnfK
         6o1hxXwN/V6wdi0dCA3IiBRtrdPlNMI+Y1y0MDCd+F9nwmrKxo0tODScS5SnxjpZ/U96
         WvXcy0ZUs5kSLR35UkdqzusB8EbsxXRkjqRtr1AxoqSKUgkLELuSteOdAATTR0cUV+CA
         TPpbMyku6kSu340GXbvJ6AqPBliKbkdkybz3l8GrY7z+luofLFUljqxKRGznBbxZARtZ
         +AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995641; x=1691600441;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R1FEpejOPp5U4YFFZSYCQ7Ql1aWyeLKoCorLd5mcIU=;
        b=lC2RKCZc+iSQW2tmkhGaCGg69fIVUBdpraw1YSLE12uZ8rAfl+g8a2coxMlkMI9LF6
         2J0z7sDlWeyutDIbRR8fvvW8W+BgG/V3Le5wVGMjvFfZBbWX57n9pob2/ek+jiW9mEvJ
         DgXWVJRF35ynZKrPB//uPd2E4yNui1jnj5dxVzuE754Lx/vR45QnIf8zusz7W9wTCJ2w
         Edx5h/TioNX7u8rjsupNAIh/NR1G3Yo55XuX0thXNWFASSPSQeLgL08NvrecnADt1jW8
         os7gQg1v9xbWo0hfcnsrGbrMyoc8D9Npy2J+xwVgpTkFziXrupbDEqSLR4bjVt2WqJBu
         mfNA==
X-Gm-Message-State: ABy/qLb94OAg4PKWuzyQITztDm/DEcm8OI/LaIOxxInivqiv45v7Jh+h
	trMM4PD4wZkXhF9nnxuGteavlDPw54w1vg==
X-Google-Smtp-Source: APBJJlESgiY+3cgphuPINv66wV/2S1ayN2mZXkRlOMTsPz6QiREHjZwhYnQfnI9YVSdWax+dw4HjyQ==
X-Received: by 2002:adf:ea52:0:b0:317:3d36:b2cd with SMTP id j18-20020adfea52000000b003173d36b2cdmr4638728wrn.71.1690995641224;
        Wed, 02 Aug 2023 10:00:41 -0700 (PDT)
Received: from t460s-2.int.vlab3.dyndns.org (089144205002.atnat0014.highway.webapn.at. [89.144.205.2])
        by smtp.gmail.com with ESMTPSA id d14-20020adff2ce000000b003176053506fsm15756969wrp.99.2023.08.02.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:00:40 -0700 (PDT)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [meta-oe][PATCH] replace /usr/bin/env python -> python3
Date: Wed,  2 Aug 2023 19:00:36 +0200
Message-Id: <20230802170036.9288-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 17:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104204

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
index 4e1edc6ce..851acd745 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
@@ -30,6 +30,7 @@ EXTRA_UFTRACE_OECONF = "ARCH=${@set_target_arch(d)} \
                         with_elfutils=/use/libelf/from/sysroot"
 
 do_configure() {
+    find . -type f -exec sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python3/g' {} +
     ${S}/configure ${EXTRA_UFTRACE_OECONF}
 }
 
-- 
2.17.1


