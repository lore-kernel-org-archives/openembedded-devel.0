Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEFBC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 17:10:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.414.1665680990729712709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 10:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NiToSMlg;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id d26so5286541eje.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82lumsw2T5o3dpkfkpAmTjWzKm6QIAa8sm9zKNS3RHE=;
        b=NiToSMlgd7JNbJQwCu05jrgKApuzCSlzjIktu0mVZ5tcDJPHVoV5mu4eWYl5G+nrKl
         kHRcAhg+H37pmiIswQqP7tFavPYT93K/fBHqV4jpGVbqBdHM8MFxQCPAR06tvQvlkx4+
         K7gHeWDhb0GHAW3HSFFVnZaFiO0zTvTwTP5T8DHNUopZdtrQ0CqplFzkjfWq3D3H9A17
         9dGsodGXIPsWcvFO62hEkPT9A2Hc81R+t8ydhX5+e26oChGcZGgizm5f7TmiUX8iKGyw
         DMUA6Ho8bw/6BywOCnuhvVN5y0dM74zlU0ZhBniwA0kwvpugABNtTYupVlGenzohgzzW
         oA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82lumsw2T5o3dpkfkpAmTjWzKm6QIAa8sm9zKNS3RHE=;
        b=utU38tAI0YuYrWpdV7vWInaP90NgIBmU08FJwc7pYj5VtLyW4HNlKjJ/5du8m0CWoC
         b9duhZT2CsN3WOttBvH2LQOhsiYHmF90ORh3V4ySpzPPhZr+pZqaFXJ82zTwA08Ew7zK
         S+ZrQlrt8zCIPpPylS4ssS++x/8++BlCfeJ4txYulJVGzYmrhlf2nRbLtnFQMGZ0Q96t
         22Fx1wciSVglqY1vTQIC6bOVEVjib0rZIgRiMxYISEUYRsoJxH4LSYpfJjMnXLGShJHE
         /AtdNCxGjPwANtKkYGgcZL5xYhj9zEqeEzLpLxS5WVd7ohoeHZr9XnYUIFEGW9p52unn
         zbSg==
X-Gm-Message-State: ACrzQf0drblvWFGHKdJQ9XxsILEcD1VWIh0A8/kSUyHZZFNcrhOj7qJR
	JkTElAsY8DTgUZ2JFimXrZXxsKyxRfAr+A==
X-Google-Smtp-Source: AMsMyM7hzLta1ZoZjls9Wt8DH6ccONb3AIbB1bbBUHquduTCfiFfWNnMUoMNrpvq4MuJrTbzv3IhKA==
X-Received: by 2002:a17:907:da4:b0:78d:4bc9:2497 with SMTP id go36-20020a1709070da400b0078d4bc92497mr551774ejc.183.1665680988648;
        Thu, 13 Oct 2022 10:09:48 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k10-20020a170906578a00b007306a4ecc9dsm177215ejq.18.2022.10.13.10.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 10:09:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] re2: fix branch name from master to main
Date: Thu, 13 Oct 2022 19:09:43 +0200
Message-Id: <20221013170943.2569325-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 17:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99164

From: Martin Jansa <martin.jansa@gmail.com>

re2 $ git branch -a --contains 166dbbeb3b0ab7e733b278e8f42a84f6882b8a25
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/re2/re2_2020.11.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/re2/re2_2020.11.01.bb b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
index 698fe7e497..5ec1c6b5ab 100644
--- a/meta-oe/recipes-support/re2/re2_2020.11.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
 
 SRCREV = "166dbbeb3b0ab7e733b278e8f42a84f6882b8a25"
 
-SRC_URI = "git://github.com/google/re2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.38.0


