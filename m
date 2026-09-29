Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C56DCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 07:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2364.1790665673823595980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 00:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OXPF4RFZ;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so12935965e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790665672; x=1791270472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MdbZmvE+rfcwZUuqrXDpWvmNMR6GbXXKmfNOsoXUoc=;
        b=OXPF4RFZTfn6X1oovM2LkueKLOJ1n3CHBMNj2WMAVGv5VwYfwJEWEVzY09aSF0NNPG
         xYS7Ztmzq8ExOenVK6Q+F28aBbPrv9vk+JvJdri/COjmnKtaCrhiFXk9XsBfaeJ8oTob
         nmRcCLSCZ3EHRsPQMKsBPY3lhDDS0Ei581N+tDPdHJogXBe2Qag8wNs9Uwa3Sy1smUCH
         RrVIyzy+oMWzd8PMQhjE7cwggkEr9g4IubeWDXeI1wImcMpjnzWqFSJ21jy7WM1yi2Kd
         ghWribqqIyeBci/v4tjlpob9vpiQWgnfYOkoR/HOLkJ9+J7CRdkM00cZgmyE5/QYWN0p
         3/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665672; x=1791270472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MdbZmvE+rfcwZUuqrXDpWvmNMR6GbXXKmfNOsoXUoc=;
        b=X4H4PVbiWEqVf4D3nn4BCfvz8ksOenCGUB5gHX69PqWTnYorJUDhhAFEgpW/K/VpY1
         YnMxsybS8LICjMqNSIfrdtItDRuFbkU3E5u1uNPH+WFgXpBJqEqN9ctrvSGLFKupymv9
         vhC+IabW7POT8I1E0oFxXIP2MxuqwvGu2WYQmQDAzvDO09CFARrx8TTxYinSVtmz9/gn
         Zk8dhCwHsHo+G0nk/XQ1+zX6F+B8vYGcoHEogVEkgH8oPBPIzOj5IoxrEN3kKgmeUd2J
         p5qMqE5Vx3lll5UbqC70Gi/Vv2QfJNXmFR3fvHPSHxtLDcQR1IiWO3VWckipGzQcURze
         1piw==
X-Gm-Message-State: AFuF++mHHw796Sl8NlCS98hKsh1pyvNUCoRa6VTAal8dAxWm+7HA7nRp
	P2G7T2EEYspMbQLjlZxiI73bbXPjE+O6d14RaK5EK/jFOYSsxzy5qj6A2/DXJg==
X-Gm-Gg: AYBFou2diKOkaq4S7I2Zc1RdcOMemUygFx5cBEBdRlJXL0FvKB04NPHo2ma3xKOnEbk
	fKhs85nr+/Cst9CIK/IN+DCiJSEg2duZQcISLdj9f+BKIxwHHWfEGdHKks+TMGrFcnu7FzMO3hi
	a+Pq2Q+8aEEZm8OUbGwwFbCOgg8Mu1yZBTNDJOr5mdcd/JjYKaTy5KaBUYUlixajpHS1YubzxRQ
	64lVHkakBr8xKz5RFcN/y/4CADGCjA4ffDmy6dFkh49U7nhHZbTF3yrDWPgV7CRqT4Ws7NpwaMY
	4oaveCWS/T1X9iwlPLr78UOU80LO8HiAYDtqANAIvSzy4rqWs1zqlc4azcsA6UvG9THNRrIWaXi
	OcyUvySlz1dOnPZudU0u9O41ykWY32okcZIrHYcLJIrD6Z+Vy6YrC2Su02yL9jqNkPbtHldecrC
	bjHAZOFhYDFDsqJk47VzNIgHn1U26CswkDjAp2GWjXFM48tEkHHpkPnicrSdW278gN71L7RBJNR
	6kGLgwYg/BTsMM4PhLl2SiHdqK90tvs/ec12pnqOZUk+OkoULzxHcLFz9GKT5ubkFXpxA==
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr267469805e9.16.1790665671453;
        Tue, 29 Sep 2026 00:07:51 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm53918115e9.5.2026.09.29.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:07:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-varlink: add recipe
Date: Tue, 29 Sep 2026 08:07:14 +0100
Message-ID: <20260929070713.2220524-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929070713.2220524-2-alex.kiernan@gmail.com>
References: <20260929070713.2220524-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130473

Reference Python Varlink binding. Fetched from git as 32.1.0 was never
published to PyPI (latest there is 31.0.0 from 2021).

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-varlink_32.1.0.bb          | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9d07fc44e27a..f84941daf08b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-ujson \
     python3-unidiff \
     python3-uritemplate \
+    python3-varlink \
     python3-vcversioner \
     python3-versioneer \
     python3-versiontools \
diff --git a/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
new file mode 100644
index 000000000000..7ce93c937014
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Python implementation of the Varlink protocol"
+HOMEPAGE = "https://github.com/varlink/python"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
+
+# 32.1.0 is not published on PyPI
+SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
+SRCREV = "8b3ba4e8206b098c524f538036a941b47797840d"
+
+inherit python_setuptools_build_meta ptest-python-pytest
+
+# Otherwise setuptools_scm falls back to 0.1.dev1
+export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"
+
+RDEPENDS:${PN} = "\
+    python3-core \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-netserver \
+    python3-shell \
+"
+
+# Keep the bundled test suite, and its python3-unittest dependency, separate
+FILES:${PN}-ptest = "${PYTHON_SITEPACKAGES_DIR}/varlink/tests"
+RDEPENDS:${PN}-ptest = "${PN} python3-unittest"
+
+# Upstream keeps its tests inside the importable package rather than in a
+# top-level tests/ directory.
+PTEST_PYTEST_DIR = "varlink/tests"

