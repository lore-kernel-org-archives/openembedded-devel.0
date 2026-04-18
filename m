Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBACF99C88
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 13:52:17 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67176.1776520332931832580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 06:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=To2MmWKb;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c55e3858cso4064375c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776520332; x=1777125132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UFSYnLRt+e6e5rP1Wi6TAPocN27EyI9MCo4QRbOF9A=;
        b=To2MmWKbX9LSGV3eVKHx8ibHijaH+ob5S7KfU5reR9HdLmwzfLkk0r3kZymBtx+kth
         OdyXO2HDkd+rDtPo90xlLMzN9D2RmRep/L/HKoMLGrt97vbfYoY+4PDOFV/KRcTXXWsB
         DaXh9EgDqlitXcqc2aEqzbEoxf+CRJgGruA4kDDFnppTvHzmfpiwLcgsIIKs/Pk3n5st
         lTlOgzruJaYIFaTA8DSEHAiL8XEGxUEurXxcGDe8xzkV69Gt8f97P1PR2DBW4Hwz6gs2
         IMKAI+FotULUV27f+Bic0qPXlay5E5+ntjw++h2ih/Rw1qm99tNgKCtrUVuskzGkEf4b
         /Frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776520332; x=1777125132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UFSYnLRt+e6e5rP1Wi6TAPocN27EyI9MCo4QRbOF9A=;
        b=S7F6gtBq1mgFGxvrkHaIgZfdMHNRCT0+xHrQvSAKIyxGsqi/32A5mLV+qGsZoBeU9n
         IPuyvTSQT+OE9TtNabEQHgEIGd6l21Obqlir3JH5TB95ERREADNRMfWjte3/0RF6+nQJ
         cnM8dwM8K+VNAA/+rsZAXEX4kYyizLUo7u6ev7IRbHYKuSwZXeJpPhy22iQ28TDfiOur
         b5+cltxz+nXpyMS7WKtjHiiiUaawRAYYroyf6JwGqTYIs+KBUYfV7XcKblZE4VBraFPm
         6d2oC5t4m6kVeSnq/oh50QCuw2gHmBOy1d8x0/19Mm8SuL8QvV04jy42ZjhMb7HNXncI
         g/SA==
X-Gm-Message-State: AOJu0Ywr959d9dKvnUzt/uzRWVlR0mPmlu7NxrL9ACvwXY8z3+qZfVJE
	vWlebhz3BEdwp2Ik74sJ6NjM5i+ECVI558FGsDOj2sn89MZ2chHM7wxlMz7BeBmt
X-Gm-Gg: AeBDieue8JsnHqafdYYsaj6BokTzcaE9CROmlWQt0Heznaj9GdmK8mblaqdKU9qowOu
	nWJFYuu4JG1TMV23l5Hz2b1bJPCZbiXRXAnZx53QYqvg4I32nqWu+NJT85w0UcV2mxm7vScUOU5
	/u/8eOqaY5h6bX9BucxZVr7oCjLd9DfpXC9PAarKkzr5wnjlAnH4Ih6qQjC9REJb2Q/4kiP9w0c
	58rPoiyjEYpEkORuSgXropdfksNOrpTHZ8VPOyMZaH51VzoRlIoa6kSgTK/1/6Cqd4hZwBFIrsW
	sFtOB1x7DqrAksT5PruBdAO2vTQehPH0R1sg9tA4v48NoCClQj1QKZmMxDk4wQeDJrYNBKU85yU
	qobl3FRqvzhQBT5YXew22M5N1u05rQvB1vtjyphkPP3WPBW6NzW1mcGg5HSRs169UU/B6lhvU0j
	ZwKywwZZ9Gad3b/9c/k+eT1pRWK1l8YDUqfkfaplNUQZZVMBsYhT71Ik363qPKhEhjjL2IKNI8d
	O+fzHE0niZB4N21kpPZBBFxupldTiAgUjFQ3OzxeobmVVJR5tGkK+PPdebahGgmZbs1Xi3I20bD
	s53GAIUHkcrt073ebLe0HpjFqNiykD9c7Oebf9Jjkd8EcbI69t0=
X-Received: by 2002:a05:7022:6188:b0:12a:6902:ddc6 with SMTP id a92af1059eb24-12c73d2fc3emr3712843c88.0.1776520331948;
        Sat, 18 Apr 2026 06:52:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm6642041c88.15.2026.04.18.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 06:52:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/4] dlt-daemon: fix sign-conversion warning in dlt_timer_conn_types array type
Date: Sat, 18 Apr 2026 06:52:06 -0700
Message-ID: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 13:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126452

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../dlt-daemon/char_conversion.patch          | 27 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_3.0.0.bb            |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/char_conversion.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/char_conversion.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/char_conversion.patch
new file mode 100644
index 0000000000..8d943b9764
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/char_conversion.patch
@@ -0,0 +1,27 @@
+daemon: fix sign-conversion warning in dlt_timer_conn_types array type
+
+Change dlt_timer_conn_types from char[] to DltConnectionType[] to match
+the actual type of values stored in the array.
+
+This was silently working on arm64 because char is unsigned by default on
+that architecture, making it compatible with DltConnectionType (an unsigned
+enum). On x86_64, char is signed by default, causing an implicit signed-to-
+unsigned conversion when passing array elements to dlt_connection_create(),
+which triggered -Wsign-conversion and broke the build.
+
+The fix corrects the array's declared type to match its contents, making the
+code portable regardless of the platform's char signedness.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -140,7 +140,7 @@ int g_signo = 0;
+ /* used for value from conf file */
+ static int value_length = 1024;
+
+-static char dlt_timer_conn_types[DLT_TIMER_UNKNOWN + 1] = {
++static DltConnectionType dlt_timer_conn_types[DLT_TIMER_UNKNOWN + 1] = {
+     [DLT_TIMER_PACKET] = DLT_CONNECTION_ONE_S_TIMER,
+     [DLT_TIMER_ECU] = DLT_CONNECTION_SIXTY_S_TIMER,
+ #ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index cbeb8c3703..6de62c2a3d 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch \
            file://0001-warnings-Fix-clang-generated-warnings.patch \
            file://0001-dlt-daemon.c-fix-wrong-len.patch \
+           file://char_conversion.patch \
            "
 SRCREV = "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"


