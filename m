Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1809CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33267.1792043094236738143
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j5AKSk73;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e7006bbf77so10878495ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043094; x=1792647894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=j5AKSk734VELBfLLLcjL30z3EGbpBGDLYlYztQKtk4wlYOzseRvt47HzfJUjAesIGF
         HwkJWyWG76o7Pf5MK95r0xrQQGV8wZsifxOUZTRS4U8FQ5uSooT2yiw547CfOQdpQ/0A
         VkQxQ6mskCp0lh46CDCi+4dIMEga4ae0+4gpmclAgmB5TXaADRKP8fMUp0RSkw9RxtgR
         8aR1845mY4NXtNq0Wfa56SNKycWaPV4KcFSyrQBxyCyP5dh+oPsPvjYFYy2vXtBZAfEh
         iyjj3eCvzxrfzFPTLNym1uEf0jXNggF7aKSSuEXAfepgHbiY+B6Gs2fGR9hGqZmcxLVK
         gTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043094; x=1792647894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=hzsgBBdJ+8txAmjYqUwtpO9LJez9WRxCbNEd1XQ/0y7VW8WCxRnm5okDiq0MOBppVb
         yqDRwEZwy+GfhdXZST+3g93MIG0w61sSkk5gPROfZfArMF5ae5a0QDw+Okoj4JFpMOcd
         ZVHD5lsUm8sK0MlXoiYYpSGmIc7rH184d/QZJkuKRLjRvJSpxl+0624FcTPLmqadqVrQ
         2qNFZqNq490W9X9tbD1hKf1uAzGVwo+gjd/q9/vdrK9rRoMS2UGc4X4FvIbjRJ5SsoOK
         X+ueWguVvF032POEWjyzOjTWMWu2zuoqtSCnqDAa92XWDtH4D0y0Ezm0t+VonkNkJ3gB
         REtw==
X-Gm-Message-State: AFq9FYIA+7KVru4sUVWvqpQRTkNOBc3uSps6pd4r8UDcp3aK3F30tUzO
	woz6Nn+6CgZOMk3R6kAXlxNTnsacda7vZTY5MqIATD6cJFOyPhgfLjs8oPGU4A==
X-Gm-Gg: AYBFou2vYGhy93BqSRHM8qQDb1bMA/L8GzzQ3YaVw42IJcHH+FIWg9Vl0D3asOF3tFH
	nhQkWOSSvvIvVi2xEbW80P4k6Cm8WI8rH0V4vFiNB7zZ0SR9TZ8DzB4t0W4nRQZWrg7R64VY3iB
	VV5/ocLqMvqpda/FjcSsyYcq/SDOhklEPsmbg5P1LOkubK//zDGPXdwXNKqOfxIxmBX7Z7Vom8g
	EddYhbSmB+PikbmgFT4j8Al7deMeNgKWFbMSBdLovO6Yq13Z64AvwzBiPbwHnWtvsqKZ7m0s5Ia
	e6Q0w4jIxK9/i4xUSVPHBLqgLgW0NvwWoN2lkGudEsdK78dftEn+JgOaj9qEdvoHi4OFlEStyw1
	JC9mVc9eCbw9rNfUXujkaw1A2bxpc49rRWvdHFYnrk3Y7EmiIsEZMOB6MrCKOoavnY8pfs2XCx3
	VwRpMd6CMuZDk/TEmIY1ErTfYHm9yzxGO1IIVtt7L1heWJSfpcjsWyvBW9Bdz4qjZINWjFj9kwU
	EwftLK4eUCn+mFrKm31yNI=
X-Received: by 2002:a17:903:2309:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2e842ab82b7mr145273775ad.10.1792043093556;
        Wed, 14 Oct 2026 22:44:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 58/82] smarty: mark CVE-2026-82531 patched
Date: Thu, 15 Oct 2026 18:41:46 +1300
Message-ID: <95be90acc06ac239870bc9075ec9ad2084f1edbf.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130978

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-82531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.8.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index 83f428d388..c700ed5d93 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -35,3 +35,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 RDEPENDS:${PN} = "php"
 
 CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
+CVE_STATUS[CVE-2026-82531] = "fixed-version: fixed in v5.8.5"

