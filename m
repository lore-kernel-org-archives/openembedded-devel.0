Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC70AC88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16610.1789257300398712858
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XJQvl9j/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2323396a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257300; x=1789862100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtevAu7rGztn7/FmxYo7Z3lUaYljxHIKicbvPEJmHGM=;
        b=XJQvl9j/qa9HWD2rH26Ows3TnulVpD9AF7TFRjw94iaEcVwEt8XSag+lrr+oKUBbX5
         8TCDItwRaNz2O5A0QNKOOEudetbjmRy7N2phY27MJogN54wtHrc9TsmcBXflGQmLg10d
         krH3utAy9DBaDvYoJMaKltix1yr4sc43EKfvjtkMzsG//v0yUcilUB/rWp6p/p+M4dnq
         sXmKZcgVwPZ4h0jC/VtC2QtsOUfPtn2XuWcrAkB6SC033//JeqC1uHyAHKYQnhdmWsPi
         5LuR725SBG2LJ2R5LvRJcXSBmL6/jAVU0w1CLTvwwhzwzP6iBykLBjeWhoiwD+v4f9+A
         dSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257300; x=1789862100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtevAu7rGztn7/FmxYo7Z3lUaYljxHIKicbvPEJmHGM=;
        b=a4ntn/vG8dIjgnMoxB/0joq5VzFGeRdAJKlF/4S9Y+DEjrPxf64/b5aWqK9D/mNsKR
         +PfYUksYXu3mMTlXhjCCN7QzviFjgrNyXxSCcERPQJXjp6MabDjcKIJYdSV+qxFR8q94
         JFp2feNZU6gez/5jBLlsRlXjXhqOmIQ2QcB4fCPpQm6/8XPzpHMMJc0hSZKdCIP4y6nm
         djnMdU9EiQ11tcrk5zV/t5Aljdxwh5gG/zSkQOeP8QeHKjVdUMb9BbazqB+Tfe8XTW5X
         3oCaudSjiDm1dD1AVnzJCuJpoYmFgV+gUL9RjFQe4Q9gt/M2fbWNLxIYBQgvRfrQ74jR
         Nbbw==
X-Gm-Message-State: AFuF++nbNuhwMADV1VooDmw7jWDPpevg09YF0wXe9s+2eV+a+krxSIfx
	7HMcAGM4cRh89bVCNGWzlM6jnlLoL9u0daIMANMscA12VBnGsJJKA2B+EZfLBQ==
X-Gm-Gg: AYBFou1pts7bakM4adkEbB/SJ2nPyPmaNafSk7GwGxXdofer7wmRn+a6qpNlZnaCDCB
	eCEYqvOCfsNCRpaBwwST+sjAeYxk6hAZlilQhHhKwfw0wQSel4FojhO5ICLcSFucU1CM6AmfZ74
	g2JO7QNYaYnmIJVm6+b1nVT0St7GSq0MO2X6Uj88mBvpmWAKp1i556ZThZfhj4QY61cIjJfEh1E
	tVh3yTTcZveXypYWa/QdsxHsGEToeKbxRnb8Vg8di0+KUe2RB/YrSzis5BlDKdQmA56MowB0FF6
	1m7GYyIqj9i1OmSloNmg2+HewY89ZCCWDcCWg84ShJE/j2A+IEEX8mFnyKU1MACPkwsMGbxkmcp
	Kwsp1knfAh/w4I1wyFuLotj+d1dUezwjocPd464niT30Ksj0W4hoIZHLtBQJspi4fz1vhiatC+P
	G91sNzjTYkTy/6ubNTqk1yuegz7co6N1ovK683GiuHVu1bs7VlFjYYqpXSpdKPPxe5jBmYd1xWy
	Qu1YNmZjvOzWd6kPTgEiX8N+fv3qR1teEJI+W2BSdUZIKr+HdUaaRl5CBk1ywau39bkWZfeXRs7
	6kcqHpudObKGmpOAIoaAR1BMJUv5hNYfylkaQ62QzDq+EunV5Aj29Qo3HqxsKpxDXFFj9p4LhY/
	g3Rx/VOrPLNRGy3BcZW+EgqOaxjqL0upuwKGxdh9YjEHRIg8g+prcPuPR
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr20021694a91.16.1789257299828;
        Sat, 12 Sep 2026 16:54:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:54:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/6] jsoncpp: fix run-ptest with busybox sed
Date: Sat, 12 Sep 2026 16:54:52 -0700
Message-ID: <20260912235456.2358617-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
References: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129987

run-ptest piped ctest output through 'sed -u', which busybox sed does
not support, so the pipeline produced no output and the ptest image
reported "ptests which had no test results: ['jsoncpp']".

Drop sed and classify ctest result lines in awk directly. This also
maps Timeout/Exception/Not Run results to FAIL; previously they were
printed as e.g. "Exception:: <name>" and ignored by the ptest parser.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/jsoncpp/files/run-ptest | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jsoncpp/files/run-ptest b/meta-oe/recipes-devtools/jsoncpp/files/run-ptest
index 2cb892b187..03a97595f9 100644
--- a/meta-oe/recipes-devtools/jsoncpp/files/run-ptest
+++ b/meta-oe/recipes-devtools/jsoncpp/files/run-ptest
@@ -1,4 +1,11 @@
 #!/bin/sh
 
 cd src
-ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
+# ctest result lines look like: "1/3 Test #1: jsoncpp_test .....   Passed    0.01 sec"
+# anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
+ctest --force-new-ctest-process | awk '/Test +#[0-9]+:/ {
+    if ($0 ~ /Passed/) res = "PASS"
+    else if ($0 ~ /Skipped|Disabled/) res = "SKIP"
+    else res = "FAIL"
+    print res ": " $4; fflush()
+}'

