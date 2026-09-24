Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE64C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 02:26:48 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69.1790216801549136917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 19:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L4XVRo2f;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: schonm@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac6072so27272187b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790216800; x=1790821600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/C/7ahAwICSWXrY2PjocgJWf7/7r+4PLA+PhvN+ilNw=;
        b=L4XVRo2fbxcXc2dLaYhQpdaaNzWnZEHtCqzKmaUBk8hI1//fbJU2mLF4ZgNjYK3NMh
         kmMXjbnRdxgATf1mIgSxRR2EegrQeEEwVkgQvw9yD2y/nKXN4ZvXlnqYykftTOlKlLzx
         N9gdibgJ0P0ENPwEMXFXvzlfzO0B4txGsZO3W3VGDAa4GhfgydB7O7sFF5tDlcP2H6qG
         1PK52/WzmcRbXASjhYKmbee57kmKre1PWaYfbTQxsU6pvAxxqeoMJrEgQUULaygMqpLv
         TxiduudffYcZjyubFOCwak1VfoxR8c3nBE5FTIifvkGv0tcCTRyf85Eu2HOxW6Sf0u+p
         vyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790216800; x=1790821600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/C/7ahAwICSWXrY2PjocgJWf7/7r+4PLA+PhvN+ilNw=;
        b=qBCXjLtow6LoiJCyuNNZpN3ACdmNXEtoGbCXTy/uzpZELuvuGjwfKET1zuINZoR8Om
         ttXQdU4KqjD2R3/kts9mADF6GLlQPVCxpP02BHUk6WyWAJXh8qkj2dFUAj/+K3lXgVV9
         XHS2OLdWvBXlbuFyZ7W6/EaW7i0cOztp/x83AadZyeMDFQsFL8oOF61LI0smdDOtYojO
         /FK5YTPLyB1G99HMZ31DAfJoToiYVaahvt6vdM6aVjUaF9cJw3v/tyWETW8xBr4pvUst
         SkQv7vh5h8apqHExnbU/HcHNI1W6uhqiIoOHbpaq3K3f+BLEBKlB4d4wg6BX/O31XMs6
         Bt7w==
X-Gm-Message-State: AFuF++lqDNRkWqCBL7ybqllrteo4qKkIa9JU3JRqDx644vdE6MvIlKCK
	Ir+RtjyEwaKNNvDwGzPtxN2tIL01dMNlguSr0+wnjY0fpn5OimtvNwbv6vwE9MDZ
X-Gm-Gg: AYBFou3Vj+eSr14wWJPEBEq2nnzr6RkYv1+KJmU8MOXwHE5T4soqOWhcedJrcam8gXf
	1ER3Sd0KarNYXxlXvcPMukOUh3ScHfpaRciU4ubd3Ab6i+Tgg5fXZJtMwD0nbTvM0p9WJH+DUdz
	fNPITE/lXuSyYQSwA6MNy/y3ufRLnzPtZEvbX9y4TwV5rlIodad0TjIMhU9nDXK42Z/gJ1MBIOm
	G3KYjTVXWFLpopGOEEHH5EwfoUV1OjGuDkw8UASPli4jSvg2dz9HUjjdE17cE/UuYh9NGXZVP4D
	Bz0S3mmeFEZwdU+SvG8d2IUzH4vewVpUHv6L6JctWCF8SnJQ6d3qR2nlNziYBts/uk3vDD8ooK1
	qxKMnVlKXgKn+gYSjbQ1luueugVNqfdzTVh8lrISqDFKxxYFcfQq8HQCJ7CPqjF3mgSI/qBtpc5
	vQIRnpEA3Q1iHe2fQH9ammn4giG/cZlMzQOf51j7z+Y9wA5ctDhO5I3/Zcm6hcVSbLKSqEYkgH/
	hyQn8CgCL6nMxIOs/psDFB607ApAN6L46e/6xCPsgnXQFB/1LH/3ONeIH0YNaSh/fhsKFXpsnYB
	4zB7V/jVDgwdID+jVRIoPP+ZgGCiIuuP
X-Received: by 2002:a05:690c:348a:b0:854:d9d0:46b5 with SMTP id 00721157ae682-8a648ec5220mr7899517b3.19.1790216800514;
        Wed, 23 Sep 2026 19:26:40 -0700 (PDT)
Received: from localhost.localdomain ([67.233.63.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a6520d5f17sm3468477b3.21.2026.09.23.19.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:26:40 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs: upgrade 22.23.2 -> 22.23.3
Date: Wed, 23 Sep 2026 22:26:21 -0400
Message-ID: <20260924022621.1461884-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 02:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130248

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.23.2.bb => nodejs_22.23.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.2.bb => nodejs_22.23.3.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb
index bfa5e296e2..1a8a50434c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.3.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb"
+SRC_URI[sha256sum] = "bd97093e1a1e9243338950c174a693a64d4e0926a9c6ce259962bc58d5e96909"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


