Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CE4104950F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:11:19 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16583.1773220274288038678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=CHPEisK3;
 spf=pass (domain: munisense.com, ip: 209.85.218.46, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9431300833so756246266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1773220272; x=1773825072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX+Usbm5DqGGycLnwfos07X4PPIPHcFkmzFaDu9Nng4=;
        b=CHPEisK3Hu2ZaDUjrvYbxnJteEeVRnvqzMcWMBm1b0zNSXsPBrt3AcwUppBQt3mDFI
         gxhDRntb6tHfH7EF5XtBeWdTpC+KAusftLXzrFgpGpc3mvNX+M85OYbw/BtcyLUxgIMQ
         3bi/vIKunOPFaIFMe+fsqq9yh8zVXV6sTLYpM0FfW/Uwd3ySvxSzYIim9PT/CKpXc75E
         zR60dCiahEUfwJpL9khNc8/pVRRCcKJHA5d7Ik/6g0NENOyaR5MSXyws2W4eZCHv8TcV
         E6Jkhs02SD4EgH6t/DN4CECzArTSjzr8YfjnaHat+lJIXcC4LGoi+4kciz3ToGeGSKDx
         4e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220272; x=1773825072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aX+Usbm5DqGGycLnwfos07X4PPIPHcFkmzFaDu9Nng4=;
        b=Ht2uNFdji4BnSSaUB4L5nwCAg+EJn0inthADGm+JkLMms/NzQz3O1hwopOpYAFhl6M
         04/34oU+aKwj4hTaaOReKNtN+8VEtAFVHmWGP2ZYmK1n+kkmi9m95gxs0Vzy2J9UH04d
         h2F2Usm5gMsr9lRYkUKSPY7ctdI3jmDoHaKY7BoIPRbF9v3sqwR2E+bequPC33JaFKKk
         n4I0J0KIzZzeUXdZptfXHkv5aL/NYn9nC5OUDUbz656Iwu6LL1wp2X6p5F9e7eHX9ZsP
         /3rSd1VVGKuU6n2eheYACYWsjt22oqq2N1rosou/OPP0m/FFsN125/Q58f/27W5CACGW
         2HQQ==
X-Gm-Message-State: AOJu0YykoJzO7iGmyxwV4Uj9sJ4ypSkR79+ZOILwI+ZU/8oEQ8RtRFVt
	Li3xnGHQ1T7XZoxLr4XrTQ0cVu36Xe2D6l5o9KldEPqRtj8KJnpHlvsuujEd3QciMAQuqjUMqgh
	k45NnlE0=
X-Gm-Gg: ATEYQzw5VqJhHLxvJMmWbCA5WMsKHvtPcl0Qu9LR8a/cZkTHuySV9N/G/RylyU4MMZ4
	x7cMYxjGk/KghLMSyIQJ7rHO4R+KqlEyJ8yjPb5N8i2qeN1Sy2UJYW+jbTKiWYIYHi7PjWdc+uQ
	ZWkD2yM/SUV6kS7cXSQtK7bcoTpwWefdo9qnnJovRK4g8vR2aA6pqS8BgJ+oIDu/xRDNbRZ9HfG
	XxzZijfNXvwj0JLkBG3t+aN/Um0wvI9mXH0YiMzt0rs3eAgJNMSDf4vwJA6HBoRI6eJO5MfWQLQ
	pSS/XIf0BjQieNtD1TFxVnSsxUJi5t9evuheHfxYl5dawgbS4qt3eTW1LhZQYl2W6qtJ2XdiFxm
	QIenV/6RgGA75RQwbICkhrgevGG3To/XlihP0t2yY7175dIZ0rwA84tQqWgbop6YTY75oSRIok8
	9keepaPGjvcuJuwqOanDrR1/OWokH1lPmGgRfJ2/g8r1+uW8YUFTbchnubELcooHs9PrQKQGa1O
	Ed6icruMwKpWx1OGQ==
X-Received: by 2002:a17:907:1c1d:b0:b88:6309:c300 with SMTP id a640c23a62f3a-b972e4e8483mr82324366b.39.1773220272409;
        Wed, 11 Mar 2026 02:11:12 -0700 (PDT)
Received: from gijs-peskens-ThinkPad-E16-Gen-2.office.munisense.net ([2a00:1708:3ba6:500:f314:c4a5:a3b2:cae2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631419b0efsm406110a12.1.2026.03.11.02.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:11:12 -0700 (PDT)
From: Gijs Peskens <gijs.peskens@munisense.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gijs Peskens <gijs.peskens@munisense.com>
Subject: [meta-oe][PATCH V2] libssh: upgrade 0.11.3 -> 0.11.4
Date: Wed, 11 Mar 2026 10:10:51 +0100
Message-ID: <20260311091051.262976-1-gijs.peskens@munisense.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311082153.258506-2-gijs.peskens@munisense.com>
References: <20260311082153.258506-2-gijs.peskens@munisense.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 09:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125074

Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
---
 .../libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb} (97%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
similarity index 97%
rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
index 5928581312..fb131c3490 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
+SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
 
 
 inherit cmake ptest
-- 
2.43.0


