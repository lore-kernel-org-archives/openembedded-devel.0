Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.964.1632338570631636387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H+qZLKgW;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so5233770pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZS1dWCyC2QR63KlUdOIxY6rEFKRoudF/PxF4C04IvVo=;
        b=H+qZLKgWNYu9G35yv5vTxB43AbEddVP7t7gAo8hwqSRizgffXxymEKasjHy2hEnS/d
         2T8/sqZcfEdPo1e+2PABlFY1kRqP4RUu//lgDqChCXHcKfWtN7H2KKa/nzIfB9ty3rrJ
         qNmJVNMxaD5MzTNHHr7UEWb8opXOjy8aWQhRMasZ+6orCRM0UMIRD1aAlV3T0y7Ez5kz
         qLcEmw4eJTruZdkhCv2gIGWSc5C1ZiwAr9zMCkG91v6pdxXkstgwVZyZfe7XgMd4iAja
         E6PvjtNqyWhY8A09dA8IKfLFJChGmioEJ1h2hraMhhxTvLISvfxynHONR99iKMmbNTa2
         kfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZS1dWCyC2QR63KlUdOIxY6rEFKRoudF/PxF4C04IvVo=;
        b=q7V2hr8iFjnIGK0ra2XVQyLVn8s3+Wsi0EV7HZd0/ZgAg1adEjjvf/uMPUaMYtLRYb
         pb2ZxFlTlWutQPHVQNvILPp24719zqxfWjOJY7hT5f/hgEoEd/mQdufCmajCDoTe93iu
         r42xJIkAGDxuBixcRTQ/p7rbnpbtRH3Q5Q6uy+T7wN7wLBAeIyq1mC8IlRM7q6AbgKDb
         fQtstR8bS+CXVpxFLjRv6Y03Dg0xw3RqnPKfBNl0jkbQtT3AdhnGWdbM//lAki6+5Kbx
         tOXKlSMDJgMI7QfMyK4cRp//P22Q+od73TysTrk2+56eeEBGw+5r2WhdTPhQXQxD/Hie
         MgpA==
X-Gm-Message-State: AOAM530FynziGCc5BPekLpouTI2/wssHxdRGVOJzPFIQ1282ejZA2rgE
	3jvov7Ces96HDMwMAIGK+/jiwwFxFHl34w==
X-Google-Smtp-Source: ABdhPJxVgRmp2Y2Lb/UvpDYmWSJmv+lv6niMQWqxD6KhyUyx4hS1j7h52xLMTMemAaromo+0axupkg==
X-Received: by 2002:a17:90b:33c8:: with SMTP id lk8mr13199745pjb.241.1632338570028;
        Wed, 22 Sep 2021 12:22:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 39/39] mscgen: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:13 -0700
Message-Id: <20210922192213.3062719-39-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../mscgen-0.20/configure: line 5586: PKG_PROG_PKG_CONFIG: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index 25cfafafa8..da8ea35d26 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d855
 
 DEPENDS = "gd "
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 do_configure:prepend() {
 	sed -i "s#AC_PATH_PROG(GDLIB_CONFIG,gdlib-config)#AC_PATH_PROG([GDLIB_CONFIG],[gdlib-config], ,[${STAGING_BINDIR_CROSS}])#" ${S}/configure.ac
-- 
2.33.0

