Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15030CD37B1
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6297.1762976150226593935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XU00RxF/;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso600825e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976149; x=1763580949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0wQY/oJ0etda7zmUKWe+T87Bbrf0KekGMIsY2tSxMM=;
        b=XU00RxF/t+Tju5l/I45aO3kZsGXK5nPRAvIabDFwPvzh/+COXYnPvF16AuYij/KJKZ
         oyH58D9OyatSG1giTscGl3h7tygS1mD9giAyf0nSLm/CN80zRxpW+o3qtK9gSD/QfMpM
         W1f/EqIWR+/plX2VZJHGsc2uuOpk0m6irOj1zb8w++aBMRj/mlp+pgZ4bBKmeAQ9VJee
         iapN7Bom+xppJzs2Wk1DJxeS9APTrJSoHOhtq3Vpb4Uw5dweCRkI7m3pbuf/5S5Q5pzv
         e/H1RvDIS4Y3Ed9sVHjVzARMRTh3anx7gpueooBlOlFH27lz5TPWrjcN/3LXG3FUwKwl
         FGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976149; x=1763580949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u0wQY/oJ0etda7zmUKWe+T87Bbrf0KekGMIsY2tSxMM=;
        b=Fw25LY1I8fLkaha66iut/tERIde4T/Ge3Emt2/kS1yy9yyPLIOGCB/LfPMgmShZMYH
         onF0q/bW9WlrQgX01/s/rc6KZxs9FDecMhtPuUtIeHTrpuO0rtT1gD6+9FYYFSPecA2j
         xQ6tOrpu/dTmKA1jc24hwrZ/Jmki9WU8h9ZZOucZlUAdbVP039XL9NS6qLKf1dQZICAZ
         6mqkCSkfj4ICJfwWKL54jjcjYRqsrARfHg9HkkyhX1U4YAZSF1+by5q/Wuto35bcWmGj
         agQM/joPQhRFrJVoh06S7wdkyv+b4+kkI3jS8ynoZ1/1amjoP1B+QCRMfoWe3OP6erYt
         VROw==
X-Gm-Message-State: AOJu0Yx4e2VcJNhQ1x82Jo4JKwwgxiUBOZLZ0YfikYCqS5Jq/6qHnq8R
	CmnJsr1mfZZ5WQ6IkKPam0fA41VshZ2uyv1zeg9mq9klUeVdz5Ed3zzyWtf0Awa7
X-Gm-Gg: ASbGncuUpHeMIUGQHe4c2wstRvPCqXHJk931SFY55AYUqsouQx+zT3RofhWMe+crPuU
	5QJTPVE/lTyPwa7fJBpgt8EBIgKMGgz/AuA0+bVEslX3Qj4oH/F7Ygfx9797U8oypJcpgKGzn0A
	40StVQHNiF6zqwvf4+cHe+7pbCQZB/kCt2VK2dK93TNypYkMf5mGcW4uSYMOviPWHgXxs9iGGVb
	hoj2RFwHTm4bpLQq6/li7WQyyF/4RdtiKQN8Nhb9hCMfcq4rbr7FrEujjAajZzr5Din0nitL9kZ
	hwdWX2mZ9pmqqg54ehvOXCSdkgpNaTu1wrupbZJgrUs+icsS0oDQF8t/HoLvOpIGD/5GyCQEtQW
	gyVctXUnIO8bl1KEHRxQU/eFD2ewa7uK840THo7Q4WRh13wFUC0uNqcbQ19Sf6P1gLuyLaa87dQ
	==
X-Google-Smtp-Source: AGHT+IH8EyquNKqkDlCtO9sT7yW2zWms+hpkeb0ClGqizYCxaKug4+9b7A9lGXgDU7eqoydyoyKMRQ==
X-Received: by 2002:a05:600c:1c08:b0:475:df91:de03 with SMTP id 5b1f17b1804b1-477870b67d1mr41496975e9.39.1762976148515;
        Wed, 12 Nov 2025 11:35:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/21] consolation: fix SRC_URI protocol
Date: Wed, 12 Nov 2025 20:35:29 +0100
Message-ID: <20251112193542.1589821-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121570

Switch to https protocol to avoid fetching failures (anonymous fetching
with git protocol is not available anymore on this server).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/consolation/consolation_0.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
index 0936b1ae19..0e6ad38495 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     udev \
 "
 
-SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
+SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master;protocol=https"
 SRCREV = "4581eaece6e49fa2b687efbdbe23b2de452e7902"
 
 S = "${WORKDIR}/git"

