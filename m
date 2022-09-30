Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD008C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 01:30:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.945.1664501441544726259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nzkOnMU6;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id g130so2368609pfb.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZtDThhEgQwAR95bDT68HH9ESNhiYo9p3CQH1JSYtE38=;
        b=nzkOnMU6d13XaOlCJBglmKMmMF5bhB232Z7GWfDD7E56hpH4deYQV4Z0EK4D+wL5jW
         f9p9MLcGWtnPlnfjMx2xT2i+ta8AQ4atwSC+QSCPGqXQv2VrWlER6hhhAWyPJZOZlRrO
         iLBZvNIQCREjXfpbFFFzo6/L7dIksUlBguVfpivIT7On5KbPGuFlV+ww6ubiv8Hun4Ct
         mOhH095qsvNZwFOp0TydSQ2trH6gisunxSYiaBDsgdHMNS2YSGnrUyq8SV3a3Zdy8zIy
         a2KV4mSG4oovqndGbbbkofY7rrYCr6MN+B6oQGJ7OiV0RmOP7RK2iRvyP0JmtoinAojK
         i4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZtDThhEgQwAR95bDT68HH9ESNhiYo9p3CQH1JSYtE38=;
        b=XpRR9uI/ZmdJm93TB/m4PA2ACUtut+UlXohSuKfnkeCAATKij7C71OLfnBcqd5XFJe
         t2YqTCeyXSOWiJl46G3oqYDdxC60djBAjbOMtL/jR6Pxu4q9AkCt+ovQF9rMt4gowbdy
         x4CFQg4qq3zz2LWvksUIx1+FXThR/cfp3PcClO3Qz6BMRPHHfnAZuAHybaoYc77w2A7d
         n1aWvW7VdfQ9UP6kfLbJMWtW9UnX0PrNowQd1n+c6khbZ4MwawAQ/vYSzX/K7uFABc5n
         gGBDzwU/tHwJ/Cr0spBwic0U5IzaM81nkK+gZcMrIUR8ief96dzoZpp/x0QfoEk9JIQQ
         rUdA==
X-Gm-Message-State: ACrzQf12NmhaUJlJ9pELAJW9lDHRn5V3pLmu4SIvdyDk3bNPsGsDArM9
	At412sVT2Ec94kxqn67K87W8R3AaXFpHcg==
X-Google-Smtp-Source: 
 AMsMyM7VrPbJOWViPSMsxvq00Ttymw88L1DTY2uNAfsMM0wfGRi2HxSXB2mB7j8xbyDGSdzMNSjhkQ==
X-Received: by 2002:a63:5c43:0:b0:439:f213:1555 with SMTP id
 n3-20020a635c43000000b00439f2131555mr5285061pgm.506.1664501440341;
        Thu, 29 Sep 2022 18:30:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a17090ab88100b00203059fc75bsm441977pjr.5.2022.09.29.18.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 18:30:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xterm: Add _GNU_SOURCE via CFLAGS
Date: Thu, 29 Sep 2022 18:30:37 -0700
Message-Id: <20220930013037.4070912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 01:30:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99016

This ensures that definitions of functions e.g. ptsname and wcwidth are
added correctly.

Fixes
| ./main.c:2940:8: error: incompatible integer to pointer conversion initializing 'char *' with an expression of type 'int' [-Wint-conversion]
|         char *name = ptsname(*pty);
|               ^      ~~~~~~~~~~~~~

| ./util.c:5506:19: error: use of undeclared identifier 'wcwidth'
|             my_wcwidth = wcwidth;
|                          ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_373.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_373.bb b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
index 7e36f475c4..bc555cbcd9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
@@ -27,6 +27,8 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
 
 B = "${S}"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 do_configure() {
     gnu-configize --force
     sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
-- 
2.37.3


