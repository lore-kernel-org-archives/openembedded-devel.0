Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9F9104951E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:42:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17296.1773222159083922717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJV2zvSO;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3666068f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773222157; x=1773826957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiyaIewU1Nr5AJLF2voZiPUhnYQJInWwIWJuqO7vsZg=;
        b=eJV2zvSOPucAkT++D0IfC/4kQuhHG7GxHmJvujz3bTAagZmOdwGhvJKwAbHQH4zklS
         Ybaz9jpuAYxt3lwBhnIMUl10o60LWwksO/2Gzjhemo/++XY15nKUauLtwYP7dNcKaPpl
         MUrPW1JEqzLXCqpdfrWqLco89fZTftm825thIMZX1zt9XpcQtvjfH/V8l01ez4ECBV1D
         TVazm48FUN68J7qBJAjNtQ15CZ8wH+ybbR7I8Zl85C2r3xFZ9QEhrsO3vLpWVr1VaaQy
         GrYqHLIq3jxEvytfAAzRoT4J+YhMJDRYrV2MwLyXW7AqKdlirR+nocFZoO3qIxrWsM/6
         zSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222157; x=1773826957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qiyaIewU1Nr5AJLF2voZiPUhnYQJInWwIWJuqO7vsZg=;
        b=ORcS+r77/aMtRdrUeNZkbAibhpLu2E16jogfYKqCBgOhj8nqz4VwPKkV5dNpyeI7AO
         nK1aXilgDwkRIFjQBrOh49CP0DTSEn1The48V3iKzgf0Lvvd6K35+Ufnh5E4ub+C6ZZU
         KpSPx1PFCYgFuc7AU8hw7Uk9HAdLUnknnj1GjXMc0Q+ru67Fjg1MsnZgTlpShSzQhHE7
         yjc1BsxQ5CqO1EUj4i0IHnyM96PRFwGtaV9J1pGYIL0LdIPzvSPmwAI/vmSBf94koYGo
         kZI1f2iAtcyuS6mguGasQP1Gne4zFW+iTdT7L1UeigOR5k+Zau7U9oLUedge3xt2EDaO
         7wgg==
X-Gm-Message-State: AOJu0YwfWPP2H2CNDtIc1OclE0s498ISp/5Jd5VwpHX1WF6akGUq8m5V
	Q/3CLaAZj0Tsp5Jbj3/gfVmOLHoOccqwFzHs2i+IzJX2f3ZWbJMwM3BL6QNzdg==
X-Gm-Gg: ATEYQzyIf+Y0tVK2In1/DAH63WL34rXPiJ0jsA4Z0tMXOOI+2TiqNyC5nePrMooTWii
	0SrR4G48Ows1F5s1EjEo2MZuupSi4UpnirkmIQ453U5QdQQt4rqXFDZFugfgbuLZH1F75aqnE1u
	OsLp3KGdu4SMfBDQ3riRaqpQ6Pw717jeAGWKQI6+yQRiMO2MN8evEiJhPuhu4Y1qqifkLqIe9TG
	5q67aH9ZGJ+753BqADhvA9H9t/qjPRTgZQCNcPHt2EJwVg1K0CRa8bBfnHI/sAlVo/f3eCi7KUf
	9w8KsWMlBEpA/XM+O0np222TR9FYzatpb+jkAtdu+7OcaoHCGD1M9D3aylW2+JhsLCBcy7Nci+i
	a3okESA0jk5dCkRME9dJj5IFJ3C9BQdY2XnfWo59vvGXOAAfX7kKyCFBJcsTBquNd11dS0FgEj5
	eb6FGR5rETiSxCHGi0xtXGZFNV1wtMn0c=
X-Received: by 2002:a05:6000:2883:b0:439:c661:3232 with SMTP id ffacd0b85a97d-439f8200e1fmr3566019f8f.20.1773222157222;
        Wed, 11 Mar 2026 02:42:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f8104515sm5130633f8f.0.2026.03.11.02.42.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:42:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/3] exiv2: patch CVE-2026-27596
Date: Wed, 11 Mar 2026 10:42:34 +0100
Message-ID: <20260311094235.1616493-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311094235.1616493-1-skandigraun@gmail.com>
References: <20260311094235.1616493-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 09:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125076

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27596

Backport the commits referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-27596-1.patch        | 71 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-27596-2.patch        | 24 +++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
new file mode 100644
index 0000000000..9f99937a71
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
@@ -0,0 +1,71 @@
+From f42720d294852c3372fb34c328859e7442128b04 Mon Sep 17 00:00:00 2001
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
+index 87caa9798..6a230e6fc 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -126,6 +126,7 @@ def get_valid_files(data_dir):
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
++        "issue_3511_poc.eps",
+         # large file that creates 11Mb of output so let's exclude it
+         "ReaganLargeTiff.tiff",
+         # files that don't create any output
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
new file mode 100644
index 0000000000..0cabc1ec55
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
@@ -0,0 +1,24 @@
+From 8e017375e1cf8b1e5a0c37951152fc7f4c2b3409 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
index 45d88e2a3d..6766ff396d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
@@ -7,6 +7,8 @@ DEPENDS = "zlib expat brotli libinih"
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV} \
            file://CVE-2026-25884-1.patch \
            file://CVE-2026-25884-2.patch \
+           file://CVE-2026-27596-1.patch \
+           file://CVE-2026-27596-2.patch \
            "
 SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
 

