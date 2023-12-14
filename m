Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B8CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:37:45 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.15696.1702532261287588159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-35d699ec3caso25931295ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702532259; x=1703137059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NORspsTczqQQauSv8OAEiN8YqKpwcDabH1Gyr0G2U0g=;
        b=BZVXFLPJ/+cYPMeB/WzES9CLPzLdutel3jeUeC3zTprPKq2BoXnvvT85/OXXK+ebJ+
         0uqtUX3HWhEw0yOyKgv03ENDGHALZYqCLlXcf/zOl57hr6pCCKn7EuYQ9Pknc+BUS9x2
         ZSwLoTmUxslqll860+Det3UQT0cmzmcKxH1DnDOLpKkyiaReZwC0vKRAbPK/VPS9Jlu4
         n7AT7mwIXoUPAlADSXitXtBPpAfXBBPhDhHOjhSjsJrPxTTt8FpoxpsfPmIHSQiFaosK
         g/LFM6Khag/PVTcAe9MWMSJaq+lw0u0D0cZSNWIed3ioCRqEb8u4tczdZb5JnB8txjEs
         Ma4Q==
X-Gm-Message-State: AOJu0YwYdtvVJ8sWw0wUz1ImG7cN9dyl9lbkHCG/X9gwkHN70kdXZytZ
	nC0xDyCBuvN/EW+gvI58NmLkI5bjVoru6g==
X-Google-Smtp-Source: AGHT+IELaMvLVp+D9MpZbOXwdhkMiNenfdQ6O6aEr9EFOQnSIomgM7muKxRK42nZFmIDo40tHD3J5A==
X-Received: by 2002:a05:6e02:16ce:b0:35d:6c24:f5f6 with SMTP id 14-20020a056e0216ce00b0035d6c24f5f6mr14577350ilx.14.1702532259310;
        Wed, 13 Dec 2023 21:37:39 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id q24-20020a02c8d8000000b0046696ea033dsm3381892jao.146.2023.12.13.21.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:37:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-bitstring: update to version 4.1.4
Date: Thu, 14 Dec 2023 05:37:25 +0000
Message-Id: <20231214053725.1214842-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107420

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-bitstring_4.1.3.bb => python3-bitstring_4.1.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.3.bb => python3-bitstring_4.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
index 8831d84cb..6fc2cf480 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "1b47c84644a961ba8503db2bba8a5965ab53e81474becdf0a18383b5b5f3f795"
+SRC_URI[sha256sum] = "94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


