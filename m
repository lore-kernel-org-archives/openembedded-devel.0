Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.262.1617899793219958825
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DzrvLy8b;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2901227otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jDtowhM2v/99FqxpBXqOd3BvpY/A8z98PidH7biZtDE=;
        b=DzrvLy8b9uEiABATlWJm/OrmJb4RQ293uP4uqlVwwcFHc1irdFGT4W4glK0ojkH77i
         RLcOYvGt2ZIR83h1JAGAR3Hq/s5NVixFDcheJAOUykZBY0vHrBnF6KCeF2Y6Bo7UtK0U
         Gx0msGlxujuYQCYzK2kkhDHlb6kdJcXGEVD5T0kwuBntDbGxO40vKHWOvhUGdlrvYq3L
         Nl8UrMdbzpS4l+kjV3TVLXHwWy/TgjIROk8QpAk+CUe9Git7CQOKGKJTbHZKzf06yiEt
         SK8+blle5kUpA6RMACes3zBzxd+xxaLUsh76uDks+Kh09MYzhiDsekUja1SOVQFjmSZD
         eGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jDtowhM2v/99FqxpBXqOd3BvpY/A8z98PidH7biZtDE=;
        b=pf5Xa5BuV7kbsZIbneVEL805GhGjKbP55bZvVOgv51lwNWCG+CqyO4bnyNoqk3RLrB
         RCY8l6CVOACxk+HQui5xjWmHiURS6DRMWdj7AvRFrYcm4aUbP1KSaTtnAvwGVXNkQ7kJ
         OjMEW+5Lrr79GLD6zHrufLRYJzI4Kpx51wH6+nHPUx5qdQVROU/uqRy+VYe8y6/lxuFB
         4VdbWZ0Peg0sja1Nb+j+GtJdCHgw93Hf6Hl+sPTHdTUgfqHAlxxHENMjOKejE8rBUTN3
         K+v4QCTV0pTZdQ1WDniF7p2TYO8sJcoBw3seWhn+66J+xonYKZuRLsCyP6JxgCZ9HZ5i
         xNQA==
X-Gm-Message-State: AOAM530Z40KJkR28qU3nyqIq0kjbSXPskGm1X4UEvsuEyaOm+Xz5VH9i
	ZqQrZOAT4jj3c7KSSObC11fHEN4VnEE=
X-Google-Smtp-Source: ABdhPJwyxT2V/FQaaWHJbGitqRrskOUVD2ZDyX7zyBsFhFc1lWVB4opLgsI6uU7S9CYHBTIadS7lgg==
X-Received: by 2002:a9d:7545:: with SMTP id b5mr8177903otl.223.1617899792430;
        Thu, 08 Apr 2021 09:36:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 21/64] python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
Date: Thu,  8 Apr 2021 09:35:28 -0700
Message-Id: <e9b5b5a1f873ba115e158d4029c573fabc9aaea0.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.2.6.post1:

- Improvement and refactoring in CI and tests with ``tox``.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 75ef564e5994ec212da7e9fe40ec7497dc7ccaa4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.6.bb => python3-cheetah_3.2.6.post1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
index a7e5443f25b..8149d6ccee4 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -11,4 +11,4 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
+SRC_URI[sha256sum] = "58b5d84e5fbff6cf8e117414b3ea49ef51654c02ee887d155113c5b91d761967"
-- 
2.17.1

