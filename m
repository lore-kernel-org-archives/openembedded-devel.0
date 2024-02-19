Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC214C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:17 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1103.1708379295532915444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c02adddb8eso4238830b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379294; x=1708984094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLC+uFDoMWxbphiroWrQ7BPimc3TCebku0eapL2rhAw=;
        b=vD4NAt9YdC1k+d/AXf7zm+/QRwZBDuf7PABr+8neVkzylsHaiamD4Q1h1vPH2vNLmU
         veDEPuGhXF35K1WCCjwZrmFeFbVzgglaOWRrHtUGPwSjcNniTfKIlOvZWw91hROS+99W
         as2IrqeW3epK8Jsl8o+lM+wLRtr57aT3PVeJSa1yKKJsKbjg7ylWQ8rsyt4fcgvo6S/v
         A/eoy7iF1Ct/dkmDS35OEPGOb32TSFZo1an8DeeHu13E58mo0Q+SCIyOO8rskY8AAFlY
         lgG/3CokJDpmCLzyIiLz8mY/rxWWprw4CpYy+EBV2dpSBi//rMYUifWVI4PixyOwlBE0
         DB1g==
X-Gm-Message-State: AOJu0YwSmb27/Mgc7a5wLyavwItPTJupMKrU9GM8pNrpjEen9ynRlys0
	pvyh79HwiH7IcL3qOrCOmLmBzHVMKg8RP5OgjnD+qZL9bPedTchCOd07n/k8vpk=
X-Google-Smtp-Source: AGHT+IE3XI1tMXqUdC+xV2acTEIFkiYuXOQZnkrG1/2dN8rprQxeOvf1WcRNOUiaiJnAxmP1/rrmpA==
X-Received: by 2002:a05:6808:10cd:b0:3c1:3527:bcf4 with SMTP id s13-20020a05680810cd00b003c13527bcf4mr19536314ois.2.1708379294342;
        Mon, 19 Feb 2024 13:48:14 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/8] python3-msgpack: re-add working ptest
Date: Mon, 19 Feb 2024 21:47:55 +0000
Message-Id: <20240219214801.1514843-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108887

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 51fcdd2b2..09fd7eb25 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-intervals \
     python3-ipy \
     python3-iso3166 \
+    python3-msgpack \
     python3-multidict \
     python3-parse-type \
     python3-platformdirs \
@@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-jdcal \
     python3-jsmin \
     python3-license-expression \
-    python3-msgpack \
     python3-ordered-set \
     python3-parse \
     python3-pillow \
-- 
2.34.1


