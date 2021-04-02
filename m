Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.10607.1617328732106757353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t0dV3bIt;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id l76so2721187pga.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IYfI8F+KDBUgcAQJSXpwVN2uu01zqQzx5iC0HvmXTTI=;
        b=t0dV3bItDtHxKGqJ+ihTvNvANL0VI7BIDa3uJGrIjDzchWffZkC2AsMPJ3mlvXeKdV
         NlvkgVJ6ihmjBsr3MQOdYDtUggmKHZuYunhZUCNYKqcAimlhrLSwu7V7PyGwm0Z2TxB8
         UtNa0IDMeIaRWsCHvwRdLCee05Y6J7bVo858TXVgXyVZw2HbS3Ah2SUnh1nOzE5CxEJK
         RV/wGrI8XJGCoTv+bbFvC4gNVFqYM/HgaXLSRvK5acZFWi9lao0op6MurxirBcHzvABV
         7rBYOP6Yjbm5YLSeZ22OOkdZJykNXm59B2hrSUS7vCelfwD3OlwDinCO3KqXg1wjSlgJ
         Q9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IYfI8F+KDBUgcAQJSXpwVN2uu01zqQzx5iC0HvmXTTI=;
        b=QoxeVdW3FAc7XIVUY5sikiLEoxz2gbUErqOiOExDQgpQSLpUT9EmOn/qlEaeb2YkYn
         XX6S6AkMRGiPomSqMj73PlygEuD7h8yaeALHAnyYB79QG18QEA3AudGLoZkclOMGW2QL
         HnjQRYk0HJmEfipfTUiMVPbbQo0HfL3K3vSU7kghAeQ+UkDC0UHRTiKrhrrINQBozMCK
         YDO+2zGrag8tesHhsBiNFuVtMn8CpelEpu/9/34gyuHlouOJWyP1wlk4hW/1h+abEHgX
         e9tcu4HKVtqIeoBF61mheNN+tCdVSnc1cmVGUI+565lNeA1zwLhyO2B+dfW5ZzgAxeFS
         6nag==
X-Gm-Message-State: AOAM533XyYw1P5Wr6hGQQzdvzzJDWcZPyyRfmTSYed9xPigsbC2EQyer
	LvMVBYcGu3Gn2LAhmx/8TlRJaFbVfH4=
X-Google-Smtp-Source: ABdhPJzKa5NiCoWw/iKtqW60PtcQOwhR8uytQhAQPuGosCYDZBKuI1vSZbJB20Cb5VZgGxiiuwVbTg==
X-Received: by 2002:a62:92cc:0:b029:1fa:515d:808f with SMTP id o195-20020a6292cc0000b02901fa515d808fmr9836684pfd.43.1617328731492;
        Thu, 01 Apr 2021 18:58:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 05/14] geoip-perl: Switch to use the main branch
Date: Thu,  1 Apr 2021 18:58:33 -0700
Message-Id: <88d8df41d057a78a3f16ac50db36057bed5d0be5.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: geoip-perl-1.51-r0 do_fetch: Failed to fetch URL git://github.com/maxmind/geoip-api-perl.git;protocol=https;, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e97d3bd1163a943797d030cbbc3207aa013ba59)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index ed5c3a97991..944c0057634 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
 
 S = "${WORKDIR}/git"
 SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
-SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \
+SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;branch=main \
     file://run-ptest \
 "
 
-- 
2.17.1

