Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFAAE7FDCF
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1635.1770146053540595930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PglcCsx3;
 spf=pass (domain: konsulko.com, ip: 209.85.210.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81e93c5961cso4956283b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146052; x=1770750852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nepTm1+WJih25SfA44hJsDA1XJ7vrs6nggtYSHs2u0E=;
        b=PglcCsx3fXsg5IFVY+7bKHfnYlYnCieycNpmEA8NA6ZTmLFo2zICZj0s7NBVNkZCtj
         1On20K1xmPoIQaNZZlAZA7hn4ujtpJZdUR+vBQDJ3gV61iuSIeqhMKzq1T0NZxKt63TA
         KsHgNAe3umVUhr85OzIpP68YCnTBKNkGNCwLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146052; x=1770750852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nepTm1+WJih25SfA44hJsDA1XJ7vrs6nggtYSHs2u0E=;
        b=tresuZGwmZzHX5xDHQ/cdG/6GlS4N0q9Ff3shpKwqZ/m60SDjIwzuvjd3xun8z+ckR
         Elwh/bJPSeuJhRjTRrbMQcvTHMzrfeL1oKI53cpGcZnWYeCCpGKjYKpC+WJQ2e+nhsIm
         XNx3+lUd4TwZJCjnveKe20PYJVimzBRCm34IEX6VqNQfCXKmn7buHByX/va61vUiZ8sw
         hnXLniP2+4hsBCw5Am4uYeaaXL2ERvOP3etT1uSk0V2BZlHKQ+jnOqdTz51OnyQEnpSx
         C+XbrJG2KvL4bGXSwsqNhOlukZiYwtVHhgnxzi27eQJuzcUXsfGtzfAJAi2lSmPKYYtV
         RVCg==
X-Gm-Message-State: AOJu0Ywpe2ekW4qdlLpBpv/fJLX31eYwCphkgdBxC+LPAXfiyozuDxlr
	xqYEEQVRk+gD4ERRz6NOcxCZjuckTsiH/vepDXO8vxFPk2OcjYepN5r++QIdcM9k7K1ZsxJ9ed3
	iNGwv
X-Gm-Gg: AZuq6aKyrhf6M+4f00ym5Op2JAN5oZz4EekhFcIMII+XAo1RLyDoQhSSS0zCET2J0Zg
	gdK755BIt9nZv3AEvjCSUoA0sEBWKBPI9Fy23Kt05RWCqyongguXAkgyf7yvrbIyzUXhBsxv2dJ
	2CSYcaSnYA/6vpWdKhXwZWJCVwQ+L+/vo2bGM36LAt+huZi5gQO6QCQ2SEe/xt8r2z9cGhVCjmJ
	Js+8t608MK89kimNhM7ictUKBwx0XW//4WVwws04U8Mydts0SS76WsJ/NRuAnKOWB0CL4eBythJ
	y01VfJhbiSIS91hK4NycFjbJ9DQ49mqneJDghIdZmzVKlU9cbRzd7qzYqFKWhB3EsMP9b2xvCiT
	xla5F5QgsC4N5oWhVI4DjUcSmPRu4UChOcUINs0JKCRB/3oW5/UL7gAqSSYHI4UVOkdMV7AyVO9
	v63eMit26tijZjBF6vFDbb16n4VNxdn0Wbx06v9k3dtbZNyfEJ5w==
X-Received: by 2002:a05:6a00:198d:b0:81e:711d:b26f with SMTP id d2e1a72fcca58-8241c4c4789mr401895b3a.43.1770146052516;
        Tue, 03 Feb 2026 11:14:12 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1b71cesm120091b3a.19.2026.02.03.11.14.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:11 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 3/6] python3-tokenize-rt: add at v6.2.0
Date: Tue,  3 Feb 2026 11:13:52 -0800
Message-ID: <c95c4078dbd6046627ab37b01264fb6929d880f4.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124108

From: Tim Orling <tim.orling@konsulko.com>

A wrapper around the stdlib `tokenize` which roundtrips.

Dependency for python3-time-machine ptests.
Use git fetcher so we have tests/ and testing/resources/ for ptest.

Testsuite summary
TOTAL: 45
PASS: 45
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 8

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-tokenize-rt_6.2.0.bb       | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a84718b704..bece6304e8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -105,6 +105,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-starlette \
     python3-tblib \
     python3-tenacity \
+    python3-tokenize-rt \
     python3-tomli-w \
     python3-tomlkit \
     python3-trustme \
diff --git a/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
new file mode 100644
index 0000000000..0f5a1b34d3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tokenize-rt_6.2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A wrapper around the stdlib `tokenize` which roundtrips."
+HOMEPAGE = "https://github.com/asottile/tokenize-rt"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5fd324061c581b8d45b8cb18c560a543"
+
+SRCREV = "1582bcf0259d183259da1761444c6fc73fa7ad9a"
+PYPI_SRC_URI = "git://github.com/asottile/tokenize-rt.git;protocol=https;branch=main;tag=v${PV};destsuffix=tokenize_rt-${PV}"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+RDEPENDS:${PN} += "python3-core"
+
+PYPI_PACKAGE = "tokenize_rt"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/testing/resources
+    cp -rf ${S}/testing/resources/* ${D}${PTEST_PATH}/testing/resources/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.43.0


