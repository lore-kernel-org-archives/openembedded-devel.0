Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2A3C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 10:24:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9826.1699957440658456404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 02:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=lmCvF/0d;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-408425c7c10so44306235e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699957438; x=1700562238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEh2j0xbjyVt3ml02ysENa3ec0XhIWneHbBRWfMYa8w=;
        b=lmCvF/0ddnFyCHuu8VxYUBRBui6Ls7fyu/9KAh4Qq1GA5ZXztrpIf35WmBB2vdVQuh
         lYSBdu1swZKFvME1gdz+C3sVj6QXTTV7njalRH+hStgncz5tINHGV3ARyA2Pp098wPNS
         BQIS+eErrklOVfOvHbB/UFa2yg/WDKieWrU0GOzQx1Nh7tpDEyoSOqUWAMIYfDpLxdmi
         S73NX+lt0px7+6lmONxSfZByvCnn++iHmxdvWNo9O1Q8UCNWXo3GN5sVMxoA+fpfekf6
         LPeq0tNfL++0YPkbYPYtskHPMO6qijLc7oEo1wzg/Kdon/Y7bqS2OzohLrVdBegMvvcL
         XVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957438; x=1700562238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEh2j0xbjyVt3ml02ysENa3ec0XhIWneHbBRWfMYa8w=;
        b=LixkR+yn0GZZGfxXr6p6OxJ2qztau4vbHpFglzQUY46Pbi0SoIowZygI4PbZptyQI0
         PuIoTjcaCV6JxkCNzaIufWr/gaHz6w6n+HPwDFHT4PQgJATGWG+NhWuptDYHLGtnGYqa
         5jMG40wKS9OSle2wbJErRtHPZGi5VW7iHzpeVo+RGkFSCphLrk0WZv7hAibiTdej3X0J
         NTu+SZiL+qhNcJjBYWquDFWlEY1t7tXgMADqMlaRQgsPD2QOGUCsIXB4Fa6uU8Ic02Ew
         zUQqLS5eTSXzFB6wOwCeYbxsQRT/G3kvtqBvZnWwY96ATwHb4PrN1Chst4leVzo+mF+M
         1mKg==
X-Gm-Message-State: AOJu0YwZhfnsm3YXrwCSk+EC3KPpIqQrj4PTO7E9xMfZpR/C2bkKsmXS
	HvKJrKKYYPNR8P7wO7QsakbkTi9YIkI2Bha50UY=
X-Google-Smtp-Source: AGHT+IGR1307cfVSIFRfGLDJCSZ5Ah68l/mU2Z6exu1qpcGO4RK9JNtfo8rOeRhSttlKB/qO7Ty0mA==
X-Received: by 2002:a05:600c:19d0:b0:401:b6f6:d8fd with SMTP id u16-20020a05600c19d000b00401b6f6d8fdmr6564532wmq.6.1699957438484;
        Tue, 14 Nov 2023 02:23:58 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id d1-20020adfe841000000b0032dba85ea1bsm7475955wrn.75.2023.11.14.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:23:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH 1/2] emlog: Add PV
Date: Tue, 14 Nov 2023 11:23:49 +0100
Message-Id: <20231114102350.3276837-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106705

From: Khem Raj <raj.khem@gmail.com>

This is 0.70 release with few more commits on top.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 08edc0b6ace0d04688a5617cf05546a7b8ba6cca)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 948e18da4..fb3cd3f71 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=http;branch=master;protocol=https"
 SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
-
+PV = "0.70+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += " \
-- 
2.30.2


