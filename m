Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668E9E748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 08:49:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.56257.1696150160522790949
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 01:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bqvtagER;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c61bde0b4bso97716695ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696150160; x=1696754960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcmnfiMuuLN3WrK5Pob/kBGpdPP/c6FcM/zCtmbMJVI=;
        b=bqvtagERIFIPxbF2MDJleXIcXmvgOiPgSq0kOKBj79uetZH6HWkIsbEIrGBxTnm7Ez
         099xTEhQ1I2nSjchNxpLpnSAL6v1/tt5AitahTiG7ydncprdYjN2wsNuju+vM3CZZWLt
         V2YgxWUQE4yaEkwl81atOIc6x7SLlX5PQtZB0lwlSJE+nbRiOLgsZKajSDF4dxft3dVx
         deylwAoCW+XDZ6MwQIaOVhQB7a1R118H394iuu6o3SJzk3uwGC0x+MWYJMDfI+/1nojL
         FJag/snoxNGSaSFHEaifloopWYjb+A+b/6C3T0ysCsS7iTLzv15NUGqtLasesKzAcLOz
         5+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696150160; x=1696754960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcmnfiMuuLN3WrK5Pob/kBGpdPP/c6FcM/zCtmbMJVI=;
        b=m/mWtKH8oDTXsi2nyktweBYHIp7KiDW5gKpHmHbTuuK/9SM10Gg68Tt8olWP4oeEfC
         vSGGPwuNPGBLu7Lr3PqOV8dO4S0Tlee8W5iCwb3ruwZKVFBIb0YxT3Yz0e1aPixatthJ
         e20wWz6fXtWqrApK0iAVBqND5p1Sr9Nrt9y+R3BlOZ89F0i8l5T5i7uxa0BrNhF+5PJo
         W2RhPClL+9oolaKNK6CH8C+cKf5mpLuTcr+XSPtoq19LcEFMlOYasGfId5qg4BtXUI3Y
         sw++//5LHLTBPLODSu98XNznLa4ou3B4cxxgCS2CA/pCoBNtRl8YwEagZ1g5KLUMkfHc
         vvTw==
X-Gm-Message-State: AOJu0Yy5RT3Pw6R6l8JO/Foc/zHXZSd+6PJ0fON/Yv3psDCEF8ceefrF
	+z86SirzIjnQRqEO4xMCoTHTgJflongbyw==
X-Google-Smtp-Source: AGHT+IFKgjAHRUYUs0uoWHj+Gy+qo237xrh3pPAXqtTHP3a063dZTDTtlQ8OSuD47XeCWmnlVI53bg==
X-Received: by 2002:a17:903:1ca:b0:1c3:e5bf:a9f8 with SMTP id e10-20020a17090301ca00b001c3e5bfa9f8mr11582744plh.19.1696150159691;
        Sun, 01 Oct 2023 01:49:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b001b8943b37a5sm8779199plq.24.2023.10.01.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 01:49:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] nodejs: Fix ptest result reporting
Date: Sun,  1 Oct 2023 01:49:14 -0700
Message-ID: <20231001084914.3056272-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231001084914.3056272-1-raj.khem@gmail.com>
References: <20231001084914.3056272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105293

This fixes
  AssertionError:-
  ptests which had no test results:
  ['nodejs']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs/run-ptest | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest b/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
index 07a8f2a99c..531dbd86d1 100755
--- a/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
@@ -1,3 +1,8 @@
 #!/bin/sh
 
 ./cctest
+if [ $? = 0 ]; then
+  echo "Result: PASSED"
+else
+  echo "Result: FAILED"
+fi
-- 
2.42.0


