Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD7F108B8F0
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:45:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9813.1774003530751331079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkU/TowP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb14227cso17532805e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003529; x=1774608329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ44+mE4JFzmhjCh8XIz8Dk8ap5WIs6TaAV9tVY1o9s=;
        b=NkU/TowPGj1WHqYracV2bSjUq2I8LoZ/IKAZ4tR3n5/fquguuN9kOYhDpFN+ps7D29
         J2yQ4gKcNFYhr65Nos1l2TFLjvTcL8zIXItzCN3K8OpuDYgyj0K8Rq9tQVbWAmvfl6Cg
         iMTUuBhcUY1K8kByLutHK4EssTxMvw/OoqsEgXWhOy2lHZWqbGWShNGYFLJzMmvRbV18
         u4zzTm6+pSK98fwX0HeFOWgzheM6m1F022NnAag98eTmom50yG5Jp7JtD8ZWsDRvO2Xf
         TeNDPOojQ9aS0/zI4bcj3tCdm9w6HqOVFD517xSPqEm87O3yOHls7luaxrGXX+X+tvL3
         3YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003529; x=1774608329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ44+mE4JFzmhjCh8XIz8Dk8ap5WIs6TaAV9tVY1o9s=;
        b=KUYt1inW/Qd5i24HcVrBunITC+TihjOuYh4nMBwsdcrj9KotBpvKnqAd8yG21l6UBi
         eJ0+dVxzrejwe+FAgprNHB0PvyTaS/lQIVdbxaWHMFSIsRWsvHkOa+Tg5MTVsG6dcsIb
         YatC9km6RBdHqynnWOAkXh7pBw7QUZfe/s/Sppm2l12oWRtURUJ3mDHESUI3AEc0Fxlo
         17caxEB3JeBDro0lVyz42uC86IaEo+3UrPWhsFgqheqYQppGfoBvEcK0nkQXEUsxZNsE
         z30cFSUH0HInXBgaLqKXDY7KJNaUzBlZ7wAjNejqzlWCZ22LRzNGhWg9PBi9ug5Z8NeH
         OP9w==
X-Gm-Message-State: AOJu0Yx/U/ntdy1tcZyX1AUrk6yRQoyuwb4iH5aKIylgWz2W9BFk+pz9
	441zIGjafdBcoPJ/9vr8lICJLM0lLQzg3ISmPLlE2GymDID8QWhKoeJLUJcioA==
X-Gm-Gg: ATEYQzx9pXHfGLY8VGSoMQjS3b0mglXDSXS3uHSXzKmwItRhhCyp2EwXfW8CmpqvMKe
	fg2yQ1X3toqAiYrIjNfAl6h+hQhXts6wKRhyhaOulgbEOzn9yOQEifYVWrgEX8WD6VCitYWWOua
	rqGHkkTQFmNOUNDb6PwkcppnjSdxiSqv1AsKvYyrZO8WF3vVKYzPQSRLZi6SsK7rlIkmV6//rlk
	nX04jIQ1jX6XI/gUze90fJgbv9d0MTd0pRzEVijatvM466kQ3wM+YF7EN0zPz4tkfloZtnIb9RZ
	Lm2c8CD1vBnWw3sHNbh7raEpLa9hh8rKUza7TaxOaJ1FQzg2++dOPmBBHHfqUFWAGQd1eV0AEd+
	ibNcoe/hZq6z8wMEGcHrbWYf7G5MgO0vMMbZhYKueno7C4X98In3+APvTucMVnWSOXrOThsSIq8
	ux7RDsF1uZryZDWKaZ1Dza
X-Received: by 2002:a05:600c:a016:b0:485:3a22:69b9 with SMTP id 5b1f17b1804b1-486ff024e6emr33559755e9.29.1774003528596;
        Fri, 20 Mar 2026 03:45:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fb4309d1sm149475385e9.3.2026.03.20.03.45.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:45:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: add missing build dependency
Date: Fri, 20 Mar 2026 11:45:27 +0100
Message-ID: <20260320104527.2872785-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125434

Add openssl as a dependency. Fixes compilation error:

| sign.c:16:10: fatal error: openssl/opensslv.h: No such file or directory
|    16 | #include <openssl/opensslv.h>

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 4f4d4a8670..66e48cfd84 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -2,7 +2,7 @@ SUMMARY = "Inspect and manipulate eBPF programs and maps"
 DESCRIPTION = "bpftool is a kernel tool for inspection and simple manipulation \
 of eBPF programs and maps."
 LICENSE = "GPL-2.0-only"
-DEPENDS = "binutils elfutils elfutils-native"
+DEPENDS = "binutils elfutils elfutils-native openssl"
 PROVIDES = "virtual/bpftool"
 
 inherit bash-completion kernelsrc kernel-arch

