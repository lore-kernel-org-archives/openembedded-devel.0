Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.958.1632338543850981350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p5ilnPbG;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id s11so3744465pgr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jwCu597kuREHYPP2ch+LNNpdkVAZ/B+orVwT6SzqthU=;
        b=p5ilnPbGPpVTJrkXVJ9cHmbwj/bbmqn2FF2fz5SFMN0lwQv+avyjc/jOGq9JsLzvb+
         JEXYyMrpeIPQAE6VUk5iwMWTmNuDuP3y8ZiTNKKqRhfye3/zTgja91lJY+Q4ltDQnYOo
         6BxwN2+zbvnjn0SNJflsbwX7xJJApce/uru2+qSjXcexgOu/tRey3hy7GB413fOdbwv5
         kNErVeSRmR/756DihjletTIOvTi8nU+d3Uij0O852anpdKxAJKSUSWW77vrp0Am59YwF
         xBfut3ZAeLvOGXHCPG1dx7naz3lZUamVci+C5V+M5fLiSqEyrR2FPYEG43j65bU3WUF0
         9m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jwCu597kuREHYPP2ch+LNNpdkVAZ/B+orVwT6SzqthU=;
        b=IBLdmTRUS2muWmTNRc3H7ClLsXrahY1jvjMWLxIqQEguaOI+42KQytQi2MDGXbRC3d
         M5ITT0ifynliaMOtonvWTP5vvKsl/nCb1/8rly75bQwd7u5neiKpqVOIHBx1Mru5LAYN
         LImpo5TREPA1gTvVFTOTGV0OCzgjdt40HcNRqxvLIqvmc0DK76feMEucoJ+X0UGcuhnL
         0xkPsC3TqweSzjC5AnNuO+Rx32BGDWZ67q67l7ylc0YkLPHDRCgSrLjwUQ73nJc5pqOv
         BJPq5WjlUKdwcwKa48nSRGHC7TmdhTq3dl+PQxxYhrkhoPXOWKHhNHjxDMRRfuYAcNmS
         Qpww==
X-Gm-Message-State: AOAM531SVv3rRqsMw4L2KIP7oC8SiKrO3LsUZBnK3LzjyLJG+N9CRAEZ
	QskwAiKkibZ5wJpBh9NulYHbm1U21kW0GQ==
X-Google-Smtp-Source: ABdhPJwI51Q53soez2lVzyljPuBhhh1P7Mvpv+YmIt4z803YoQnYHiKHtaXtnWyuQHy31gtZfdqhdg==
X-Received: by 2002:a65:414a:: with SMTP id x10mr447038pgp.403.1632338543268;
        Wed, 22 Sep 2021 12:22:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/39] libbytesize: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:43 -0700
Message-Id: <20210922192213.3062719-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../git/configure: line 13851: `PKG_CHECK_MODULES(PCRE2, libpcre2-8, , LIBBYTESIZE_SOFT_FAILURE($[PCRE2]_PKG_ERRORS))'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
index 118259e4fd..7b8d4a3f91 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
@@ -12,7 +12,7 @@ B = "${S}"
 SRCREV = "c9864f4dd03736839f40d225da494cb1eb64e654"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
-inherit gettext autotools python3native
+inherit gettext autotools pkgconfig python3native
 
 DEPENDS += " \
     libpcre2 \
-- 
2.33.0

