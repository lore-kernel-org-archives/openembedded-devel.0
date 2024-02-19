Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80422C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:27 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.1107.1708379298483532050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c03d6e5e56so4991170b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379297; x=1708984097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INXYr/9EVmtKwZ/eBhVwPG+q7261JIsOtEWxj1/Qxaw=;
        b=Gux7o2nu8b/kfg207BxFYOWnGPiXPqehy0krTNj38DIe3IIeN2GoHjGuBuGrC/kIJE
         hOVgk+FHlGmJkvOs0Dk6AEPvvcBQu3dv2LbOCOX+Fco5BgiGyQcH4w8LxJM0Ub6n9FVb
         ezkDlxCgJb3caWDexhVezsXDC0zD/mSPdqNS3ztKeByB/KFrKL4GT9FfLZW88Is5FYlp
         zWlm5wAzCLDMbpx6VmCoB9sEqPXhLBIRmlSHsQCo6kMaBm5wZSUHIgiNc3iBxqguEeua
         1XlrIMz2KpD+6aDXJE/vjCv1pQlto3qvNUdh3qOYTTRZ/sjAu3KJ+x7kJsFBOe0gvX5d
         vEUQ==
X-Gm-Message-State: AOJu0YxFgWXv0y97RJfH5dxJws3PUGi19Lx4udPPGm2Kxb3zAiBZhjlU
	djj3c1IRZLoue66WhvMVd8z2cfkNghSqksgKUzKy6TYMcHEXPrcxJZGd+uQq7l4=
X-Google-Smtp-Source: AGHT+IE10tPCNk1/CXfS7AStb10twusARc1zK4invTtZbVYngN+tsZddLtVNV6Ql7FFYtphNEl8zLQ==
X-Received: by 2002:a05:6808:30a5:b0:3c1:5d1b:a6a8 with SMTP id bl37-20020a05680830a500b003c15d1ba6a8mr3553735oib.6.1708379296929;
        Mon, 19 Feb 2024 13:48:16 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/8] python3-parse: add back working ptests
Date: Mon, 19 Feb 2024 21:47:57 +0000
Message-Id: <20240219214801.1514843-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108889

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 98ebdd07a..ea6284264 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-jsmin \
     python3-msgpack \
     python3-multidict \
+    python3-parse \
     python3-parse-type \
     python3-platformdirs \
     python3-polyline \
@@ -77,7 +78,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-jdcal \
     python3-license-expression \
     python3-ordered-set \
-    python3-parse \
     python3-pillow \
     python3-pint \
     python3-pytest-lazy-fixture \
-- 
2.34.1


