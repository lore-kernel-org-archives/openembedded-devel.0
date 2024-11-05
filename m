Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA04D40CF7
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.31028.1730840000838410173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELrJwL2F;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e291f1d659aso5370922276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840000; x=1731444800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnJyukjx+KG5dTxvM1Km2ipVwGv21TxWK8oMbIjtEMI=;
        b=ELrJwL2FJ/5lY7Nt0hIslVG8AoeAkGS1Q0GI2JsU8ZQUvBFLjhua/xfZsAlA96pf/P
         gcFoXkTt1Dpvg+rzZZ0GcZSqEoaQkx3lA8Y82QSABn6UJ2P5/tcWLk6urgVaoOhaK8Zh
         mFlngr2xYHDaWC2cMwtLwavCUDKj7mqQH2Xe6hMhI1beaGd4C7bPztJhGzv8DTpNRIL3
         iue/DVZ9QeEpVqZA4zK1jmC9Fqm1S2ABdGaLEiPXuo4U0RY4B1fN0nGnhsUuGUjIAydM
         nBt4X+n8EjZnIVsUbW+0moIuOVHQzwS18iC+aEuuWKeA+lfRb73VRzpgxDhr+lRaB0ls
         dyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840000; x=1731444800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnJyukjx+KG5dTxvM1Km2ipVwGv21TxWK8oMbIjtEMI=;
        b=h/rAJE241OP5uQSHVjPhq/f8O3vvFVGtzC8ypJZ96+3luwfY3C+Cyizw2OQ7inhdoB
         6QOXxWYwFLxvNhkoTG9aITI54XVNLgQcS0RpsbVqFsTAgI3TFfcEDzIfkA2+wwb/AgL4
         gJJqaxJvtOpBz0nh/7ngj0BXkgj86cJDDmccx6V0FaojWBun16BHvKck1DhIB7jR5dw9
         IHmNhSVvg9zfcJdrpb3pI7kLz9pJ3vhY1WMU1zrhkhMY7GBt74KZysEvRlzoijHgfQPl
         baXGJt/SsOrit5iMwso+x6494xRi45HAe3hlXTN5btR+Q92FRZ+75wFr7FLLIDWuIlBK
         /DhA==
X-Gm-Message-State: AOJu0YwyT6P32zYp7G6pnl2XBl8CTuHknVyceIJ/aUGpwj4NiOuUJLlJ
	/Y4LO+GL8hwAal4evsqEI9Iap2HREKcCp/b8TiTanFrPEJyXkVJ/mnUfZ0bt
X-Google-Smtp-Source: AGHT+IFxTsqJU9LwGywfijSr8sgwKlK7LtQZZOYh27r016XWwRmgFvxpyh0BCAsIVArf7+sROjzrTw==
X-Received: by 2002:a05:690c:7482:b0:6d3:be51:6d03 with SMTP id 00721157ae682-6ea64b27563mr168623617b3.23.1730839999426;
        Tue, 05 Nov 2024 12:53:19 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:53:19 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 144/161] libotr: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:50 -0500
Message-ID: <20241105204707.4155-144-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113660

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/pidgin/libotr_4.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
index 115a6968e..b4f462de8 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://0001-tests-Include-missing-sys-socket.h-header.patch \
 "
 
-SRC_URI[md5sum] = "dac5a8778a35f674c046ddf5d97e4d81"
 SRC_URI[sha256sum] = "8b3b182424251067a952fb4e6c7b95a21e644fbb27fbd5f8af2b2ed87ca419f5"
 
 inherit autotools pkgconfig
-- 
2.43.0


