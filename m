Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8588E7E65F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 19:36:47 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.523.1695757002359285068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 12:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59c0b9ad491so116918817b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695757001; x=1696361801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylNKeQg/PB67ci01mxTiqH6I5QkCNYwStF0mKPeeENQ=;
        b=L57+tfYYBHEVlWBWmHWsVFbxGet8hwPvaK7R7MLxQQiexFOjruyxhBaYPK/KzxOq3P
         X3AXzE8UtdJoz/7Vii+JbIpxbTfn51t5PcyFiv97tpSyYGv1C7ytRauXXR9T/KS63l9N
         nYJoxF9LpZx1U2vkJmxR9znJZLw52yvvaW36ZQeDFUueLoDxDp0u/kWV+e/TwZHxNw8d
         K+oIg9KH0e6DKKUu49ZxiIBlCZtJzOREmDINlScpkhDLAGixyThHPTrCgsBHsq0UEZ8v
         i6J7vQ43BuRkORRKs/Ep7Xkbue0cHaAR/jeB+vbEkNxsH/z5V0QvhDhxLlAfN2JNbVfX
         ky+w==
X-Gm-Message-State: AOJu0YyPBp8Smz3bESWa4vlRBzecta48HzXyDqkB8z2bHGIJdNYgpfkU
	UzmaXOIxvw0hWF0MT38wpZCbJaqViuf1HQ==
X-Google-Smtp-Source: AGHT+IHviuXvSTLrnMVvI7WVw2OBOMtk8px1y4A+XTdXw86WwS8LsMqCLdUygYJ/UImkejQ+BEyhEA==
X-Received: by 2002:a0d:eb15:0:b0:595:e1b:b978 with SMTP id u21-20020a0deb15000000b005950e1bb978mr10841079ywe.21.1695757001094;
        Tue, 26 Sep 2023 12:36:41 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id h22-20020a816c16000000b005772abf6234sm3169047ywc.11.2023.09.26.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 12:36:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-argh: Update version 0.29.3 -> 0.29.4
Date: Tue, 26 Sep 2023 19:36:30 +0000
Message-Id: <20230926193630.1565463-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 19:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105147

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-argh_0.29.3.bb => python3-argh_0.29.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.29.3.bb => python3-argh_0.29.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.29.3.bb b/meta-python/recipes-devtools/python/python3-argh_0.29.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-argh_0.29.3.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.29.4.bb
index 93e0a84ee..f67ac9d6c 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.29.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.29.4.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://README.rst;beginline=261;endline=275;md5=a8bf3475df7e0d575a53d04c83d5e090"
 
-SRC_URI[sha256sum] = "58e438ce9169aaa2e6de147e3ceb34ceacfe26556a2306f50e2d46f52779acb1"
+SRC_URI[sha256sum] = "695c0ae4534270cae2697841b4a56f434a990694a00264ea10ebbbcdc02c13f7"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


