Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B67CC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 19:02:35 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.571.1705086153587367964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 11:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3606e211e5cso37851245ab.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705086152; x=1705690952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTHBIhlyAShzH1Qhw3FYpEUxjO87SXnFR7L9xYyYtBw=;
        b=SNzWQvDATnwxyC5a7vmNmSgMJTRYmXNwZ38HfEZQRTlK0FD5K1kQHHmM7FIIfl0Nj8
         jWotpIPUmgzCX7eHU++W8E1VwVpDPKeldZ+l6WVornhJFEYTV/+R8hexT4TjvgP3OPQU
         zPKgfhF/mo7BqHZ50pQNCBwhRS6kmRCldjXOOVxSsAHHYMz6jbLnroRczhWmQOdUDGR5
         NE3oiB5PAzCUIISG+ean5u0IzuQK2pZ0Z2z9tleg8FX1EBH/qdnNirXS/GdGV5z8FGHy
         t5dO4UHhXdzTRsl3QdBRb+HDvPOPaNKmDv+q670USj1wfyChLs7t6n7O8ZMNMUsTU5kh
         lHSA==
X-Gm-Message-State: AOJu0YxCtVXDYD7GUW7EI91Ow1kD4DPDGdA/SpCyrIseXXMYMPFQcHMu
	/LC7cPZeDZFzDqA83NPLpmScIxpLzLmqxQ==
X-Google-Smtp-Source: AGHT+IGrWRXTrv1GfGOKMW8GwPpfly0MxYyWWLXbkvMVnuYJLZY6lb7OyTs1mx3cPZ9OQDKsHUIoew==
X-Received: by 2002:a92:cb84:0:b0:360:76fb:a894 with SMTP id z4-20020a92cb84000000b0036076fba894mr1293677ilo.62.1705086152240;
        Fri, 12 Jan 2024 11:02:32 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id u11-20020a02cbcb000000b0046e5fe2d364sm533868jaq.9.2024.01.12.11.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 11:02:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-web3: update to version 6.14.0
Date: Fri, 12 Jan 2024 19:02:26 +0000
Message-Id: <20240112190226.3021991-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 19:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108249

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-web3_6.13.0.bb => python3-web3_6.14.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.13.0.bb => python3-web3_6.14.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.13.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.14.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.13.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.14.0.bb
index 0f0682fca..177c6fc03 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.14.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "769ab3cfffea69c6b495c63a1aecdb522651c0304260fc25467a886d0be622e2"
+SRC_URI[sha256sum] = "a3726289da9eff2ce30f9b1b49ec59e9245216f7aecbfa2007f73dbe94999717"
 
 inherit pypi setuptools3
 
-- 
2.34.1


