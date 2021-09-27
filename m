Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9E8C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:53:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2721.1632765215880896910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ktsfk9cA;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id g2so12468849pfc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLkPZUQx4Crw8VAqJe4l5YpDk30U33X01fagWwTeUMA=;
        b=ktsfk9cAP6szhKBLiHqz0ANbLIClfOw3SCvxBMb0AGBasMUWtdTNvXIfhb1VCv7Bu1
         dxNtoS3kzb3+zAP2NWJNPP8YThByf59KiZPStz4ES4CZN9ZHdl4dMP/LBaZ0ACNDOWsU
         mRTpS64o/miHryyN0mFeW+aGAC3SseaIYj3fBX9N+BXa72Ys6lP25zHtxMQ5TaTWUpK+
         vc8wFtXoVQAVtsjmlbG8r3n8xWp/Un9cRAM746XiQ2Y+6pvm9IVK73McUT3lPJJ3nen9
         7b+LZfxUogiSNz6mM3Uw6SzhfkhbOiVC47MT0jnZZC++J05aezv0zmIIb9RqmHNYWWAM
         bc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLkPZUQx4Crw8VAqJe4l5YpDk30U33X01fagWwTeUMA=;
        b=njC7bMiCfXO1s+KmKklOK+ZrRxs1gfMG9gAfMMLzHZeQl/2XnUnCKoON88r7TTnED2
         C5o4nD5EBPbrORquO8UszUXZj92hW/2GzwZfasDwfA6Gn9+TeyypFZDrSAGV9aHk2vZC
         QbcpT2j8v5cBGEc5aXfbS2HJedd2REcxlxnHoHO/mfZLuqi09GCk9atnI878odi2sTyu
         EkTrpJmtq06zQZF9PlOGLjL5/j+YZs12z1S984VjHdQJAAkhceVi3VvZcPnZbd+MshTF
         nVHu/rlJl3GteZs4T35IMjNl1m4pdEoUF/F102uY37jHSOqA42+G+rEGe+sWOURr7TmT
         z3hw==
X-Gm-Message-State: AOAM532SYGn/dAwmV3iEx4tkOqSNJV8Ggfj1Vrmix3FqkGCRS2IjVRoH
	vzLvEkKrSXJfYuEXAyZWW2os6lP50gZH1w==
X-Google-Smtp-Source: 
 ABdhPJybNyfKDfjSawpCTI7EPyllZvEN9askYPQDiKpUuo7KDLLh72qNiqDVLE8qQ5YNRYLol1h/Sw==
X-Received: by 2002:a63:79c7:: with SMTP id u190mr811678pgc.378.1632765214895;
        Mon, 27 Sep 2021 10:53:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id
 ci18sm117319pjb.11.2021.09.27.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 10:53:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] smcroute: Add missing pkgconfig inherit
Date: Mon, 27 Sep 2021 10:53:32 -0700
Message-Id: <20210927175332.759395-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 17:53:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93157

Fixes
../git/configure: line 5918: syntax error near unexpected token `libsystemd,'
../git/configure: line 5918: `	PKG_CHECK_MODULES(libsystemd, libsystemd, with_libsystemd=yes, true)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
index f226f23af8..8e62f588f3 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
@@ -10,4 +10,4 @@ SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
-- 
2.33.0


