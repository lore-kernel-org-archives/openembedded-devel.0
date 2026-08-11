Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BA1C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48360.1786426674134119634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pGOF0VbB;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2287613a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426673; x=1787031473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAgVUasoZMEQ5uJfOvSHCop+kkwdyI2A0uc3MUXa5ZY=;
        b=pGOF0VbBVtZVn63aIMrhILLlKPu3ZgUTSOhywilaEd1bXqkY0ysnGwafvYteaRORBM
         56MdrRka425rjb653K4V4OJ53xRns1ALvD8Mf549P3shhjlY3RbmRlalO1CN7ntZLeCj
         yzWTuY8pw2+DZ2EmRRrGLHF1iJO8i6DtVUcOXcSP5tDgpSXXbhX0GWUgdLhCiFhf+RTN
         BkMnXJ+ZDmgkZx70fkHB1TPBhuOQhJieONJ4kdEHtcONmYoGmyKzV6bY4wmaxY6nWfgu
         DtRFIjKTozm/KEpvtmwcIv9ZGDQmrgMTcjoU4XJAYLzexrEB0tug9B8QlbJcD7DnxFko
         oO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426673; x=1787031473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAgVUasoZMEQ5uJfOvSHCop+kkwdyI2A0uc3MUXa5ZY=;
        b=ZI4Xr5e/g2FPwUTsU5f/r2E2Ck0Y7Yl5W17ysPH7AYIPnb4UNYWNieNCQGgUQB7BC0
         FdvQsXr8VIinN1hA2j1GI2/KQMTfakjljpaB+smODEDbir492cIWxtiD10rJTxI15Vgm
         I18MwG70uomhceiHrJkVAiQ06nqgww21L2rzmUZ3V0hdGOPVL9WU216McyO4SQaFhfha
         iCIDtW4PUZ9sGc7JkLexgR9yRgiiKxj+cDT2/vyguQJFY+khb7XxliByG/qZAjNpZkcW
         3Ox4nDfyBX7Af+aGR7+iK5V8JrmgJ4/PChs2idlBhKAAWm+nbGRoj6jV8zqVI6W3k7AY
         LWNQ==
X-Gm-Message-State: AOJu0Yw+jEPbwp9rL+Ca3pnjbmwfkKQO7msJJHFbB2iVNkT30nC6Sqx4
	Toug24Dt793bi3Dr/PAByiESY/UIPutf5/gkW5drtu2vfGU8xhlDCcZxyxofAcL8
X-Gm-Gg: AR+sD11v/w8i2hjQxPAmsVg7OhHCY4tARl1XdzLXaNbYN+Em6TxiO7M+PXsihwaEWEc
	5Lz+a1wQhupjwlrQDoOHYz32sSgE3d+ftEbBLx8W1eP4x5O906LfbrjaDIep+21OpPrYwunqBg9
	MxWof0NhzRoc4a/zQQDI7g7a8rBi7W0rtvVXXIdPo9A19pgmA9clEca1ayKBA0EQqEjyAp2MpHE
	z4/PmIAMhg32tBMui8BOHwvcEMJYxFxh3YXJdSAaLNyAl2E+Jteq9O7AaUcBB14QVe0BlWsaqF8
	Pv8WDV03k7Je3hsctkVZzFc0RzmNmewgE7M3ynRUKcWiQQyjsa45CFJgLcm19lx7zMmSvnZpTMV
	hCC0ci9KpWtFRP7XWiAKaq+i5jB6yea+5fggiY5xvDq8SiolyO3lPYOD2N4b2RhoZ9LRhT6Evio
	AKSK8UWT4jb50Gj/M4H3/OR/0Qv9fgizraFCnLOxRQFFQy194Bs1fnbtjokZ9oRN2UYXhP/fNJT
	Q==
X-Received: by 2002:a17:90b:4f89:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-392ec72f865mr804860a91.20.1786426673319;
        Mon, 10 Aug 2026 22:37:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/6] hiredis: upgrade 1.4.0 -> 1.4.1
Date: Tue, 11 Aug 2026 17:37:28 +1200
Message-ID: <20260811053728.4125303-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
References: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128914

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update branch in the SRC_URI,

Changelog:
https://github.com/redis/hiredis/releases/tag/v1.4.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hiredis/{hiredis_1.4.0.bb => hiredis_1.4.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.4.0.bb => hiredis_1.4.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb
index 62e5a36318..6d4e7391cd 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.4.1.bb
@@ -5,10 +5,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
 
 SRC_URI = " \
-    git://github.com/redis/hiredis;protocol=https;branch=master;tag=v${PV} \
+    git://github.com/redis/hiredis;protocol=https;branch=release/v1.4.X;tag=v${PV} \
     file://run-ptest \
     "
-SRCREV = "67c88a05bb97c40d5c29d0680e51828627e4f362"
+SRCREV = "616f2286ba5503f74ae96e720623fa11dbc690af"
 
 inherit cmake ptest
 

