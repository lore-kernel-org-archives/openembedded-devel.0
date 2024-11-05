Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B337D35E32
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.27846.1730831908576353189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJ0Rzffc;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3b7b3e9acso50509547b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831907; x=1731436707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKvkUODFtv1Z7ZnXpswVJVwOvZ2zB59+eIX8ERYZmSA=;
        b=jJ0RzffcliFk+QgyZvXAM4iV5PNS18BjTPJM+SZ9uovYqmS7IO6Saz3bIxqMYUcz6l
         H+X29HVjVXh6UGh8hgK3nmojrPTMtTlVOrYpt6PQxKuQ3cjGlU3dDQ3SWfhVDdVRHgH6
         bFV1Hb8qozDsxooVBrAWZnCRTiDV92eGVwNfME312qtZWUp2Vj7+wtmTSWApQ86svSaO
         DP52+e5hRJqF6E55tqvOB3JFQyHHy0r4G9OpOWY6z9Kv8EpbbvDZCeWfGov+lCFj4z/U
         4lseplwnSDVpHpYP0ykW+LoWmKN0uqmlzpkfLLutH8TXnHyDFWFNTJCRZv2s6FItFZft
         7+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831907; x=1731436707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKvkUODFtv1Z7ZnXpswVJVwOvZ2zB59+eIX8ERYZmSA=;
        b=A3H8Xz0Vy68vaq2i3RW97VI2tdQ8hmULQe5LTkFCuTKFi6LPsfrK+vHm12lArwQhqG
         ZIfIs7Wll20iEpo//g7G74CxaNzCUfqDIEpzrncvr5Em0jyFk7P3v9Fc7/YpedLz+pb2
         BQKR4wnkJya+zoNUcUKtV81cK3Xa89cymQWrRWs+V+zzCjPXQxRsB99GFImw6/ezL2FF
         MrzQ06aPhxG2N44xJK0IP94KszM+pNjiSUlpa60T/OFaITdgU3vqp/dHN5UVS0Zl/OVQ
         4Oh6pJgAGT6hvSm+Aaje5mxFiGMqNzGDgNaMFGpV7HKaMDbCrAj+T8O4p5n8GadrOpqV
         sJNg==
X-Gm-Message-State: AOJu0YyAQJh6gCmnVZO/X/tsaJ7FpaCrHrr1EOQAGRHaXi9shjT/OYUQ
	vtVN74GRlUbBppj9UBi1eUkzWjWZMzXv7ej3i1JeIZVWPocskXDnsiBD22L7
X-Google-Smtp-Source: AGHT+IEDIMV9alSYgfU/4k6vA+PHSp5PVk9QF9H+sAdE7lKAkuvZFoEDh8ZXunZHxIuMiDF4HQHB6g==
X-Received: by 2002:a05:690c:48c7:b0:6e3:2361:df8c with SMTP id 00721157ae682-6ea64c0eab2mr180726407b3.42.1730831907281;
        Tue, 05 Nov 2024 10:38:27 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:27 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 037/161] uw-imap: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:13 -0500
Message-ID: <20241105183658.34982-39-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113552

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 3b8da9144..6df54ee18 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -19,7 +19,6 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://uw-imap-fix-incompatible-pointer-types.patch \
            "
 
-SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
 SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520004a28"
 
 S = "${WORKDIR}/imap-${PV}"
-- 
2.43.0


