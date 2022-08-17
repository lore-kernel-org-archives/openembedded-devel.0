Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B094C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 18:05:46 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.32243.1660759537365594539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 11:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gd/ljHWj;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id l64so12632875pge.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=q2ZAmvFxlayWWB3khB+c+l4h4nhIB+MRQGg76kznfrk=;
        b=Gd/ljHWjDcnd49RSmuWBZ68B/HRUygLOSHGdo6TendI+V45LnOsCLi2JKsl0UWwSQ7
         rHTc2ip0zcSdo4bJA8fvooqJm2njQ29CozTo6Jp9LC03nHuPUWApas8WI38qyydKUpL4
         HyihPbne+nOz5xkNCUV6DpDV8lQCvAUBF9jt/4enApfuUPvRDbwXiPq73nF5rFVOdjEh
         oSSRxX5OL4MdW3pb8klYCAYdwFQ7suwzR7mIC6RbzoOUYRJ/61NyOleTmgxPa9XMM1Kb
         dSotvkx9p8gC36NKh33KVmMb4jkP98VwrZmVkpYbzcuksywTUoBbQjqTLOydv8/j536e
         6y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=q2ZAmvFxlayWWB3khB+c+l4h4nhIB+MRQGg76kznfrk=;
        b=rXbNqsgdt50+MDEsBRwwenCgC0zDxm/YZDoPXytU00cO9ltA86h4ntLKm1kC/M0Hrn
         WKFNQhFOvyh5eSimJ6WDQwIwLFuKL0nRV0ZcRIQVXYQuZqA87OPGLHdBN/k9gBBIWzmQ
         1UeZQqcpvX7IiXO+zv0oyqCqsnUjL7UCNC/h5l/HTd4dC10xjg16VeWrNuIeukm4CwSJ
         X8kT1qgQhm9taK03qH0HwQ6ZXundRDT5KeENV33csukp2qHTWP1j3/RZ2SP0+t0SnWZN
         suMTEa55iIDV1GzqcVDbwUZ5B7zfUo/qX3hqFvVuFoxEasKdmzX9TJbEG5yz1xwGsWxK
         2fkw==
X-Gm-Message-State: ACgBeo2g0e8mI7MDWrbkaibe4lQFcJfKtT1iDSK775dwBXrxKRyqxJ0Y
	KHEydzrywKEcDOdvZCDOpimXjr847jMgQg==
X-Google-Smtp-Source: 
 AA6agR6Tv+aHSVG0GqmTmlfZ5+b7aM7sLCQlz5d7wPLYrU1ub8La3bhO+yLDXpwog3lFqh82LjKoCQ==
X-Received: by 2002:a63:224a:0:b0:41e:1d36:5063 with SMTP id
 t10-20020a63224a000000b0041e1d365063mr22021005pgm.568.1660759536364;
        Wed, 17 Aug 2022 11:05:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x143-20020a633195000000b0042254fce5e7sm9269165pgx.50.2022.08.17.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 11:05:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [meta-oe][PATCH] audit: Revert the tweak done in configure step in
 do_install
Date: Wed, 17 Aug 2022 11:05:33 -0700
Message-Id: <20220817180533.1198248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 18:05:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98311

This tweak is needed for building audit but not the interfaces it may
expose via the headers, therefore undo the tweak before packaging things
up

Reported-By: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/audit/audit_3.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
index 28d7d01764..78439f66fe 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
@@ -78,6 +78,8 @@ do_configure:prepend() {
 }
 
 do_install:append() {
+        sed -i -e 's|#include "audit.h"|#include <linux/audit.h>|g' ${D}${includedir}/libaudit.h
+
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
 
-- 
2.37.2


