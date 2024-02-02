Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6598C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:43:56 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.3298.1706906629684628936
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3638b5f8240so3740415ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906628; x=1707511428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZjjEAgqxBmaIIXhnxVWMeYLx/kZkKbUM6H4yM7VEIw=;
        b=VQDx0nvibczryo2vGgkpm+D1bK4h1vmiIi/9VYqCrohDcigOogeXHDPF7gDHHXeKod
         a9F07nvSvBc1Vdf+lh1BYK5hq+Yj6K7iyonrc/od9tCEqzXCP284KiVhlqyJBmLOwVTf
         ciK8nxSNhCW9RHh1JT6BnDBo/td0ynUsptgB8LDY5YXOSgmsftjvs1sVBoll2qYWBVai
         0LzqeqAwneT4KRU2M8sLH8FJkI+cON3fX3fGzcwN7uCuEB8jvbGXWAlndx6C+xMl3Bko
         SuLt60X7rnnxm4m4weYD7shaZvaTF4e0kBMIV9IyziJHTvCDQduCsEH/i1NSnEqQftfl
         Uibw==
X-Gm-Message-State: AOJu0YwvKoleYkVxZAVU36ASnVobflp+QAOorownZXKZk7OedV3a3u2E
	s8eE0yUFBC+jBYG138FlVQ19YYZsxgnIXrHoa7NZ3oNLAFLCo2SjXVqKq3Y4iauhaA==
X-Google-Smtp-Source: AGHT+IGLBsvT9fPz4ko4wg3E7LczdJmsy5OXI+FEUXwrJ0KK+smy0z3GVCsFX8l2oYxg+DBh/hwIEg==
X-Received: by 2002:a05:6e02:12e7:b0:363:8985:e852 with SMTP id l7-20020a056e0212e700b003638985e852mr3419870iln.16.1706906628092;
        Fri, 02 Feb 2024 12:43:48 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056e02351f00b00363abe37445sm793412ilb.87.2024.02.02.12.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:43:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-eventlet: update to version 0.35.1
Date: Fri,  2 Feb 2024 20:43:39 +0000
Message-Id: <20240202204339.1582134-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108546

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-eventlet_0.34.3.bb => python3-eventlet_0.35.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.34.3.bb => python3-eventlet_0.35.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
index 64db72b2d..c1d10eca3 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "ed2d28a64414a001894b3baf5b650f2c9596b00d57f57d4d7a38f9d3d0c252e8"
+SRC_URI[sha256sum] = "3b2eede94d64538cb894eec50302a881e056ed7e057f0e24fb45b28a19d6b2e8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


