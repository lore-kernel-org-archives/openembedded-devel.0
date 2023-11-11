Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7698C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:58:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1808.1699729078700446184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QEx1q7EA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so25492735e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699729076; x=1700333876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPyL4fa8m2iP0LUMhe7rTB0rcJSj4Ihelm4nc9Z8l4Q=;
        b=QEx1q7EAAD7vcjALOqQ4Zp2l3VSt6quFCzZEn8HF6ywwODE+AkQa5UvHydnIl3SSxy
         3jU+oKDEv5LbjT6ZTdhBwLqGCO271BKvwLGSfCY+6bTdfuhfXd0VrVsceSBF/YsQBanh
         9PUOLsKSNDdZJiQPFSwCB30gZuqAoMF4+BvHhoKCCz7vBuQbcDAJjoP7kI4F3BJPP3Ae
         JYIrywyrsWk0lm8wWhhtLrw6JXL+ngXozdcKVZW+sm6d7+x9UZ/IqP4v9tet/FMIAL2i
         bsb8OELVJqzU35RrM7YFdkBgzpLtlgzRn3xBvu5wJJFfHLJGBj09z9dPbmdueT2hKrJs
         ucDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699729076; x=1700333876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPyL4fa8m2iP0LUMhe7rTB0rcJSj4Ihelm4nc9Z8l4Q=;
        b=qtcOaCx1FJsVLuV0lus4TF9JvC371yMSY4wSe5cG+ArsFEo5PVhBE295P+d/npgnnr
         IubnxfIDCd96Gk+m/PAubqx/DZ72lw2h98nlN+Rkd0G+ELZYI8rUOQHigdS1kaMqK2GH
         J+LD0LNnB1S8YGiStliYQh1P6jOxBEO0ISfwoT9jepNrGQw946FSEb/ijCykzF6AUCqo
         Y9Z0wtkTuvLhRxyf2cxApmeJSlgaxviTpux8L9FjvZ54IwBCAjE4DYAWeYZOwMTSsQzG
         2Aj6AVmAQqwAkBsEGqUTWkAnGAt5KDjo6b2WWaZQZroEbjw53kyL/UjmyCU81LoDKQt9
         Qisg==
X-Gm-Message-State: AOJu0Yxtw04WlL4OYvIkTlowG/dt+NlbmkZTcwGqGXWE76fKU4iq6eiJ
	GhFC+QwXvxWqS8UU10B+lnTC2KFBZ7ZC5Q==
X-Google-Smtp-Source: AGHT+IFVRtKyIqgHhVtlIOquQcWl2KBKooxFns59fxFBmtS+YS8xfM+aF7X6covgApoX7qbsgX1SPQ==
X-Received: by 2002:a5d:59a4:0:b0:32f:7a44:76df with SMTP id p4-20020a5d59a4000000b0032f7a4476dfmr1955183wrr.49.1699729076503;
        Sat, 11 Nov 2023 10:57:56 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d548f000000b0032fbe5b1e45sm1974210wrv.61.2023.11.11.10.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:57:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] tuna: upgrade 0.18 -> 0.19
Date: Sat, 11 Nov 2023 21:57:45 +0300
Message-Id: <20231111185745.3414221-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106564

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-extended/tuna/tuna_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/tuna/tuna_git.bb b/meta-python/recipes-extended/tuna/tuna_git.bb
index a49341240..0d71a3124 100644
--- a/meta-python/recipes-extended/tuna/tuna_git.bb
+++ b/meta-python/recipes-extended/tuna/tuna_git.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Tuna"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
+PV = "0.19"
+
 SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
 
-SRCREV = "0681906e75e1c8166126bbfc2f3055e7507bfcb5"
+SRCREV = "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


