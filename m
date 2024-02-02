Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2A2C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:11:39 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.2536.1706897493248603736
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7c01af010bcso87579139f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 10:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897492; x=1707502292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN0mIzkkqoUzlbvl3nAiO17TctJ4zWXp/HuNZhmklj8=;
        b=Q3OiiVG6crlihxX1mdwcVDmy6tGnig5/Pv9rc+64I3v4IegvltJFAps+v8S9VzSg0d
         7A200OCDJpt9ZeGg+DcTAAXwOKv/RefgtMe3NU8heVjo1HhsTLO/x2kmcNgV5OFvE3V3
         PzRhAOk/2zGvFOT3D3X9mMVZkYwfYtLfmZ8ZM2rbxDmTA9PWe8lkT4S9QyuxlY3PD3ER
         qitpjJA6IO/XrWNCKStZq0Z9E2jc/LafPd+riT9BEjU4DqJPv0tlgxeOBif78Q/yeJD9
         PDkWyfFznW1hDme+lTVMrhdCEvXciNIMyy1VRwgyp9lYzgPTjUh4/J94z5G1eDiGMLAU
         FxqQ==
X-Gm-Message-State: AOJu0YyFw3or159JHNNoapiItPLfE4IOjihrO9U3Eh1gTC5E2EKP8rPw
	zVTbuNlLUrr2NKI1e1fFMhtCJnZpAj0Keq1bmWSlMDaiMTXMwv7/Gd9RtLiKz4jJJQ==
X-Google-Smtp-Source: AGHT+IHv/3s3RgmwK3vsyYt3EJ8Sk137p8JX3YQWyKEzelqwB+c0CIjRLK0NSzWBFhQiTXflpMDpkw==
X-Received: by 2002:a6b:f00e:0:b0:7bf:7a2e:41a with SMTP id w14-20020a6bf00e000000b007bf7a2e041amr3100012ioc.12.1706897491982;
        Fri, 02 Feb 2024 10:11:31 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m20-20020a056638409400b0046e917416c8sm581814jam.89.2024.02.02.10.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:11:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-types-setuptools: update to version 69.0.0.20240125
Date: Fri,  2 Feb 2024 18:11:21 +0000
Message-Id: <20240202181121.1502646-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 18:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108534

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ..._69.0.0.0.bb => python3-types-setuptools_69.0.0.20240125.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_69.0.0.0.bb => python3-types-setuptools_69.0.0.20240125.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb
index 2fc1895b0..7e15dcb13 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.20240125.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b0a06219f628c6527b2f8ce770a4f47550e00d3e8c3ad83e2dc31bc6e6eda95d"
+SRC_URI[sha256sum] = "22ad498cb585b22ce8c97ada1fccdf294a2e0dd7dc984a28535a84ea82f45b3f"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


