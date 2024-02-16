Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588EDC48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 15:23:31 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.21346.1708097006185641964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 07:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-598699c0f1eso568308eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 07:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708097004; x=1708701804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc+bVrcSfav3CjvbmfLgOmf4fi4VtRnlwtfgJIrUxYc=;
        b=uvL5jutgcdukdydgMtBCcXBls6I/q+OG0J63KERUxTZYQoX/HZqF73olgkvO2g/7us
         qi27zazaF9RmEm112EB0Sdp5a+VK2hZnOYVmPYJhw+CPzFHZ1dyJOpo/ey5cRDN/Rvvx
         4x81dIgQyXHMb6h1eQJKkNQAc218rTOtnnBNRVb94bPCr1So1RhErcu+cxMB/KCZhP+D
         jRD4Xjsy8nQE/fJBMctGQBIZEB0jUsNxmf7diljTOJaRSLeRh8w6r0A/MWizn938ZD+y
         ZwDRbqk0gtF/2CdXcZo2QjjHSNHBsB62k4C+uexZa3JNKAbsgMLXswkAcECdQP8hNemZ
         zxSw==
X-Gm-Message-State: AOJu0Yzm+z3eQKh/p6JPD4Wazsygsf3fLnyIxhhkJTT0RGKyzcFu8GwG
	iupB4XSJXz0PZcnXbX+0kkiXGsX5ZbQu6LINpWFddEMdTpUspHOvXQwyLHhXa+Y=
X-Google-Smtp-Source: AGHT+IELk/pyl98qYUOj/X+LrLVH3tPpgmVnkjdxD3nwqSnhu7GUGDmlDHXI2QiG5fC/yGssNynMvw==
X-Received: by 2002:a4a:6245:0:b0:59d:c3a:d6a0 with SMTP id y5-20020a4a6245000000b0059d0c3ad6a0mr5474299oog.4.1708097004637;
        Fri, 16 Feb 2024 07:23:24 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k1-20020a4a9101000000b0059a14309a29sm13648oog.16.2024.02.16.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 07:23:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python3-yarl: add ptest into PTESTS_FAST_META_PYTHON items
Date: Fri, 16 Feb 2024 15:22:59 +0000
Message-Id: <20240216152300.2587130-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216152300.2587130-1-derek@asterius.io>
References: <20240216152300.2587130-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 15:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108768

Verified successful test run using bitbake meta-python-image-ptest-python3-yarl on qemu86-64

1106 passed, 5 xfailed in 22.83s.  xfailed tests are known failures upstream

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a96009ab9..67e861ba8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -55,6 +55,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-uritemplate \
     python3-xmltodict \
     python3-xxhash \
+    python3-yarl \
 "
 
 PTESTS_SLOW_META_PYTHON = "\
@@ -86,5 +87,4 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-whoosh \
     python3-ujson \
     python3-xlrd \
-    python3-yarl \
 "
-- 
2.34.1


