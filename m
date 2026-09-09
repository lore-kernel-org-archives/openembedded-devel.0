Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF26C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 23:55:33 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2300.1788998131567915748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 16:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FRY1iwqN;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: schonm@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99ddso10419047b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788998130; x=1789602930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXS9zyYFiv+faAVpM+cMDsLski3OuYjhHMUhsJcrfIo=;
        b=FRY1iwqN3uFy5u8kAF12j1atrVEeL7RueCRLI8LIFGHteLKiKVhA5HM4vkZNP5rEnC
         vZFLKJ/2YltRiaTJFWyeNhBIReMTCzyB2o4bd/teqpH8PvoA/ct+ctliY/g7xaRvaEON
         FmBA0Lpdf2SQxLJ03wPyafBRgqMPqjvDwKBP5n1rdK4pf5LbESHI+nU8/LUtG8bh/DNi
         /AZiyvOOQfNd5azM/XWz4NgPVSBH4jL+yJDRM8VTQj6QJIVRgkV5oS8kEBA8W9XpLNlK
         LXFSTn0Nj8gQROS+mAtpIqSpd7ve086dyaHEDcoKQDYTHjzYojoKoEYKi1FB/F7ZDO+I
         oWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788998130; x=1789602930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXS9zyYFiv+faAVpM+cMDsLski3OuYjhHMUhsJcrfIo=;
        b=HREmapIetHfNUTUCugparHjQhukySES74M5F7Z1Jj3z1INuR2jk5mf6yU3mtcro3AS
         RoRzbtlZ2CkbEHlHgcwfvZxF124TBEBAXUTv8Zj/CR0CztF+qQkB7EaZnApFcmLOCgPJ
         vDqfZ9Nic3f9hCEEwzmBcDrPr3hi0kfiVFa3q9AEMOpkUtcKajfjQ88mxERIV2SZZg1p
         Ht0ZjIUJiQ7EawquMmsY53MESqpDITyjEkL+6ostZVmwrsafwDH+TRCxTtUVPktcHUwF
         YLfnu6z87hobLkeBL9ahDrR111G6MNcs5PakePZonj8jVT6dqTe7MMCMeLVZO1XXxh9n
         Ut3w==
X-Gm-Message-State: AFuF++nAB0Tg81+NFIzx2QZjHy9aqQOaiM81qp6q5cznCO+65bJvCwa0
	zMTbXG6II++5HqiO3bnSnzyHK3Nlj4pYQrHowK+dik6WbeBMpyzGDFzsxPjGfLyD
X-Gm-Gg: AYBFou1h/eYaGrR1kpuDX5Es8kZTA5BhVpCUx5CgDGFppXEw7JhnVviMdC1pVgDqbBP
	XgGhYDFvMDzx2mkz1DUUZwuZMbWrZncJrJILnLvM461I3YmIWsrtM3zsJteLXaju60tpGfjs6cm
	XWLUDhwTAW9C2AnlT2UmqSIJeX1ha2d6g8pmmWGwHLZQP4tw/dMxDnj2OJAV7bmnmr4oN+3CrQ2
	9SqvwYoKQE3NwlBjX6+Cvmcp6ipEJ4aXFEvale79Fm2WRfQ7ghXO6K6jsvIaU4Y9qkHHlgHnhOT
	pPXZuaeetK0gIuF8nu+1g/w7BwHcMHt6lULj4BJusyxVKBdVc571kNBqpuZ5LSy86p2/uX+LD/M
	AcI/LHReMfWwVlv7mnESzq2Ql4gHC2zpQX5oBGFzgEr5ZYGc9FYLuymzMu7VIKzuwq6pT72eMVm
	ZkY+9AR/Bul4Wf/dhDycGQU/psOicvSr3C3RrOU+DCAX2biSEfBGmY6EiKbe5DBo1/bcmz8TI2P
	ZvXjYlBWauB6s6ieXDvROs1QIek0oxxKkOqCHzlSNEDn6eZCvbhgFD5zFGVyjz486vI9X8301+0
	QT1Les49ll65A1BknJNm4hk=
X-Received: by 2002:a05:690c:7483:b0:820:a55:3ca3 with SMTP id 00721157ae682-881574e782emr24365607b3.33.1788998125634;
        Wed, 09 Sep 2026 16:55:25 -0700 (PDT)
Received: from localhost.localdomain ([67.233.63.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87143bb048dsm116432147b3.1.2026.09.09.16.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:55:25 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.20.0 -> 24.21.0
Date: Wed,  9 Sep 2026 19:54:30 -0400
Message-ID: <20260909235430.9664-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 23:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129901

Changelog: https://github.com/nodejs/node/releases/tag/v24.21.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_24.20.bb => nodejs-oe-cache-native_24.21.bb} | 0
 .../nodejs/{nodejs_24.20.0.bb => nodejs_24.21.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.20 => nodejs-oe-cache-24.21}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.20.bb => nodejs-oe-cache-native_24.21.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.20.0.bb => nodejs_24.21.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.20/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.21/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.20/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.21/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.20.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.21.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.20.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.21.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb
index 789c402632..441a920f36 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "2732fc3f588dd335cd6779c06864f7cd424bb1b5ff9a1743059a66c54f9ca4a1"
+SRC_URI[sha256sum] = "a6f54defb6fd7c84f41dba13d61e78e9b4e0961712cf61f29715c05f5ced94fc"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


