Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A82CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 14:53:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14087.1761058433728840793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 07:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5vDCVoq;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-471131d6121so44818475e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058432; x=1761663232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcZMhsGZ/IFxKMoW1xk6T9Ac2Gai9ZZZo5Xcq+Zsqss=;
        b=D5vDCVoqO3gQZJfAEmlo6WvI8V6NcuiIWfdu9ZgR+rjTR2tgVWj+yuGEhcCqNi13Q/
         2PLM5RVq8D6tXbbxnUaibzAwLsEINHM7HHmTVEwMLSNNPhxSAEHv+Tn3wskq965oLWwQ
         jLDLdWu46G53sVUYa6WZLLiFCbUPmvFna5JTX4PFugntZvOH7lwkqR64Hzh4fG1TViqz
         RzrrmTWlMSE7KUC/nooR7nGmx4tbhe/JWvw4hQAhlKUu+EA5fuBKDd7JzWiNyi7SlX1Z
         Bew25OS0xkftK8VfkqMc+rLP6JU1XFL+xVOj4W9i61KLWVkZ4pBKzPBPdJ8bGpW/KD7/
         +FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058432; x=1761663232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcZMhsGZ/IFxKMoW1xk6T9Ac2Gai9ZZZo5Xcq+Zsqss=;
        b=n/LLs0L/w5tHX+E85IuAZL/8xkcmiIaXXLVTUoILG2n4V9ZpUjI5RmECD2QBt1VHbl
         uQpdEm91aHaStHcX2Q6bYz4NElnjPf4kdzNFJ+2N7/WPlbg9HA7jUKcGtC62emdAQ79k
         UwZCPwCG/l/kFcYdI3VX2enEbnlM9L49990/A28VvJoxP9BLUGA+zukiQ5y5aoHQzxNP
         H7hVzeBzFsjU7zhT8rQo5XHgeYINVxClGrA41lCyCIpPe/Uzjq/PYCq2zOPldLlB1Ppx
         ncxCQANjK9PPfv05TEYt6QctclxZ2o6BiNkIdkb3EeY6xLmxUo5E63yhQN3U+0ozIZEg
         XkNQ==
X-Gm-Message-State: AOJu0Yykkufa6aOxikc+PbWNymuY8LDyaSxux043+TFL7iBpy6O24PE2
	UylO2gtMAemdxDsXB2u5bNziPvw6E4dX2Fk+rQrhKISrnXaNYYxjxXNnaZxDIA==
X-Gm-Gg: ASbGncsGcbAYvgpJDbUgoAmIudywlA+R2PJr4f6BaGVCk42KFCBObqQhpdv4dQxF0VE
	8knUz9GX8YXaUXHYeJZtJwcdyKGJkK4EE6BaXZ7/Yf46eceKRCp002SOJSnPxhIwpLsQ/AWaR4U
	MECMssRuCETXc8HwKtU0JpelWKSAF4qdciaQekSs42Ug7ur8Jz2DW1Ui4qFYm9dvTcJd2Z1dvb9
	CwvAZt8h57Fr5ntkuIh2zL0MWntegtgjfXPQPmIhZSq9OP7LxqnaHWdVKGvA9s+c46mETnoNw4A
	kxPD57vqDTaGf25ckSgz+1qf9lSOrMmIiZNA8ROZGPr/g5y9Moc7NS2VFw62f2C3lIdI1bGEoDU
	dtPPWKJ/5MEgIGCnKiOtGkkMGdphViElmcExJxn863QTlWef7Bu1QqssBcExrVHsmQEDIe3gmf2
	pvRbPqAmVI
X-Google-Smtp-Source: AGHT+IGHuZUJhZUNKjwqvsFDhqTUF3jjV4RtBvuZGslkqASMZPXBDFjlHIUy3PH6RzWpo5fpRnn4eg==
X-Received: by 2002:a05:600d:41cc:b0:46f:d897:516f with SMTP id 5b1f17b1804b1-4711791c880mr148218685e9.34.1761058431620;
        Tue, 21 Oct 2025 07:53:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm283259535e9.11.2025.10.21.07.53.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:53:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] dash: set CVE_PRODUCT
Date: Tue, 21 Oct 2025 16:53:46 +0200
Message-ID: <20251021145349.33878-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021145349.33878-1-skandigraun@gmail.com>
References: <20251021145349.33878-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 14:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120836

From: Peter Marko <peter.marko@siemens.com>

This removes false positive CVE-2024-21485 from cve reports.

$ sqlite3 nvdcve_2-2.db
sqlite> select * from products where product = 'dash';
CVE-2009-0854|dash|dash|0.5.4|=||
CVE-2024-21485|plotly|dash|||2.13.0|<
CVE-2024-21485|plotly|dash|2.14.0|>=|2.15.0|<

Our dash:dash did not reach major version 1 yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1427013e01df44b9275908f7605e8e25fc3fd83)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
index 3674052311..904d8a74cc 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "db778110891f7937985f29bf23410fe1c5d669502760f584e54e0e7b29e123bd"
 
+CVE_PRODUCT = "dash:dash"
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"

