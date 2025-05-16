Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB16C54756
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:04:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.17150.1747411474469187147
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCZyAwWW;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2008900b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411474; x=1748016274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs8+eBeIHMyRBxspjUKDkQ7yZYQW+JQXzzjX+whIuE0=;
        b=HCZyAwWWuaiYfiKJTeRVsEr2z7Rv748ciZKTmypLLU9Q6j9fqHeFeBlO1UokoBYKbx
         xBYMEJALN7cyrzxvrg/8KJNN7mOkJCOg8Byf8qJ4uhR9MRU3MpgBLnLMJLKj4jYKLQ/E
         aExmqfUfa2JpCDI4pUq3F9HhE6KUBGTTtq591b8j/+WqBI/e9u4OxblnzRsFTr+Ws0kQ
         74Wm8uQiMk2YHb8kCNIZmZVpY1rqSPIAfJYG+Fa9fP91DukF7+HOtCL5UsZbd+hmCI/d
         ixaCTuDlWkUyKnWvzdM4ttuPQtA5sXlnafBFgyyQiiXz3+837aa2E69MGIW3TjxCFan+
         gJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411474; x=1748016274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs8+eBeIHMyRBxspjUKDkQ7yZYQW+JQXzzjX+whIuE0=;
        b=W13QWMiBnNCkdDAxfkdBCJ1hciQZTS1CecSiath/NWFj7VzWWQWUu4F3Aj0ffk4u6F
         t6eoFJWIdmY7udYkiiNM01ohPQTZGhqO6hdMwAiQHhMn45tht0SqxuxqUp6rBBbVeMrB
         CkqRmpN4AymAiTMn2luJEUrcDK+wAGBC/ETsDJwmNTk0oC7bO/LRE0nN28rkREQMLNI7
         X2RyPMs1sDl7htsYY9z6Dm1Z8L6rX60OcLh/r54iqiKR2MGrjzIB5Hfy3Ftbkvnz3o0Q
         2PfaZbiB/oHwUafI9sqAFM68gUbQM1xctBLDyM7qPFEQfiv+hwwCTix+ZDUy6aiVcVcv
         EKMA==
X-Gm-Message-State: AOJu0YyrCoz/Jxtc+A7j84RdEbtb5uzaN/x4frJMJg0Lbw8rp/MBLiBU
	QLS2eFwzJdng/Bw9IYu/h+8fJqbvY/N42pWWXYquQb+pvHy+KGxi/lyq64v2by91
X-Gm-Gg: ASbGncsGdZrrlIuWVgGpEXS/yQ5eIHM9CPCbTqcIFBl+IE+LlaqXEQJPakoJcVSScyY
	cw1i/BZTk+O/JB5DIaR1+a5QYPC1zxLz1Bip4GjG7JnxTajx1lwHaEBtthZF2WWZ8f82oE+SZ/U
	Z2T8EqdB7Fy4KBCVGLTOn31ErB+j4aTyG/n35jjjvAeAcQp6g2hDiih8Y52D9yKMEQzjrxOtMls
	o+/Vs8mp57jDQQwr9mVn6eUS18yQ5MgbmXCCb8OTy0OcGD0BAZTmxJcWYS2Anr1TveeSns3yA5W
	mzSgeV/r8aX+0VsDQFp13XNV1HZthaOtVpwv3HLHprE=
X-Google-Smtp-Source: AGHT+IFSRGhTrggk6X+C/kit9F21Prz8WOyMjZFgz/lqVcseP/0YSdecdVCNRAKKQV8E6skI+BUNDg==
X-Received: by 2002:a05:6a00:990:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-742acd72901mr4309426b3a.20.1747411473566;
        Fri, 16 May 2025 09:04:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b9a0sm1749877b3a.108.2025.05.16.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:04:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/4] gfbgraph: Remove direct dependency on libsoup-2.4
Date: Fri, 16 May 2025 09:04:28 -0700
Message-ID: <20250516160429.1391450-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160429.1391450-1-raj.khem@gmail.com>
References: <20250516160429.1391450-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117431

This is not needed explicitly during build, librest needs it
which is a separate recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
index 9b1a02bb09..aafcdbdc8e 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.5.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     glib-2.0 \
     json-glib \
     librest \
-    libsoup-2.4 \
     gnome-online-accounts \
 "
 GNOMEBASEBUILDCLASS = "autotools"

