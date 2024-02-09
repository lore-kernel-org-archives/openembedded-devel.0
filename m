Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F5BC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 06:14:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.5839.1707459262826678788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 22:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UATZ+yqW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d731314e67so4167175ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 22:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707459261; x=1708064061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u3hAf+TLDSPeNJtmcRIN8dgrHRzi1g2tw8ZZfKSqdhI=;
        b=UATZ+yqW3uXu+Lo9kaPtm7CA17ikIT1LmBGmkD3OUpSvR62Gv914AHlnH5BrPrrkB6
         3st3YOkmPF7iLtH5Z8Lhg2P08jpPT5ibpbTYsb/+/zt0YEfxg1JmL9AV8/heiuuOa5ZM
         TcMQ24R1IRJKi9HYiUKvYWb7kPs23Dolwl3XL4VRlb8DpTmPDC7PMys1Xg9Ls4sAw50k
         73U/7saex676r3cLwrtQma+uAkCyxLeh7BmaNQIdXlVZxzg9JfmfB5iAp6B5coeWcMFu
         MBusp2N+1iHaLxON38DeQMX/fWZvhO0bgji7hOpM5iwIY9eKmUDebDju5NNFV6ZKgn6l
         e0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707459261; x=1708064061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3hAf+TLDSPeNJtmcRIN8dgrHRzi1g2tw8ZZfKSqdhI=;
        b=ptuYHwGsQK1SCRlxjlAFKJLxkCd5y7APdPSZ1ID80w5CsFcdOzjBk+IzxrIrXUL0w0
         jauKyB2ohOYJD5a0xizABuGxFsatNKMXwrps0lEwGLWb7Ya/9AcNJ1+1uzCm79dRmQOq
         C3W/BbrUxilq3n3OKY8gxCCQyRG5WA8vCAzD7w6Ue2W1D3WV93xXBWvwqsu9pYbwX21+
         0c23QaNUuYZWMpocyAzzmtw9Fn4NzIX8U4gi54S4R1vf2GNzUFygdTajkpqGathjflU/
         ccZG/6Sos/sXfcs0ZRsxPRgZa8VeT5vK6lUFu26ex3MDukDqSELJ6VzU/VytVYw/gMGh
         0RQQ==
X-Gm-Message-State: AOJu0YxukW2p3Ba6kCqY+s+emMSKFuckrw5M9lnEtD9r3CQzbfpR/HW6
	Iam7KTK1SLgpUVHwpXzhX9+dSyAJjN1abrWRYuLu/h1ZrxI1eZPv1p/biQKe
X-Google-Smtp-Source: AGHT+IGjKEkwQ7LsQtIa0/yADVGJUCG0hVwmfH5cVn6BRZictgd7LOLeP15QPE7JvRuu1FvnnXi5cQ==
X-Received: by 2002:a17:902:da82:b0:1d9:66de:ea0b with SMTP id j2-20020a170902da8200b001d966deea0bmr700169plx.37.1707459261408;
        Thu, 08 Feb 2024 22:14:21 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c45:770c:9b88:c7f8:8927:6fa9])
        by smtp.gmail.com with ESMTPSA id kp15-20020a170903280f00b001d90fe6da6esm746093plb.305.2024.02.08.22.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:14:21 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-oe][master][PATCH] nodejs: Set CVE_PRODUCT to "node.js"
Date: Fri,  9 Feb 2024 11:44:08 +0530
Message-Id: <20240209061408.164462-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 06:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108679

Set CVE_PRODUCT to 'node.js' for nodjs recipe

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
index 0ca0c1498..5cdcd2767 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
@@ -44,6 +44,8 @@ SRC_URI[sha256sum] = "f799c66f6a6386bb8ac2c75a378f740c455e97f1fe964393dd39c9f9f6
 
 S = "${WORKDIR}/node-v${PV}"
 
+CVE_PRODUCT += "node.js"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
-- 
2.25.1


