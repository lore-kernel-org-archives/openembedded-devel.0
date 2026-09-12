Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B30C88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:11 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16783.1789257301420693814
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WgOVm4Rt;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so722404a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257301; x=1789862101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+TWoow4ypkW/AJTDKPwfQIs/M/k6Hmm8JD6jQ2kb8o=;
        b=WgOVm4RtCg14FfjgQD3KfYXWaMkI+0HX/RrtXrtI5K6Sk5ntdpwD6aI2z+j8dDtPPP
         52c2KHyKf7Ne/K7r4l+UQvwrSI8Hw/PWJ19Rh/hviG+kOG7QisON/Fv+0HWj1sSb0aQa
         VLZRj3RHHppt1pdzpWR65oPhWbooYlB1zLDcQuYYIoP4ONogkzMI6WpKogsipqf1v9YG
         5wZml7eaLloA8XgDcJmecS7Fn7xJWWNFP//s5nE+bnwkBUvC6kZqOY9sDTAmDjfOcFBF
         IBpXrf3Tr+Y1TwkDKT3e2yt3VY8V7m1sR72QXRghNMBe2jof4XCX/gXLFUdhT34csj/4
         Cazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257301; x=1789862101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+TWoow4ypkW/AJTDKPwfQIs/M/k6Hmm8JD6jQ2kb8o=;
        b=YOo73jlEwk2fxnZXVT5kJtISCbB5n7YjBUh54R0A9ubA/gJ6GGJKDJLCCMIk9zYAgf
         pB44VA3qFyWQNCiR6L+sgNw0aEQpw9GPAOSsqEFOeAd6vC8F1m5ExmLq0BFXU8eHWT0o
         wS+EHnvmTdXAIQzfrsZ1mzPbXF5gA7sESbZYa27VLx4mrXP04wVyK1PeaBLu/Y5wD0zZ
         Aa9KtT5J50oZ4Xo2E0rt+5HbfxZ9nnmViB3zYbxaZgf0cigiMig1P3a/GYPudyU73wZ5
         TZGJDoaPDq5dIzNsWScCiTrg0nPkPV86We0a+crqG3v3EOkJeSqDbFMiqfRMmh+Z38UK
         wq2Q==
X-Gm-Message-State: AFuF++k/6iW1X/jvijpB/He/R3bln14WiOCASvcCZuNrokCuL4sE7/tB
	2FrMv9luSNGxiXjQVJxYX5WKyiIRZl87Sk/Krpy5cLkRw2y7RIk30BFl1zwNIQ==
X-Gm-Gg: AYBFou3QyAgJwidqy2/v1FpmRVZQ5dYnlJkl5SMB98Xn3gfbzuPrBKs/HF1Mj0zHCbf
	ldHzodRL9TvSW+QkhgYwkzbO/bUsd3N/GCWUYqso/pii0KQhjOu1u1Tf6O2mpxjB3w/ydwjZkXo
	t0Mjv53AW6Is3VXbnVufdheSa+K0KeLrPhKU2gqqhgDftNtsRN7U+TPnK9TdhPBrswn1ipVYD8T
	TA2m4plCctmbeZbBJKo0camEUV927AXddnPNLa02KjFxbLDSpZ61jDPHh+hqzLbGC60UCN7rIsx
	SWPqW1IgZ8y9KC4ueSbhaDMSSv5q0I0G6lMV7e/DHprOlPAf3IyoOtBwGD+mg4yWsuX1ukAGcZX
	kEL6CyX2NAmQSQZngMb1G7E82AvmOolhYiYV6RwdHU9nmSsvsCD8Caaf4JhsOxtl35Ed8RGCEa5
	qaElHkR5bhtyU7u2XOFB7XHPaaEOG4C/plmKjTqFwV4u64grumqMhk1PGpf9X49bil94XTQYZSy
	pnqG6sZyZqvAsxoLgH4j2YDjApxUFioOlD7RMddhgC630BjoTSKycmhpM59/wVu2YFbVVo610c0
	nUq6ftgkY0Xzk+pPS5rpTL8DOSy8+I1IcnJWPIiEUDYLA0Lj3Rnf5vKz4R15/Ed+R0IwCpw6p67
	fW6vN4H843D0onqFEUnwE55CAm/iemRdYKd7L++aLnNXXCAOI3exUSGDv
X-Received: by 2002:a05:6a21:140a:b0:3da:bea4:6219 with SMTP id adf61e73a8af0-3daed49deb8mr20307756637.20.1789257300700;
        Sat, 12 Sep 2026 16:55:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:55:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/6] tbb: fix run-ptest with busybox sed
Date: Sat, 12 Sep 2026 16:54:53 -0700
Message-ID: <20260912235456.2358617-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
References: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129988

run-ptest piped ctest output through 'sed -u', which busybox sed does
not support, so the pipeline produced no output and the ptest image
reported "ptests which had no test results: ['tbb']".

Drop sed and classify ctest result lines in awk directly. This also
maps Timeout/Exception/Not Run results to FAIL; previously they were
printed as e.g. "Exception:: <name>" and ignored by the ptest parser.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/tbb/files/run-ptest | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-support/tbb/files/run-ptest
index da46c68550..0d11413201 100755
--- a/meta-oe/recipes-support/tbb/files/run-ptest
+++ b/meta-oe/recipes-support/tbb/files/run-ptest
@@ -1,3 +1,10 @@
 #!/bin/sh
 
-ctest | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
+# ctest result lines look like: "  1/142 Test   #1: test_tick_count .....   Passed    0.01 sec"
+# anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
+ctest | awk '/Test +#[0-9]+:/ {
+    if ($0 ~ /Passed/) res = "PASS"
+    else if ($0 ~ /Skipped|Disabled/) res = "SKIP"
+    else res = "FAIL"
+    print res ": " $4; fflush()
+}'

