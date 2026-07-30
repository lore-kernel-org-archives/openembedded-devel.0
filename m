Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8128C54FCD
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 00:15:54 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1192.1785370553636373696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 17:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oxdbDQCM;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e9f7491ffso24356187b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785370553; x=1785975353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcw1RPXplcRizPHL/TjSHoDynjrdBYab+vFy7pZtTgM=;
        b=oxdbDQCMSMNv2R+T7gQAHj/91Lpsgc4uX4jLZnzyFzkF0EJEp/IzSSN7PxQA1+nl0U
         3d7uOIwpqCUr018OmM5dHtIn0EqVk3rwx6MBK+OR/ORnPpKys0GBaNsmWOoBfjWyBJRm
         sxXm/ATgy018XS7i+/ne4EEaaSrZ6rFfuEyKo/LhgTgKr+aD/s0VDSVCv9O0jIKkolJw
         B14+/HAhY9eo9De5pi/cIGnnSVRRa+17Yu6NwU46bA72hL4By8cCr/XeTqOsleJEwveh
         eu9zZLRw0urgZg8Un92A6S1szy+J+5Y8jsqMRiR3v2HEoqEwlgliJ0uYznpWrrv2QfhX
         MUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785370553; x=1785975353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcw1RPXplcRizPHL/TjSHoDynjrdBYab+vFy7pZtTgM=;
        b=MK01jorzdLp7GAOov5HHXCT6AF/AL9fHqjZTJNswrUKcR0omnrAEiHhDj+Krmlok9C
         RUBMlacusvTPkLyGHadLjg+lR8K9cybK44kGPoJrfCIeYpEc9XOYXs45fsdVibfSQGJ4
         F04ww2pPuJ5CvLe83kAPrnrdUPVXQDt8L74LQ9ZhADGu0ZFVW/pACHBok72K7HCDLfKI
         8yI/ehTI4y7HK7cn2kXDQOlimxbopqIK/efF5NkRJOcVZ9j95XqoqM3FjGbnJrUPUxJe
         Adkqe8xRAQA74O7FVqjqXUi1CGnQG8us2O3oH48Q4yeMTN/ksbDaudoOLenJbhaDliBO
         15BA==
X-Gm-Message-State: AOJu0Yx8LGD3sdcCRcbPEZhsMLvds4nzs/dJkzr6A3XXDMS6YiG73QTF
	iEnYQ4lueta4TvPXGd7RjN8qZ+eAnc794/EyO5zyMj8oBfcBec3+/jualBRtuiCD
X-Gm-Gg: AR+sD11w98SxjP4q3CBC56G7JVVFEH5d07ImchBl2ifxTdtfMWpfiiZVOstRZJv2MAl
	TCJBEP8oIKCahPt75kgVxfL/Q6jvZSWDkIke0P9JMtoAmZfItH2l3/zccLmMZIfx5nYDaJE3Lce
	DyxCXg2CMa0km46KFXqfvQOx0o+HDFbwd3QbudB9A3kDDoRX3mW5v9h02bo2Njfsp3vo9fcfhbH
	yZCUQJqv3I4R7WNRLLorYSXoBJsCO+C43FwbY60nS866NYx2MSRGeDFIHRbd/yH/ydhs9sKmXh4
	7ItSn56VUN9tZSNcZWIe+C/jC2UqESRvj8QGfZpl0A+z1iCMpfELbNHMiSDlEcXLikfFBV/lM3R
	IeGdtj5OHeG9qsMmp5VwWpDNUNhBjvBC20TJaWidaUMJ/Rkm3zjQNxL7KX6zoQmS+uGqitfchMT
	IbbcSFWjdqahEl+DWIOoRjWjrh7eMRdCL6fqh1LOGpJUgFVGbutOpPndcv09pefs05oAA8akhU3
	70Qd2NXO9piBhhvchuHzj0YEVlDdS5iIwz9mfGrbBuaCQidg6t5iafy1rp+f86EDpBd9sFFZdLv
	hKYYv6xC8NJA
X-Received: by 2002:a05:690c:690c:b0:81e:cc22:747a with SMTP id 00721157ae682-81fb8aa362cmr2442977b3.60.1785370552419;
        Wed, 29 Jul 2026 17:15:52 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a8a609sm1102307b3.28.2026.07.29.17.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:15:51 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.18.0 -> 24.18.1
Date: Wed, 29 Jul 2026 20:15:31 -0400
Message-ID: <20260730001531.1833347-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 00:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128563

This is the July 2026 Security Release.

https://nodejs.org/en/blog/vulnerability/july-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v24.18.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_24.18.0.bb => nodejs_24.18.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.18.0.bb => nodejs_24.18.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
index a0d8926d34..db3cba1a75 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.1.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "e94afde24db08e0c564ee7110a2d5aab51ee0059382c9fd8233c54eec47b28f9"
+SRC_URI[sha256sum] = "86d40d594bbdfcf69009a62fdf43cb19ae72b6cb5822d2bdd8349c5a1b2fa628"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


