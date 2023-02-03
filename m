Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E81C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 10:10:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7451.1675419010023725481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Feb 2023 02:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RTwtPkXH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m14so4129632wrg.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhglzpBhu/61tfCGcZy/nD2R7znv21c/ouVbunKISI0=;
        b=RTwtPkXHXJTJgHVpR6BfxW/cUsmrGTRNyTYSo0Gk1Pip1ouqeo5QkOyVk4MhkCZwIh
         uGrOOd1T4R6WbVDGbSy4ESZ1vZtTmQd45v5utwh9CJcW+TzpFshWa6yl4g4v/Zb6YceZ
         hzB8lPk7uqsnWSsTECydXMYMvvWA804EOcQksQd5HTVNauVVnDS6/Y7G19l8xBogbDOx
         ucdXBWnURy5yOMZw0eDYaaZ3AngXOu0PGj71AMTQ3rYr1EwVYEpwwDOFLLpUrLeUq81w
         oPbf1MJhKTJWngxR6PvV1IjaDkL+H5eiHmgJIgCnz1SLa8tPvEIU0w1go0wT3OEnBeqP
         q2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhglzpBhu/61tfCGcZy/nD2R7znv21c/ouVbunKISI0=;
        b=pjUBc5z/kLkHalVHywFatxvjKGFpiPjM7mIkb6ibhnvGZoGG1D8Ll0pX8TUULVeKYn
         VntK11adSWWi146qLsf1oEKtNtqD+NslSJg3YbZS5v4Ud2QbVJPW4SHBj3b0BH/pDpG7
         GDPSvXb8GdYyb6TkoXd+caE5NIrdJeIgXCumlV2FESJzYePui4Q9elJMM1F0Kh1HY6PJ
         4M2tPgn94FzpjvNyPoV0NC2ZWEZQywXgi6tnenN8yIc9iZLe83965q4HDKmJbtZIjUEA
         yPjJDJ+Zl+oYV9lBj0mqK8OgbLSIYwojuFi4A8IP9qS4aBvfnThdLk7efrLPUPVILjao
         hTYQ==
X-Gm-Message-State: AO0yUKVikI6gg2AWbe5xIP8c8ooPbp51iZqsoB2WSu+HuCIyU7QhcPzV
	Boge6ZduF1GlnDc6Bf2u0Ql4zJ/aOfQ=
X-Google-Smtp-Source: AK7set+r2iBDRTbk/Iv4UD/ao/ACMywi6dQnn2ap0Aw22JGkiV/6ycaiU/3C9qbQrqOkyGG9nniC5g==
X-Received: by 2002:a5d:6c6c:0:b0:2c3:bbf0:1ffc with SMTP id r12-20020a5d6c6c000000b002c3bbf01ffcmr7335172wrz.61.1675419008083;
        Fri, 03 Feb 2023 02:10:08 -0800 (PST)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id s14-20020adfa28e000000b002c3be49ef94sm1639833wra.52.2023.02.03.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 02:10:07 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 1790.60.25 -> 1790.80.10
Date: Fri,  3 Feb 2023 10:10:02 +0000
Message-Id: <20230203101002.25424-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 10:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100923

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../mdns/{mdns_1790.60.25.bb => mdns_1790.80.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_1790.60.25.bb => mdns_1790.80.10.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb
rename to meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
index 96eb4e50c74d..612d343c88cf 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.60.25.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0008-Handle-errors-from-socket-calls.patch \
            file://mdns.service \
            "
-SRCREV = "e48e3a58b763a0d7b76a14f7f309e24d7502e796"
+SRCREV = "8769ab51605e465425d33d757f602ce5905ca639"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.39.0


