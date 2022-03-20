Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73780C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:26 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.16395.1647763706162309410
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DH0PNjZl;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so8011177pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaYBdwru1/dQmIqnVHzLjkXTPbGgB6jrV+Aev9xVOKc=;
        b=DH0PNjZlFnu6G3hC+TIU7a4bF3FP79lkqGM4Nv7xbvuhAiHd6rfREuBSUxY9zmuQTZ
         lu3EdCL4r3CNPcM1qduJnpWllSn4GdgUWgBOL3gWLdjlrqS5wM6cX0Lc7AFNGx0YqoYK
         JsO4YfuOuGwifTwkgVNR8ftV/TM8TN7dRI1TWmDr5vrLfIYNd0ElMSpLnese96F0hKdl
         lCHIW90nsf0skhGsnn5an5wV38ROY9asenmNdPqBkL/0zvg+9dKQDHqBnx+X30vpcV+i
         SVDDvKs/Qn9SkX6Pba+iye/4Bk29XePcFuDqx7iQRwvWyl3Mk3YO9Nfa+jYPAOtBCN41
         83RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaYBdwru1/dQmIqnVHzLjkXTPbGgB6jrV+Aev9xVOKc=;
        b=BPZ5BjXs3JUmcrhA16nyiURaPCJAxiUxeSCXYJBigOwTLSGixoH+DSILuaxpJKFWx8
         qwTKu3efbBFmsW8v410mn6Nvb5G/YA9qC4IhjiJGeDGVDoNk6RlDLSu2n+F8YEYl1KPt
         MXwqh0KYfRuWt1GH9y2DoiyAw5WY732V5hrIUP2qFEFJfgZLmi1KpB6lGFoCqG6SFpXi
         WwLZUuj0MIIRLUPMrsaiuNvokFR38dd028TF3KKRCgJ4mhGVZEvAuc0VEJrOacFA5pGo
         7Zi8SVaYU8mTbnR/EwX1rDquYej1WOuIN1PmpesRdyl2AkkSjp5Q2Va9FB+oKJqcOMB9
         U+Aw==
X-Gm-Message-State: AOAM530mu42TYQPo4ryix7b6O0qe9drvK7W9pN/qZvWC0BqynGYXwj8C
	6XKT7NZu8/R+zGBxC+IBZVXYATCZ/ieV4Q==
X-Google-Smtp-Source: 
 ABdhPJwnYmYilWbMLo6Sm8VPGQJwW26d7pvlx774uQqgmtuCQ6VqIT8kBvzlRPwDvd2UjVKia4yqnQ==
X-Received: by 2002:a17:902:ab10:b0:153:b520:dbbe with SMTP id
 ik16-20020a170902ab1000b00153b520dbbemr7551286plb.55.1647763705399;
        Sun, 20 Mar 2022 01:08:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/17] sqlite-orm: Define cmake variable defaults
Date: Sun, 20 Mar 2022 01:08:09 -0700
Message-Id: <20220320080815.825928-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96075

ensure cmake files are installed in right syslib dir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
index c0b22403b1..db90bc589e 100644
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
@@ -11,7 +11,9 @@ SRCREV = "e8a9e9416f421303f4b8970caab26dadf8bae98b"
 SRC_URI = "git://github.com/fnc12/sqlite_orm;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF"
+EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
+                  -DCMAKE_INSTALL_DIR=${libdir}/cmake \
+                  -DPKGCONFIG_INSTALL_DIR=${libdir}/pkgconfig"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -19,4 +21,4 @@ FILES:${PN}-dev += "${libdir}/cmake/${BPN}"
 
 # Header-only library
 RDEPENDS:${PN}-dev = ""
-RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
\ No newline at end of file
+RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.35.1


