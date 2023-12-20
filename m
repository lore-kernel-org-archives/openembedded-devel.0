Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAAEC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:19:24 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.34170.1703110759056851971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b7fdde8b56so7228539f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110757; x=1703715557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLOEI5YzWKZkN7INDRFfcNQUF1jJi1P0edy/mebps2M=;
        b=peaXgIzVgBxKGS0N1aglpbtDwHHe8QvmGMgPhcnBqlFiRIiulmPe5h5UWCOuk/YkQF
         u2l2ENq76bNr4bTJJEve51kjLbhfqy3UcwFuWEV8x0+Ve+oR+EPh9pgiJfaTEXU18NN3
         S2cyYwS4VZJnbg49h+SMk2R00FhJ9oCX+R/lCPItrHLoselKk7YPp3PEVid8xvXd1Csk
         1qDhkGWy1yCdQhdBggodhAmTu+SyqnYOKfBkns9vC7s9mE5w4joIvdd2dwbxahRIDG5v
         kfeDGqKYEmA8+oaJV/nJUW7syn3yRrR1K1XSMt/dnEtUh7yOVMxRZ00BWcThfR0QCgAs
         Ruyg==
X-Gm-Message-State: AOJu0YwIKWed9tJeY6RRVglRdaHf/c5B8wegv6OSDfwbpp3A/uZdR8UQ
	VppwC2F2sTc+OiIztXPrGrolbQGj25hj5Q==
X-Google-Smtp-Source: AGHT+IFFQLwdDKWDvaySGH9P5TqkUJMzLhG4fNUXQ0RF5bURQhXIWLY8uBi7Yzk7pHcgfz0q3zYcRQ==
X-Received: by 2002:a5d:8850:0:b0:7b4:28f8:526 with SMTP id t16-20020a5d8850000000b007b428f80526mr24201263ios.38.1703110757171;
        Wed, 20 Dec 2023 14:19:17 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id z6-20020a5ec906000000b007ba73d4810asm125676iol.10.2023.12.20.14.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:19:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pdm: update to version 2.11.1
Date: Wed, 20 Dec 2023 22:19:08 +0000
Message-Id: <20231220221908.3789842-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107681

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pdm_2.10.4.bb => python3-pdm_2.11.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.10.4.bb => python3-pdm_2.11.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb b/meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb
index fffefb3c6..5ff6ffc9e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "6dfd9d4cb59043edecb2d0b47d208e55d89d333ba7197deb05cca2dfbc7a4bfb"
+SRC_URI[sha256sum] = "b10bc4e5394856f1639ddc9bc754d9c26323ec5b828a135c6ed35f935b054b83"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


