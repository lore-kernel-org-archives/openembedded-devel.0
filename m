Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428ADC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24511.1786747597802255702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e+hwf22T;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso15332045ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747597; x=1787352397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCMf9npD6Y2j2neRkZp8Q6Ug3NRRUaq3FxphJ+vPIy8=;
        b=e+hwf22TOB7q6vN/G2bFR1HnmXPguYdI27FpI3moWSSnw0CAuQlUIK1KcHPhb2UKf3
         wwqT2NwPr1UQGaHI8Nb14T3NlrrTfe+NhZSOT3oPia1fi7tgYpQnMYFnh2ASObTYJ0BE
         Vg/WCe0NqC2UOb2SrsStLAALvR88AIllkr0IYKH4OWYjKB7MO6guJTM+vRlDCz9CyOAQ
         RVu7Sycyvl8df4DYw0dgQYHPg7OY57fxVRdim8FnGzO5UmYft7ZphIiE8dWJdV6SaypC
         OjZ2rWs/55PnwrNgLwZtUiE6QmFXrbsahJM2KRmiRYeCivt35yBYtllpazYyTzejUtME
         Ys9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747597; x=1787352397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCMf9npD6Y2j2neRkZp8Q6Ug3NRRUaq3FxphJ+vPIy8=;
        b=JvRrUYH3K20yG4tkVYp91MluKqgosA43F0xwjgeCGXNub09j07160oIRszUIC5K117
         igdI7l+aRogamXnATyCW6c3Nngp/r/uUkelxdWjfq15wUgI14F0vrG+uAyzVrLkUcADJ
         dDFQk9EzY95s7dIrCXwxsCMQrAck48zL1SDqk9JJ4Vp5vSsa9eU72BK4lDTBNe9U2k7M
         2tHl6l1xhenr7Klo934QN8D8DELE/zgcp0056N75lsM/fjqnSjwH8c/+sErCyEOKabk9
         1gwV9wP6kN9vR9Rd5bNjJB8ATWbj85Lz/E9XscyuKGCwNimYd1p1I9KFn6zeTvrg8D3o
         pLwg==
X-Gm-Message-State: AOJu0Yx8Tf7V3WVdgfBQg66OKnCBAYAvFGf+4CG0ygaSl5J4BmK6YF7y
	N5LpFWyzr2N2iZtitxz+jHno/OTZciBJ9nGOQRf2cfLHO61R+zKqPEa6GNaBwOB9
X-Gm-Gg: AR+sD10obNAdWgL/tGsN44dqJVTWs5UOKtqX8xJGsIOL8WdreAmyasvpUHwK0a+taQA
	pqxk+p6IEaZ5HaJQJBDiDJnRF5LQuPfwEi0wAwSNy1qchYvn3BflPcsSIUt5ZCo1hovM2JxhPJS
	VoPIpmMHT0sEyAk5BQIvqip8GsdPvcIVsH0YRlNZxfWbfBa8ScwJJNg/IhfxKHO43BbPfvHbbs9
	dqlUwzRtUGVNdvCTqRJRHEqbR6UMd3GBB5BJMGNzvgmrWDf+TrOhoK8I+GGsAPFuGg3F12HAP+M
	E/k6aTt7FYfelFnlhG7QqnJEUbdiIVQm5PbTU+l+WXg4FlVQG1zKNzfUC9ngp6f9bb1ucAPPuZ5
	+aRBSpxUpp05CFOMEKfRNljaVuPa3WTUp/JmAgJaQIIJoQN9TI+LoR4dZT+3K/u3tCNHe5GZZRZ
	bjNOrrTDD4XOP+I17tppKG34TntoVxYJ2o6Z/um/p7+kpTAM0Zi3J63b9VWjp4TZ5RmrLi0BQSu
	molHaRGeloFyYU8sv50PONP4Qqe/ePjlum3/wjA+epvPtCMDJUeMRiDSZp2Hbb3LGKxIrZHpW1h
	r+e+Yf1MykwpCEHzQpyU1zfEPFzr6cHFE/qcWmdaa3LZEZxT076btCYSvmteiMEEG6gGwb0WsnJ
	aVrUXxFjzj5kuEZeRWZJu//pJCE4s1W0VVBebHEBVjtGGpY4bdJOYU0ZA
X-Received: by 2002:a17:90b:1d45:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3933b7c3b71mr10676805a91.1.1786747597082;
        Fri, 14 Aug 2026 15:46:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 048/109] opencv: upgrade 4.13.0 -> 4.14.0
Date: Fri, 14 Aug 2026 15:44:34 -0700
Message-ID: <20260814224539.1523174-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129112

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../opencv/{opencv_4.13.0.bb => opencv_4.14.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.13.0.bb => opencv_4.14.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.13.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.14.0.bb
index 981b06e33b..1926ee8e26 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.14.0.bb
@@ -10,15 +10,15 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "fe38fc608f6acb8b68953438a62305d8318f4fcd"
-SRCREV_contrib = "d99ad2a188210cc35067c2e60076eed7c2442bc3"
+SRCREV_opencv = "0654a42e19215ef25b1d367d822f3c630447e7c7"
+SRCREV_contrib = "a8e9acd62cabd30419dba83007f2ac0d07de5e2c"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 SRCREV_fastcv = "9e8d42b6d7e769548d70b2e5674e263b056de8b4"
 # kleidicv must match version of OpenCV
-SRCREV_kleidicv = "1e8fe7008c2292657b9689d70ea5d30db0e57767"
+SRCREV_kleidicv = "b1dbf474b8685b97a64d03e828b359fbdc050d1f"
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv_kleidicv"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https;tag=${PV} \

