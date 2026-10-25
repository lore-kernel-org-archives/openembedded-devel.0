Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30955.1792964616254318289
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g5tPoG1g;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso1666360eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964616; x=1793569416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynWcDO1M7yPhWtMUOQIqIE4EbeDDQ7rBBhJB/wkAkS4=;
        b=g5tPoG1gj6pfJeAP2dwXi9FbMZ0hCYRYZtenpDusiMte5zvn3/o0Qx7G1dwqa3gPrE
         3/3rMDfCGNjKgXYSorR72Bue6qiKBEdVu4EQ0YzARjhXcgVsXSu+9GdAt9wfMYIWuzVS
         Ns3cbvct0XY56/omc1sFC9J83rwLe7ff+SNSK+Q4LPeCBBajBjABs5AOHHmZU7rGzwHF
         U9nBDKaZpVG3vTn9mh6agIAOSojipylrIAlUHd95f3hqhMLsDFp8vNfiIIi5e0mb2bwy
         R7kEydcVoHZaWQcEgC6XToNjZofIwIhuXOubfqItq6ohCAgkHFUuDxGccwA2cHYwEJ8E
         +PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964616; x=1793569416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynWcDO1M7yPhWtMUOQIqIE4EbeDDQ7rBBhJB/wkAkS4=;
        b=HgN6EhS+NaosrhVL4el6HUHDbko0j6p2HAnaoQCuK7sSxQZHtOY6YXbTiydWq6rLCo
         PnxcM8Q0N4p2wzx5/KPz/aQpbkL7DY9DhIbtHyvSsQs/0echisXvXABH6P95c0TH7H32
         VRuWHKcxv0ov1InQ9O/aCiReFdJGwpNl1RNxpnGcb4dhCQY9kLD9NHYcztiw0Hi50su7
         eabxUtQLgfYunMkDXu7jTMik9eT+cHycxYN8Q+cKoDH1SV+tQNFumofFY8B2L9zVAHRT
         6dX2kPWYm4gEORU1Iva8B3KT7E540Lmb4OrlyL8K4gfUx873gcfqYh3f/+v+8UV8KL3S
         BvvQ==
X-Gm-Message-State: AFq9FYIv0rfWDlMiPqQ3sy0bjqefnvqTnVoBNW7NAJ9cRp6lxndTfXCf
	qsywVaoTX0zozFEBt2V0fGyir0g2piwDm1N+Qjhn7NvAvUmsEJJYJCsOJntcyQGYP44=
X-Gm-Gg: AYBFou1MLdQ/R7yH2EgaMM58Z2ZAY8TzvdSAVqHbt5Dfs7Eci9HKPRqv+TYeNuSSnTg
	ZkhZv4evrmuj8nLyjcTJkHB0vMK1EOh2p8859fODc7XGMWwJuKiazVtKxAZjutHZ+vHpOxfM58K
	OAzrcGjC3fr7FBsbbibbmZMVx3B0c6W8/NR9DNvZMOlulVx4gAc0XWF9jsU3kQY8KCvxkeXC8J2
	HbILp2cICeC415iuQ3R7iRXmWVXvQ0RETa/tAyY5ID98NZQnuIEuJk+wrAGPq6dAQL0ttU/tZqZ
	0cTl/XaVOzMmXprGYxQ42gwg99ZWFgva0lSbuqe5+0hs7esLNaeOvYwq8xb4CX0/vyk0TItFVht
	S2puHU8++8cttL56Nlnq6BBXwyiIngogdwO5ZM2S+q2BnEO14QLk2spO0LGFPb7CLSh5pBSLhIK
	7KmL+nOmtKtTItYSUltNDAdnLOSjzj+Syd+QqvlBka3zRb48AIcaR8taucfaw8f/f48Lsn8onAJ
	Afnvi6VnBCLQYuF1sk8OdCkmvoKWJ9oNk7y/1E2U3kwnO+u2yNDWbpoPjGlb6NcvV6ouJqY2KO9
	utJ7bXcOL8O/IPPetIdRoO0iBJFTdAcsKt7O4Y732pJFEKY884ho3q9mkxZiYAvr1S7Gli2mMk1
	og6+DmV0jv9APuqHEvP7hVWK+J6qS4t3n0m9g4Og7J4ti3Gu4fQx5KEmLyWDUufWRyaE2FpEdsb
	iWShV3NKU9heW+0Z1bvf/9XLRoUpWrPtr1+k2ikPxQThp2jaSuXmZqxNLV/cMs2IefGrdfTcano
	jWFQ/ajzqey1mY5JYiJXPSlorfo/rg=
X-Received: by 2002:a05:7301:261c:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-369e84f9955mr8373170eec.11.1792964615508;
        Sun, 25 Oct 2026 14:43:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/6] tbb: Skip test_scheduler_mix in ptest
Date: Sun, 25 Oct 2026 14:43:27 -0700
Message-ID: <20261025214330.653779-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131408
Content-Type: text/plain; charset="utf-8"

The test hangs intermittently on all architectures and is an open
upstream issue, https://github.com/uxlfoundation/oneTBB/issues/1281.
On qemuarm64 musl it hit the ptest-runner timeout.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/tbb/files/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-support/tbb/files/run-ptest
index 0d11413201..ef14dab437 100755
--- a/meta-oe/recipes-support/tbb/files/run-ptest
+++ b/meta-oe/recipes-support/tbb/files/run-ptest
@@ -2,7 +2,9 @@
 
 # ctest result lines look like: "  1/142 Test   #1: test_tick_count .....   Passed    0.01 sec"
 # anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
-ctest | awk '/Test +#[0-9]+:/ {
+# test_scheduler_mix hangs intermittently on every architecture
+# https://github.com/uxlfoundation/oneTBB/issues/1281
+ctest -E '^test_scheduler_mix$' | awk '/Test +#[0-9]+:/ {
     if ($0 ~ /Passed/) res = "PASS"
     else if ($0 ~ /Skipped|Disabled/) res = "SKIP"
     else res = "FAIL"
