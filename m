Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB833F5513E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 10:24:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33621.1772965447670013626
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 03:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGe8Vz1A;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852ff06541so9517955e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772965446; x=1773570246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUQtt06vJw1xH80X4m0pOyRQux45CEimmH+ImZBkeUE=;
        b=IGe8Vz1AaJcJBvoIdkVtUeyRxuekSZTPQ37Kg3HOgJlxjeikeaz/eeH9sGvVFucB6W
         qWrZLB/UtamHULW6kKh8J9rAbQHl6um1zSRXJcbLAv6sPNcNwvwRYTHpkUnVolb6syxR
         oaU9iByrX4MvRLMuv9o69NsCXeXJfidoFxt4ZWoLxb8vvLPV8Cj61Mzdae83eLHlNOOP
         IGDuFL580tmNHSrArXKI7mS3aRPlSlpv1naxG3rBzu0M1Whj06Or8w04O1XZ7Fz047Bj
         +bqtkLOHe3W31YDHR+jmLVceVLm4LJpkUMIHk0DR1morKxDvAAKS2dkV/uf1zZBIUbnj
         k9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772965446; x=1773570246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUQtt06vJw1xH80X4m0pOyRQux45CEimmH+ImZBkeUE=;
        b=hcf3NEsAk8tLiSxfEKsfnptZch91dmRSHZfEHNxuttfhASpH2ERInHQe0IPLYDpzXE
         63HuaQ/TyUB3ibpcF63yRqulIA0vigZEsDEWQIuwyxc7Jmndp3cVgtZNHL37PzEnb3eN
         2Tf/lonFqCABbdmjpVLIaxXu477r3gK3/OwuFxqmubofjCTnas3uC5JbwaM1XQ04x6OR
         l4+qCHJvMdNMLWs4W00tfBH0tW20Dw2m93YWiWoPZoyrPXn01yDuU6J2orCtH4GgG7j/
         DdMPR860+5C+mTwkwNAVduEEiTKIyYlYrNuHSlQoldhQ/x7DnOqtR0He5uXJyx+BHouE
         KPXg==
X-Gm-Message-State: AOJu0YwIHvFLrzIbjwD9nXV0hmUUx6AtnmcgiCxdgh4b6JDWx29N1Ph3
	WQfUdyHusTBg0EEqNWtbPAwF1I+tWKlaLticFgUa1pPvqgOWhnz1wQzAxr/e7Q==
X-Gm-Gg: ATEYQzx9Gzp0Hd+Y1hncIXH/KS1HjvFaFS9amzG/pe17qDo9asZ5EL0Vuh8IdmGH2yA
	qwlfKjx1AqIsLiau2hmqP8A4hv/xs3w6rpptrXW1ebHXnvfCQokNLBvzv3+Y6S8UKr+adSz1HMv
	wEVx3qV318ONHUUumNei+a81sI23tlLKiZzA/2P4MP3zzs189Q9TQYX3YHoCZbucCs8wIaTBYtP
	GNXwmwa4bEm/D9dQIXX+gTQftuzGOpI2oo5rX8soqluk1vH8DujwyYS47DLeq/V8wkGn7BXfB6G
	amnvpMmxQ6QQ+mahE7h3lb4UScEVgmv8avGw7PKF5ZmO5sUT/DTfpFDwdEe0FCvLNY7zgwTIr62
	6MuUtuxjRgsGcn02JAqhuK0bV2kuZqu4RFE/7eUoE9BrTd9zIE3SPI1WW7n92zvKEQ0k4SvpQvT
	s3RmeIIQstqVHIPJdRZAeR
X-Received: by 2002:a05:600c:3b0c:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-48526918923mr123607335e9.6.1772965445710;
        Sun, 08 Mar 2026 03:24:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853833094dsm37947035e9.13.2026.03.08.03.24.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 03:24:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] freerdp3: upgrade 3.22.0 -> 3.23.0
Date: Sun,  8 Mar 2026 11:24:04 +0100
Message-ID: <20260308102404.2164321-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 10:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124938

Contains many CVE and bugfixes.

Changelog: https://github.com/FreeRDP/FreeRDP/releases/tag/3.23.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/{freerdp3_3.22.0.bb => freerdp3_3.23.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.22.0.bb => freerdp3_3.23.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
index c182ee1339..52ec74d5d7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
+SRCREV = "b933ae18d9ad2a1d73c610868fcc30eb61654070"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 

