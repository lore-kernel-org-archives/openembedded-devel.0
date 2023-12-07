Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB69AC46CA3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:41 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.113085.1701991472144636262
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHx2SaMV;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b844357f7cso1125599b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991471; x=1702596271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT4rE6ZBybBzjr2T8+raeIO0Ns9T3HqFHAoo/kr23xk=;
        b=YHx2SaMV60Gyh3PPriqWSynwxfspYHZnndRxSvgJe3sOuVUAp82fZNPRtAE0eThSRv
         tOWhWcUJwiBBCjI6jeXzpYYtrD53YOEuQ0G1zkXzedaEHSLExG890Fr5z++5WDqaeo8O
         kOOlUUwMCwvpezkGlUzaU7SZWqkJ+FSTNH/AsPOJUROmH9LLMtRAo9FGQBYi07CJ7P9d
         1Lia9WNRWWVHluD1a5XiICwMxn+d/DWevjuIVsQA/Eh7LOL/TOli3Fq9KE2icd9u1D5c
         ++dF9IqSC1fBMIEenNNylKHIPt118orkboi+NQHdGM/eX2J15IljD/UnRhWqY1RcUDc9
         KvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991471; x=1702596271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CT4rE6ZBybBzjr2T8+raeIO0Ns9T3HqFHAoo/kr23xk=;
        b=bpT/8PyYF7lNHiyRlfAYcqDmDQpkLvtLwSo9IjFkCfxHY8TnnKe0NL6qHhJtvb58ZN
         i9zJRyZfkfjGeKMF4ssOf2w4hDlRWdo4/yG3s1/dluD0zYa01gG8FAZjGbhVsV+0rTHJ
         +jHe8fs4uj6SWY/nUEgNN9i4rkNrhgkE7y0UASjquc0Np0VEv1/7incWvTmb6y5ATZVF
         pEJbEOu2KCUKhZhl4Z5RXwLw7L87QZ6zLeV2BMJQyWZv9kpDScG5B2ppdrhpq2UXXFCC
         yqoyUqNvdBAEMy4L13zrK9UiJa+NOYnEI6nSSiWtVIPXqAwWLzOmEKhUj9UX3r+Ab+9N
         KXyw==
X-Gm-Message-State: AOJu0Yw0YUlt+jHhrwi3YCmlqByb1Psd0q+9RofeI2SSDEeibcKa+wT0
	wR/fDYWQXEnv5F+VY92G95Iogm7sHPA=
X-Google-Smtp-Source: AGHT+IERElI/N8qEitxoDXDacsS07Vd7GWQBhobN75c4IjTq0GrBWLMc+P9fOTN9lIstBptpuPakuA==
X-Received: by 2002:a05:6808:148e:b0:3b8:b063:6ba7 with SMTP id e14-20020a056808148e00b003b8b0636ba7mr4110936oiw.86.1701991471174;
        Thu, 07 Dec 2023 15:24:31 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/7] python3-pydantic: fix RDEPENDS
Date: Thu,  7 Dec 2023 15:23:53 -0800
Message-Id: <e4660bc7f55d5e9eaa76f27d39f20d4fcb762689.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107295

* Newer python3-pydantic offloaded some of its code to python3-pydantic-core
* Add python3-annotated-types to RDEPENDS.
* Add DESCRIPTION and trim SUMMARY.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-devtools/python/python3-pydantic_2.5.2.bb  | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
index 3750d49a9..226c58e87 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
@@ -1,4 +1,10 @@
-SUMMARY = "Data validation and settings management using Python type hinting"
+SUMMARY = "Data validation using Python type hinting"
+DESCRIPTION = "Data validation and settings management using Python \
+type hints.\
+\
+Fast and extensible, Pydantic plays nicely with your linters/IDE/brain. \
+Define how data should be in pure, canonical Python 3.7+; validate it with \
+Pydantic."
 HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
@@ -10,6 +16,7 @@ SRC_URI[sha256sum] = "ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd1
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RDEPENDS:${PN} += "\
+    python3-annotated-types \
     python3-core \
     python3-datetime \
     python3-image \
@@ -19,5 +26,6 @@ RDEPENDS:${PN} += "\
     python3-netclient \
     python3-numbers \
     python3-profile \
+    python3-pydantic-core \
     python3-typing-extensions \
 "
-- 
2.34.1


