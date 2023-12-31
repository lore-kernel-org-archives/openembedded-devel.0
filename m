Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9249C47258
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.219026.1704025427751844125
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewxa/XTa;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a275b3a1167so330043266b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025426; x=1704630226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP/WNMYcpO5XeqcxW2TjUsztEXx9SNJPBmLcEbuUh1I=;
        b=ewxa/XTaCv6DiSsrXhtSfABIgev5pwSO+PYhZfQsGqp3i51Z5UGkoxwOeWUU3PS0re
         UNrwuph1Dj0yXoBIp5SkWDabYEs3RwSnjqp3DvVFIgaUsdj7hFj2weR0f/9tzGoCTD0X
         kvCd5mnM0WNIdmmUzO36FUE1TA0U7WXXw635zEi/gchUx3dF7Ugmg92P3Tv4+yDfmKSN
         0yZ3YAbSlU3zVoTHG/LlAqMbPyw4AP8ZH1NWJ1qcuIUDpnFYM8lWN4v9SamZ9myyhdTe
         yqXA6F92HU2ck3lWZ5AUub3waaql64qnT/ShBngXrfqpMZAi6/lMx5R4jXddSIslju7U
         A5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025426; x=1704630226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP/WNMYcpO5XeqcxW2TjUsztEXx9SNJPBmLcEbuUh1I=;
        b=Q5y4RauShH4n9cPLPz/cgixGntVDke/vsGCqsi/GcdrRuY4+OUuU4wozm+4YLEtHDd
         QaA6EhilIRd59NGoG8DA6ttMOuSf62FsB4kJyVrGOGXEBpQGleFpVP25AORi6fOePwoO
         jK+ajEMbRsGXMGNNVRHZ2I6zCHGGyB3S0ghaUINvFlhUlAPEQ6YMSlxFN6CjJ7YPpEfg
         a4fnGpvyRLUCoY+HK6oMrB2rFrrfY9rfSatBNrNn97m/T9TXrgimqtnybqRaDwB7VXba
         LAU6UpwCwYLttr0mF06DAgria8mOED6SE7uTwV7y+mFFh8wvr9ocz0xmPXFdh8fFRnbK
         hUwA==
X-Gm-Message-State: AOJu0Yz/0EYO/lIo0AI41nMTc9A7x4yvyi9JGZLFYvHrRqB+ip/2vcUx
	Fa+EnSfK6NHErHzRm+82nLX5fO9byXs=
X-Google-Smtp-Source: AGHT+IG7gv1TtvpsxlQK6qXeJA7/aXlK7wN0lGTfHFXJQ7LzsQEZpkN2JbpDiTb/P0K3IpF6nBRf1Q==
X-Received: by 2002:a17:906:739d:b0:a19:a1ba:da2d with SMTP id f29-20020a170906739d00b00a19a1bada2dmr6713864ejl.84.1704025426218;
        Sun, 31 Dec 2023 04:23:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/23] mongodb: skip until python 3.12 fixes are available.
Date: Sun, 31 Dec 2023 13:23:24 +0100
Message-Id: <20231231122329.405225-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107969

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 037d58cf1..ee5c77a85 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -145,3 +145,5 @@ SYSTEMD_SERVICE:${PN} = "mongod.service"
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 
 RDEPENDS:${PN} += "tzdata-core"
+
+SKIP_RECIPE[mongodb] ?= "Needs porting to python 3.12"
-- 
2.39.2


