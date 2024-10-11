Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E4AD0D7B8
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:02:20 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.14102.1728658935828122769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjgR9GT4;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c803787abso15020555ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658935; x=1729263735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1n0CqXC3fDNqs2dpcQMXyBVALQ307fyPX+UommG1gJs=;
        b=HjgR9GT4oZId257ktFW01Wc3RQxF2hF8HyoBEgo7tcKSSU2BqTEKsX5DMVYJwPQOoi
         wdm8Il9zWmmj2uDfZqb6nUwCO6mWWMLMSHi5UIqhiV4CeRuUcNRqWvygMCEDlewXvhjW
         xZLUevmjilI6Gv2x/hai5bZjXKQj4fS4JPNjy0dWcVd2sIxC74EsC0ehG5Zmox72JUDS
         WfA9aV6l8Kxa7Dq/9Mef7OdaN60uM+ij5AbfqzMZLRAcG7pjASj1JCJeBynA0Z8+0OvO
         2UaMFnTDIvVGnrRz5Zgv5xecLyPjxGhvCCD7PZYd6z5b8qTgVYNHK6qg76ALHiXfnbnL
         JLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658935; x=1729263735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1n0CqXC3fDNqs2dpcQMXyBVALQ307fyPX+UommG1gJs=;
        b=aFCDRugRSiQLIfPUbMKnvCwt5NQl+V9GXlXFB2uBVtwlJquorc0tpl74eq8l2TR/el
         wtrUBTfdw0KbQVDNgw68plg9+HxppjAmhmOU+6Qs0x3tAsm6rNuvGRIIO5WnxXEdAuw5
         TGvY0x1XFtQ3VC9uM700D0U9BElnMJj+C66Pfu9vd30rFo7PvSWM1FMfgU4xr43zhCi/
         s9mJ5eODmWE1Gk4FKnDfyjCk/HpcNEeoVEbuPlkL0KuCedM60ICjxb9/PcaRkBx9guCT
         CtLKILUQSOMXD1kUwuKRwxjgjCeXFs1RyNP9zL0acVZcjV6EKqIsnM/auafYverePLdq
         Yk4w==
X-Gm-Message-State: AOJu0YxXylA4GCoPkBWfZQeK3FUCOUCOY9TtMqJaNX4QsjsC2jvTEskq
	0vAG/kEtvf34ERMxITCNYoQFa2j+wAxtZ4l30INgzHdntQOambAfjBu05xqG
X-Google-Smtp-Source: AGHT+IHfTz65iKj2nUAYVOre+KH3dQYMTuOU1nKuHGSp1vDQpfPL3IqV6ahUakzoOTcC3BYDsA4JgA==
X-Received: by 2002:a17:902:f60c:b0:20c:5a7b:dcb3 with SMTP id d9443c01a7336-20c8052b62bmr101257085ad.30.1728658934792;
        Fri, 11 Oct 2024 08:02:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8d77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea44969bd1sm2540190a12.93.2024.10.11.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:02:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-yarl: Add missing rdep on python3-hypothesis for ptests
Date: Fri, 11 Oct 2024 08:02:12 -0700
Message-ID: <20241011150212.3576668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112806

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
index a7406dfb8c..d0b8b0d0c2 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
@@ -24,6 +24,7 @@ RDEPENDS:${PN} = "\
 "
 
 RDEPENDS:${PN}-ptest += " \
+	python3-hypothesis \
     python3-pytest \
     python3-unittest-automake-output \
 "

