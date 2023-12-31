Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA0AC4707B
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.218948.1704025428997328793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YzdFPmwo;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55539cac143so4600277a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025427; x=1704630227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9Bz94541kwDKHPgLoFuZNYpVI06u7elWIH4jSMrVWw=;
        b=YzdFPmwo8M5eZrgZyyZnupuEh7LsZDrYsEB0TD1VXIuxWL+hmwvjCyISLOcLD6HFqm
         Go4sRbaQNhPL/2VlJDEjc9U3vD9ReoNQYseXtRxBq/1ubT4lkJstX+Vt/bzzKTuRE/Ep
         RNiYT+FM12f5oaBeHnpKBnlZfC+o0S31QCaB8SvhGHQDFtIHpWdHkLRX3hKv2waqLZ8K
         DVfGBgFSJ0L8C0fhtkIAEWAsbqG6i5CKr0LBrjpJOKpgKWrFoI/18YY/oPtBezE1phGE
         eVJtsmnHIXz6we+BjCQLhvTBxMULj/xDKB1s7OB/W9qSb3gz7/OBZAgI9N0iI5UjEFmO
         WLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025427; x=1704630227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9Bz94541kwDKHPgLoFuZNYpVI06u7elWIH4jSMrVWw=;
        b=aGkGxR6J7OGW1acXyZBf88Ama+I4BTi+yUi1bW+HW3bw7ZDDz9yyfIwUvdPgOnOmzS
         QnPcWMWsQmoSB2xP33YplgacYVka5lOpGFWrCCgth7Qusv8Cn5rFUP61ZlMFbVcclV3o
         KlIrNGfPjAZWv3iTHWii/3A7Di8SqafEEydTARtxFnvtMmrEhYWROR/aUgjicf7fgsEL
         DW0fUDPgBtXzJtdZtV+uo3eqjNflWnopVzFan0KiPqPp4JumHqnO5GG/Txw1ZtPFHQeD
         xG8JSDt19WR7Fuqp6fAV3kmw5jLwfdvX25lzhib8vUepnimLJs4YnUCCiA+ddjCTLSMC
         Ajtw==
X-Gm-Message-State: AOJu0YxC/9TXd+kskUCS8yKm2ldcj8kRvMbX5oRPVqJ1TTIKIGQkLrC5
	uyGjcfmKhayj3nhneMDoZ8zporcNAUQ=
X-Google-Smtp-Source: AGHT+IE4rLE5AuvFTRjq+8xJQGmx9OhDeD6bTTxq+Y2ohiQLsK1x6xGmvJrwBpfyf7EtjZxA5ozyyg==
X-Received: by 2002:a17:906:1913:b0:a19:a19b:78af with SMTP id a19-20020a170906191300b00a19a19b78afmr6997382eje.114.1704025427439;
        Sun, 31 Dec 2023 04:23:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/23] rwmem: fix python modules packaging
Date: Sun, 31 Dec 2023 13:23:26 +0100
Message-Id: <20231231122329.405225-20-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107971

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index 8ccdc27a8..bff82fe35 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -32,4 +32,4 @@ do_install:append() {
 	install -D -m 0644 ${B}/librwmem/librwmem.a ${D}${libdir}/librwmem.a
 }
 
-FILES:${PN} += "${libdir}/python3.11/site-packages/pyrwmem"
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyrwmem"
-- 
2.39.2


