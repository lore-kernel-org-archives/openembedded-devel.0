Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D1FC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 17:55:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1080.1644083718057650959
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rtsaz+zf;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id y9so1179120pjf.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iKlo7Pxm4WEnQZ+PJz6bq2ZDSfmugJ+oczni3Qly6PQ=;
        b=Rtsaz+zfBgyMPi6j2yK4dRVa1aQ+ii/xkwRvndJwNmwm+fDrpMCF7r6GN5DH8oKC94
         +mQvzX+dwv5Jg5XZ0+r0jJmYZvo43IQyhKzM9+5FPxi/ogvpof/H/jlhoPZ7Q+mMztKr
         /zC6rTl4IGWFHVgdAMrkvNsaAXYOgxj4ucRRmfpUHPw57y5t32hFQN2NEOW14OTMD++k
         NL5OCYoVir7SIxKFjDiXN6LUYYuKhFB3KD4MrtMnqPjxChmeHaUF0HExboizV/7B8o58
         4bTSXPOeJVN4HYFV2oUWJWVOqULIy1Fdf1RzFTgTkXc9tTa1mGWiLlSSeGMu/r5tgShz
         U+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iKlo7Pxm4WEnQZ+PJz6bq2ZDSfmugJ+oczni3Qly6PQ=;
        b=TuP9UzOPuwfPKWd+2P7bBaZTm+SUkBekwA8z4zmWgjpaiayIf14YJIj3OQrsNfTn3v
         fUSTqWAA7+Eijs9KRMLoBp9mTctI7LcwfKTmoIS0eogZZ98MfnXjTi0UHpA05gsa/wEZ
         IAqXSKGB9Oyf+/mxXJagr5QQIb3bnsV2FvSERctixHbYa+S8NPpEmVI+rO4reLTzYRkP
         vdz+ID5C2Q0gSWPT7r/5ApxRla8EdAA8YqO8BnbdhRT63o3xm2KxjHFsgHb2m06t0u1T
         WQvvTdJfLfSjInMClI/z02aozt5/rK12QqhbOTn2eXmHHxzwx8aIkKOMpIVS+UGBKR4o
         j1oQ==
X-Gm-Message-State: AOAM532oC9BHDCV6wt/qq+bl2bdkUaY8Avo68Mjd+XXeajIE/OUkIkRc
	pm9b2MDCqsEyFmSPV6vesVwUumpHJ2Q=
X-Google-Smtp-Source: 
 ABdhPJxIM5SS5qvblHwf4gNCdJgZ5xfcrx2bIUgXyIMx1U6UcQjIgCzVDVlixy6/m8DNBdq5+52weA==
X-Received: by 2002:a17:90b:1d0e:: with SMTP id
 on14mr4895585pjb.59.1644083717386;
        Sat, 05 Feb 2022 09:55:17 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:c500:ff16:ca75:f2cc])
        by smtp.gmail.com with ESMTPSA id
 pf8sm1140677pjb.20.2022.02.05.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 09:55:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 1/3] snappy: use main branch to fix fetch
 failure
Date: Sat,  5 Feb 2022 09:55:13 -0800
Message-Id: <20220205175515.1767488-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Feb 2022 17:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95229

From: Jan Luebbe <jlu@pengutronix.de>

The project has renamed the master branch to main.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0c9c5c666150bc105cad35b442fa76464885aa1c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index 252ba9f3dc..0d58345d7a 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -10,7 +10,7 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=master \
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
     file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
 "
 SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
-- 
2.25.1


