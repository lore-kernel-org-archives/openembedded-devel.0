Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2184BC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:58:57 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13905.1785621530932497612
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I8GhLmJr;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1563953a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785621530; x=1786226330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0WDkVDVRuqRlqpwIMm0Xl4DBr6nBaGSd6ZMN2vPwI=;
        b=I8GhLmJrY/T6Nhhr9UzBG6ZmsHeCdlA3HzPODqOZXmNGL3D+aBne09eKdI2pfSWEe+
         vIKuhWTwqak2sU1PWEEzbcXVxR5AfKtQBdO2LkFtPdXuBeIvILT+KZGqdj2jVO5oyC9r
         njuKuen1sAmbvEsvhcOXwbf4v1abMAoWPk/hYGiymBmPdRcTXkepsasSqc2yH0gkENGU
         myGz1MFn+A1xzjuceq1SH2V/TYT/n5Yfy0MYljT0/N7197doRKc5qjyTfnl1xRnxWEvd
         tYu3pLEqw6mfCKGHQTn9LMgdQTE6gkOtgOpWONWC+KConihqyiAx88S1mB+NbjPoXlyf
         vzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785621530; x=1786226330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0WDkVDVRuqRlqpwIMm0Xl4DBr6nBaGSd6ZMN2vPwI=;
        b=UJ9055mbgIRD/6y96TS2EAPInLPuMvAbNrLc8/pwLyAX1uBY7G+p3mUPScsKvqVi9L
         1HKUvtEupfca7JbWnSL65Y2Ao/2dFy1Dd08imgFohRmvRAb53ySl/yVbXF8Pd1+2IsPY
         eRTCS3YI+RCCid8PQmP8ycu++rwznsKFHJZfze8fYaW19oOGWfaimzjhNJ+ktbDf1tBG
         Y7RQSdnKhtRq5+Klr7YvY/ipHRYdZ8IsVC94tHg4Rg7VIG7J3uksKX6xJcWDuGT75VNa
         XcmdyS6qY30dsC8macWHnMzsJSuMSIz+8tRmlim7e0ZVYVu2yxqks9+8XyKBaA80L1ZH
         8rRg==
X-Gm-Message-State: AOJu0Yy/PkUCEbPDYquka9io/9i3fBhVJQacW9FYLxbY/b81qqUuFgq5
	EeIWXbQXsDSPor1TKq8QPKqWf7li0cZ6AcP4WIIBIpyV59sqVRijE4us4NqW8cx6
X-Gm-Gg: AR+sD13rOd7ce091Id+9LnmFqu3d7EkllYqFd+6NIRXc7txZiXSXjNqJEZilHHAI4Tf
	vtI0WO4HM8iPBuNvg0APFetgEBFD+X/tJK0PXZyJbDWFvlykkbEl2RUhoRXvMzMsJMeBF62+fdu
	xfL+jbSl2i2+drykderldgo9paztApUHIYp/dRzCtsN/ISXEFxuY1jDvfK/q7qHSV8OlsQYnjOv
	9NymtIY653gyGK0DtxUvwhja6diF7U6KbSwCd7DeQqbSO48TXFP2aR+Uy2Y6p0yOTB0Yd1Q19Sa
	WeU9UqnFXIEysuHK9r4s1iy7nroXqzYy4f5QeRpX4n36YtOq41vAPCT36hIr0WwB0dyc5lEGwty
	D5tGrTiaCpKtcvw7YzmMVt6ZJXYXfXsuTi7rWcAVakUHMEociMXU4gCoJwgMeO3r7cM9RqlPlnW
	BdAEjQvYT9CdH2etaSmczajzqZv0dNyQokPqrBjkW8BAuZTTSLVEJOeH/E7oQ2OKt66kEQJVyj0
	UzviqX1SLvVf32a6XSiyh1rPpb/9JotWFOd+LBgbC4uxataJOmVNIj9GNcsWtY468fgZmplxtJS
	JSkoqlSNHRg06WYL4URevJ7uLcX0YzVPnHgB+2SInqwd860j7Gv5aPFxOcvLyuirnxQaK8LMAFR
	2jojA/idsXYHVqA==
X-Received: by 2002:a05:6300:6698:b0:3c3:b226:f165 with SMTP id adf61e73a8af0-3c92a83769emr4570952637.35.1785621530281;
        Sat, 01 Aug 2026 14:58:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e107sm23559442eec.27.2026.08.01.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:58:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] crash-cross-canadian: Use oe.utils.all_multilib_tune_values in the docs
Date: Sat,  1 Aug 2026 14:58:46 -0700
Message-ID: <20260801215846.987181-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128649

oe-core 6b2defb521 ("utils: Move functions from utils.bbclass to utils.py")
moved all_multilib_tune_values out of utils.bbclass, so the unqualified name
is no longer available to recipes. Update the packagegroup snippet in the
comment block so that copying it still works.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
index 924e3ccfc0..bb9bc321b4 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
@@ -60,7 +60,7 @@ do_compile() {
 # To ship crash into your sdk, you should create/update a packagegroup-cross-canadian.bbappend and
 # add the following
 # CRASH = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-# RDEPENDS:${PN} += "${@all_multilib_tune_values(d, 'CRASH')}"
+# RDEPENDS:${PN} += "${@oe.utils.all_multilib_tune_values(d, 'CRASH')}"
 #
 # You should also add some kernel packages in your sdk, add the followng in your conf/local.conf:
 #

