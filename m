Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.5926.1617634477223492398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VuccKkqZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so8430385pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+fzSvJ3ng0syo/LiD/N8ALXVcLvScd6d8+I/ZFESvvU=;
        b=VuccKkqZ/2NZeSlAXAlhZ7W5TJvL7OwtC0BRTsVJcs4nPRmtRkjaDRr5o8zVMG3XFg
         U0oVVuCe1fI+HfoidJT9d9FcudaQjCPukH8gL58k3rizmikKjJgRhQ4Ht7T7TGsZnawG
         ibrN7oGcTxqPwdot1Pg9nVkW9UPgmXg2SOYiu7jgCLD0PNDcp2eOaB+qmo75u92iZ83/
         DBxr/wr+I+mualU1LxMm2SMhbIPWvFvH9c7uzkg0XMVzJ9wcCkE00tpt5BYM8lDAs/nm
         oOkRHbHk0QWu+Xwi5YdjWcJZdlNiYluQv9ZZodr6JU5QCCB5tBT9pM+lgUugEw/+JVPq
         JndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+fzSvJ3ng0syo/LiD/N8ALXVcLvScd6d8+I/ZFESvvU=;
        b=BYOMKdZlh9oyjyPca1+E+c+/7e2HMLLEJcxp+0FKy+e5a7lZuuwVMiHX18bJBtB7Ux
         +Ro3JwLDugVDOL587eH3hGH2nN0VvJdDiRhWCSY3ik0coL7+ynzSkxcooqbHebzy9xOY
         4Mfpunk7Ha4pgM7E1VWzNq2Rw2D6UkTe7C1RMXO5Yxu0ycL7bD6fe8MVMuRgSSQumW1S
         +DexEIxUmHs/TzSADdqLR7B9Qp4mMRkme9jPR6i0KprUM5qt1ckyx1yUk+7pvno0KfSC
         fMULfeHftbg5FMohETWx676U4v1Vj0fpeQ6dcvrPNpTlvZwEofzr/YSZIRs4/N31Q6pj
         OYLw==
X-Gm-Message-State: AOAM533+G8Mrr6WGejGVl80hrUL7BlF6pE3dVhR2EiDZzB0i7KkARe4J
	O5bSmxVHOUeDh/bIKyL5aLCPDfegLko=
X-Google-Smtp-Source: ABdhPJw7463WHaXEOlS2w1edWpuRbHF7xT2C7yBd/8wLulNe9U5gxKY5SAwsLwchQ6C5trc9zFZLRg==
X-Received: by 2002:a17:90a:6343:: with SMTP id v3mr26650994pjs.153.1617634476675;
        Mon, 05 Apr 2021 07:54:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 06/11] Update commit for version 3.9.7
Date: Mon,  5 Apr 2021 07:54:19 -0700
Message-Id: <0d42c85b1336ef6f9b5bbdb1abc281a3e82bf4d5.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Peace Lee <iipeace5@gmail.com>

commit hash for version 3.9.7 is invalid
because previous commit hashes
chagned by git filter-branch command are restored

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fdbfb6ce9943a1739220c87c3f8b5ea7bdfabd84)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/guider/guider_3.9.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
index 2b799fd5e45..88fad936ba0 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 PV = "3.9.7+git${SRCPV}"
 
 SRC_URI = "git://github.com/iipeace/${BPN}"
-SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
+SRCREV = "459b5189a46023fc98e19888b196bdc2674022fd"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

