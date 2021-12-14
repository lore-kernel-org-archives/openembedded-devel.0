Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFD9C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:35:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.25617.1639488902427356564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=CUCcGOzq;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id a37so27242462ljq.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGUZlbflo0kRigDHHLY1bT6lZ5Deoltqxcy64UVTEgQ=;
        b=CUCcGOzqb9XLPu/uhF5GhlJyfbe79X8tR5Oq/54Pneg9adj4GrxhZ9XYZxacOY/WEC
         a7TBLXw5I66xLf8uq/KG0zf0xe1i22n9TccAQDl6kgPU+24ZaufFnEMFHdhEa7p7qv68
         kVA5HuE1hweerFzjEJ3JQXzHb+LFxxBM+Y9ifr4koCxdgqnZEUxL+LaINvSxFxhLqwmq
         eY6lCA12jkedypzBOtVel55ZVvNTHwnq2bocy0EQbFyEB/5gVEdnxn6mcx8DsvcBDXsK
         6NwTI8MWlpn015Oxa6ptTr9Ho9BAnnSWqVi5edSKxg/DxBCkLKI/2BqDkp81XJckwZiG
         8HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGUZlbflo0kRigDHHLY1bT6lZ5Deoltqxcy64UVTEgQ=;
        b=QFzRtQDNVB+ci6Znoaj5HyX8Df52qanXZklkofXqu291CGjBJggw3Yhzzson70do/j
         9iKTIzLZLDVyYqXclsE+ouHzWiyGFaxBUPqUZkE5IbCuZdBM4hEP0wVfVJmjpO4fEUlC
         DCWjWrXT/6i7szEIu9UpZzFXHh9v9aRUz2kkYL+Eh+ZFP0TCrHZX9Fz7yuenCvlAhSLN
         ydSNZFo3R7j/EDS6/vgrblXXy57Rx5nLj1L/O/KRWEWjFta1VwBsv5+SROG9nhEUHvUh
         yaBToBR8U0+3uhZSnWIFDezmu1RH4yE548WA/TCfHE8LIgchaB6LK0c+FBaaLMiteqWT
         jC2g==
X-Gm-Message-State: AOAM5305Oft5WzACjBhjgIrmuO5IIVsrtZ+F4ugbIyB6KXeA8XDBsiVs
	KduoPFEW1USXBpH5HngYdmql6Jbnn2sLMEIw
X-Google-Smtp-Source: 
 ABdhPJz+AQPC17sUvH2W5MSQAiYk/G6WwjWoYoWQjtLdJYbKTqgJdaBAG5vVzgODOi9q4DIzYmLzZA==
X-Received: by 2002:a05:651c:1036:: with SMTP id
 w22mr4714153ljm.356.1639488900337;
        Tue, 14 Dec 2021 05:35:00 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 j16sm1832048lfe.4.2021.12.14.05.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:34:59 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-googleapis-common-protos: update to
 1.54.0
Date: Tue, 14 Dec 2021 14:34:58 +0100
Message-Id: <20211214133458.1175301-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 13:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94352

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...tos_1.53.0.bb => python3-googleapis-common-protos_1.54.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.53.0.bb => python3-googleapis-common-protos_1.54.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb
index 58d35f3d8..afc6dcbfe 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.54.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a88ee8903aa0a81f6c3cec2d5cf62d3c8aa67c06439b0496b49048fb1854ebf4"
+SRC_URI[sha256sum] = "a4031d6ec6c2b1b6dc3e0be7e10a1bd72fb0b18b07ef9be7b51f2c1004ce2437"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


