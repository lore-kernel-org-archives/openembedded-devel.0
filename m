Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.4546.1620811921365766025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 02:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q5W+rHFh;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u21so33937020ejo.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wVrUM7eWehvlDf5ENt89pO4C8mfLic5GhFbls/ekck=;
        b=q5W+rHFh2TtobhH/dIyRcd31kJ7Azahow3rurbIYXYF5kquGzI1XV5hA5NTG5PYRQA
         PeOJhkzligWJuewrTFZpgewudwLmmQOFAXGOS/Xg+ahHR0OzuNeMi/HyYJ8EYp7FnPHr
         fy0oacfAMejcYWWWGGxWcb1VuJPqmn3ClvqbknQMfrnnFJT7R/eG8pARv7VsnUz+U7Eb
         eOzjtY7WtfPSG76aaQFTSdch8kX3v5sgLcbOjDmpU/aC9xR30H9wdjTxq/L1kr5ip47+
         m7qm8nMIcXeBdCSySdRKcQtnoajHJhtNljj3ccC8JmTOqjkT7yeWwwkP5uEyFzNytv46
         zM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wVrUM7eWehvlDf5ENt89pO4C8mfLic5GhFbls/ekck=;
        b=W0+ZwWTjNqOLkx9JlJLanDu7XQc7v1688P9ow4oooKBFKsZ5oD2O61nvB4JZ05KAT3
         nD5YEqjghgyHULztDaHNfH1zSz0ofodTQxwXSSV+WCUOHOTRmLpBtCWSYPaAGzYscdf8
         uNIiBMMnDH2V5jlpXAcis/NmA9SndORxGBYxlQ7Aj9tH4wcf4gdUolvVL7dRqwQZKxKr
         /7WRzbKbnxzUsMQnHmYd4jf1o5gtMxNhl73UA+Qe/aaF/H3yC3b5cJGNODZLyXZzcUbA
         zZuz81yQptBewm38pH6DoggcmbhvUAYXurvhyUF0rV8EDqFwo/8DYVtvYlezS62WGmpv
         q58Q==
X-Gm-Message-State: AOAM5319c6TI5FjE8JWy/dZ3YSNzv52PR1zLTQUApwIoVEH4wfQnI8IN
	aIl6xTEJCzz82/0xEN+zNFjXKAGMrfw=
X-Google-Smtp-Source: ABdhPJyZgvamXIFpgtmZqDxGlA38x0AJFagH7P+2PZnIr9qQP8TFcHC4VdktGAhSWuKwzQeFBB+qxA==
X-Received: by 2002:a17:906:2408:: with SMTP id z8mr37643447eja.60.1620811919946;
        Wed, 12 May 2021 02:31:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n8sm3764071ejl.0.2021.05.12.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:31:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] ostree: switch from default master branch to main to fix do_fetch failure
Date: Wed, 12 May 2021 11:31:57 +0200
Message-Id: <20210512093157.48670-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* branch was renamed in upstream repo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index 43021c5342..86407459bf 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 PREMIRRORS = ""
 
 SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree \
+    gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
 SRCREV = "6ed48234ba579ff73eb128af237212b0a00f2057"
-- 
2.30.2

