Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.18023.1590941806473805369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VcJiaYx1;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m7so3265838plt.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T2XWGaTIew7u+RaCtMnaEixf6alV3FG2I5w7xF7iVnM=;
        b=VcJiaYx1rmQ/R2jJtELe0zILk9s3+TZOrw4ZLBhwOSk2Rj9hqJFe2ZvH0kEEc+meT/
         kKFJ+txBRXyglQbkfRS4kd+KPuFv9MVhQCjyu4XJ0YVc9HskiD2OPsgKIRAXAuEP8RKy
         A/f84/fXx0fJSGCQ6XlCNaS4XC6shGONNjdNipCAWdXegmrb96dZod+vagxFBoDZ5AJW
         X6im/wJDN09LJWHNKrPFQLwEnkR/ATGDjEiGuUmPmKEpR8h0DKDyZNHsZBtLdWUoUfL/
         tnMSJnBEW4bNRBPv47lycc0Y8rHnuT93iivG89AoFhO2g854Lwr6ih1tCDT6sqCswaYi
         /Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T2XWGaTIew7u+RaCtMnaEixf6alV3FG2I5w7xF7iVnM=;
        b=nQ5unoW3ERaN1ZEaa2o67Dxs3yjj9qQYPTILK+daCegrBi+fBCCo9jGRF2J1oQgzfO
         L5ir5eVe3TcneCz53x/6mXyOUoSQtG1TgSbepZWsQiZfTRxmOKMteSy/JOZ6obqapAqY
         xw1QODC3eacZWlkS8lH5MjzVGoF+4ssf4Ji3so5z7N7t44Wa3mSH0gfChCcYn6cNnZw5
         jsqvwWIU/ufKti2UR9HkusO+fIzgJh8kwl7EGZ6Y4PWc0F/3Y5Hvb+iPz85OEiuDdh/7
         e8rBBRoCLV9YkuJ0AbNYrwJcybbgEoRU19DbXGoD0n3YO3QjmORCHBf7I3EgDXRcrz0K
         z+ow==
X-Gm-Message-State: AOAM5337G/Bx16CAKHIMM9jAJ6BD/RUYlamYwQabNS95NTldHeIBCfEi
	kkmX8TRAeCyMIbg8T0iNV2T9TQxB
X-Google-Smtp-Source: ABdhPJzocZ7BE+Ui4sMeEieWg4DEV6Ob1WLQQoLFEipe+AfsOF13JoscieCHieG8jYv+iMfoUIcu+g==
X-Received: by 2002:a17:902:c111:: with SMTP id 17mr5502414pli.319.1590941805855;
        Sun, 31 May 2020 09:16:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/35] python3-gmqtt: Upgrade to 0.6.5
Date: Sun, 31 May 2020 09:16:04 -0700
Message-Id: <f32671264b38139a1b8a63a73b4101056700670e.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.6.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6575f2f016a777ea5d0592facb551c8ffcf6dd6b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
index 8d4ac88301..379c7679c6 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[md5sum] = "f763f12c5e6ba6f0fa0ec4a6dc8c3fd9"
-SRC_URI[sha256sum] = "3b3c12cb62bbc3ee0bd81da3d9fbd78c5414098aaf58236c3663edfeda5237e0"
+SRC_URI[md5sum] = "9388ec09b6536c4e68c5ac5c31de3dc9"
+SRC_URI[sha256sum] = "c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60"
 
 inherit pypi setuptools3
 
-- 
2.17.1

