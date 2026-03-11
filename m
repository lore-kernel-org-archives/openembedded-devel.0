Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E7D104BEBB
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:04:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17621.1773223436745028987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VXjPBdwK;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bcec8613so7782187f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773223435; x=1773828235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7o7BU/XbzXxGFzYu098EVJhlUcW7G9zZKFL3fiJOkzw=;
        b=VXjPBdwKvJ7kfoIXMwlpMPvPDvzH+izNNpW4VRmATbQEmn/KgtIUOibi0M1M8p5s2b
         4aAesR9LmLWbCM7seiJs6ym5d/RJ1FfOB7/dHBDFedympg3Enx9+Dgf5FJsih2hIUhLB
         vbhiphs4Whyz8oUTcio+EYCh++LcCB/n3MKsT3doF+Z23HNdHZDPBzFhfs7ndVvUz6an
         qrK18dOhSKifgdmmBAAjJEuV9fJUOK80822kMFMsZwD8XOoPp18WeS2MLHmuw29uAGjj
         rhyWqK+Svg6RskgSMmT+NwNwRyFMVZ9RFiekrkBfxfeKI76Geb/+5xBpcXnE1GxwMlGQ
         Kyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223435; x=1773828235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7o7BU/XbzXxGFzYu098EVJhlUcW7G9zZKFL3fiJOkzw=;
        b=NSeGofBnVagwGbZ//ETgrj7QbI6pnCYIPEq9npcb4+0SGpYxDLH8RATM4BLloEK1yL
         C19jpTySdhTTTZ4f2i0soggTtsu6FOP4Mm2EqhbT8rToX40ZLzp8KawIwatkJfhvbjNs
         rnOYdrPD0BnN59GJvJw5fP5UIh5w5gvgSFr4RbFqDieaZhV51ACECWQFvDlIE5PCXI94
         1SRPahivxagssveaLIiSOlXEsuI806UVJnwtb4yXY9osMers8sbZBxyasM8rycTuRUGM
         MDygDlb9bQP05ghw92Bn/pH6qCzzTuwirMe3YBC7fq3R4rzADUzYTGxrQHwnaygJFwQ8
         vphg==
X-Gm-Message-State: AOJu0Yz0UqJJn7Pbun2UOOe9NhfNuwPCbE716cUULfbNbKmUH+Zs48qq
	p0U9qDGuFMJdI9Z3c4aq6w2VtxuNiMjTP4Idckl2azOWlRc/JePi7UiPvigteQ==
X-Gm-Gg: ATEYQzz/9hsxHUyptyuFrldXReAQmglLwSxwAsEvieaJMut7kr01I8qOStzenhoO2Qa
	X6Kug7pV3cVVdMazY8cbZZErnIdvp6iEDOWkRf3lOwRbtBmYpwbYl4cqM2vhc2RV8dtzWYlaiOS
	MdJO0eXP8OJ2lzfWaToiJFetv54tnfaGemwA2XoFBScoIepkcmCT9sOphBH0rteEpyoh3X1KmdL
	+/zWCga93U/fH7jTwOASkiVFZgpsig/BXy9rVJJvhCgFQBXgWQExYrzcNUjT5nuQ1uAHMBdxZCQ
	U7+52Y8VJlZympACqpIM+14ioV516VjzmsfQNd13v+J+YcOejbzkJHlx2rjWLQJMYkWBylK6u0Y
	KYoCV8VO5Eya5QTnN7bjrTk+4YTxLVlgvPaVyMIUUBs5VqXw5c2ITPOqSKiVBmIKYB/OaPAyhEq
	PNQ/k7pIjGdkHDrAgkisLM
X-Received: by 2002:a05:6000:2681:b0:439:b79d:b9ac with SMTP id ffacd0b85a97d-439f8223276mr3731174f8f.45.1773223434758;
        Wed, 11 Mar 2026 03:03:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f82067a2sm4575816f8f.28.2026.03.11.03.03.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:03:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/3] exiv2: patch CVE-2026-27596
Date: Wed, 11 Mar 2026 11:03:51 +0100
Message-ID: <20260311100352.1638062-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311100352.1638062-1-skandigraun@gmail.com>
References: <20260311100352.1638062-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 10:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125079

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27596

Backport the commits referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-27596-1.patch        | 71 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-27596-2.patch        | 24 +++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
new file mode 100644
index 0000000000..c2baf1a54b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
@@ -0,0 +1,71 @@
+From eb658ca4af5c81e790b5c85810ef19481655157f Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 20:44:18 +0000
+Subject: [PATCH] Regression test for
+ https://github.com/Exiv2/exiv2/issues/3511
+
+CVE: CVE-2026-27596
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/fe0d0154ab2886feb503e6cfd38c3b6d5722921f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/data/issue_3511_poc.eps                    | 13 +++++++++++++
+ tests/bugfixes/github/test_issue_3511.py        | 17 +++++++++++++++++
+ .../test_regression_allfiles.py                 |  1 +
+ 3 files changed, 31 insertions(+)
+ create mode 100644 test/data/issue_3511_poc.eps
+ create mode 100644 tests/bugfixes/github/test_issue_3511.py
+
+diff --git a/test/data/issue_3511_poc.eps b/test/data/issue_3511_poc.eps
+new file mode 100644
+index 000000000..4d403cc51
+--- /dev/null
++++ b/test/data/issue_3511_poc.eps
+@@ -0,0 +1,13 @@
++%!PS-Adobe-3.0 EPSF-3.0
++%%BoundingBox: 0 0 100 100
++%%EndComments
++%%BeginProlog
++%%EndProlog
++%%Page: 1 1
++%%BeginPageSetup
++%%EndPageSetup
++%BeginPhotoshop: 16
++3842494D040C00000000000441424344
++%EndPhotoshop
++%%PageTrailer
++%%EOF
+diff --git a/tests/bugfixes/github/test_issue_3511.py b/tests/bugfixes/github/test_issue_3511.py
+new file mode 100644
+index 000000000..1825550a1
+--- /dev/null
++++ b/tests/bugfixes/github/test_issue_3511.py
+@@ -0,0 +1,17 @@
++# -*- coding: utf-8 -*-
++
++import system_tests
++
++
++class test_issue_3511_sigma_LoaderNative_getData(metaclass=system_tests.CaseMeta):
++    url = "https://github.com/Exiv2/exiv2/issues/3511"
++
++    filename = "$data_path/issue_3511_poc.eps"
++    commands = ["$exiv2 -pp $filename"]
++    retval = [1]
++    stderr = [
++        """$exiv2_exception_message $filename:
++$kerCorruptedMetadata
++"""
++    ]
++    stdout = [""]
+diff --git a/tests/regression_tests/test_regression_allfiles.py b/tests/regression_tests/test_regression_allfiles.py
+index 09a218e18..34bea3b03 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -124,6 +124,7 @@ def get_valid_files(data_dir):
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
++        "issue_3511_poc.eps",
+         # large file that creates 11Mb of output so let's exclude it
+         "ReaganLargeTiff.tiff",
+         # files that don't create any output
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
new file mode 100644
index 0000000000..b3a5a7cf2f
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
@@ -0,0 +1,24 @@
+From b05f12b6c94e946648a681c39c4581b2fe81afc3 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 20:44:54 +0000
+Subject: [PATCH] Check for integer overflow.
+
+CVE: CVE-2026-27596
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/2cb728a850b4aa048a683711906d716c5f9a32ac]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/preview.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/preview.cpp b/src/preview.cpp
+index 993c3b749..90f60146f 100644
+--- a/src/preview.cpp
++++ b/src/preview.cpp
+@@ -422,6 +422,7 @@ DataBuf LoaderNative::getData() const {
+ #endif
+       return {};
+     }
++    Internal::enforce(sizeData >= 28, ErrorCode::kerCorruptedMetadata);
+     return {record + sizeHdr + 28, sizeData - 28};
+   }
+   throw Error(ErrorCode::kerErrorMessage, "Invalid native preview filter: " + nativePreview_.filter_);
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index cea5455354..9ec2f48a77 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch \
            file://CVE-2026-25884-1.patch \
            file://CVE-2026-25884-2.patch \
+           file://CVE-2026-27596-1.patch \
+           file://CVE-2026-27596-2.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

