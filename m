Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C59C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 13:32:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8785.1783517574492230286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KX+Yn+pE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b27c7451so20861695e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783517573; x=1784122373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ndsU3GxsjYf7boxJ/ku7RA84kA0bPxkGts2Y4/5Ax8=;
        b=KX+Yn+pEeaIheLkvj3c9NoKSVQfLuwredUy6/rlRwVZ1eAZ9/c23rk0jInsaaPKa3H
         qwf4RLmO2OPRoTV+Kbnb6a7lSzMT+LxehmpGfITOwtAcNy3IxJgNPj3UWhJQmh/wKsCp
         s4e1cp8bpJRXEFR3rx9NZXuG0P+H3Wux2UwKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517573; x=1784122373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ndsU3GxsjYf7boxJ/ku7RA84kA0bPxkGts2Y4/5Ax8=;
        b=fIBi+Jij//mlfnOqI4p7MJjkQQ2l4F2uYZVLOke3VoGvTxtJzrDXhWguXJ3RfNeO6v
         6El/jhbOgvhO8cr1yH+eKK4wFNw1h1+sfoJHzON5W/J1lwklfoPifA871FgzAfv0Dghq
         adBd5FwcdD8TWjr2TdFfsHEvqN75Iftz94r5D+kInF1YyE8p8h95CU3nElmtKWqcno5s
         JF5B+KtLgQuqxeLwqY7jkhzD6vLfiIxAKvpiJsQq5hurncT0E/X+xGEPSh81/tHn3CzU
         paTwYMbnzLnECfATJwPNh5ARE1vJpXGqP8VGunSyO3FOzvSJdbQ1Lb4F0bNwzqeRooh1
         2kBA==
X-Gm-Message-State: AOJu0YwCFzLuQtsNfdWlhLFOvt9Pg5eBOqz1L74kXD01q0uLzdN5jXQO
	7t+kc5AIexUADdx/R2eBpqmPhxQW24nmvjdBTGx4zk7KJl89dFmtLduvBcpyFsFBWm0ZJOga+Ne
	crt0Z
X-Gm-Gg: AfdE7cl4Do4rG2qub0Q27EIYeMFQL7tDh92vhNow06A+to3ybejOIFYThQE82q1MMEJ
	2WW+pcNWJxsmaQJrH12aWpTfPjDOnb4vbul3DT4ccMjFqg4p5mLPi47SLfpv2zvUQLEZpsxufgV
	YhlBdn0ZVc78qAva8RJclNNX/0dUWmah6SYMP+/TnVyRan4kuCv3uJDlrNRJ85xAzlBUOXVEQY/
	/MnuO/o/53BZ6/Iw7ivD93hpadzF93Aw0aCu4DzYplxWhZNpXtLmsHLXqmug1qUa5oKsP6wAftI
	okhIswjtmvgIhfadW03rZ3PVZylO7zP84rIOakMDloqK7B4NguN407Bhjarb6A9BOBuUAr9finI
	miPtk3E73uiPshaMUg3dji1HUpLXkVWlH1V8KgrtEonRCvC6fwa+2/lKNv0vq3upGQz8G9olezF
	oqtvoAEvCvNFZxG/OpkeO+VLRAuXOqJp8NEzRmRgLDIyLEYiYtJodV0VkurOWzvIaisXJINQMOc
	B1MPuH42xMZEXvWzTUQgDZCoiEk852VCn+zVnbUDA==
X-Received: by 2002:a05:600c:6208:b0:493:e542:ffd5 with SMTP id 5b1f17b1804b1-493e63706b2mr26320635e9.5.1783517572619;
        Wed, 08 Jul 2026 06:32:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f294a6sm262333915e9.1.2026.07.08.06.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:32:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-pikepdf: Upgrade 10.5.1 -> 10.9.1
Date: Wed,  8 Jul 2026 16:32:46 +0300
Message-ID: <20260708133248.1765250-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708133248.1765250-1-leon.anavi@konsulko.com>
References: <20260708133248.1765250-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128110

Upgrade to release 10.9.1:

- Fixed a crash (SIGABRT via std::terminate) that could occur when
  a file-backed {class}pikepdf.Pdf was deallocated while a Python
  exception was already propagating -- for example when
  pikepdf.open(filename) appears as a transient element of a
  list/tuple literal whose later element raises. Opening from a
  filename closes the file in the input source destructor, which
  calls back into Python; with an exception already in flight that
  call raised an error that escaped the destructor. The in-flight
  exception is now preserved and propagates normally. Added a guard
  for a likely non-reproducible related case with DecimalPrecision.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-Do-not-strip.patch    | 37 +++++++++++++++++++
 ...df_10.5.1.bb => python3-pikepdf_10.9.1.bb} |  5 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.5.1.bb => python3-pikepdf_10.9.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
new file mode 100644
index 0000000000..7483ad413b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
@@ -0,0 +1,37 @@
+From 22020dc444aaf3f98dc40f38c0a8aad48476db8f Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Wed, 8 Jul 2026 11:45:11 +0000
+Subject: [PATCH] pyproject.toml: Do not strip
+
+Switch from Release to RelWithDebInfo and explicitly disable
+scikit-build-core's strip, so bitbake will handle it Fixes:
+
+WARNING: python3-pikepdf-10.9.1-r0 do_populate_sysroot: File
+'/usr/lib/python3.14/site-packages/pikepdf/_core.abi3.so' from
+python3-pikepdf was already stripped, this will prevent future
+debugging!
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 06ccfbb..475af59 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -7,7 +7,8 @@ build-backend = "scikit_build_core.build"
+ 
+ [tool.scikit-build]
+ wheel.packages = ["src/pikepdf"]
+-cmake.build-type = "Release"
++cmake.build-type = "RelWithDebInfo"
++install.strip = false
+ wheel.py-api = "cp314"
+ 
+ [project]
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
index 289a702e06..2482e8913a 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "ffa6c7d0b77deb3af9735e0b0cae177c897431e10d342bb171b62e5527a622b7"
+SRC_URI[sha256sum] = "410fcf32bc9c8a0a96d94bbd6268ba7585333b1423b93a5fa2ef3c05f4eba3da"
+
+SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
 inherit pypi python_setuptools_build_meta
 
@@ -13,6 +15,7 @@ CVE_PRODUCT = "pikepdf"
 
 DEPENDS += " \
 	python3-pybind11-native \
+        python3-nanobind-native \
 	qpdf \
 "
 
-- 
2.47.3


