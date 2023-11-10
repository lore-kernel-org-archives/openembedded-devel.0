Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEB6C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 10:39:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.24651.1699612741991319280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 02:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrTwqh1c;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso3207163a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699612740; x=1700217540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7hHuul8my0PqS8DUZVtLBnXBmec0tdPNhH6Wb7fdJ0=;
        b=SrTwqh1ceSZdeer0GEr0dhogdYmksjgT9YvAMry/Eb6rcq3I2OgaeDJ4HK9cPI6k/k
         wzDZaLqGxPa2MnUhsGgbe/PoU1FPMfZK2+3EXbN42CXRMJhOuD8bNgIvaALJyB/KVZgd
         G0ZZED8cbMOMxnAyCXln/C0BsLiT/otUt/xHt72JTpH+nDYq/SqX3sL/XN+LQ9weKKoi
         OXv9FMjZGfyA8ltBrJf/1GgYigNTo0R0PPVJAy8mcij9nrhga9dTlUy3oWVbV1OmXDlp
         QSAuemH8/czrhnj2gLIqn5W5PIET8p3xHCcVn4e1F+6mQYB35m8MPZfi2uUZElx8dJWc
         8DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699612740; x=1700217540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7hHuul8my0PqS8DUZVtLBnXBmec0tdPNhH6Wb7fdJ0=;
        b=wxZ7xPCl97/C8XQhid0cdgzfcUuoH1rdk22apqXtE3vq3vQ4wUGQAjCAUH8r5jfKzL
         TidCN7sEbKV7KOLwaOt0Iw9DJrEXXFFK6zZ34kSvnA9A3jo0/O7t+eZw2nhbNJsGOMfR
         /vRApSKKvBWLycYKmsie0k3TrMkCklfh6DZitlzxng6zhT4fGaWPmSqYC8Wngsmd/RiF
         BrYTR2yYOkTlqCugoNUkCVXDmKk7jP68tvLDMsJFZSsDRSbrlepxy1mN/4xdhW13qb+R
         oamDNNv1Q8H1ecCrxk+4uHBhwwnkpwViRAiUri+Ecirtl9ABex0rENDZ4ENDPrc17Doh
         LWfA==
X-Gm-Message-State: AOJu0Yy3Su8FNBd97nwhkNLYLKkybvXvznbRqZWh6qFjNHN3ol7qG6RT
	kwrjPlVhjlPlEKF8vwiLkhOwErlONUg=
X-Google-Smtp-Source: AGHT+IFEvepRisGmis5Hv1aYCh7SuRlSXydHXmFh57i+zN3mlFZcwcz4SfYUGS6ufWuvn1g9uk9puQ==
X-Received: by 2002:a17:907:7243:b0:9be:ab38:a362 with SMTP id ds3-20020a170907724300b009beab38a362mr6619583ejc.46.1699612739361;
        Fri, 10 Nov 2023 02:38:59 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id kk15-20020a170907766f00b0098921e1b064sm3759667ejc.181.2023.11.10.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 02:38:59 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] geos: Fix packaging
Date: Fri, 10 Nov 2023 11:38:56 +0100
Message-ID: <20231110103856.9780-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 10:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106534

Due to the library file name change, the subpackage "geoslib"
does not get generated, and the main geos package has unsatisfied
dependencies.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
index 95cb29775..0382e6bdf 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
@@ -13,7 +13,7 @@ inherit cmake pkgconfig binconfig
 PACKAGES =+ "geoslib ${PN}-c1"
 
 DESCRIPTION:${PN}lib = "Geometry engine for Geographic Information Systems - C++ Library"
-FILES:${PN}lib += "${libdir}/libgeos-${PV}.so"
+FILES:${PN}lib += "${libdir}/libgeos.so.*"
 
 DESCRIPTION:${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
 FILES:${PN}-c1 += "${libdir}/libgeos_c.so.*"
-- 
2.41.0


