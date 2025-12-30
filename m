Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A362E95A89
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63172.1767097500819649037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dy/yZUHd;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314f52so5537755f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097499; x=1767702299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFB8RZWgFcIU97vdjicuSlzZY+wgKSw5qk8Hp4nSEW0=;
        b=Dy/yZUHdR5zgE638E/GDvUQjAcOh8xYfgXRc+YpDg7SjbILzq3WZ0gBJeYVT0cyFXl
         q2H6o1vstfj4lyrc5YaXocBaztR6GItuZNqvAIh2COrB3cj5cLYdUj2A5+POJWygeQMy
         FmCWo2pxtsilLQAhwO1me67z1WVttbdxwiDW7SQltHMFO2C+pUjM2qIgY/N+PuWVKpcg
         xJoj724E3GDoSNzHWr7WnyrDxnCC9UZ9zBv/Z0P82IAi0DIJNDPuKSaLkcRifumSDbaw
         Y9kUaQVhMYAl73I0TlcblNkPxYopJwltgHKtwn6hbFjV2VZEHx/BeCr6FgR2FNIPPAoJ
         exvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097499; x=1767702299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFB8RZWgFcIU97vdjicuSlzZY+wgKSw5qk8Hp4nSEW0=;
        b=vFSjXu0GsQWWJzSqCThaLmXwVj/U9y+kO57fnYh2/zFQyrgBGXtPfR/KpgH6yGVw6/
         1Dp1a2AmrwYM7t5+Kse2k2i/dqrrbqhyaiU+nONMaQj6Kbc6Z2BZ6LUXz+ecTOPN5IUa
         rfi1naKAqImdXZl7/xQ7LQPRAfvAmYp2+8IAq7MCPmqwtyJwVkWJWEFR91aGFW12dnKB
         dXGvAM5hLNcKQuVhje35Oj3PzWYGTiGKyROrGfvAxRRfRomvh0vtStMQdFwqvq1wyCPt
         hIN5m/V/Z3P6zvZsgPVSaPi4WiFt9SqoE2pQYoE1R6qZfvxCRfmdiIVh/GrJTp3xqkIO
         RSxA==
X-Gm-Message-State: AOJu0Ywpxned+JAiAOEvt+te1dIXCAltVWcbCB3f7bVshMuYsAoKQ7AU
	Ho2lpv6RXD1IS4wxkCxF+EXoUBMqW5lwS0CJcnuwoUvcxqSTX7DXWGAIck4Kcg==
X-Gm-Gg: AY/fxX5LBqbB3goXsZi4AcNK1VbJVs46X/VomSbo+5gYbVcxMQBybucOLlJs8XOy2Gn
	YY3moyQYFKfOSLsLIj5TvrAsgUjucBoFsuQ2emibuCNRhjJOWrBFIiitcANbzeu+mXRZrdDSYdw
	pqmnuOPZzFQPAE3NsMsRRmTK4gCD79Si6JVp0bPsvB1qgYe3kbEZ+x8sZYzwCi6f6x1UB6sXUQ9
	o+I/P/oT79ly6TaeWqdnEkSaptOHTv7PVRLa+jSGlYfhX3qjivi40SpSorvoEM7HxJQGxCwzGN9
	Up8Gxa5nGlWsRqx6ZiHgx1DOR3QTm6A+wGHPfLRpQvwP57JuFl+TXsn/7qAAjyBTKygA6lBn+BU
	wQIA0FfG8VM/Zu9Y8qN/5izgNnppSRNGsax7blh9vKRaNS5E+bQsHbS4pqFQ2Gl83wo3m2x29Ha
	jndaXagrem
X-Google-Smtp-Source: AGHT+IEZ2Fuk1L4Rvv+ru1W2F9qVmVINDRPkc1p5mzA96utx4t7bLUh8F+EYpmk5LeV7+ivX+PcXGg==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr42234267f8f.41.1767097499060;
        Tue, 30 Dec 2025 04:24:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/10] python3-pyrad: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:50 +0100
Message-ID: <20251230122454.721515-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123012

NIST tracks related CVEs with pyrad_project CPE vendor instead of "python".
Set the CVE_PRODUCT to pyrad, so both can be matched.

See CVE db query:
sqlite> select * from products where PRODUCT = 'pyrad';
CVE-2013-0294|pyrad_project|pyrad|||2.1|<
CVE-2013-0342|pyrad_project|pyrad|||2.1|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
index fbe7a0924a..e8cfffc9cc 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -19,3 +19,5 @@ RDEPENDS:${PN} += " \
     python3-netaddr \
     python3-six \
 "
+
+CVE_PRODUCT = "pyrad"

