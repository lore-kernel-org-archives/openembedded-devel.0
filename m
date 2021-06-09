Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.4435.1623220744809672373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PW8l6+Nc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id he7so17227010ejc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GLxchJ3Cw3cqT6IP+1XRhGHlV8D59et6/8sgUnVJyM4=;
        b=PW8l6+NcG2cHCpokzpwuBmmxT3HJMOUVFih6MVFV9Z3OeYnWXfXCWN0mmdhQHnL1mF
         KwyXrD43NsxW1abuLS2cEZpWH1aEm3ccHx+TGuhf6qoGGTLl30VWYT4lFndnL10Kx6CL
         9yjVec9MDkWnVgVAJ+JhnwlyGSzZfc7xeziqnSv+SdR88Q/sKxGToSOsCh6s5sw94cRr
         R6Q1txwq0N0Ddbz62esc1ysSjj7B6s26VFWFMI5+RaCqaTRhksH7saBILhyNEZAlKI53
         eOn2UzPx72TQMjtWIfQw6kKW+P4V2lH4KjfKw3UYO/yG6K+O7+pN5QWsOhRDvnI6tbVX
         MsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLxchJ3Cw3cqT6IP+1XRhGHlV8D59et6/8sgUnVJyM4=;
        b=Wryfb5VElf0mWbYB9uIBFvc1A8ALe7vLAghydu1Ekmv90BDwhZ5kjLokr3p5a/GZvq
         NX65lmPC2/yycFt90SAHFw4vgp4KnCcIDatN3DKFK9oii6V3kDC9QTQ3KIuEbE2Xw+MY
         gOOwpdxbfSAdAZlFPRnej/bwVMGnIk24cZqAiSZDjWBh3sOq2WQo0H3crTx2m/lleUbw
         XOAwP0tXt1RB3UFrfJMSe8LIv9Wzr75oa3H1y0Cjpt3sKVzS0v8S39nGO0tu7JVHJoXF
         cpTCakFnjh/ZkU/Qbak4IpuB/4xMJKthPh/2J/Pif2MlH4SGTKzbQ3IqDPeigRX0cz69
         2+pQ==
X-Gm-Message-State: AOAM533ZpGEMbp3TIb5dz7p4WahlLuEbm7CzREZ2j5H76R0tjkS+Kcpm
	DwvUqU755aKWYAihqJ91H1iKfZHNjvGIEg==
X-Google-Smtp-Source: ABdhPJx8ekwYZdS6qgJ7NAZ7XJsJvN1hg2xfms0ZVLLlnlM77Q1dBOIJtowXXRoW/KZfDFBOp9XeBw==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr25056816ejg.489.1623220743379;
        Tue, 08 Jun 2021 23:39:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.39.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:39:02 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 27/28] modemmanager: upgrade 1.16.4 -> 1.16.6
Date: Wed,  9 Jun 2021 08:38:30 +0200
Message-Id: <20210609063831.3400611-27-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Huge changelog can be found at [1]

[1] https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/master/NEWS

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{modemmanager_1.16.4.bb => modemmanager_1.16.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.16.4.bb => modemmanager_1.16.6.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb
index f8e8aa1d4..b499d93ec 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "167e60b26fa05887f87a0b3fb54143d7845e6e4d8c2f2dd93afac059f41e7edf"
+SRC_URI[sha256sum] = "2a90b6260f66d3135609d62667ada73416694d717e7fd9b73223e3703a499617"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.31.1

