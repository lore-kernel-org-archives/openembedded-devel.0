Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A08EE57D4
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81874.1767167689664080291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8mF/HcI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso84936015e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167688; x=1767772488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/gBldvRSwLn4Qvir/HX0Y6BwmViA/eaYdcllOcxAok=;
        b=J8mF/HcIvO9B7CKNhUu5X5xflDYro6/KdaiWKRcJMIFqWF4Ox0yI8L8AraV3ITk48j
         9+pRjTY+Wfz0t3Py1qZYoZlusqZNp+bCTed+j85wrvWw+8K8S0d/ti5QeFV9NfWoo6Ss
         tMq5Zt4iyTXON1pJEPJqJtgq1mNzZxkYGiuJbasiAkYZe/pFM/a55EYs9eZDT4I3A4xv
         4JWoxav2Afa6qH4ug+fWkL9KYs5wS+4/sIY3vrns/GCXs3rzfqd/aDshaVN/z8WCimaf
         iwuX6a4YAT0cqM1yxu5lxjJbNjhkDbnw+C5D+Rjcfwsow/lxhe1xjJcMFOeBI8e8urXN
         AVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167688; x=1767772488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/gBldvRSwLn4Qvir/HX0Y6BwmViA/eaYdcllOcxAok=;
        b=FqFUj5MWtXjb1ggFeyZATwnJBBlUbHtkgRc6UUgdLz9QZnAxoBfCvfZeuBBcZoSNlp
         IovDFnmqrxP66T65HJdxMEKclLvk3nNEppaukiacHKKA++p+53+La9IhUinavutGsR/J
         /Zo33m9MUfFyB/Zs+iV/1gR39arSeTOX5CZ+DHnKosefi4y9jJjaXeyDxDK4UDr7SvZr
         Mfs899zlW+mNEnTVRX9F00QbDnw44qX9A4/F/bw9+n3mL6IU7U9LY2VNIDZOGgF/HXVh
         qoVRM2giHsLgTR/0gLBsPOYvavbLSllGqv2+1/6XV3NX+fEOdMhBNN+v7G/1gfMqY/M8
         WAzA==
X-Gm-Message-State: AOJu0YzJ4WPWCYpwnG2HZnDv2ntIgHG1BQXtREEIntuLnhXwWeRuO69X
	PPKHNSDnruTXw+a50AVZyUjPxl90Skv1S4RW7tBCHfLMg30Gi0tLtcJdoGDFMA==
X-Gm-Gg: AY/fxX66z4W1ShXPjGa1fnHaaTBb+O0SZjU/Z5TIUtceuAzmm9Sf0DeHmDWRlURaEZI
	IvO0ZOI21wEcD9BetC3aHcTNwG4QleB0K0XnywJdH+dQFQy5y3+QTXEs0dJw5Z+MkeAVX5QzjJk
	boYJBied0uJfNGpIWvmJpJz7fi78h3MUA5+gCh6nacmfIHrUrVYTGy39RFBxEUiB7JLsEg+xa5f
	MZ1gdvtEPMWK5ArSRqRX1HNskZ1SyLplkwvGSxwi03Jfvc4XA6CVprVoicr23OfO27kEobHv/OL
	r3XA63kIuqANpHmt7GlgAMLAwWVfe/zk2etk7eRK3ZmI/JLz8MdubQr8tFvitdZrth19TQUZqbi
	zEXBdN95gJ8wsSLKNQYAVterKN6Frtsh+5Vd6eQT9bDn5eNc6q595kMyZspPxx7Yj950bPeu8f5
	gEbSUbPqUf
X-Google-Smtp-Source: AGHT+IH3L8k/OJ/s2fifWJ2HFHxFNMePM1LsuYDMv0FgNgNP3R9SAVIvRZoJx/UE1xez4i0++0gwwQ==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr372656795e9.14.1767167687962;
        Tue, 30 Dec 2025 23:54:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 16/34] python3-sqlparse: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:18 +0100
Message-ID: <20251231075436.771395-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123056

The relevant CVEs are tracked with sqlparse_project:sqlparse CPE,
and the default python:sqlparse CPE doesn't match relevant CVEs.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%sqlparse%';
CVE-2021-32839|sqlparse_project|sqlparse|0.4.0|>=|0.4.2|<
CVE-2023-30608|sqlparse_project|sqlparse|0.1.15|>=|0.4.4|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
index d8c3bc0ed7..9f358d40f1 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
 
+CVE_PRODUCT = "sqlparse"
+
 export BUILD_SYS
 export HOST_SYS
 

