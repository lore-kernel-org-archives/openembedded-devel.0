Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.962.1632338545617496286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdiIRGER;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 81so247709pgb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZZxOWwtAuOVHOlsk7vpQ7VON8FM2RZC/JxPltaIpy84=;
        b=UdiIRGERA1NCoYfflZvKZxno/1Q9mOO73MLss8Jt5TJl9oCgPrOa/cJtm/qj8Uv25Q
         KLMN1HU0/hyZ0hBukvIKTDTyYp+7KmqIPn9uMAHvpxRMyzZt63aXytbm+Hey8M7lj3Ju
         mgg6EQhS54acuCRMeYcEze1+vsGQyqRJgiVUQ/PJpHE39eaL0ov3VQbMQnu77LjmoZbq
         gQqy8VHfiEiouDz886pPE7buZrJql69bAZOR/42+78uQrbEnEcVDscNjFHjbl2dO8v65
         rh2NF/oCtgF4rcvqUQiyo6mXnyVNW5SNyfbdonJbzdWIegXmKqcKRUI63d42u1xRc2MU
         tn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZxOWwtAuOVHOlsk7vpQ7VON8FM2RZC/JxPltaIpy84=;
        b=m2nyFCwT0MRR8vS2sOjaBK4FNV086DmZCZxV+vbznlB2RBIEtsvQHl3jQ3MMC1wFbY
         0vI4UdfhRtfz3m3r5WV9vvigxk5aGKqu1a08RepDXQgDvs9FgmxaYXRgqTlDQMBTASXp
         5GlX40KEwSWbcc77UcL9SsEpIHJ55ok6zdfdwSeqIjgzns5nsNl8Gir37aMuxWkbUQ9W
         ouFUwqlWzyQbfhLQUnSN5cJ8XCe7m4HZJxE6QXYuXG11lq+vDu6kDXTNmekkwPwq0BNQ
         dpXMPoC4GAnXLfePrC5zLfZAuEvZBUsdI9frcoKiBNAQHPJVhSCsjXt6SlWAK4/sxxDT
         iyHw==
X-Gm-Message-State: AOAM531oj0QD0WdEA0Ivbi4vCFlAfrm6ECzp/TcRS139yZQfZpcD5HFV
	fi+CPni1rQp2E9U3jEBU22QwSS3qe3G3KQ==
X-Google-Smtp-Source: ABdhPJyOQkAqsh89mhSWcba9siFMGd3S3KYnxOJjUvu66hMj2q4x/uQ+Bl7DCJ40Xxq3qEx286AQ6A==
X-Received: by 2002:a62:9242:0:b0:446:5771:7901 with SMTP id o63-20020a629242000000b0044657717901mr351854pfd.81.1632338544992;
        Wed, 22 Sep 2021 12:22:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 11/39] libmypaint: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:45 -0700
Message-Id: <20210922192213.3062719-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../git/configure: line 13030: syntax error near unexpected token `0.16'
../git/configure: line 13030: `PKG_PROG_PKG_CONFIG(0.16)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
index e123ef5fcc..d509aa3dd0 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
     json-c \
 "
 
-inherit autotools gobject-introspection gettext python3native
+inherit autotools gobject-introspection gettext pkgconfig python3native
 
 SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1 \
            file://0001-make-build-compatible-w.-autoconf-2.7.patch \
-- 
2.33.0

