Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A60D36108
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.27877.1730831932945606946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VlODx5LH;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e8063533b5so48281067b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831932; x=1731436732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKVavywgqAroVavH1Y5N54WeaHKJxqU7zqM5OffEpB4=;
        b=VlODx5LHJepjk9iVMVxah+HLOvH0otbK721NnmyzkasXvghpwINZ/34LErjcS9NyoR
         Dj6v0KvsV/vjJqSiDLd1HP8VcafWcnPMDHlD8c9pFZkMB65LLAQQecig0p4Cj/dWiRls
         lZtHA9mKjt5eew+WSTsddwazKiScosY5GIHfRZGcfyCYOKwMgCsXNeCHN5yV1vE8uv2g
         gTkGuAgqDFnS6l0y+1NGe0g2YNYFdd2sW3Xq3+0CCbvGM4Jol1yFeM1gYmN52d/A1X9+
         oyFaMlYjYRrxrAZfqBorpYu7YvBQDdk/a4rthwYsLiDZN82ktCHuU5nzWvU3dXdr9Iof
         dcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831932; x=1731436732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKVavywgqAroVavH1Y5N54WeaHKJxqU7zqM5OffEpB4=;
        b=afXS1BXDdLXTNxf6YthpAQtHtXn1Vpgw3rSYN+psglS4pgc778ZteY9B6S52cT4ZOZ
         IhV/qwECCaD31URZrgD1QcbXpGnC8but2dMCr1RDTAQzIUxeO9nLVswnyMm+DDUZAuq8
         PIk92ZW17xwkbC+zgyJ3po9czT8thjvqVLlT2oSqstaXaMT33QkTNigSeImzDKqkKP/X
         IQLc9m/n5yiZz1epAngOYK29pyOpAy1l58jJ30OCyGc1PML4MaG7P0V6Je/d3dYIMASq
         eVN3dJEhOvVWBScTb0VYF/JUB8CE2EL20EhEgMF4pRn7ArsfvX4ff56aknzuHBVkAaTD
         iQzA==
X-Gm-Message-State: AOJu0Yz0o3bni8usjVU/mjCvvZnu0QBHjbSZmY7vB3eCy/VyrjsCeLId
	C6iPVP1JkhKX04LWtBSI40FZdhaJG5t346BoZc+g5ikXswIH6NItghtlyuTI
X-Google-Smtp-Source: AGHT+IHHri00HVD7I196NuDjoOve1V7IY7q2dte1oLgRx22DlSFuXh9mkHnPujTcpYJZIORUlMY5vA==
X-Received: by 2002:a05:690c:7482:b0:6d3:be51:6d03 with SMTP id 00721157ae682-6ea64b27563mr163952827b3.23.1730831931574;
        Tue, 05 Nov 2024 10:38:51 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:51 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 065/161] volume-key: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:41 -0500
Message-ID: <20241105183658.34982-67-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113580

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index cc03ab4fe..92a9bbb49 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "200591290173c3ea71528411838f9080"
 SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd77309b"
 
 SRCNAME = "volume_key"
-- 
2.43.0


