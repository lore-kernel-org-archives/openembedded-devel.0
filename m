Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECE5C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 15:08:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6786.1660144099710080926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 08:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xc0kXLM3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d16so14472126pll.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2mN+SsPrOUgCGYp3mwdVFUNrScRJb4KoQnsRC3MwxIQ=;
        b=Xc0kXLM3WTbQ+OTIjVm0tPZ5XPJolT6/rZmpQuN4cP9uMPJSkAO74oPoRU5OAwSJKH
         d+1tq2ZWCMA02NL/4fWq84pyK+FKqGUuyTqNcx1pB5RxP4RnSdHUl5Y9G/F8qgzOYSQg
         +DPdERPVn9D1sgGDLiGRoxxqW5DAF8KD1PGQ7DxQ/h4ubPrQCjUdG2/gdqn3gQVhDd0X
         Q9mGi9dWzm5Wn5NEw+rqie0fI1V9yE2nvPzBdJ2zSnPSnxULaMJ8com9xfIp4GP14Qfs
         fLQY0xPSgKv11W2oeHE8oWeyo4z96D4xLwepwmDEPFJsNxa79FhWzJlLU8ndFNZm7YUT
         N6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2mN+SsPrOUgCGYp3mwdVFUNrScRJb4KoQnsRC3MwxIQ=;
        b=ZrUPWb7l/8x/wwHma/uCQraaPV2ZirfSeftiNu+Abst3HrqiEVEJaIt904O9mGL+So
         8A7ha10GnImy4GMtjPXPSxRwS0ah3Di5qX714CSWJzHYQW7gfHH5oKFj4j6ZRM/q+biK
         eAKIowQLfnnx6rPCEoHKd6xS2qCI76MWgPdOXcNHDS/RUn+l6EW5fFpX4NTwBkMfyTR7
         BAvZ4GjqOfrCmzCQusYU8lCKavH0J2SmBP/8Kd3YZY4ibIMpadw+XKD1LQJecU/ZpM8x
         ls7Sg5/jtiSr+j8BUS6fm/YlsYNCAEvRqExdI7ZjOmjfv5BoDQfQZ0quYzgWaN+hRd7t
         UJwA==
X-Gm-Message-State: ACgBeo1ICiiuFroCl7M/GOe7v/jIICeW/Wdybs3aeccOWu/WeDyBoxQ0
	gFZig1gKV4MXPGEk/R/tRuM283+cPBA=
X-Google-Smtp-Source: 
 AA6agR5JGMBT1gbpJfTZJxktp5woZCu04pDr+RH82XSdLnG7RqVY2rDiX2lbMguCSmmgvcDd57D/qw==
X-Received: by 2002:a17:90a:c283:b0:1f8:a3e3:f937 with SMTP id
 f3-20020a17090ac28300b001f8a3e3f937mr62235pjt.141.1660144098633;
        Wed, 10 Aug 2022 08:08:18 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a170902780300b0016d10267927sm12872263pll.203.2022.08.10.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 08:08:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] xrdp: Fix buildpaths warning.
Date: Wed, 10 Aug 2022 08:06:11 -0700
Message-Id: <20220810150612.817828-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 15:08:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98187

From: Lei Maohui <leimaohui@fujitsu.com>

Don't print configure message.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit abe35f5953af99da4bf6b8d023ee4516ec4710fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
index 7ec6ae15f6..947ca75388 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
@@ -49,6 +49,7 @@ do_configure:prepend() {
 
 do_compile:prepend() {
     sed -i 's/(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am/(MAKE) $(AM_MAKEFLAGS) install-exec-am/g' ${S}/keygen/Makefile.in
+    echo "" > ${B}/xrdp_configure_options.h
 }
 
 do_install:append() {
-- 
2.25.1


