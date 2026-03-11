Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52584104951A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:42:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16988.1773222159777584236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUbn+n+y;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b7c2788dso7413259f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773222158; x=1773826958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKNM8vZTQnRPNnNluyRFTTq8ZQ9w/rx73hYnCaZEPzU=;
        b=MUbn+n+ytzAEY6QY4lhiZv+rTxi0Nq2E/JDou04bmpFm3r6B7RmUjTRo0EfdenLV+s
         Ruh6QYCtRu8zvtXuRvQjYcA8xLRRBz0tBjvQCNXWI5ldj6nC/Gh7AwsQVTVbdsNnw4Jx
         lgYgXMJd/Hl00aW5Zau6oimxEoGFtG3/4dV5nKCKUYnvCRRFfgJNAbK/L+IqXVQzs+F3
         yNOeko531AJUAOKPiCbL4A7SUmentr8kt4lfDz1efn5WVidMwsl4G0y/fCdFZThgWHUa
         +DRGm3JVoog1VCMB+1yyWO60t61NLOnKn1O7z/hl53FuCCIxX8xpOuVm61/cTJA3/4OC
         SkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222158; x=1773826958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKNM8vZTQnRPNnNluyRFTTq8ZQ9w/rx73hYnCaZEPzU=;
        b=ZgiDgVxYjYj+5PtKJqetlDwV/J8GR0SoCWD4fksBw15W4Bm4hbGPeU9dGLp3XgcPKA
         lqapApJE2+hnY8EY/7H+7+UNPKETNXAu8tVe9Eoz6XGriPrfhW0yvOeV+09TAN0BLZjy
         nwTmgqkbEnKY+TG4p/0SPn0L/Udfp/OfVb1NDeVJdbxLlZa3qXAtNPrP+vq2VwPy0+Ex
         jUAPRn4fw71cjsZO94NgXbHa8N/Nx4cl0TVaVHbT7y8ehwa08xB+dywZo/JtmtFfSYqI
         f0flz8olH3z5CX1d2t6TGoaLSG4zJZsoMyvna/t8YadML6w61dWHvj5SW/U24+gFOrXP
         33KA==
X-Gm-Message-State: AOJu0YwaCdQPdqzVIix7hK65y0mfz9nynNiKJPflxo8iamCROsnCppWe
	33RI2AW6M+WW8xD4cRDfgkTrK/gWRKSgqspzb9GiEUFTbuETt3p94hirzx75xQ==
X-Gm-Gg: ATEYQzxIHekhoEJlxHq/a33ycZnekmDusv0h2CXTKWT5jZJ9Cxo/DkChCiOMkyvsxH5
	2lyHGpKG+6LmTkmZYg+IzW0835fhzTmpyiOjJZBWuroX9NvgvTM+4YAKVd8Dbod0tR7OW1bAO0k
	N6dJcOwAw0huwxLp9trxv7gRoVGb/Mmse/0FSFxP7KH3eXDFxKbTVs3ieph08+bRXH6kcUY3li+
	hViI1KAgfGvfPxkzz7BfJKV279RkbYngUJ767LSY+1K5bWbKQv+ERlwKBAr9+rFarzwpPMQDcfr
	7O25JQun6kW6cVtf0FcGprvP9RhTTt3xLgTtegbDx+a3t8XZ5VwLs7N0YQjGcXZawRUxC8nesdm
	5bKcp5X9WUDnRnzpbODTwvdccBzOXIaBuQ+pE7sq8DfnuSUg8mBZV8Q2//Zi4giHZZyPpepQnX+
	VaJDtbcl0dXM3DcJUa+sdC
X-Received: by 2002:a05:6000:2211:b0:439:cb01:b1a3 with SMTP id ffacd0b85a97d-439f821bbfdmr3769246f8f.32.1773222157915;
        Wed, 11 Mar 2026 02:42:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f8104515sm5130633f8f.0.2026.03.11.02.42.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:42:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] exiv2: patch CVE-2026-27631
Date: Wed, 11 Mar 2026 10:42:35 +0100
Message-ID: <20260311094235.1616493-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311094235.1616493-1-skandigraun@gmail.com>
References: <20260311094235.1616493-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 09:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125077

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27631

Backport the patches referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-27631-1.patch        | 63 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-27631-2.patch        | 26 ++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
new file mode 100644
index 0000000000..0f85053091
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
@@ -0,0 +1,63 @@
+From 7a93f203cd72a895b26bb633d51b2448a0f629a3 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 21:14:10 +0000
+Subject: [PATCH] Regression test for
+ https://github.com/Exiv2/exiv2/issues/3513
+
+CVE: CVE-2026-27631
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/7adedce8c779e9c7bce843cbaf9eff26bc1659b6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/data/issue_3513_poc.psd                   | Bin 0 -> 206 bytes
+ tests/bugfixes/github/test_issue_3513.py       |  17 +++++++++++++++++
+ .../test_regression_allfiles.py                |   1 +
+ 3 files changed, 18 insertions(+)
+ create mode 100644 test/data/issue_3513_poc.psd
+ create mode 100644 tests/bugfixes/github/test_issue_3513.py
+
+diff --git a/test/data/issue_3513_poc.psd b/test/data/issue_3513_poc.psd
+new file mode 100644
+index 0000000000000000000000000000000000000000..b8cf982ccc29e4574783b1317347a8494bce4240
+GIT binary patch
+literal 206
+zcmcC;3J7LkWXND(VPIfj2I6QSp2oldW&@cF4i-+HzAOnKCIbVQ%?V)xNk#^S{{sU!
+VK$eS7U=ZX2Ii>-KnHh{ttN=+HebfK|
+
+literal 0
+HcmV?d00001
+
+diff --git a/tests/bugfixes/github/test_issue_3513.py b/tests/bugfixes/github/test_issue_3513.py
+new file mode 100644
+index 000000000..5383470e4
+--- /dev/null
++++ b/tests/bugfixes/github/test_issue_3513.py
+@@ -0,0 +1,17 @@
++# -*- coding: utf-8 -*-
++
++import system_tests
++
++
++class test_issue_3513_PsdImage_readResourceBlock(metaclass=system_tests.CaseMeta):
++    url = "https://github.com/Exiv2/exiv2/issues/3513"
++
++    filename = "$data_path/issue_3513_poc.psd"
++    commands = ["$exiv2 -pp $filename"]
++    retval = [1]
++    stderr = [
++        """$exiv2_exception_message $filename:
++$kerCorruptedMetadata
++"""
++    ]
++    stdout = [""]
+diff --git a/tests/regression_tests/test_regression_allfiles.py b/tests/regression_tests/test_regression_allfiles.py
+index 6a230e6fc..31f9c844a 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -126,6 +126,7 @@ def get_valid_files(data_dir):
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
++        "issue_3513_poc.psd",
+         "issue_3511_poc.eps",
+         # large file that creates 11Mb of output so let's exclude it
+         "ReaganLargeTiff.tiff",
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
new file mode 100644
index 0000000000..712b40e22d
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
@@ -0,0 +1,26 @@
+From 1748fd9763e89a341bdf8a451534067abb964ab2 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 27 Feb 2026 10:38:22 +0000
+Subject: [PATCH] Check for integer overflow.
+
+CVE: CVE-2026-27631
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/284b4e20229dd6edf492e712871878ae320801fc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/psdimage.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/psdimage.cpp b/src/psdimage.cpp
+index 1a8e4c61c..b2f5247a2 100644
+--- a/src/psdimage.cpp
++++ b/src/psdimage.cpp
+@@ -287,6 +287,9 @@ void PsdImage::readResourceBlock(uint16_t resourceId, uint32_t resourceSize) {
+       nativePreview.height_ = getLong(buf + 8, bigEndian);
+       const uint32_t format = getLong(buf + 0, bigEndian);
+ 
++      Internal::enforce(nativePreview.size_ <= static_cast<size_t>(std::numeric_limits<long>::max()),
++                        Exiv2::ErrorCode::kerCorruptedMetadata);
++
+       if (nativePreview.size_ > 0 && nativePreview.position_ > 0) {
+         io_->seek(static_cast<long>(nativePreview.size_), BasicIo::cur);
+         if (io_->error() || io_->eof())
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
index 6766ff396d..25f35e203a 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${
            file://CVE-2026-25884-2.patch \
            file://CVE-2026-27596-1.patch \
            file://CVE-2026-27596-2.patch \
+           file://CVE-2026-27631-1.patch \
+           file://CVE-2026-27631-2.patch \
            "
 SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
 

