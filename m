Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.7205.1625583201115973201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vA/u1s3F;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id in17-20020a17090b4391b0290170ba0ec7fcso1652129pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8NE/4HqEKR9TAWm6lIGOF1gWveH0kUwrrw8LPR+TrHM=;
        b=vA/u1s3F2uM7bsa62GbuWmZt3ewdCFNLd1ICzLxGIr34ShaYQyk5f47joqfQFPKygp
         EOUcGJxNKiRLSzl9NMpPYirEctKS92WNXXEjwuK+V0OcmnpArqHYRWNht4AIyfoNnRJy
         lkO668aD+Nyep+6PrsjUT1HzslbjJl5aXUCb4pLnD2qdVFZwy0Qw0RtW5KO6kIKDYeh/
         tDjlnydwrY3VwiKg4NX+EyiiZJtocrFbs5fXuNVvJXpAin8TxOVI9IFjtxdnK7VxYK4q
         mF1MN/Yn7acbc51XMIGGGWoNeLyBMbcxhpt+7ypdj8800M16hndD427wgwFPAUFJpZ27
         snAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8NE/4HqEKR9TAWm6lIGOF1gWveH0kUwrrw8LPR+TrHM=;
        b=igK0XTAtMB6Cn6Cb+B9o53a9waYMWDD/aKBuzI9RwgfLRW80GZ9jy5z7HPqUGvwpLZ
         /3xs/H9WtHSvpBH3k5SqtOC4I1lk0nzF/pW1Za8+I+7q8hmXeWQlkYzef8/l86y56piT
         IbY+yBT4ILAnyVc2j4NhJ42zg2ba1xxx32dJ5joB0oYifYZDqENi8UoGapre9izJ4Oqw
         QNyayHhnLmMhwbs0K6VKoY0DIhvAKNX0SistHDH25pQ12/avegz9IP3aa1VV8Qwy3qTI
         IT6kFo7zFDZxkxnh4D55ju7fYAIeyulJ5tfHaCCQg34u/YEiaMaL3rcLSDcf2/PmQLkR
         DOlQ==
X-Gm-Message-State: AOAM53208ggbrsSAzC0xrtZKN9lH/Ugqj0UW2msIlYGQFaTXqDO30kpr
	B1BXUTyFUHzLFMnXb06N69EA/ZmiWDvCuQ==
X-Google-Smtp-Source: ABdhPJwwNC1/w/FQG5ovMDfW09H3f585wsZNFMm5kYkFePK2PrsZtnsCAiqggGNp6RgoTir8PBsUgA==
X-Received: by 2002:a17:902:934b:b029:121:1215:66fd with SMTP id g11-20020a170902934bb0290121121566fdmr17320491plp.19.1625583200561;
        Tue, 06 Jul 2021 07:53:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/11] python3-django: upgrade 2.2.7 -> 2.2.13
Date: Tue,  6 Jul 2021 07:53:07 -0700
Message-Id: <7ee3eeffedc2ceabc5d53f1a86909bfbb8a762d9.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Upgrade from 2.2.7 for:

- Bugfixes, including CVE-2020-13254, CVE-2020-13596, many
others;
- Official support for Python 3.8 (as of Django 2.2.8)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c4e201c6288e5fee7eef8f6eba576d4c426109c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.7.bb => python3-django_2.2.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.7.bb => python3-django_2.2.13.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.7.bb b/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.13.bb
index e56453abc1..55eacdff2e 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "b0833024aac4c8240467e4dc91a12e9b"
-SRC_URI[sha256sum] = "16040e1288c6c9f68c6da2fe75ebde83c0a158f6f5d54f4c5177b0c1478c5b86"
+SRC_URI[md5sum] = "30c688af9b63c4800ef9b044e0dd4145"
+SRC_URI[sha256sum] = "84f370f6acedbe1f3c41e1a02de44ac206efda3355e427139ecb785b5f596d80"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

