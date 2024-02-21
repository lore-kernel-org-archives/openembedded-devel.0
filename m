Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72413C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 23:25:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.1089.1708557939556332938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 15:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c17098ee8eso673029b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 15:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708557938; x=1709162738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qRuufs2tBCQ3CV/NbY6Ey7NXQGqTDi+q3sV7EhXxyU=;
        b=vQVHkrsZ3wvWR1eEQR+5FDHDXobgP+6SmaMZvQmxsm3nXFkNf44eY8wdz8pwyKNzPz
         ZSSBSFS+T27viuh640AVg4aRhTBaWH+7u0dPOQxQK7ELLAmbCytwZNwo7uujlZwwDxrq
         t2RMa2/KDV+QqxhRyv49bHHm8MeP0LLkjgq/J9aaTWcF/AIMd1dU4SkYSgUCuIa8SRIm
         bcH/b4/AgpHLXCtLXA6Yb/n6UZPSSht62+kV1wCcHWrFlfxzoRrBt87SyG0eHeGR/Mqr
         aMgYuln/o1jBipKNeyAelC13D1ItStSd/qst5q6i08gdOY5gfSl7wOR5Nq5Fe/v805hv
         QuRw==
X-Gm-Message-State: AOJu0Yy751DbJ5YYg9YgfOxFZvVx03gnaH66SrjxJZOT9pYGYI5AV7DB
	fLme4xWMicqeChVPMu217hTaviUiGqTRw/L2sY2+TdC7Qewp5zWTpCNKCVHMF+o=
X-Google-Smtp-Source: AGHT+IHVfd/DcxLRlFTTsW5f/JCuqSf+cm57jXTWIAu9/ffSFdp0gtGtdUJj/N0yJjppXZMOeEWpjQ==
X-Received: by 2002:a05:6870:9d06:b0:21e:bc51:21eb with SMTP id pp6-20020a0568709d0600b0021ebc5121ebmr13054825oab.8.1708557938363;
        Wed, 21 Feb 2024 15:25:38 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id oh25-20020a0568702c9900b0021e7c192093sm2600909oab.27.2024.02.21.15.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 15:25:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2 2/3] python3-msgpack: re-add functional ptests
Date: Wed, 21 Feb 2024 23:25:20 +0000
Message-Id: <20240221232521.2196633-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221232521.2196633-1-derek@asterius.io>
References: <20240221232521.2196633-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 23:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108974

Verified tests pass with via the test image execution
(bitbake meta-python-image-ptest-python3-msgpack -c testimage)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc   | 1 -
 meta-python/recipes-devtools/python/python3-msgpack/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 8593b65d7..b3ceb457d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -76,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-fastjsonschema \
     python3-gpiod \
     python3-jsmin \
-    python3-msgpack \
     python3-ordered-set \
     python3-parse \
     python3-pillow \
diff --git a/meta-python/recipes-devtools/python/python3-msgpack/run-ptest b/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
index 5cec71169..8d2017d39 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-msgpack/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
index e88532e73..5180301f7 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.7.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


