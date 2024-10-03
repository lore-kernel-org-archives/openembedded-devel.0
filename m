Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1297CF34B8
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 15:50:47 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.96.1727970638780892274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 08:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pflx3oz/;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e28ac7b12bso693390b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727970638; x=1728575438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4KwjywYRp5UhjBTIKspB1aVBWDsDVb9mKlEDUABVYc=;
        b=Pflx3oz/IZ32jC7l+VXfxrHK8YmN7wgTU3MwmMcsqx/yitdBQEVqkqC7SjOtZtQm+A
         WA1c12kuXPTm2uIsrtBizd9BgIcqMuCmTiMo2O5MulKWC3baEb98lhPyW+NVBkmYJcUc
         V8mUbCIAU9uGmQzstRbsvDj9M7W7XQ+D6Z9RSrIr1sj1Qt/5hooO3ttn3XkETaAKxKCY
         kqA2WBx/x9saG9U8rNblhZ3T9YtAO+APSx5260rEsoDP1yEJoD+cQ2hl6Yw2SbL2uNfi
         q67Xw1/QESU4v+u21s8lgIrpcsjTjSIJq4kjHoifZ05lRUB+eEUQKLSUc2lohfugcwxl
         G7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970638; x=1728575438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4KwjywYRp5UhjBTIKspB1aVBWDsDVb9mKlEDUABVYc=;
        b=Ot+6wmtMBx/ygcIT12CP4V26okfE+llrDxxJtqlVmBLtg8vAPOCOBllNoi9FB02wmQ
         BQUya2ZAKgWwfpuJst45MdE7RDIYSuVmHC9D2gKmT8XN5WxxyUSSAAnPcqivQdmoBJHb
         L7I1P0dRHHTVOFuvx9xQcmQ7n/5+XBdV5LE5pULW2GDifqMKbyFM8oTM0XVMGECBf+9X
         hpuPxOPaByhKBgoQU0JPJSTk9GXOQPB4/SrP5Cnah8ujFhcZZ6FajwXSsyMdBBYvdEQR
         U+FCSu9BhtrVsJWbLzkOObV4nTjtuU9dvPoB0CntA9zWjwbtm1iL/1Q33XQGl9OOs84h
         Hn6g==
X-Gm-Message-State: AOJu0YyPA++thK2Vvqlu1+d8NH+HuKxAw6NrEy49oX2N28JlPd9mxroj
	sWNQMPAxXxGg7ce5oxUHJw9skuC4D+b0sUV4YPqSf/cvod9yEJPHbBTWeJ33
X-Google-Smtp-Source: AGHT+IGXDw+zlTIDKuzvQOpVgOLay3gFJwtVW8V07w//Jl50h9q4E1Q1A3vEzhyHBwYsf58hW1CsYA==
X-Received: by 2002:a05:6808:3009:b0:3e0:5c45:454c with SMTP id 5614622812f47-3e3b416a707mr6185022b6e.29.1727970637838;
        Thu, 03 Oct 2024 08:50:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1340])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dbcf0a73sm983311a12.10.2024.10.03.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:50:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] webkitgtk3: Always use -g1 for debug flags
Date: Thu,  3 Oct 2024 08:50:34 -0700
Message-ID: <20241003155035.1070562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 15:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112650

Ensures that debugging symbols do not explode modeled on oe-core commit [1]

[1] https://git.openembedded.org/openembedded-core/commit/?id=9badf68d78d995f7d5d4cf27e045f029fc6d4044
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 9493d86422..0dadf570e2 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -93,9 +93,8 @@ EXTRA_OECMAKE = " \
 	-DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
-# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+# pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
+DEBUG_LEVELFLAG = "-g1"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "

