Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F7FCCD1A2
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:39 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11747.1760694797843632508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmZ6+Z8k;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57e36125e8aso1698955e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760694795; x=1761299595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=MmZ6+Z8k1MVQ7akk4f/of40z9KLBTBpBsw2ayxZGXQsyrNOko2QzS+pNNS38sdjMcU
         B2rXV5YepY2bRjtqwtd0HDqgtoVEj9c37myeypPQsemCvW57Is4D/v6NKs6K6lZ3YBGp
         V5aNl5iMAADBNyCJFQgXlf/aXsCC9UZbQHCwDl4oEMX54cncCGYPeorpE+CXSiX998Kj
         6H/1Nfe+97XoHVoKp8DBaFn9klhzSJi7Qkiqhoz/dwTPvERqgEtdQuC4ogw15+EZTmLW
         pVpIMr5nWUxlhhiY2fEhJmdngZvn4E2KVK7UAc0zADNWC2KeGoLzf7jHTpLdYxuVeKQj
         1wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760694795; x=1761299595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=Pf6WdPREHx6TsAAs6A+jdVXEgFOdcKFZD0CxVy5hZ+lcMYJ63Ps7HNferhziu8kFn6
         qf4YHKJn9qithnzKH4BbqYDiTah28A+V4LIjEEY94gaFlmjgav/oLPuCcy3nj6ssW4Bv
         4fhZ3qGnQU5otF9sNWVKERbFstdvBPP0ZfXU2Ba8zlpy+2ygCSU3gXIPPJdTfZSw0CnD
         GzQSjBCQBzijP2HptirNVkC82FwqIsk/mn4jdZOAfhyh39PGBBXAcBglgbKrhx4cFWtm
         9iqCTjjbm/L3lxkd2+NlSk0JJ99z+84fo4kyUCYzp/ZoK1iP+P04nPT+KIfnGyL/C7ct
         /N7w==
X-Gm-Message-State: AOJu0YwYTlVExDcxXijP4iEIx+P8byBnMc9jUsWjyjlQj8tDIa3vdsVS
	jVZ2nXgufvTnQensMNfGo1DeC72/VMDvAIh9xD0Uyr3uvmprW2UPuqDt5kuoxbUZ
X-Gm-Gg: ASbGncsR+jqX5C5QxRStYbHavuDa8ntBEMqnU28p82nJKQHvfJmF95COJc8EC+iOE3e
	lTV86SXizvlJYP/XLh3VXQhlwZpuqOAQenHUY5ICUz8+CG3KiT3WNxSvpg6p7AKVBqW7hhePRIN
	gp4zqMbiHbxKV0vpR/iHfvCOx96U+h6KY145hmXt+84bHKc34CAB0KRbWkVRKERTIdvqy592Vto
	3XhNgCBfvHbLkccRWeJgSFM24qU1ZguK6Ia6M1YuaetOGXh9QvGYUXSsfZr2SNNSGYt8sVZQg7k
	8bB8AdrupDf0KYtxyhVo9897GYnjkAMxmp7ZuBkmnpAT38U8f1OifpxjMLn2BJD/UBemK5fRD9i
	dk0cm3WMMPKqnz1fMn2pHDrlDbR7wWlimYYTLwXO5YdBjzuT/FU4MGa83zUOn+gHOjrjzG14MC2
	ygyk2S6XbyH8hkbEbfPFR3YGDHrjfSJLk=
X-Google-Smtp-Source: AGHT+IHbDGSUqSo0Zy1POt6jU8OTQlfOA2Oen9Tm/yjPCG66qQYR8mwVQOksMHyphj1ae0G0oyqj9g==
X-Received: by 2002:a05:600c:4fc6:b0:471:115e:624b with SMTP id 5b1f17b1804b1-471178aaa72mr19672805e9.17.1760694414236;
        Fri, 17 Oct 2025 02:46:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711442dbaesm75368995e9.8.2025.10.17.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:46:53 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 1/2] linux-serial-test: add patch to fix returned error code
Date: Fri, 17 Oct 2025 11:46:32 +0200
Message-ID: <20251017094636.2976738-2-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017094636.2976738-1-ghidoliemanuele@gmail.com>
References: <20251017094636.2976738-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120752

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

After commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility"),
the behavior of linux-serial-test changed: it now returns 125 instead of 0
when the number of read characters differs from the written ones.

This patch fixes that regression.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 .../linux-serial-test_git.bb                  |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
new file mode 100644
index 000000000000..91fdcf07ad63
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
@@ -0,0 +1,62 @@
+From 1add8f3d228368665c3abd452640b91a86f41976 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Mon, 4 Aug 2025 14:57:22 +0200
+Subject: [PATCH 1/2] linux-serial-test.c: fix returned error code
+
+_cl_no_rx/_cl_no_rx are true in two cases, first when the relevant
+command line paramter is set and second when a rx or tx time is set
+and that time expired.
+
+This fixes the second case in a loopback test. With the change the
+application now correctly returns 125 if the number of written and
+read chars differ.
+
+E.g. `./linux-serial-test -o2 -i3 -b 115200 -p /dev/ttyS1 ; echo $?`
+returns now 0 with a loopback and 125 without, before it returned 0
+with or without a loopback.
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
+Fixes: 4e57f58c58ae ("compute error count valid when no_tx or no_rx")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+---
+ linux-serial-test.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/linux-serial-test.c b/linux-serial-test.c
+index d8f66c16c72f..c2c8882d601b 100644
+--- a/linux-serial-test.c
++++ b/linux-serial-test.c
+@@ -55,6 +55,8 @@ int _cl_loopback = 0;
+ int _cl_dump_err = 0;
+ int _cl_no_rx = 0;
+ int _cl_no_tx = 0;
++int _cl_no_rx_param = 0;
++int _cl_no_tx_param = 0;
+ int _cl_rx_delay = 0;
+ int _cl_tx_delay = 0;
+ int _cl_tx_bytes = 0;
+@@ -442,9 +444,11 @@ static void process_options(int argc, char * argv[])
+ 			break;
+ 		case 'r':
+ 			_cl_no_rx = 1;
++			_cl_no_rx_param = 1;
+ 			break;
+ 		case 't':
+ 			_cl_no_tx = 1;
++			_cl_no_tx_param = 1;
+ 			break;
+ 		case 'l': {
+ 			char *endptr;
+@@ -745,7 +749,7 @@ static int diff_s(const struct timespec *t1, const struct timespec *t2)
+ static int compute_error_count(void)
+ {
+ 	long long int result;
+-	if (_cl_no_rx == 1 || _cl_no_tx == 1)
++	if (_cl_no_rx_param == 1 || _cl_no_tx_param == 1)
+ 		result = _error_count;
+ 	else
+ 		result = llabs(_write_count - _read_count) + _error_count;
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 888b13e2f6fa..66511bd9c312 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
+           file://0001-linux-serial-test.c-fix-returned-error-code.patch \
+"
 PV = "0+git"
 SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
 
-- 
2.43.0


