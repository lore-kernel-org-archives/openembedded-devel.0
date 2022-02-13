Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F270CC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:17:40 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.16163.1644715060488656141
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ai5Qp3QW;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id m22so3757987pfk.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrCiJgIssLG540yNMRl1U2j7sn3MwcVj2vsHejbPTqU=;
        b=ai5Qp3QWrPOOPN+OK0tCURddiQ0/aCff3H7QM9nidJpjvw6tX8DIDF2uHEHziCwRq3
         MWrOZFa+TVR0lbD8KmGjcXtPIjNZSdlQSy7OdHhRf/1kcCD5HjszQTfMguxJ5PXBUDaI
         aC7HzuIVOiVF1Ya9RXsF20Gd1Cg2mZOlQIIX/ZSsrsQvgEBSDLQOJSq78PYmqa77lnsy
         bA5i14zZXd+xhkesNCLMuUwqhk0sdOeB60oTk25ry1zWDs64Z9yf0XJEMUSytO2N7d4g
         JCa2QGid4k34T/Whc5oJjTGKVC/pzxcs7cq6Gh9DE2FnLPyqw5J4disdmoXEMIbhHp+2
         +eGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrCiJgIssLG540yNMRl1U2j7sn3MwcVj2vsHejbPTqU=;
        b=A3NF0YWzLYUING/5X1bv8oevf5XsbUJNVf2rBzYd46fo8mPSUh/Xoeciq3C2dVKDiJ
         YncPX+5SSGiJMySbAmq5YPuNtZ0xPNSVJP7kqsrtnk2ulKeLWJLGcViiUeQjiaOXmSV4
         iDU41kPbG8Dzgddv9Bb6aHGx2BnimL3iZfkIquDEsDcKfPFqMaKl8VsKO06csmtksz2T
         9mYXTrJ8F9JyInq4D6k3r0sBh/xL8R2lFs+hWtTLHQnOYfiFrtQfTf2+GgkPG/aBV3Ca
         KhN1ezt263pXE910y6wbJpV3SJ3D2ZlniyQaGRUPqZ67p1G79LHWAO/00RJdG9BUitmt
         dkKA==
X-Gm-Message-State: AOAM5318TYYLr72LtpbBuaKDXuHqKH/xjewldo6g5gjQHArHv3nyo0Si
	6CRZBrnuiNmwu5fz3cRyag9ISVmr1zWHbQ==
X-Google-Smtp-Source: 
 ABdhPJxF1Dnrx69LkmdfcUkAOyhXfE9OygN+Xp8f5WQz9FvGrY48zw6HqCiVXMROhr8ZclL/ALXvyg==
X-Received: by 2002:a63:5c1f:: with SMTP id q31mr6607986pgb.176.1644715059617;
        Sat, 12 Feb 2022 17:17:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s6sm23106262pgk.44.2022.02.12.17.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:17:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] capnproto: Fix build on mips
Date: Sat, 12 Feb 2022 17:17:37 -0800
Message-Id: <20220213011737.3193333-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Feb 2022 01:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95303

gcc and clang calls atomic intrinsics which needs linking with libatomic
Fixes
| /usr/src/debug/capnproto/0.9.1-r0/git/c++/src/capnp/arena.h:114: undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
index 164bb2cf8a..9616edd732 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git/c++"
 
 inherit cmake
 
+CXXFLAGS:append:mips = " -latomic"
+
 EXTRA_OECMAKE += "\
     -DBUILD_TESTING=OFF \
 "
-- 
2.35.1


