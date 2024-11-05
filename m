Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806A0D33A2B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.27814.1730831881056385654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkHTTdYx;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e34339d41bso49926387b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831880; x=1731436680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtdlEOxi7k5E1A3frYuvV1kEZrkEiS690YUA2y0vw48=;
        b=jkHTTdYxxSWdVbyJfINbFrWqxJRgLtJ2nfXrFRwgpadK87LOBXJEsNliMKdYX5erDJ
         /PFL+MBP3Cvp/f1+LtfZqtjHTlAH+cb3BoK7vkwQ+rR/xxz7o2yNrPFIZ5uqsbXoTdH3
         7rBBtk0Q2DtBQMq5vKCAEbxld92qViLi9EoEqXQX8MVXWfYqDLGFIXUCl3DJzeDF8/op
         T9Ra/3eEtIQnuZmgHGkp9Dhqoc0wW15qcEh6rY9f3tj8ODrC6x1GsjicjrOxC0L0oAb1
         RwNr8uqNKImEhTyjrcxkBfIbD+IUFuCQjs0CCwvH2hZVMEgxd+D8dgUWAMDRLqS2LuW4
         OGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831880; x=1731436680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtdlEOxi7k5E1A3frYuvV1kEZrkEiS690YUA2y0vw48=;
        b=ubemJGlDFXvkLBGQFOS4Xjq/w7qz+dWpr6eORPkUSkAWECLoNwpKQOF0z42jpklA7g
         bS0fifUXc7Yf3LGT1HfNmeMpHjoNxSGK8JPsVLZHFJA6QIkjjAC5hoNpyvmv+7dDwUVA
         4J/f2zP+5RD7ckbzpaBbKEH96wx/MxwTqALugBhS1tF1N1kzCCyvnoGQtcZoS5P/c2+I
         jI9AUsK4+tv0ACV1Kc0rxFlqT4mkpEogCrfAXHutJXh50aBGzqh77tKMdXVLYJW8XKP7
         vzIx0Hb167icuSFNjtgDZ9Qnjokfbi0VwRI9eqLzl/HFq/FUp8a4isyOLFnlKtAbDDGD
         kiSw==
X-Gm-Message-State: AOJu0YxFtTYHoeBfidJZBxNUxFhqlzIglEv9QQMZbsj9HO0VvBd9UTHw
	IXSqwFw2FAF8NGwMuGnrrdkJ7GtnuGJ3jBRlXjNUcxEe/VhDUnDYE42jsU2w
X-Google-Smtp-Source: AGHT+IEVobe30UJnaNxL9sL2CFIoslE+CO7ZaJXRkF6XK+0jPYafQkaB/K4jBc/ic/LVGtYqwS03qg==
X-Received: by 2002:a05:690c:4883:b0:6ea:8c14:7bfc with SMTP id 00721157ae682-6ea8c147d28mr96370287b3.34.1730831879503;
        Tue, 05 Nov 2024 10:37:59 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:37:59 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 003/161] dbench: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:39 -0500
Message-ID: <20241105183658.34982-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113518

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
index 32f51fee4..d300c40a4 100644
--- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -22,5 +22,4 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 FILES:tbench = "${bindir}/tbench* ${prefix}/share/client.txt"
 
-SRC_URI[md5sum] = "1fe56ff71b9a416f8889d7150ac54da4"
 SRC_URI[sha256sum] = "6001893f34e68a3cfeb5d424e1f2bfef005df96a22d86f35dc770c5bccf3aa8a"
-- 
2.43.0


