Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165F6CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 16:49:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.152.1758905351876638103
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 09:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvMJaE0S;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-780292fcf62so1904692b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758905351; x=1759510151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sotd2I2CvOdZxRRYJjTsspen2bGqcLbWopO+xvvz7Hs=;
        b=XvMJaE0SNixMR9Gv3BurKtLxWOwFjsyQwBdBr/r6Q+VBjnL03+OcaTlKvpQizOuNiW
         +kceotVD+DkqtA01mLOJ9ubOTrfQyGNava+gC3IGWhkO9M7QNNuVdMXDGTLtDa3Cxc8g
         2EZSYji6k0sG+Qp6h22P/5UsvAlCX5z2VLVa2A3Hey6rYA2YL8Yn+yT08gIPe2EQzING
         Vun+T3xi1d1rSEY3ai2dobcamFCvcHPkR5rLhcfjWNH5lEGivFQIckzuoYA7rAceAZY1
         3wpWruANCiIILv2zweTC4n1qFGOICesniwkURYCbga1+VSzjMrRBYkIiNJtabpa7X2Rw
         t2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905351; x=1759510151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sotd2I2CvOdZxRRYJjTsspen2bGqcLbWopO+xvvz7Hs=;
        b=XePSIWBdumx7Uwfx1lhfs/1w4MzaptXY0NWtmACavcofIKAJq+2x8OcTR41h2pspuo
         ZDvwALX9LRTWk0mv+yai5npiKqUNrY/YnIQBq30BShM1PsmJNYzgnKsyxMxKtbGf4m+r
         U2jn7KLM/iqUTg7ag4egoD89DUQASeJyi26ExP3m1uyw4L7jujmmGXRW/uLYH0WoVEC9
         6v4RHg4nyuwsyuWZoORKmngCxrLeB1jcIbb5/4/Fam39OvixAwgucqt7Meq8n5lanJ1S
         dJpo3JdfWSNSGjh8y/vpyX6VmlEgc3UjEH0s51qTBSebdA3gm4WzCLFkYBKHcIBpzalr
         vP4g==
X-Gm-Message-State: AOJu0Yz6gveE3Jd9SneMKRm5pl61sj8Y2O+0Fgvw/tMVyPjIS9ExVbfh
	l4hSrPSgTPbaezu9c6Gm2DgUbLKuJyTs9UyWIffaXpWI/MNsoJYLqGYtrT3XeA==
X-Gm-Gg: ASbGncuPvihGJZWXDnVlcMqHtLqq06dsS017lYMAUjYTcKs3/3z3yMc6Ps5gTsXP57p
	zVE1S2oUNiVCr3Ld42I7FRvEQTqATP0q6QGUdZrlWzUA6HNIJxOy9ceu8lvXwr9vEhQclFKNFG2
	BLj8Lg/GFERQm5X0/S9UoHj1ofxAE/Gobn+sb9Lve2lN3doeQ1OB0xNpxhk13Y9S2kXSRru6Z0m
	2IW6WSwT03l+MK6BtQCK5OwKw1DRxQanNztEVb1DpM3XCs3LLSwq0Zb1i6r1d9tpfHifXbBDuge
	A24A/AiIBT3WzcIW8EC0l+s5TfKBtwplgcQAnQf7xwmzzIev4nsrjw3sSU8wMTDwSvVwWSqVQGG
	be8k9V7bxhxzA5g==
X-Google-Smtp-Source: AGHT+IG/myq8tnsBEpqWHJ69ayOPVOWT7GC5i7ooTeKAEWCf/fiW91693+ctYHqjZ6GMS+hZf+r+mA==
X-Received: by 2002:a05:6a20:918e:b0:2bc:ac1b:60ab with SMTP id adf61e73a8af0-2e7d437ae76mr10029725637.52.1758905350959;
        Fri, 26 Sep 2025 09:49:10 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:d4bf:d4c3:9352:f98a:353f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm4765795b3a.88.2025.09.26.09.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:49:10 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] 1/2] systemd: backport fix for handle USE_NLS from master
Date: Fri, 26 Sep 2025 22:18:49 +0530
Message-ID: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 16:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119933

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Do not build translations when NLS is disabled.
(From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)

This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
from master .
Since the systemd version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-core/systemd/systemd_250.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index 66d20a46fd..087c0035eb 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -235,6 +235,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dmode=release \
                   -Dsystem-alloc-uid-min=101 \
                   -Dsystem-uid-max=999 \
+                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
                   "
-- 
2.43.0


