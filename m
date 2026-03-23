Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BDEEC01C7
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:37:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14110.1774262266701238386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lH3RCi12;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b05fd1d147so60155ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262266; x=1774867066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HZ3RzuTrnuwgt9aeTcz46jrfujEpQZTere3XWo1fmI=;
        b=lH3RCi12Ojzorp1v7GPKxndSKNuK4h2/zPCPDJlfhabq8gKxgIozGv9zq24P7cB69F
         vSJPHl8sKMm4jAQThted4wXs17hhWAizz882Yo0rkN3EPpar7pn6H13hBkLiVQjUJeV1
         /cmnTbCxasAqNAdcF8PwZKSKFenYNphNxB1lKix14RaHamx85pPfz09mD5fAgEEgwr/4
         UPW8Xo9R4Y65K5bTUnFLNcujmJ2Scoam/l1eermonjYexGOrwvb57kHM0zr3rvPf+6Q9
         xTlfdHGdbsa/aC2JS4qAFtalSlzmhkkH9tnVZxojFJiNSORUpbUiJv1+nfibqPrrQEAW
         mbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262266; x=1774867066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HZ3RzuTrnuwgt9aeTcz46jrfujEpQZTere3XWo1fmI=;
        b=gGvg2u3F5Q4pYmtxjsL0MBlDqUBonJyKi84CXeMTFqkPLGqOH2dnLF0cwQ3445c8jg
         EDXxrRVpDIx2ZvOlIROAHye0Ug6DMMcIxalzNsKqqh5igRlQI+m2Btkg1svb0k5BtlVx
         uMQRgxFgbVuuK2K6vHgvBBpSTbn20rubOpEp3cZ8oKOco2ZwE867cWEWLVMOAnnaOyF7
         tdvStaiizlIWQyyptm2zHsMCZfOS4Qp+ZWDWdK57aRpRMwzYOhs14Vu8WcBoyYFgacBu
         8D/83OEwjbsSkcuVTbHLv0UfEqiQhhIPlsbbcM6wtlILDmUMuNloEw5jR0oe8fXjA+1P
         3gjw==
X-Gm-Message-State: AOJu0YwbKO2Q253O3F8b3SWXUwMH2eOa5X8AemOqW8Arj0zHVrCoaXGn
	idSHn0MjwmHf+iaxbEvIYQHF4B4UijtkqKBOArtwVCg/Y/iMfqWi1htKrfwaLQ==
X-Gm-Gg: ATEYQzwG1L7RqC65OiuS3hfDf6P90Doh1CQQM7VZCKq4tVKxySlHcP84Y7kATtLUHz7
	dOcdW0jM0Xx4ljPkqH7g7/pZbd1mv5LIgGcstzScGG5X2/sDXZ6BAfV7TqRjXKdkn2DKmB4Ppwr
	FIZrmOB7VJ4BzDQlyTyJ8hRdtzaHrE/Ofw30SdVr2ZEbAvlz9yL4JeCIwEFgo+5RkGiCJC3L3c7
	wNDQbRXhj3SFPYgh8FhN6Vk4ahTP6XpBR7dfTb3kCR0g1XJi1lAQErl91qv5rAPOZ/FnJ8qqn2N
	sBkxEscc7JsXFIWTC3BoIF+KjF2/pipJX1CvKnwEAp36AaecF8kID5NVANiLXgVWto3WPuvjokU
	Dd6jjBe7xbSDvfNBLes9K1TMzos/Mku8QuEehw1tNa46IOSb+XRAKAGTnJBi7Z6Y25L32yP2Byi
	ZAy51ncCaFH08JDTKT8E3bwbcOGPV1slQ2zLI=
X-Received: by 2002:a17:902:fc47:b0:2b0:5b9d:4559 with SMTP id d9443c01a7336-2b0826b90e0mr107545455ad.6.1774262265812;
        Mon, 23 Mar 2026 03:37:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835551c3sm102792665ad.35.2026.03.23.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:37:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9.0
Date: Mon, 23 Mar 2026 23:37:23 +1300
Message-ID: <20260323103724.2341742-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
References: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 10:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125500

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Conatins many CVE fixes:
https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.0-stable

Dropped CVE_STATUS for version 5.8.4 specific CVE conflicts.

Ptests:

START: ptest-runner
2026-03-23T10:28
BEGIN: /usr/lib/wolfssl/ptest
############ Running Wolfssl Ptest ##########
Wolfssl ptest logs are stored in /tmp/wolfss_temp.Y7VEJ2/ptest.log
Test script returned: 0
unit_test: Success for all configured tests.
PASS: Wolfssl
DURATION: 130
END: /usr/lib/wolfssl/ptest
2026-03-23T10:30
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/{wolfssl_5.8.4.bb => wolfssl_5.9.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.8.4.bb => wolfssl_5.9.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
index f16c8c1e68..625ee66609 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "59f4fa568615396fbf381b073b220d1e8d61e4c2"
+SRCREV = "922d04b3568c6428a9fb905ddee3ef5a68db3108"
 
 
 inherit autotools ptest

