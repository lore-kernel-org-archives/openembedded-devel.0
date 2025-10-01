Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05BCCCD182
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18617.1759326777176658925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWcQsj76;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so13685185a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326775; x=1759931575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DtCwZwplBaKk/D7NyC5MBQKKj8Hih06T5C75Egpyuw=;
        b=RWcQsj760CmAp5ioaDdVKNYGD7HkRS1rld6p8yxqB0T0KDEH6HvbKKu11fRnH7kkO4
         cpIkR25tTLiQvVaSlQegqlTc81MqVLsJxnPCAvNwog+mhOJ5TxbomEj+DzshAzbEJilH
         tFzE5GcsUA8TZzqHhyudC0BVCyx/DzHW/1Ugd3UB/lAnIz8kgP12WyID4RJzmUyJnk+J
         cPkNRaK0FGVLrEVuwA0ERSGzF+TeJI8jJH3BZXxE1o9LiyL/CnqPUHNeql20gGz6J4qb
         e9D4D9TmxqX9KpyA8BW9eBQvu1MnkhXK85As3S+ZZM3hUMyEaB6dFEFq37uCRQftGQUC
         zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326775; x=1759931575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DtCwZwplBaKk/D7NyC5MBQKKj8Hih06T5C75Egpyuw=;
        b=fcuo8AG5gN+lC9dwKDMCMQEKuLmV6XE2hOmlVverUIfJXoWS0YI0QepLnaPLT7m4/7
         XfiU6chDrRDKq6VIgLuuyu8nR8PpYh4FNdk5TFtwWvpkMBCvokLJJudJxpKfV1gBdtxB
         lxvwDqgWYDv4PWzEyhOE1L2qSdSO2wXgQh1QLdyg9b+LVt2TWOSQ4CdWNKvezQHG6hCa
         mQNj0sPuO/qo57pPQRCqaLtfJtfQ6l3ZQHvjWGCAn4eV0NPf3wfo2QEC6fZlr3MLysmB
         myaBUimbmXrOCFJi67ciWGvzjvVVOHxdLs5/N5Z/k2IkM6MAdJgvL5VrDguVHz8zKv7b
         Xshw==
X-Gm-Message-State: AOJu0YzFwxPlR4Ft4TFiR6GmIzcZaZmRj9SQgHdO9GaXAO4TchOef088
	EO4V9xy24PDKe9u7PPMZ21M5+EZJNqa4tg6oSdpcWkFDYFaBQoPXCdVXH7ssLQ==
X-Gm-Gg: ASbGncv97nGRfpvMVZSUCvmfpDQ268mhiOkfpUgujxjr1+Pd/Kwnwu/dzGkdpFcf7V3
	oqIsUPUDhvWwB+Hzk3qxPK3CpPpWaG0whFZqZnYhWwh85Bv3QCu7ITB6frywy3epTafxIZpE64b
	V7zQlzA8fpwKdF80ckrN1FUwQXz5sALyRuqfF4bX2tfTo8DNMUe81PfTIut2IC+M4sn/Ot1Owos
	jpXYqhexUIkDcsDj+LhK4HYrDnhL+1E7rCKNxrVuxNxyt0P55VM5BlEW3mUY0qkg9EuBYKvCPCS
	9hF6xm08tnWyVNNLVxPCvRMX34n19Q9d0U/xgUD244pXRK9rHpN5c93YleC6vaeJW8+bU9w0sEu
	bAsG3fhgmyr8z5QIVgrmBuwLwMCVZwI9Cvpcg1XCbEwp2
X-Google-Smtp-Source: AGHT+IFWD5gaIqB3WOOP47gEMKs+5YX8Am4lPjLMxS6l5by/zXTmIzz+FS6ozYCPVsnhrsmwB2jd6w==
X-Received: by 2002:a05:6402:40d4:b0:62f:19e6:401d with SMTP id 4fb4d7f45d1cf-63678c0d4d5mr4178296a12.7.1759326775481;
        Wed, 01 Oct 2025 06:52:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 13/25] minicoredumper: correct the sysvinit service file attribute
Date: Wed,  1 Oct 2025 15:52:31 +0200
Message-ID: <20251001135243.1490753-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120128

From: Mingli Yu <mingli.yu@windriver.com>

Add the execute attribute for sysvinit service file to fix the
below error:
  $ service minicoredumper status
  minicoredumper: unrecognized service

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d477cbb5267f39846d129f27d0f6a7f2b001db7b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 0b934ee2d8..76b1d73fe6 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -37,7 +37,7 @@ do_install:append() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
     install -d ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+    install -m 0755 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
 
     # correct path of minicoredumper
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper

