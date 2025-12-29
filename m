Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643CAE92FCE
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 18:18:54 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48614.1767032332787070425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 10:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXWbq0sD;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso6992248a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 10:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767032332; x=1767637132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxTJLBdOSPEL8DWuaUTy9lK15F564tEINEU3SMoFusk=;
        b=DXWbq0sDnQlckTrYDTLOHfsszNbkwN54lyyVLPt0LtQ8dr+BS+N5gk9l7nLgI4Tu2f
         iWvj04vDbGVFIBtvFJA6fGJ1+mh5vRkxwui/zQhxrfyd3cuB2ljKisizUH4dPDVNJdYO
         xvYZwZbov7k49sXV0tv9Jkolixnbs132LIlozJhOTH7dsE4IEZ5vjTRJn19tok+5JnfK
         iIKz8IruRpNpTGkYiXANwzuwEkK5BnJTcDofka+MAPEbELdvU0fdLEJmgcF+ChcRa1AW
         htuETuY2QBSFnkE+Wx5x4bN1gG1dSMmAu+iresY+nRl8ZgkSVYS5z/7V9RvaXdbJRJPu
         0kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767032332; x=1767637132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FxTJLBdOSPEL8DWuaUTy9lK15F564tEINEU3SMoFusk=;
        b=PYeXPM4rGTl3kS14GpN9DEDwNSqSII9Llw3E/QLsMSgUS01M4vA6pFBROVoy1C0fsX
         aIn5cq8Mc1JObmEtNeDYv6vVrQ/3c/dFKF7MgJZvvICEgY2G07y6PVXKgeTe+l+8vzFy
         IUKt/Ky2DNRTZZ/FEiFfRDrjazob6ayG2VhPRZ/Ye6dQhaX00u1+EIaMHshY6BVHMpDT
         o+b8sIv9G9TZu4LVZyAIR12qSlS6JoMMGyGwOd9MukLTQLj9fSehOe9Eyqu+n2KgqWuW
         vCf/t0OlAUImWdHANp9VfuT4CqfPHUnvJiWpwuK2jmA3jF4Q/P9SHecLgRV77q+XfngE
         UdeQ==
X-Gm-Message-State: AOJu0Yx2N3wEqcCmmvKE5TVC7I/iNUiAs/amX2I+rD4nfPplJg/yxqXR
	Pg0QrjSIX4b3VLOBGpORvEUnVTVQop8WK55BIhvDK6Cyl9ob1XIJ7cDgZ+P4ckmkIzI=
X-Gm-Gg: AY/fxX7Y9DUrokrUlK0XEgpmy/u+SMeOHQNK+lJc7bOOd84LpVLOqFaD2xLMlIn8qhf
	1ZP1k92+3z5kHL3pRytgWs7GqRfhjbf9Nf0oGdLrEow1G7zHazzGqUBH9Xu2o6Y72iciptwYQHh
	Hfdjc91e3pu9+2sCq1LutCPfPkRxScSPoCH+zcfEPi2bib2zwdLX2Usb/3hsJEg6jP9rLemW5eS
	CFodXAESisIjrPJdhyZlb5bZLKpfz5Tbt0LzSw1OVseU+uO3ZQZDlTV+U9GrLaG8FYmSLOTRAcw
	pgRKkq/hBqVDyPtG+OUMf9lh/fv9lckFTZaLMCOepqIsoh1S4ekEfYvEY9KhiPuX4aBgtQbdVrI
	1bOw5L0bI1dH9Xh6MUaZrLdzeHipWIQ3LtTs2OkolwMw2jxikHhofKdxZC0GEplAc9/ZZMlHt8S
	NB9T4c/PHkWmYc4vbV5FwTpOaUWYt2zOw8S4aJvfbVo0a4MfkyYOH0JKevSqEGK9WYKP91nPwsm
	w1GmaaJ78wTBmWh+JdQURTtiM+fwB4=
X-Google-Smtp-Source: AGHT+IHLsBZQtMuPZlZzLADyLLhMqp702D0oMkW546qsYo/NgbMTQ03PANYv5zsfaetwUE5J10SKfQ==
X-Received: by 2002:a05:693c:60c3:b0:2a9:97bd:a844 with SMTP id 5a478bee46e88-2b05ec344c4mr38158697eec.21.1767032331845;
        Mon, 29 Dec 2025 10:18:51 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm82981428eec.2.2025.12.29.10.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:18:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] botan: Remove ptests execution on rv32
Date: Mon, 29 Dec 2025 10:18:48 -0800
Message-ID: <20251229181848.1160714-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229181848.1160714-1-raj.khem@gmail.com>
References: <20251229181848.1160714-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 18:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122997

It needs go compiler and runtime which is missing on rv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 2505997ee7..f8d9ee6f9b 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -67,7 +67,8 @@ PTESTS_FAST_META_OE:append:x86-64 = " mcelog"

 PTESTS_FAST_META_OE:remove:libc-musl = "jemalloc minicoredumper oprofile"
 PTESTS_FAST_META_OE:remove:riscv64 = "nodejs oprofile"
-PTESTS_FAST_META_OE:remove:riscv32 = "nodejs oprofile"
+# botan needs go
+PTESTS_FAST_META_OE:remove:riscv32 = "botan nodejs oprofile"

 PTESTS_SLOW_META_OE = "\
     c-ares \

