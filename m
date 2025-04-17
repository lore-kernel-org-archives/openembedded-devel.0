Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B2DC369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7703.1744893156402212836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UtJ4E6WX;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so3810375e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893154; x=1745497954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0S9WO6W0Kr6doTVMoY3xl1pBoCbUSVJCOVDfG3zcdQ=;
        b=UtJ4E6WXwkO3HOCb5BQXluYv5+BE5ockFlzKVeWqnK7MnQgnUCczaoxy2xaIUUfcQI
         leTo3qibCUv+/BUC5Kx+ocLmzpIp+m2xPMZwZzioC1s++eLEQM6i+o2h9gqTry/+Iha4
         bOeY9hdDxNl7HFVW6AQeuFce9CPx7kivsH8WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893154; x=1745497954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0S9WO6W0Kr6doTVMoY3xl1pBoCbUSVJCOVDfG3zcdQ=;
        b=sSsdlYjgdW00o4k6huBEXRszsgP6f9Y1J8lIaPgDK6Fq6QlmUceGwFsL9J3TsjidJ+
         MEyMBmm0xdFlQAIUAStHi/wNuEknPrIaSlXua6dVgYQWWo3ZIWRRLpCeuj35WQuZ6jTH
         MgF/nZptep6dN4cCmJ8KWz5hWJuqsY6ktUsHbE4+pHBVy3Prnx6jzG1Ky8FOp8qRmtCR
         4zYTuDm8OiUjHD6qKSSvrLq9nnQrAyx1UIf9RjeWBmCFw99RQlctjrGRKuT6KeqC+eDu
         3ez2Bx9Um9i4cqLW4aeEhB6C6+8OcZYKG9FAvHoUzW4dx1L32Csg9CPtHcYxtrEbzQ31
         8h3A==
X-Gm-Message-State: AOJu0YxZiIKoPdy3jAxnKwFWeCUNTwnTJiQ797NBph5bLa3u6O9kgfyE
	GTFJzrJTTCEksemsYvhWtoYN+YChGqWz2kQsG6PQq2udg+JCI5B7jsg45nABu9W+TZUCFP9dnbh
	d
X-Gm-Gg: ASbGncug144BHoNMitUeZbCs9eMGY8aRJz50AIRDaQCqFFE6cVJJtB7G5JAix+1nJt2
	jd/LZQXIEQt6fm+hld44XcjJz9yANLlLoZVHqLRjcC+5ahF6UsMna59/4Gfb9L1VCP3LfbwHch6
	72Q5f+Daxn80nbqf4W50aNbXpL4qFQkB8vjZd+M18wse3g378RuGm+eXtrLPOvZaBVwcpOu2mso
	U3bPNWQRf+AffW11W9HIfVrNY2URvkUInV8iqyHCJwvwdBztGdmuYaDoGpu6ubA0o8LkUZo3W3C
	fVHX6Mc5q+qSp8SxacMPrvHGs5rH89YMwSvAQI37jWvhiCtsZ+aLkWM=
X-Google-Smtp-Source: AGHT+IFGVjuh0Lpxk/8SnjR38+Re8Q0TLHYv0T2oPNPdQsjoIk6a+UOT8lJkkrMuUxQm7ujfwLbk9w==
X-Received: by 2002:a5d:64ae:0:b0:390:e48a:3869 with SMTP id ffacd0b85a97d-39ee5b11205mr5494957f8f.11.1744893154234;
        Thu, 17 Apr 2025 05:32:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-yarl: Upgrade 1.19.0 -> 1.20.0
Date: Thu, 17 Apr 2025 15:32:26 +0300
Message-Id: <20250417123231.3063208-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116931

Upgrade to release 1.20.0:

- Implemented support for the free-threaded build of CPython 3.13
- Started building wheels for the free-threaded build of CPython 3.13

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.19.0.bb => python3-yarl_1.20.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.19.0.bb => python3-yarl_1.20.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb
index 22203d335b..04e150e164 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "01e02bb80ae0dbed44273c304095295106e1d9470460e773268a27d11e594892"
+SRC_URI[sha256sum] = "686d51e51ee5dfe62dec86e4866ee0e9ed66df700d55c828a615640adc885307"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.39.5


