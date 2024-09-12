Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02B2EE6432
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 04:39:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.39903.1726115997951887315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 21:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ISN0yJ/E;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so431565a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 21:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726115997; x=1726720797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqeoEDjuOz/wAzQ1rmd+GN6jWDgJRriLordD1G5owgE=;
        b=ISN0yJ/Eq3uTLRgtqa+R/jOJkt0dziAcdMU/MA8WIbepgAjjqUz7t0PP4VVFAZE4Zw
         yp81zkGvOb8U1NGiQoEWwP/mcq759lyOZPtkDAaysu0ABCu40najNnngKxKAxJy1qdbM
         hYh5xe7UuThTME5GgqlW4e7I9oSjmpMxdOZAXePi3fPO4hu36D6aWKOaewoH0TLlRrVl
         8/XrKYX+FPz7cvcxZOpdfIZ8QKAqQrSSLtXYn8/BUQc9nb6Cqnrm5Z6DQqreFVxvWfF+
         r6v8gwPHFkhTP0enH5Q96RCt2HeHS2B9w6H2DDlLxpy7GcxIMFJNe9zoN3C5rK4KxW6W
         CYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726115997; x=1726720797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqeoEDjuOz/wAzQ1rmd+GN6jWDgJRriLordD1G5owgE=;
        b=dGkMnvMuWqZRb8Z8eT1hlPgi1n8K6xt5KUCJiYupSreQh3u0D7Ow5faqlTXq7x4Xkv
         nxnkcCHwSoi6gD8XCx2YY4ZmWeubppKz7kqXlyY4C+dcPIhDP97W8bvhmJ5wsziCelyN
         EfPpqTyCxqkEo87Dpxc0TumcQlol6DiYPR796D+x/v7h031gptXjRhsELNVouSoqKCId
         9D68Ry4YgBx/epIn7/0yNLF0Gdj8U8bdB2fLGm2JL+x9UN3rF7l8RCe50d7RhQwwqVj8
         OuKHz9rKNsW/X6n4p1Uta/qg27p0xVms9pvfG1tJy2fmdPLxgXcztGKdGdTc/vWR8ZEk
         jHFw==
X-Gm-Message-State: AOJu0YxOIaLzb41eL680qzvNFszibfgFlyjAsJG/P9yl8lpvsD3cOPJW
	QXrL2gJ3zqaUkZQ5ih7EUUyB6cCztroxtMnl0RBGeP+/39QqjrApmM9PGanD
X-Google-Smtp-Source: AGHT+IHH7taPIlflKMj5PFXm0xjAmXJI/MzV01/lyv9hcpLDCRztMY4bcZ5wnejV/9djvjV3FgCU0g==
X-Received: by 2002:a17:90b:4c50:b0:2d8:84de:5e0e with SMTP id 98e67ed59e1d1-2db9ffb4682mr1836713a91.19.1726115997129;
        Wed, 11 Sep 2024 21:39:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc110527sm11523964a91.36.2024.09.11.21.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:39:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-parse-type: Add missing rdep on six for ptests
Date: Wed, 11 Sep 2024 21:39:54 -0700
Message-ID: <20240912043954.90158-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 04:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112255

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
index db9d52cdcd..06843c03cb 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
@@ -20,5 +20,6 @@ do_install_ptest() {
 RDEPENDS:${PN} += "python3-parse"
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
+    python3-six \
     python3-unittest-automake-output \
 "

