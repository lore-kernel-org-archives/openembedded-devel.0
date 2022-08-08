Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08768C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.25912.1659968721982457239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CUZ8qFNR;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id b4so8929295pji.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/aLvAHAIQhn97f46LAf6vi/tm+G4wf1C5lMPlW6XaRI=;
        b=CUZ8qFNRjrnHLe2mXujC7dw8eplEDZ9wog5N0gnGIHvFLqHPtupCY9bkFiseqGBu8R
         G/MZIqsZqMdLQShb3ZFVhp53/VL6soor3ceEVGCDo6hxuA1oVS9tPY9PdoJMPOaibWTr
         tqT129SXp3g5ATpl/EP9XjNtASwh5MLTBvICeGaeCCnf0jNkCTMS8ekKwRYynJ/cVGeS
         iYqMfJzj19iPWo1wD2h0vhYj3X86E83q01H23fzJ2Ak3DWGIc+i75SXUhE6IaOjz+uWy
         luVmXKfx4HFJzu7W9N1N+CmN0r6EeAryfO1Y0auZBb3ZUw1y/ILvc5NcKvIVy6mESyYs
         Bo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/aLvAHAIQhn97f46LAf6vi/tm+G4wf1C5lMPlW6XaRI=;
        b=Yy2U+9z1p0wce6pesQ66/TdqOPhQ3IkWZIHWI+KVjmElcsj5Hn2BCkKhQS3N3c6xn4
         NOkyKHqVYx4pgf6aquCM6y9RwxTYI0pOGhb6xB85shy7INROF5SvEkiX2ldNzkdLdX54
         FakJaYsd5soQ5pnFwNWz0kDja8cuNsTM+hWgUNJGnqXNlx0lUg3zpcDfbvHDk6epZ30I
         TS/4VZETFebc2lLpTITeUfGd/NiK9zkWmVaUpVVjzNnK0ety7D80G2aYCazpOmIk9CG4
         9aXX4MGodFO1+o2Me1ZbdyCGTWUbSl4d+n2ShDHGzcpY+EnodJtkg3HD2ti4lbGlJ4Y6
         S9og==
X-Gm-Message-State: ACgBeo3dVaz4r6Hj2s/P1LitgJTwmf6wDHsTUtI4SgBYTgkkp/H1HSAq
	wUB7B882Gcwqd8QU/jS6Z1xoz3d+IBo=
X-Google-Smtp-Source: 
 AA6agR7qWHPU/mng8CNdoiyy6qpT8iSlLVR2hDor8PjPO+2q+ZaVPqtndY3SLrJ8clgTHtbf44UIXw==
X-Received: by 2002:a17:902:e844:b0:16f:9d2:f4ff with SMTP id
 t4-20020a170902e84400b0016f09d2f4ffmr19065815plg.27.1659968721068;
        Mon, 08 Aug 2022 07:25:21 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 13/13] yasm: fix buildpaths warning
Date: Mon,  8 Aug 2022 07:22:52 -0700
Message-Id: 
 <9165fb0d1fde9a99e6ce3ec37e8c2ca43757756e.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98173

From: Anuj Mittal <anuj.mittal@intel.com>

ax_create_stdint_h.m4 includes $CC as a comment in the generated header
which leads to buildpaths warning:

| WARNING: yasm-1.3.0+gitAUTOINC+ba463d3c26-r0 do_package_qa: QA Issue: File /usr/include/libyasm-stdint.h in package yasm-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7346d2bb1a60289225cce78d760e4d264d1b2a2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index b5cd35ab3a..044fcbea74 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -22,3 +22,8 @@ CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
 BBCLASSEXTEND = "native"
 
 PARALLEL_MAKE = ""
+
+do_configure:prepend() {
+     # Don't include $CC (which includes path to sysroot) in generated header.
+     sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
+}
-- 
2.25.1


