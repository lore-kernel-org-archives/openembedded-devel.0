Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01F2D35E37
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.27876.1730831931883020485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDYzGhjC;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea1407e978so54712577b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831931; x=1731436731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqGOakxQgsxdwVNJaa7VqVhk0k/Qa1DhwpK5O65FJMk=;
        b=VDYzGhjCwNiNVjglvu8sg+ILyNjmnMBFDqWLa8Pj7klW3BNTbyzzrOURzRnlBsubuY
         udWdMJ/Qj+P6Ip5q6Gb+JivNfnfAI32VQtR+2owLet5GxPLKAebPEmaXTG6g/m1CWN80
         GyK5sCX5zUpFyWvdd4Rrf0MzAuU5CMLTYmhDQOTl9jIMESQRSN/sFoA+vy+Azg3KdkBU
         LUKitFd1cQ3X4gB9CnvehXXU2rHZb9jB//feICfch1RF95Z7xz+5Axm3qV0+gRv6Zubw
         +O8v5j6b1fhTCi3klDFB1AlFnbi5TKIvJguirNiA2zDOYP73u1fiCmphj1nxXfQ79FMY
         Nu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831931; x=1731436731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqGOakxQgsxdwVNJaa7VqVhk0k/Qa1DhwpK5O65FJMk=;
        b=wCyCAbX5cwkfhFZczgtt//RKGe7BAyURu3EYxW4ZNIQHwVttV6q3V0Sy9DmBIG6r+d
         aMsjmNxvT3XhBms9eJ0LTZFJdWnjPp6rflo7A0FCo8xQ/a1Y1W/vg4jyuy+Sl5EvOG7K
         6RwydJ945ouwnrO7Suayu/surfUza/Jpn6Uv2sollQcWcc8dOhnz9sZxeR4kCsmuV6Lv
         NLUsspIg4jTw6DVPsFObyFE7HU5lsa3NhgI9cXG/9aiKPmg9CUfMtS76ZKDqcBvPfhbt
         1UTgObIfXw0elTZKw1LHAziUJNSJqhFrDwBuY01LhKjKJgyQnFhON78xYgnNSJzixUzG
         jOlw==
X-Gm-Message-State: AOJu0YzakwweBSUz8RDHt+7StZr25yc0wBpjiPYhitC7mg+AhPmv3Mtl
	DSIZ+rEq2k6qEy+QliuIAaSmpsNKwGTX7wCpmp2m5F4S4ap5xWkT/eUMLUg9
X-Google-Smtp-Source: AGHT+IEeLlo3q1mFSTrMP8CcjKjwuYDCFVXJz4O+x8Hvm5ljCDgNp+0ZojVugSpsSBvPCKdRIvx5MA==
X-Received: by 2002:a05:690c:3810:b0:6e3:3007:249d with SMTP id 00721157ae682-6ea64b10f76mr32534847b3.25.1730831930524;
        Tue, 05 Nov 2024 10:38:50 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:50 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 064/161] vlock: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:40 -0500
Message-ID: <20241105183658.34982-66-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113579

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index 948d8a281..8f9f87b37 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -16,7 +16,6 @@ SRC_URI = "${GENTOO_MIRROR}/37/${BP}.tar.gz \
        file://vlock_pam \
        "
 
-SRC_URI[md5sum] = "378175c7692a8f288e65fd4dbf8a38eb"
 SRC_URI[sha256sum] = "85aa5aed1ae49351378a0bd527a013078f0f969372a63164b1944174ae1a5e39"
 
 inherit autotools-brokensep update-alternatives
-- 
2.43.0


