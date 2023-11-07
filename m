Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F2FC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 16:01:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.14707.1699372865135570257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 08:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DsNgVlZL;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-540c54944c4so11618188a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 08:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699372863; x=1699977663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeYCGXdvOotJeGjNcQ4jRAcFA4ZHYZC+ZPgmMqEN/hI=;
        b=DsNgVlZLUClNnt1qvHiLXpOsBTX3m+0uqxo+BBoRjaCfHwBjgCzXTQfK0DOYRNT9QL
         S2FplxTfnbUkbH6X7hMoeJyYYp6wiVnLIOeRrPL6NxVJj8R2so6NpXC3D9kPLbjonc//
         +lLGDUhXiH8TVU//MI3c5hUHvlCTsJfPVPuw4tulrmN5nV0USDvzWMw480ieNoHmiCMZ
         vOpVuHvjJXHNESeDDMIcd3b4iKq3NQHbYU6Ch+LNFK7yviBYx+Ye5/8mLmtVjmtUphiA
         bCdsay3+3bZwwN5pnqHfKqh65J++jjA8bWJtEv9UYQJGyjTC8dBMYm1ROcSFsO7f1KK6
         uScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372863; x=1699977663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeYCGXdvOotJeGjNcQ4jRAcFA4ZHYZC+ZPgmMqEN/hI=;
        b=ti5B1LenkFOPRBGZInfzeiHnvFtc1XadUVyE8wEPiMq3ZcfQEnyrvo1x1jpn0ct4ga
         uyhM9+PwM954mYij645zNrGhnq7EFpd5+f64OGeIfJd0QoGDi+kzCQDB0Yzw4XbGOfjh
         h9Fk4k2/OQDxPu96hzjHychar9fz59eQ7/T00Y2v5cmqJdUAprgAuzfJZO30lQHBAZD0
         btcclinpDSH+w7DjGvlrS6fT0hJhB6E6YD+HSSJjxrFK9YTyYnqJtOApKWGOn3oC3jtM
         bpyejE4gfhlgoaSjUUnqIlOmJBejb+9IlvIRhwR/8deS8koI9pryNA+i86PwQhZCZ5g3
         hf/Q==
X-Gm-Message-State: AOJu0YyT4EVYoL5w4rInqURxNwDZTEYcv+8WOwrVtR+YXEN8fNk8MOSt
	D/rRmpZJSQLAJMyYJZyBUxvV/3gZCLw=
X-Google-Smtp-Source: AGHT+IGFz3kSmSH4JUl0q201Qwxdt11a7prqJNTf8Kp84swgPgIa3sStkVr1bUchLFBIR+zJ6NTnHw==
X-Received: by 2002:a05:6402:124a:b0:533:5d3d:7efe with SMTP id l10-20020a056402124a00b005335d3d7efemr2756832edw.6.1699372862570;
        Tue, 07 Nov 2023 08:01:02 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v19-20020a50d093000000b005434095b179sm5596195edd.92.2023.11.07.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 08:01:02 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-ninja: Set BBCLASSEXTEND = "native nativesdk"
Date: Tue,  7 Nov 2023 17:00:57 +0100
Message-ID: <20231107160057.312458-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107160057.312458-1-zboszor@gmail.com>
References: <20231107160057.312458-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 16:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106458

python3-ninja is a build dependency for other python modules.
For this, python3-ninja must be built for native mode.

This partially reverts d4aa17dc436beb96a804860bc6d18cf72283709e
("meta-python: Drop broken BBCLASSEXTEND variants")

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
index dd07968f0..3b9077f32 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -22,3 +22,4 @@ RDEPENDS:${PN} = " \
     python3-ninja-syntax \
 "
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


