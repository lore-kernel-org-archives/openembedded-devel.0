Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9BAC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:49:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.197262.1698317362575147225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eay8yxVn;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso5648345e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317360; x=1698922160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2XV/oCQF7aUaRlgvzcoXxYwvMGL2FINlLFFc6c8CZc=;
        b=Eay8yxVng6UNe37hv+M6pfUSThLK2nlM7LnMb7QdMIT0iDO+KxtXqOzXhDR2Z40A7R
         x7kubKxfduJFsiEewXAO7wVONYNwzA28qAjCtTLy0QpyMjc1Ot9VuUKs+6ygk0eE+aSj
         TENK3IkcAn5S/mvEV1uHVzdFQFLpJfkY68xra77bfmy/2Hbd0kd02KYDkdjQyIuDXGxQ
         V4qPTi9yKfK41PlKK1Vd7lzpYFb737uzvFXRYuqzxK4cOf4tzLf7knKX2a16esiYD8+Q
         rGaL5aKHsTmv2IuLftzUZlUzYf8bl324Awc/RvCt210Ym5CG/zGoNTw2cGkbger3X738
         fC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317360; x=1698922160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2XV/oCQF7aUaRlgvzcoXxYwvMGL2FINlLFFc6c8CZc=;
        b=e67JUas5TMD2tCpizPeOgJyx5P0xHRbYt4RP6QR70AMvp9UsXcMFGG+NLXpkRvViCF
         lem9ENk5ZnDWw35t2B9HZtci+D57cTgxQ0xLOeJcr0Pbw++mnd34B/nGOel70T+Mb24J
         My1eRjDOJo8iaTjJbFKzZCtM2QAdF3kvp36oTgARs7tVyRcXq/11Pup6wPU3JaGSvnhx
         2uo7c7QcZbbrXYIx8vfqD/7bexfGaUrfb/hadFM57F+xju43XRxJylbZtWwgY2+/6IRJ
         tUzNAKtLAt5D47m/qw9vOpYn8mybTLlJQwdZpNbZxuAUai5rSN/XzvIMQ3CJNv+NYK30
         TIYQ==
X-Gm-Message-State: AOJu0Yy1uDVd/ze3JrfDGGoMVVcH+8t+h5JvufNcvdi8tTFYGVM+3Jsw
	phwdBUTaM3TOs5FwmAoLHgubYuDV84o=
X-Google-Smtp-Source: AGHT+IHYYGk3eVWLaoW/+KEKAFkjrM9Zyzp4aNokE9AbAve7I1Z0gTV83ZUqT6sbipnoIGSdLELlxA==
X-Received: by 2002:a05:600c:4f8d:b0:402:f55c:faee with SMTP id n13-20020a05600c4f8d00b00402f55cfaeemr12872848wmq.26.1698317360325;
        Thu, 26 Oct 2023 03:49:20 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id y1-20020a05600c20c100b0040648217f4fsm2197433wmm.39.2023.10.26.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:49:19 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Federico Briata <federicobriata@gmail.com>
Subject: [meta-oe][PATCH] cpulimit: add DESCRIPTION field
Date: Thu, 26 Oct 2023 12:49:15 +0200
Message-Id: <20231026104915.417321-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105740

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Federico Briata <federicobriata@gmail.com>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 58e4fd6e8..f88d3b6ca 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "cpulimit is a tool which limits the CPU usage of a process"
+DESCRIPTION = "cpulimit is a simple program that attempts to limit the CPU usage of a process (expressed in percentage, not in CPU time). This is useful to control batch jobs, when you don't want them to eat too much CPU. It does not act on the nice value or other priority stuff, but on the real CPU usage. Besides it is able to adapt itself to the overall system load, dynamically and quickly."
 HOMEPAGE = "http://cpulimit.sourceforge.net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
-- 
2.34.1


