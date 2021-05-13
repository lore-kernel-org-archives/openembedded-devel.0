Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.7720.1620872263593307270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 19:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K3OF076S;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id i190so20244939pfc.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 19:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LmahtQVxSsyQdrGEMofflrbdRUthmt+C7XxBzHNj5VM=;
        b=K3OF076S+x8q9c6xOn2mpdb0JCF4sDOZuHNbwXarUuNS8IWuCeO0wPW9qiXv/UwPWa
         r3Lx/kPdixqIvEJP/+nOro0VFc1AQtgD0rT7N3BczNxlPrg424q9x3/BMbdofYIib7nE
         Ylc/4argyahN7dCmS9erwY/n/jgR3XuWbYdFsP/gXxzbMYO1KhM4YvYGXMNL88Pq7Xf2
         aqsKkiQ+KnRerP7/1JjeO3nndCksgAHkcVnTFoSqBPB3jmVt2EH2G1PrWa0Ca2S9b/Ju
         ZNJ22XBYMYaVlJtLSjS09StMdcPweMeCv3n/w06BSSLQVb8O19THJiupJsCsYjL7tGxh
         6Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LmahtQVxSsyQdrGEMofflrbdRUthmt+C7XxBzHNj5VM=;
        b=goNuWuo382UUXU1Gx+XTnFBui4TNNXcdX8wVLLnsTTAwKz1AZd2FFU5Mh/DuHPa25m
         qhU8xTmtZ+tPpwKQMQG9DDo/O7C6aNJq8ibPaWRWsNgA8aBqlaPklHL8ahzu57P6J6nF
         yMRDszFVvnr0rJNK7XqwK17ah1VLLjtKN88QqmJqRx6JPtWJqH/9RTKOze0uawHN+UD3
         VjmLJwEnFELfDPJuLoukaHHOt8DPrSIgFPmQWX+cgM9lH/4wHIJ8kOc2wPN1N67SRBE8
         U0m7deTILadNLNAJsT1zDdUMm7JuYWwibiI/Zp/rGl2jryN1gONhfd9T9DpgokaXW00s
         M5Tw==
X-Gm-Message-State: AOAM530KDVukfqDRofQ96fAuL4LUvun1IDrRFr84FAu5JlW5QpCRW5FA
	+f/bm2vHLqDBIoS6+FJhwYzKM4+dZ+8=
X-Google-Smtp-Source: ABdhPJy8NM3xnHgflwcPeUGDmv2j5FJ4mfmrqe/hfe67CdrqcbriGHqSgvGLOgdcYF5eDA6b6038Vw==
X-Received: by 2002:a17:90a:3948:: with SMTP id n8mr44221923pjf.32.1620872263008;
        Wed, 12 May 2021 19:17:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id r32sm864156pgm.49.2021.05.12.19.17.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 19:17:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: add audit to pkg grp
Date: Thu, 13 May 2021 02:17:40 +0000
Message-Id: <20210513021740.3370640-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513021740.3370640-1-akuster808@gmail.com>
References: <20210513021740.3370640-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e9493fe27..2bc638ca8 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -697,6 +697,7 @@ RDEPENDS_packagegroup-meta-oe-security ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
     softhsm \
     tomoyo-tools \
+    auditd \
 "
 
 RDEPENDS_packagegroup-meta-oe-shells ="\
-- 
2.25.1

