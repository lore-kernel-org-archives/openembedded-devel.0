Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04998D3C52A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:46:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14828.1765370797022712667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AfCTHuJq;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so7481620a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370796; x=1765975596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4dXT+4igI8yvTnHvaiMK5YxEcL5zdt2aUHl4vZNr/M=;
        b=AfCTHuJqWdUat5pTz1IC/dSXCTOOHyKTAW6FMuRB9bYngOPAJeLYe8YGjZqlhn0YDN
         qo41T+ShpqAgLp7IZvbe9/n3M68tHkhlwQ5JVof7bAC63mkeqfNGlwU8nG+3R5oFg8Wq
         W2du8xuYxDCixRlDlSMvVrIvdHdhBXPpZX0aQRwl7zNdXfQqcLvSrODeaaTQhyfxXnrM
         rECZoUV2R1gdX/6nGa30mxnKSPECpHJGXOx4wPGy1nFsJI+uhX64pOPaTh+XV55qyHm1
         kCZX4iXTC/ByOaYCmcsqUT6zmVU4rq+a8S25mnuFjgd5FH8rgJ5OiUXxhxwrYyLb9LPB
         QsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370796; x=1765975596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4dXT+4igI8yvTnHvaiMK5YxEcL5zdt2aUHl4vZNr/M=;
        b=JAXKC+RRH72/qxm+ykUH+XSy2WOw7HWmvo3imiQS6froCUZXvOD4tJtTKidS45wiEs
         ijMWLGLVWxvCBHizbBzGMDCOqzb1OBOfOe7cjQi2HgPimaTxRiUH5d50V0jChkkTYvxs
         xH3zumqpJ11AvsdhPU/lcCCdYZpj+WfAhxTcgtQvrh1sN6eUzRcfagLqbgB4TB0+/882
         1iOWQqc25+qQvGPZ1Cf+SKe6rYPjO8ZmggaAZWU7Lr86KFdSI1qaldrGn/nXsNFBHrMM
         zXm4HMci/9WY1UQIPERsYwbi2y34zmzYl3DNkzUNpe5ioJ13Yc5qP/bWQYucjsWSV0sx
         2uCw==
X-Gm-Message-State: AOJu0YyUopGrgFar4Ir02Zx8oc0jk3Xum6QzTJ8LTaO2eMWBoTBnGrXj
	JGP0SKh/gkSvvLzYRMDYrSp4NrH+em94eIAUfAo4v9pOjxEUMqKVDW61owe7nw==
X-Gm-Gg: AY/fxX6xtJv97L1k8An+Ofewoa+f5KoNAQ5yq3Q/Z//9BXoDakJwpxC5u0MK06UNdjF
	GkNyRlfVIkOsMqsagUHraJjhx2KQaLq5CYF4vOyA8FDO6qDhICQlmNh3Nxq+5EzLY6cwKutGleT
	Yi+9KWL6ayQnMlneMuqJwWwW8cu0gekGUqElGB+mv5Je0WtOIdPQA6ow+x3nrNRoieCpOdhgIk8
	EfXQC56XEHNe3xPWnhl+BuNe7yFcg71jbmnU+dAnx2b1YRAUh0ghzhvbSfK0sbefqcu9UtTHVAw
	MMhIoptHs20k9bItiTzRb6zzPGc+01o9J6bQvpSZsjzrD00gjlj2rDUk6H1STqHe6IKKzUIN/vl
	jhdCn4V3g9xrx7BRRRhDg67uJMa9FQbYhUQwgcPln6axkPHcMg6vuhqcJSY7QrwvtSuTo7lEqwC
	lgSYcBCPDcBNQ+TNiodAbcGQ==
X-Google-Smtp-Source: AGHT+IGwO0DbOGqg04r2Ep7YLJE4ZYP9WGB32176rQi6ehJbDHdcMCZ26f3JB+Xo/yKUf2xEG8wEYw==
X-Received: by 2002:a17:90b:1b47:b0:349:7fc6:18 with SMTP id 98e67ed59e1d1-34a7281a5b8mr2142838a91.13.1765370796117;
        Wed, 10 Dec 2025 04:46:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:46:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 08/43] nss: upgrade 3.117 -> 3.118.1
Date: Wed, 10 Dec 2025 18:14:52 +0530
Message-ID: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122512

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 10776ec8a78a6de4fde74086740170f9c8f2c7a2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.117.bb => nss_3.118.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.117.bb => nss_3.118.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.117.bb b/meta-oe/recipes-support/nss/nss_3.118.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.117.bb
rename to meta-oe/recipes-support/nss/nss_3.118.1.bb
index 5e81441219..dad242df2f 100644
--- a/meta-oe/recipes-support/nss/nss_3.117.bb
+++ b/meta-oe/recipes-support/nss/nss_3.118.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996"
+SRC_URI[sha256sum] = "8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"

