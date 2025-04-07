Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9F3C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:46 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.40144.1744003242677063672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EV5xOHMR;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso2993150a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003242; x=1744608042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUzltcDaMynIC4MbhJ57oBniukypyXEcOZA5RtYH18E=;
        b=EV5xOHMR222jEpJS0kxKjSqOi7h8crZ8bOkSY2srZXrrPTJxT1lmgnX5eW+UHKKmkK
         0PBGu/kuXeoWanWWuX47dpvlhvnefy51Q6u65CPK86bnswbA3RMssWaBZCz1aC/F9bc0
         AuSRjKZMg9bAU4oVSHf3GrbtCR/4qQdPWTvSCZtdv2ADeMxpuOyRw4yiH4N4hFgBNkhU
         WET568Z0wY6YnxXxzARE5KRl25378+oRDVAOXA0XSdwcCN+BxfxNrFfQCS4eW0ihYOve
         8mV+qrCZw/Ejp24vAyUHLRMbU7pJQtiRZXl8hZR97/JA29S9Thhmxh9tjhCKnDruZGcC
         u1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003242; x=1744608042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUzltcDaMynIC4MbhJ57oBniukypyXEcOZA5RtYH18E=;
        b=BXVQBY/1SSWxfktZAIk0SC7G17TAMEJzaulDwMgTjoeRrPfwTumBOXqtRixSWDb2bw
         4NArdYaBirDmaENQeezMs7zMgfS9A+oOBH5a0O6OxI39j3TL53FH06ruBcg8HaN+HRZd
         x1HOLUEsvDaB1gWhtrIiPFK3pIzTSTB32bZ7jLrYeHeAipFaZI99MheF/Z+PLdDFD/33
         1culw6wj/AJXMoAkaFPpccZKDhcz0jqn42P5OtyQXNp6S8vpnP+bBJM2DlNE6q2T59FX
         8OEE1mL0E970MPDgcmZuQ+oi/cL4x5uJc908u8CxnT0VQd65LOC/fqPLV/niV3W2Fbif
         /7sQ==
X-Gm-Message-State: AOJu0YztfnaliP0lXokgySdD/35eOUAVFm5K0drcZhLVlPk56eBPUxy0
	ci3D+bONcuhsl3H1cqcV3taiV+pBhudStXqGFce7gmdTh1kMIWOOLo0qGdLz
X-Gm-Gg: ASbGncsSU2XGFVN0yaxqCZ8GWDH4y/fYLMRx8fbE6VyTdslcHX6qwhclc5UFeA9kR+p
	jvfls3+s+vfWGaJ3gN1RwORZfhG1lwlfilycMydFRXY2q6rFmZW2VEbOpWc2/YMx3VuUxBUPY3Z
	+4wYx2t3XUNPphE3MgU0yUGKF+yJy36xIvyA/FBzFjN1w+PpK9XgYyccso/sg+VFjLvpDo3JqBL
	Jgomuko/HxoWKV/AOjV4MkeLIsKxLDkyhfL6iZx3i81kv0XPGbz8NU4pyemFEThIoocqihTzQ58
	1a5i9P3rLLHvr56TSc/yiWRRdTBVDWCz/AxL
X-Google-Smtp-Source: AGHT+IEFeh70Ac88ZoBpNF6djo+pouKyQ+gJJ7zJZBvqsTYMVt2XURABnGV+m+PE7Nx2rm6IK5T1Jg==
X-Received: by 2002:a17:90a:f946:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-306a4836e38mr15058467a91.3.1744003241719;
        Sun, 06 Apr 2025 22:20:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/7] python3-pydantic: Upgrade to 2.11.2
Date: Sun,  6 Apr 2025 22:20:32 -0700
Message-ID: <20250407052037.502341-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407052037.502341-1-raj.khem@gmail.com>
References: <20250407052037.502341-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116618

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pydantic_2.11.1.bb => python3-pydantic_2.11.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.1.bb => python3-pydantic_2.11.2.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
index 4a566639e3..c0b488cba4 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "442557d2910e75c991c39f4b4ab18963d57b9b55122c8b2a9cd176d8c29ce968"
+SRC_URI[sha256sum] = "2138628e050bd7a1e70b91d4bf4a91167f4ad76fdb83209b107c8d84b854917e"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 

