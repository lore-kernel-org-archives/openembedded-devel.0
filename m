Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D9AD35E21
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.27835.1730831899787817179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljha1E05;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so5109725276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831899; x=1731436699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNYSRWa3qWqQNvsFuwIkbBvjJE/MqtXjFAvqhmnTNfU=;
        b=ljha1E05OVBds8AqiSctQ5N3wiRjaMB0Fq2eos3Op3cDQP0C/m0qAdglvckHcwBsIW
         ijxoqBKjueNOn9/Gm6zSbfyXH4t75zmf01DcPY0cz0Oe+6Nf1WcIpISTto4q49bY5giF
         qAY3GLRWIKNl27XQ3gR44m2n7w568PTHg63BHxX8oNM0ZqoogPrKYYuRPsa0nCFWg77Q
         uKfGsFiLsefdDAHLStUSlRouuaqxWxD+KQ3QC6a6exLbo4Pe+4N5xwMnMRqS/mzgDsPs
         34s0WbjpmeR6H6SOsM51/8mPfEfiTq5vSXTX8eWouKU83210eTrYMmeEjwBJM4fZ3FOa
         u2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831899; x=1731436699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNYSRWa3qWqQNvsFuwIkbBvjJE/MqtXjFAvqhmnTNfU=;
        b=RcETP4zAreh51tgVivKT41B03ds8f2N/7rGnCVM0BkQ3UhDRnjYtMG0HM+dY9ovMfh
         uMD+2y84DENJ5XxWHj9qkzeJnXLK4HR0D+7zqjxKQIi4JGQikYRgQxGyTXg6mRURfqIV
         vpBrEpAqLbneIoDGv4aAn+ZNFgD6jbONu/VporsLtInZci3aHzUK1DF0I1CjXnRBJSBf
         tzc3yHC+E+6oeJZmSv52zYgMqLQS7MUQbGlC+gFHNuBPJq1zyB8e4uawCDzOzq5VrscS
         vjIJdqpgCGaFfEHrQ/yZm0lVS4LqR1AhQZ8/xjhcsG+WyItDI7dQvhlN1wYsjz0ksZP9
         Rq3A==
X-Gm-Message-State: AOJu0YzTh+luK0LPJv/DHhjXdjTnd4/GX8wa1ihoedlEXRIqM8csk4ar
	wjPC0YFiLOPEKZ+TRwaW3FHAs/hE9+k3WDi1FK7xUt3aFpfx+8h4y0u1jmKO
X-Google-Smtp-Source: AGHT+IHs9MBwmhitFR9qCwrTH3S+I427+bHFX4na7ggDYp4PwPEy6IVH6a5OZAwwRWdoE41KFJpDtA==
X-Received: by 2002:a05:690c:30a:b0:6e3:4190:ab45 with SMTP id 00721157ae682-6ea523610b3mr214073417b3.15.1730831898322;
        Tue, 05 Nov 2024 10:38:18 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:18 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 027/161] autoconf-2.13-native: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:03 -0500
Message-ID: <20241105183658.34982-29-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113542

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index d0e0446eb..f928ed965 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/${BPN}"
-SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
 SRC_URI[sha256sum] = "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
 
 inherit texinfo native
-- 
2.43.0


