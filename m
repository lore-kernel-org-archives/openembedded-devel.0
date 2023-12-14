Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F0BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:03:55 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.15382.1702530231327581078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-35f77c061e1so4542235ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702530230; x=1703135030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jSMWqnG/Qw5nWRhAX2ZxcgOtBD/y/IBvMB3/wiQcNQ=;
        b=gndcicHLk+qthyTrmbwKuc/cs0J8udpqZa/OqhD7sOCaK46v92Og1ETENCsEmdtHHn
         N8I2HxGb+boJFLpGuN3RGVmOf+5/MigGxEzegt65IjLg6BLheNgS261JfqymzXx5/tgq
         70SmuzQMQ/4ygLPHEkkm12AVaL6BiVhOfXCqUop+QD6z028fAcYPVzxl6vmVlvoboahH
         ekP3Q7OGpAVeOU0qYc47oPnsUvEBSjwm1tnnTrN/TYp7hOxa+qjHWAvVov1aiwiKfnIC
         8Dpbp0f01pzdFExuyy/iq8k7pEdGLoZjozI16ZwAXsDRBwVTGzWlM9RBJM+XPqF8Z2+7
         yH3g==
X-Gm-Message-State: AOJu0Yy2D+ycnvbJLIf4zbKpSrwKQQGpbkY+fqbALaDDZ8UcaFXq/KiT
	2yZwI0jsXBCdtyGxLz8KQ9G2Xnj4XXDD4w==
X-Google-Smtp-Source: AGHT+IHOtGy/5mARxK1AdSrzGTyTj2MjwoqBosvOfAndDIud8X6pLDv9Tn8HDsJRGAfTKk6305HPbg==
X-Received: by 2002:a92:c24a:0:b0:35f:7379:28fc with SMTP id k10-20020a92c24a000000b0035f737928fcmr3037269ilo.22.1702530230048;
        Wed, 13 Dec 2023 21:03:50 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id o15-20020a92dacf000000b0035f44616e06sm188147ilq.63.2023.12.13.21.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:03:49 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-colorlog: update to version 6.8.0
Date: Thu, 14 Dec 2023 05:03:39 +0000
Message-Id: <20231214050339.1190691-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107413

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-colorlog_6.7.0.bb => python3-colorlog_6.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.7.0.bb => python3-colorlog_6.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
index 69f4be17c..6aefef6d1 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
@@ -7,6 +7,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
+SRC_URI[sha256sum] = "fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6"
 
 RDEPENDS:${PN} += "python3-logging"
-- 
2.34.1


