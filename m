Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.12532.1599842778848633952
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 09:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAIlmOsQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id o20so7770155pfp.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Olg7MZjHRO1aPXfGS1h1588isIxiABGqTEEaTr8553g=;
        b=kAIlmOsQ9cc1JwZrxp2QY3P5yZ9G3w/SXyaBPER48Gm797pirjNfPeeUAP85h44woU
         RK32HgFyI9LrStCNLfpW1CfCSGKW7c3mXobRM9aKJOuFqyf1ESgmsv8BZBBJ4KBuClOw
         Z2zR35rOysWrezOm4d+I857c75QBLfZ7XjVFhDbNFVIA6iRrx8G7PDwL6EHyD1bAu0A1
         hshHSA05hY4+h/grsF0D3mIxQPEo9GOYhvzQxzjWGYNZM+gOfaPVMWCilkKqT100fczt
         vaHbIp5aDG8DaF0dZteclPPOUoRWuB3LscRlmm8WR3a2BknsQwy0b0k05xMeNepfBCFC
         1yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Olg7MZjHRO1aPXfGS1h1588isIxiABGqTEEaTr8553g=;
        b=opbfFSjh8g8CfraVWopmysLXq5tb157AKirNLhNfLuhJnVbC3/WDUrPLnYwj0l8GF7
         ZWGOSeZf7zqDitXUo+YnpnQEbk+nglKh1ulxSbXFpYXR7/4M4gSUvrEjmbwWFssEWkYx
         X4O26QiysBKu+vx7a52NPEHI2MPrDc+mMB+0kVO2KQnqmso/kkXwf8TDusKzX4imOh2J
         GRsgIS+WXyjdNSbLKBTxkMh8RhaddfDbEmVKv5gYMlyin9SqvNg8mK4kCg0DLsJexUPV
         eDUDnDfk+eipa+OdoftGpcSqV4vjSxxEus3MlWjDcgQGshtuCubh0/Nuwh8xIEeNJVp2
         0Z5A==
X-Gm-Message-State: AOAM533SOjxG6fakeAJ6u3lsTqj2q/D+LbehxqPenSXk4s7EgupmHr88
	W3dKUZ+aWgx7YWmKbtoxO4Adz/EVMAse5Q==
X-Google-Smtp-Source: ABdhPJzFt/2zKf1OODPPmrJ11tTjmHFXDp2NEq9v4Ea3RmT7nEJjGGPMuJfqYORk9ZTGl4iKSSewOQ==
X-Received: by 2002:a63:4548:: with SMTP id u8mr2287875pgk.76.1599842777934;
        Fri, 11 Sep 2020 09:46:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id y29sm3013879pfq.207.2020.09.11.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 09:46:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	leckijakub <jakub.lecki@3mdeb.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe.bb: Add cukinia to test packagegroups
Date: Fri, 11 Sep 2020 09:46:14 -0700
Message-Id: <20200911164614.3107939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: leckijakub <jakub.lecki@3mdeb.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 675975499e..2e84576ca9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -885,6 +885,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 RDEPENDS_packagegroup-meta-oe-test ="\
     bats \
     cppunit \
+    cukinia \
     cunit \
     cxxtest \
     evtest \
-- 
2.28.0

