Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.13356.1630869679267873227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmOotMGU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id q21so2646099plq.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xry5dqyQ86psL6XzzHN5qI6N1mhb8x4pxqe54tl7O28=;
        b=YmOotMGUHR6pTV6suEc+wyj8z2tuHWMsdirIr3EEQUQtNl4ubddiJirQaFwBtXFx3Y
         mYp8xqZf/ka8Z/E+VgFb6fI+RbmMMBSoxy6Bxc9+FIaR23NGwd+c8pEa4dYWHKT6o1Rx
         O+4WYHfqRKAX/8I4R9bsH5D4fpHM0N230L+e7YkVaxx6aHeIWkqhXq6htcazxnsti7vZ
         HO87iXg4rfiiQN+3D4SVoxUN8pGJyD1F1oh8owt6IEDX5ZBgfLu7Xx0MWon+lSyEucVE
         VuShTdYg1esYpmztIxocK7P8ogRGpHjvzN0d5UwcUl/vrbWaogZmrfA9WrOUaOpkcCFy
         dmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xry5dqyQ86psL6XzzHN5qI6N1mhb8x4pxqe54tl7O28=;
        b=KsqON+/qcKv3fpNhWf0R7YuJASlYs6Oms4L8qCJHxaUlH/6EJ5kafIHu8wkUf1qjXg
         B9kfHmgiQJKFto2BY27k3h7dVaRwcl151Rw0M19VeNunLo7JB1eVDNIdMhswAyv5Z67o
         yjnsdPtxL6M5tEA2zbV1qYLVducNLxVs4XWfm8vCy/eNxtIYuP53YBLkTRedVn4CCPpd
         abK+TsvZj/jgoBxC6By0J/ptd+AYBTy4uZ8hZ/Rvltk5Zth0hj3GGUagVdMhmC1UP2Ut
         n4h74RWohwrRdYqphOD9dp5TtIHp0RGWcjsFtROmHcGLYoH9bFoqJ527HZ9cTGkBYGcR
         ESjg==
X-Gm-Message-State: AOAM533cQaabvIUEKqgPYuEaHUDGa5qJnJJH/KiJAkMlFGlpU2H5FL+c
	U4nq1vNF+wnDniI/1rnbXc4VqOFvtzo=
X-Google-Smtp-Source: ABdhPJyS4VnID1/yXQMes6g5rlnEwNBL0kW7gcmDThZ42xF085HclFLllGK2DQzIKWcrrqWE0VZ6oA==
X-Received: by 2002:a17:90a:f696:: with SMTP id cl22mr10315206pjb.216.1630869678744;
        Sun, 05 Sep 2021 12:21:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [PATCH 7/8] c-ares: upgrade 1.16.0 -> 1.16.1
Date: Sun,  5 Sep 2021 12:21:10 -0700
Message-Id: <20210905192112.2081037-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Source: https://git.openembedded.org
MR: 111050
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/c-ares?h=hardknott&id=dc25d9f11f3c7abc84700fc1d51fe6c2088a11c4
ChangeID: dc25d9f11f3c7abc84700fc1d51fe6c2088a11c4
Description:

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc25d9f11f3c7abc84700fc1d51fe6c2088a11c4)
[Includes cve: CVE-2020-14354. Bug fix update, no ABI changes]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../c-ares/{c-ares_1.16.0.bb => c-ares_1.16.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.0.bb => c-ares_1.16.1.bb} (92%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
similarity index 92%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index e235b9b954..67dd701807 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "
-SRCREV = "077a587dccbe2f0d8a1987fbd3525333705c2249"
+SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.25.1

