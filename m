Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35456.1792987099796971288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tEzvHis2;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so3888249eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987099; x=1793591899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wwqlajcwu06pPzj3QgIUwNVgFE00DZY8+8h0xh+U24A=;
        b=tEzvHis2UvdkCVaGiheOp9i8EXnc8XsDwicY37EOSpHnM4+JbBWP89m0Utque8CyVM
         LkE6jx619XSShZidF+/VAFqrbliKQ/PXXeceiBKPqaGjydmRGNouhgAJyPo8DbuB3XO5
         1vTMMagwRiSvFkWJkUb3j8E5Xr4/YiDIjiWCvDPYdiNJP4JyL+byRW61UxC5w4FPn4mI
         XR489mmOp8psJIKmaXJse9JmecuIGf7496BsfGiwRtrEWdzsOt15ffwliOWbhw7anHke
         GtKYPmPwH/gQRFMdsNTFJOvREwy0kmJUIajT5YVK1V3mUuxb3ew+cFqyC8xC3IhFI5D6
         q1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987099; x=1793591899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wwqlajcwu06pPzj3QgIUwNVgFE00DZY8+8h0xh+U24A=;
        b=W23mrzOeF9abheDxFUrSXY4CHJ+Q432GRyfEd3uHS1VtxPT2655YkeaMhq1/P3XP2A
         iKSWNf0GcZG8cmuyhk7xCOStjUhaqYa5c5IMmQrXS9Cg1B27kejqSQvFILYpdPZJ9y8a
         nFRwrQH3xKLxuQl6oXSOwAfKLqXwHJ7Bmh6xQlrXY7R0Rgh+eKbFvZ43F88qSUcK8ONa
         +SYKJ/tDr6jTNIis3wHoLea5I6ZJyfcO7osMex5qmpgsWb93DW0f35RDn1I38rp+KHrw
         8Yfqc+T5AVsxarl7IGAKf2LYCV0kC8ysHx0HhQhKzozSpfzx9b4Isp2+/S21eg3x9Gw7
         APTg==
X-Gm-Message-State: AFq9FYLPx0z5BN+KKviiPg9NFtd8nzXm2N/E0+mCbRsr+TFsFDC36KWG
	JpQ9spK38cM59VIKrwIvHxdkY3fETyIrdG0bZv6+TH4r7lqSLo5F5Z4mAOOsBnmksjk=
X-Gm-Gg: AYBFou2FKJ/A0+mYyuQnaFhAjNc1OeI2F1OoKz4fHq6UypN7hgP+LStwiqgrS5INDaY
	BGkPefZS41zyNRR7q7evBubgFMHYuMyXjsndEsLPLsucT2nnbn2Xiw0L9p0hRh3b6QD9CzmWTB3
	WAnuT/W8cO7DH5aAf+Zcn5LHY2SBg27Iu5x0WkesVTaqS7HHjmcSz0Umk0/aD9aaYTV6aA9hGCx
	r/KPkgy4VvEFV0jO7QBbY9e8nePVb3d4Gld/nNii0mFcUctPe6pdtSPmXuMYk0GvOZvWT4qp/dX
	ikDyU8lZv9udwFgCvU/RBk5R4xxcqMzCUORz94XI/nmKhmbXP42KCQbZT4OJUktaYvkI3kfH2+w
	/H4Cf3B47I+Vn9mNOi4yCsSulIcFXatoz6BAgZNYMK2vKzAjw+yJ94e9hFS8nUdjVMyDkowZu/1
	rzLtzBqJAGdhs0VGKKXUi4E+9HzdN0RGfG6+TKTrY5BBLN7N9agKuVOgPwZ4z+d8R5xc5egxA35
	IKVRRgVkwEzP4C9Wo1fviPSAIP/bv5bkZrJwp9LVteAmLlJU+fWfQwpbn1MTaPKJGg6oFlL2UBj
	PW3WCXs0UB2o7oP8RgZtzJ8/vYkmc7AIJgB74lBXoD56+qJQ1MTntQi2i3P6D1v/ZHaCnQqw2R7
	wsUC8Hl7GeWTv+3PPdH8q1ibRH0WGpoOOTeGgMKRIiQry96JNQwcDdCRPzqDZYp2aWRNAhIOlCy
	V8GgP2nfQfcW2vTZHU0T1BUWR4rSCCFGjZvL2IPnbTxXEMPsPPeuBmQe7Er9cvQhGSFJidSY/1r
	hGuGsvBw5NcsQsFxDFur6oDu1ugEjk=
X-Received: by 2002:a05:7300:88:b0:367:3d68:8480 with SMTP id 5a478bee46e88-369e81ca340mr9408581eec.0.1792987098703;
        Sun, 25 Oct 2026 20:58:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/8] python3-ipy: upgrade 1.01 -> 1.2
Date: Sun, 25 Oct 2026 20:58:07 -0700
Message-ID: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131413
Content-Type: text/plain; charset="utf-8"

Changelog:
 * Drop Python 2 support; require Python 3.5+
 * Remove the module-level names INT_TYPES, STR_TYPES and xrange
 * Add inline type annotations; IPy is now a package that ships py.typed
 * Fix IP.broadcast() returning an IPv4 address for IPv6 networks
 * Fix IP.reverseName() for 0.0.0.0/0
 * Fix the flaky IPSet fuzz test

The fuzz test fix stops the intermittent ptest failure in
TestIPSet.testRandomContains, whose oracle ignored that IPSet merges
adjacent prefixes into a larger one.

The sdist is now named ipy-1.2.tar.gz, so drop PYPI_PACKAGE_SDIST.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-ipy_1.01.bb => python3-ipy_1.2.bb}        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipy_1.01.bb => python3-ipy_1.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-ipy_1.01.bb
rename to meta-python/recipes-devtools/python/python3-ipy_1.2.bb
index 437f23975d..1e128e8370 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.2.bb
@@ -9,12 +9,10 @@ HOMEPAGE = "https://github.com/autocracy/python-ipy"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"

-SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
+SRC_URI[sha256sum] = "c145e664e84642fac875a043fab1a0b50bd65297385dc438dbfe25f24e65ac61"

 inherit pypi setuptools3_legacy ptest-python-pytest

 PTEST_PYTEST_DIR = "test"

-PYPI_PACKAGE_SDIST = "IPy"
-
 BBCLASSEXTEND = "native"
