Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9216BD3611A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.27882.1730831940236302563
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUYcy2Xd;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so4899930276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831939; x=1731436739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUm9T5v+b5WdCjzYKNkw8+6oTflabxD30XRNakwPge4=;
        b=DUYcy2XdQ6CMbuiiJil6SeTSmF8unTPVNHF3qt9GZl9qBoV1GxO9dQFEGY52q4OCVN
         MV2vB61nnK5kECD8cbcZh+BOROZQqNjwXNJelXND2eyShY33V99Jxxf4PnDsLnEdcXuq
         OUdq7lK8DpuGjfsHjYLq05P96ByJiefHOSmn8Fdt7RoX3GT0MlPSHdXS85WY3N5kNUNg
         CARp/KtJEAGY9SBQGWmrX8ryk52mlp6dDP9WdcPbuv9YvKtpj20JaGzSK+mbnwotvjMN
         k4izZSLTAPNppYoDEa2Sb3TP301kckWLk70vZZqr1KrIIhM46ttMFUHX0U1NwxcVNeDf
         eWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831939; x=1731436739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUm9T5v+b5WdCjzYKNkw8+6oTflabxD30XRNakwPge4=;
        b=VS/OTpwu/xT0EgfXnf6h56hKmORzk6KnNT1wsmQirobSunf2wo3ZAsvQ1apvOfNQg5
         pcQ8aND7OoXCaAP9Mg7cT7dnRFVXeqSsix3JoI+8scwYdgCM9EwQKInMWNtUsxCZQEJV
         mXK2YCTqMsUTlRnaINbTkksHo48aLRyP9ma/srWo7DIE64JYdMpjoU1QOG7gDrNB5hto
         l09zBgph26MrN60hTFbpzG0HR9e6XP+d7mEjpdM3MFu6hmWZT6ALZMiK2gMdCJVfsy73
         Dd/XuBXqiHS5uCzCF+lBRZcDS248lvQfV8Ty7BoDpH0yRLZHz7zMEAZKKe1WnU3v4rJB
         jFCQ==
X-Gm-Message-State: AOJu0YzpPIWNofLkEcBqYctuGfQJfkOKZPkBHOZnihovNz3pmVb+ikhw
	Rg6Mcp3aMumMbaYLuIb8r5bSKDwUjqhMtFhg/5PndT74LzWe5RhHOF6er37G
X-Google-Smtp-Source: AGHT+IGvFqAQIt6ZQpIjNFivocoha8q7xWm+mlTC35iDn3spYehe/WkOv9u4naeRDCat+992rOFrHA==
X-Received: by 2002:a05:690c:6913:b0:6e2:aa89:9d0 with SMTP id 00721157ae682-6e9d892d79bmr377808727b3.10.1730831938867;
        Tue, 05 Nov 2024 10:38:58 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:58 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 074/161] libsdl: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:50 -0500
Message-ID: <20241105183658.34982-76-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113589

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 1f436c6d7..2ccedae3e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -33,7 +33,6 @@ UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
 
 S = "${WORKDIR}/SDL-${PV}"
 
-SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
 SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
 
 BINCONFIG = "${bindir}/sdl-config"
-- 
2.43.0


