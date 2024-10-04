Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4621CCF885B
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 21:45:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.113.1728078337229876912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 14:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBNDTyTm;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b6458ee37so30250835ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728078336; x=1728683136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifn7uuSixWYbCkbACBAtRxu7vmMtzx5FlGRAaZBzTO0=;
        b=KBNDTyTmwRKbWM+5FeK7pH6Pnc5y43N0GHQXY0icOMhziK3M/jD3k0NiYhUa4ZVKrR
         Wi/pVy79KZW+DdWOalOVlVo95oIDw8Veotxr+cYvt4keoaw9rWc6xVwXwLL/FTk5bQTs
         gAZb0qRyp4BLLvHAXcJTaeZGTYxbJ7hKDhzGkDJ/6mXz1IfqVAJvbXRmkNxqORhw6TMR
         8+P/bYKMivolDCQs8864/uLfk2ijtG1MtdOK1a5EixUFdy3ubG3W3E2stpM8+8i4Fwgu
         mc9N2HfD7Sb+kII3D3UFAIS98OCK9TxbSn0cgRHJg6jVN2uxqZhGG2tAk6hj/ZCWsApK
         rMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078336; x=1728683136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifn7uuSixWYbCkbACBAtRxu7vmMtzx5FlGRAaZBzTO0=;
        b=tyrtEFQAskWcHlsjL8TAcLzqIXVQ6NFD2an+zdLXOiH2YVkmuDqaKg5aDy73+zFQX4
         C+RSaRmdKzrV68wdJ8NrZRMYJzSJ6fLxUrZhsGGQIMgijIXkvmbaVD8LV6lRe5zavUnF
         2Amexv3ecAwAe+xvJmCFLaAHzN48sTRqMrW65gD09yGXt5Q+Lb2wBAc5G/JC6NYb0vtG
         i0Z2Xy+8LIDeTARI8ArkIaLooxU1VuyrJJ/Qc19g6VybKI35tTGXoye1XxPOlEmyvw1v
         pI0igTAvV+ZMSg0fNFfixjYl/2GPiy2brL3V5sxMCa1SrSzj9sbQpfF8ewa8LbCTvrDx
         fnCg==
X-Gm-Message-State: AOJu0YwRVNFWFeTZZPPeMvc9JCqmq6zB5l21S7uPGuPJVL4KJEsRe8au
	jIwNjnlPYpIt3tkZ21FNwJ0wWEG1gC73YDPdsei5XjP4yzeAdHgkGDVSeC1g
X-Google-Smtp-Source: AGHT+IGpTCBZiXIgZz4WP7iB6CGl2f6L3tO3lAyDgLGDL10WP1jvQD2Idq1gX4Ud1nEwJ+t0gnlPXA==
X-Received: by 2002:a17:902:f608:b0:20b:ce30:878d with SMTP id d9443c01a7336-20bfdfdd2f3mr55501615ad.23.1728078336196;
        Fri, 04 Oct 2024 14:45:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9f70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13992b84sm2957955ad.284.2024.10.04.14.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:45:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] ptest-packagelists-meta-oe: Add fuse3 to fast ptests
Date: Fri,  4 Oct 2024 14:45:32 -0700
Message-ID: <20241004214532.2503043-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004214532.2503043-1-raj.khem@gmail.com>
References: <20241004214532.2503043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 21:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112671

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index ff48e9d142..32c16f82b5 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -10,6 +10,7 @@ PTESTS_FAST_META_OE = "\
     cmocka \
     cunit \
     duktape \
+    fuse3 \
     function2 \
     fwupd \
     gcab \

