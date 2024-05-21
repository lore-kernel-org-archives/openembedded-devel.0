Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C507C25B7D
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3045.1716315029722569823
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDtUzkte;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso3505365ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315029; x=1716919829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0KxQrfFr+RjOyonqJMkC/E2Uwv7W6nQs5LoBMf2cC0=;
        b=lDtUzkte92zM/1NK951DqlFy1sqg7b0TUmJ9srl0O/QpWufqZFduyBQxdnsYCcGgWb
         HT2/UDuje8NO+iO+sbUNTHg6/blf65kLIFrn67qIz5xx3qG40DnMnDqiDnSCRa1uAH+5
         rHA4yoOm5ooNJd5J1rUa0h682HMsCDRxfWJJbUglUgOue6DFQ+FmW0xPTnkmseGT7Yy/
         ZSmhogSq3GTgoz9STjE6xacKJxlQMXyx/AAuIKt+kNxFxMi3Xg7DChFXqNGehl2+dLjB
         PXurcz95jAmYMElc0doNxRcOefHO62MKDD/JAQT1ytg6QmVujSKK/U8x/WOYZDYuNOgm
         u9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315029; x=1716919829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0KxQrfFr+RjOyonqJMkC/E2Uwv7W6nQs5LoBMf2cC0=;
        b=cclOMoDr3JmnGbDSAes6cnG8U2SbHrvLhD37NVdr2sKU+/Dlmgjs6EeYIwd1JcYG7f
         h5w9w+lju4Fk3FqzL4ugrtXyZZYB7hquVcyM4zIQTEsujGUi7aQuNKRQto+4ajaw59GA
         P7Fdmmpe+kVq24oeMJ4hPYG98l+2DqaXfFf38pB1+gfFnigh1YELoTzFrPNHo7R7zuuZ
         UMDV9iMKss2j10AlzJrwExT5dt0ZBGnz0V/uNKhcTTKTaKVeRAcXsN/lqVz6xdGiovXW
         UztQf0Yoz7t5xg0yYDfhOicEBD5LdO14OoI+674SyJ3yFyE22qUau8j/EGux8f6yvIsk
         9t6g==
X-Gm-Message-State: AOJu0Yw0kmJ9weZvlgadIgxX3HzONvsRhd0rniqTAtLL84uX1V6PV5Gj
	JnxnLuTw8Sp4H3lbtQRKNEUiHv+wPRHITZVRxEA5jufIrQ8qDJZ58i99iU6QprM=
X-Google-Smtp-Source: AGHT+IEPsSHOMrRkEXf8f+VFwrjLrpu6fMDSZR3oyU3Hvg5gvQOg11LQaJtS12wy86nHa/BUy1AJBg==
X-Received: by 2002:a17:902:f691:b0:1f2:fdec:d29b with SMTP id d9443c01a7336-1f2fdecd5cemr79490155ad.49.1716315028608;
        Tue, 21 May 2024 11:10:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][ 02/22] folks: Upgrade to 0.15.9
Date: Tue, 21 May 2024 11:10:03 -0700
Message-ID: <20240521181024.426176-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110451

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../folks/{folks_0.15.8.bb => folks_0.15.9.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/folks/{folks_0.15.8.bb => folks_0.15.9.bb} (92%)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.8.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
similarity index 92%
rename from meta-gnome/recipes-connectivity/folks/folks_0.15.8.bb
rename to meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
index 4d26817107..899b8da261 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.8.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??= ""
 
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
 
-SRC_URI[archive.sha256sum] = "954a6afb3e378f01d310fd443790f235cb0eb71e2139cff4f05f09ab725e49c2"
+SRC_URI[archive.sha256sum] = "2311b37355c351f33f163fdc394874a22a0a0682c319493d6d8a6e420711415f"
-- 
2.45.1


