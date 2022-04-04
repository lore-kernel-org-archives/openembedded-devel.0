Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFF7C636F6
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.39413.1649096279646617969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GAW6c6Av;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso95090pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJoGFfsgxJyUYmlCiFNW00QAT3HUCWuCeFTtA14bXY8=;
        b=GAW6c6AvPOLZxh0ovSnI7mKe9pFc5CgFXopLJ2pXSBHpNy5NRQ2yNT2iMSEUK3ZtE7
         5/sjM+fI3wR09tb042yFUxvfchywv0AgQ/LVVcpRAMA9/syMKuTOYbzW9A9K2s52Dli8
         AjsnCOOdbAJ9nnEkjpgnCXEcfESzmEIKfUYU2Pm/ZbeDmRAYuR3n47rv7bsZbI7XXVQz
         fR+/Crs0aBZRM2JvKliIUC3iwBtjEMKovaXpxy72Rcoxq0pvVMpdjUZpgzrw2YBIUtfL
         Xkb31u2oSwGvZA8SkwUNuKx8SmpsHZTUc7cPKbpo9BeYnS0FdVMSi/0FZ9RucNDHBEzW
         raEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJoGFfsgxJyUYmlCiFNW00QAT3HUCWuCeFTtA14bXY8=;
        b=7f6Eg67YvPrxxCk7kFPxMLfLLlG0bP7Ef5AgI7q2Mo+M9B6AhoBHmtCbReKbzsAl71
         7jADieSgCSLhIf+Ij7T1XUD1QjOCyvV8Zce0qQqWfoNMB/7+eMyUGrd6I1JpUiaPY+HL
         sBsmqnFz7Y+R+T418AxfJhnrX91WRLCp4o17ybjiTbvTujzqom4JUNN5JecL2RfF88f2
         nidgsaE/D+8fRcAwVkSlZnSV1Ds/b23qRgqhznIbYsWcrGeMZtpzuif+8hWIhMevb1gM
         MrDlGc+NbDJmwejlJfKvc0aK7GpwXgMLRjzKvPK1JHLY4FVGgF2pL6oLIS3bgIyLL/TC
         znZQ==
X-Gm-Message-State: AOAM5316c+Le3BLva4I2y83HPHNOcSp9g/C90L0pC1Pdz6nXStkpJbci
	G3iyZE4r4R7eVe9vJTMIUPEBEuikLB4=
X-Google-Smtp-Source: 
 ABdhPJzQB2J39HX0YV6WiYndL4Wx05IOgSTp+HIDB/nois27/ykr0KGOm0+dgDefALPZ/ZY4wSjqxw==
X-Received: by 2002:a17:90a:7:b0:1c7:c286:abc2 with SMTP id
 7-20020a17090a000700b001c7c286abc2mr472252pja.65.1649096278790;
        Mon, 04 Apr 2022 11:17:58 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 m13-20020a62a20d000000b004fe0ce6d7a1sm3933140pff.193.2022.04.04.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:17:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] breakpad: fix branch for gtest in SRC_URI
Date: Mon,  4 Apr 2022 11:17:56 -0700
Message-Id: <20220404181756.2893289-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96386

From: Thomas Perrot <thomas.perrot@bootlin.com>

The commit 4fe018038f87 is in the main branch, so the do_fetch task failed.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8bb7dc157b248802218fcf80215f80a6c7cd6f3)
[Fix up for Dunfell context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index cbeb99316e..3430e895f4 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -26,8 +26,8 @@ SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
 SRCREV_lss = "8048ece6c16c91acfe0d36d1d3cc0890ab6e945c"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
-SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=master;protocol=https \
-           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=master;protocol=https \
+SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss;branch=master \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
-- 
2.25.1


