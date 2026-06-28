Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC99C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:37 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14752.1782634356179006572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BfAxDDkM;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322719eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634356; x=1783239156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PkFHlx8GV3HPCQSGg+E43hZb87VSuZewK0H+Z0v36o=;
        b=BfAxDDkM5haN0xCFq2OGAGr3aYzV0x2+tP5i310iJ7GTcR3w++HKF683H279pqs4/T
         G/VtZVKLQ6Beo1vZsP6ojA+q4yRETiKZHOQGds+MnLSujrDX89NxJYlh3wViyAVW/iR0
         YzbkBwFPYN8tVaAFmCxJiiD36X2AYFfZHxNTF8GnluBTWuiHlBwctG2MQjTaZNfoFLQf
         UMfB/ZkMmSgM553mG7qpj1z9347liG77hb2WsUhR9avJDq3Q1MlXbViwQjloeemySNqd
         MT2ESI8fHSQG9sOBlS6zXnSTSwPvARHRs9Tfp7Qhhc8A+EdgOGMXvCnrdOuUbnPED/V1
         8UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634356; x=1783239156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4PkFHlx8GV3HPCQSGg+E43hZb87VSuZewK0H+Z0v36o=;
        b=KbJG32kcWzSm0boEG0FVA662RUxcB2cITUZWH8kpsJyXxuyjcBulE9zgVAKWfI7axj
         V8wDaSChAZPMht8tYx4vWPid/3pG+Iiozo1RWdDQjzDm0houhMdNdDEVDBiu2Uyr8dy1
         WQ2vGFnqwc67ZT6KUAk9ZIOuc5zkoNyz0giTD99SM/7CWC8DkCcS0M33OBnO1U8UNuPf
         KnJrAMc8eHmLEWEFepuPWOgj8cofNSfK1VEqcPgk2wHMx4W2WmpMcPpa4iJgpK6yEDhy
         uXCtFjU+qKazWVQu4tC6jECGUwGkQpQsep/R1LLopZD6yTMKFchkY2DFI4ZsBOda/lXy
         bCRQ==
X-Gm-Message-State: AOJu0YwslkIuj/jcl/nTATrSdEGG+Vop4TlSMi1RLncHMONC9jEvIUn1
	cQYnjjPuuIK6Us4XLl2IvXbJ3yHKRQuotayJcHxGgQyRNODOJ686Cg9PV2G9Qi+XjFuc6A==
X-Gm-Gg: AfdE7cn63XWEPUGI4ag6jLE1cfYZz/ERygzetJ7tZ8zPgh+EfVbSjWwxKhUzL/mIMeo
	C2mCMafDxAoAyT2vt99FEIfRPfulo1RiWs5vgzx6Srv6eI3dP756yroWdhFRRucBzugNe8aYJMU
	NF5hi6wEzfLCWaFJUEuPLppe+qIsyjcxpgM55Yc+bO8F9EkNL2QTbOyJuWWt9RANeodl2BrQIUg
	sOe0MfeXuBDu22nmOe/kVWnYMYRkxc7Nh9GW88nXU/ojWjI2NZd7qOUaDP75gNSCWF6Zt+fvsxQ
	6dTHd+VRBHo2Z5LUDYXE7GQ0Wi0f1FoVb17bDy+BrkcPk1YyacjNprg4XCdrMTc6qQaQP1JJZJq
	uxJLF/6QfIXjZkhWFcbTUzCUBYOSNemd6XJPm6DN2deE3hbNolTrJruW4JHkWUIlUNKwhJyrbzv
	95mk3CT52MJB7s6BVho8o9zKKDJfIpUfjl68q/ltTxSuWyc0wZxvqKLfPOZjeEXswN1jfV5IcEg
	JWnA0NuvIfbhdygaCdyF+0Q2ysoqrWPMdOJEwj4u81UjzcL+9rRdzpqpx2zGr+yzjaTYLhaiiot
	aC4mb3nfIt7qRDIRMNj1aUYXMbgk1g==
X-Received: by 2002:a05:7300:fd07:b0:305:179:4dde with SMTP id 5a478bee46e88-30c84e5b383mr12923157eec.35.1782634355492;
        Sun, 28 Jun 2026 01:12:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 077/128] xscreensaver: upgrade 6.04 -> 6.15
Date: Sun, 28 Jun 2026 01:10:28 -0700
Message-ID: <20260628081122.178348-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127887

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xscreensaver/{xscreensaver_6.04.bb => xscreensaver_6.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xscreensaver/{xscreensaver_6.04.bb => xscreensaver_6.15.bb} (96%)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.15.bb
similarity index 96%
rename from meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
rename to meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.15.bb
index 073b3f0912..15ba9590b3 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz \
 "
 MIRRORS += "https://www.jwz.org/${BPN} https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}"
 
-SRC_URI[sha256sum] = "787014b29f0c5793ecc2d93e1109a049ff48ab0c29b851dab34f683ceef6b152"
+SRC_URI[sha256sum] = "d2e687e56263fbfd8fca1fb9cc7c9331fd4f096ab57d3f7482565fe012c362d3"
 
 UPSTREAM_CHECK_URI = "https://www.jwz.org/xscreensaver/download.html"
 

