Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3837FD2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 07:01:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9641.1765350069003049565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 23:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TQqX0I34;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a1c28778so79451435e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 23:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765350067; x=1765954867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykZwElox0Um1eODxolIGBCaf1M7M+s9ZBa1tW3ifg9g=;
        b=TQqX0I34Ez9jFbvPpJer68rkSGUYhu3G3GNc5UestE819qSTevRLPUuBD1bwM3mpgP
         bnzQyIDUoPx5RJBJOUGX0XCWqYOMvt8xM4kdVEmd26+j4Y4CKFeLcwrJ/Y+tC2b/B/hv
         jGrVnwW1Nuh6jQJuSGX0mYuQFZsl5kSSUfY90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350067; x=1765954867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykZwElox0Um1eODxolIGBCaf1M7M+s9ZBa1tW3ifg9g=;
        b=nQMDtHz4rAAfZSMlXnf9k0vNJctAexJS+rC/NM+7XT53DLVnqS0n28CuhBr5jrGhTK
         v9lxxxHH09u9MyDHPWlR8LU8dgMrU1xHPZiCQ6ZDL55Zr63Xszx3S8j2jZiWR3Mgaplc
         uu853dlUiROmudLcayXiS2b5a13KCdGTsBHteGnNteurAo8oFy0WmbP0R9pYfTibI0bp
         KYW2MdIoKe1R4rTEbAnavGAknWZVyIdL6v8+fMfya55hyjwmVW/NXtm3frNG1JCKurCJ
         fB6UFhndSpyIARLg4tClTiYmre2wVLIPLKB0tTpYD/dBVLfOZEkKNA1XZvRpbgtD1sgz
         B0eQ==
X-Gm-Message-State: AOJu0Yzk1JQDPDNhq31mIO6Ib567QGi58c2C4KgGP/XUiDWYB3RtmZIe
	6RJcZ4qRNfN4GA7btBkWUF05kQK248LO3Z3iBrxQwqExcvQUKn1AX8waZbUD6P2PE+rpkg1qlgg
	sWlTt
X-Gm-Gg: ASbGncsI7thn2Jrb8fy7+rpditggTDxS/zPCjgxs7BHQkX53dU0SOAGFZaLK3Q1afut
	WXCFyLuqjXQq/sFdCHyrXv70KUuG/1lfNSi/PugtJ5O6XwePgJGfIfYq6OVA58I/SM0dUtRsE+5
	AonFNwBhruMPF0CQmbYIZ3miX1d/IuGxyf7+uB/B9Zxp8Hev6XwzgK4tj8aJr6gJpxlhHFWiMSp
	PJJUmrdpBJjwZMcyMp4X/FJrI1n5qYywZeyWJCd4soQRPQUXPw5Uemf8Kqe09iAZgABvKxXRLsH
	oxcGSQQwCn1XYXT4M6VjoSDH1Tg+pILhm4bYVL//es9+TOX0tdf8/uIStbv75VFfbh9p1qylFt8
	6VeyRcIA+ltiuLCSqzDDjeGxZ3/fmRB8QlT6Oissghg5BiAwJEXl/oJtfKyApTfKndPMaB7tZ99
	Zepv3ZPlZC4WLbri5yTe2kEzCRIRh70Z/dO/k6UFGAkavbBg4TY4e8CHa6W3qvUV6CokGe8rGqF
	KICPM4fsXryPMs1Cg==
X-Google-Smtp-Source: AGHT+IEvrsEN2oxvJWuA3H/vvKPPxW50vUkjyHjVyJn66CJh6vyIG7HbupfYWxeuXHofMqlkCWHWZg==
X-Received: by 2002:a05:600c:a06:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47a8375362emr15090335e9.16.1765350067017;
        Tue, 09 Dec 2025 23:01:07 -0800 (PST)
Received: from localhost.localdomain (2a02-8440-2504-6d09-44ef-0473-cdec-42b0.rev.sfr.net. [2a02:8440:2504:6d09:44ef:473:cdec:42b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2231dfsm36811832f8f.26.2025.12.09.23.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:01:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] http-parser: fix SRC_URI branch
Date: Wed, 10 Dec 2025 08:00:22 +0100
Message-ID: <20251210070022.175967-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 07:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122484

From: Gyorgy Sarvari <skandigraun@gmail.com>

master was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8fb37f0f954e234d132468adba2072a70812a818)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index d4f76850d3..09e26e9f1e 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
 
-SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nodejs/http-parser.git;branch=main;protocol=https"
 SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
 S = "${WORKDIR}/git"

