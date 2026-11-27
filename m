Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10284.1795752835313268875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CCIHjTHV;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so11423622c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752835; x=1796357635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAtjLhhjNy/kAdMy7QEgBtG5MvhM1f1EdeTN0EXlRJk=;
        b=CCIHjTHVOpbIsd3HbGVtRM81RMOaske0cqAqGPa71ZVGr2iKRgSSujCjaSdbScI9Z5
         sxULdkIB+fbKkLQ+w/vBHHElekXZUOZfXKKvkg1/FMwfwaQo9PCxOxEVxhYkciw+Wksy
         S1OjQSw/JsKgV+B/xGf446BkbXcEvzsH772oWcFS9OGkcjFVR/7Wvguyp+YWvRCfxG8z
         MyoBzuH42usHSoDO/ge4Pji+7m/J/DgY08vCq4NdpVVFFoMxNCDD5ln3JFQZR5A4aEKJ
         OZ+TfUZtIGDrZyva5/rSPD/a9jPR0dsBbNDnNUFsMwG8xTjMdJfkFjN79IkoQPeqvnT0
         YkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752835; x=1796357635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAtjLhhjNy/kAdMy7QEgBtG5MvhM1f1EdeTN0EXlRJk=;
        b=Q46isW9UIViUEhuo2FzBabtGpU0WLn93G8QfhmQhLqPhH17oXrlCAeAHGF199GBgEZ
         ZTTMZTLh4wDslx8pl1sHfuXjViCQ4YbsGF+KedN6zXKHVxnVZ9v6v44Wv8Q0l7yp0xqQ
         G7AutTU0QgL5pgEFb0fm11WlHIf05QytErHs1FekMoLsu3CbloHWMdZRxBUsZSasZKMq
         5hVWS3gnAVrweWbn+ujw7kwojX8gBbJHi7saqJRvqhz8FzGfkSBB2j8YgvqsZH9sqWBC
         iHmLdnBKYCIIxgWV4wTJMPxMJBm3UOzU82RXyDnOkDeRgnHSGqhF4y1YziwcJleemlkQ
         IsVA==
X-Gm-Message-State: APuU4Z8pe6vhbRLJOONdi+oJKC0hCxKjeYikCGvzQ4epZHGXdtA2sgAQ
	cTdQw9IJ1CB9EnxRr59K8w1vUwm82k1v0U+oWPGw4BHG6yG83lhGbrjlAQuNCC4D
X-Gm-Gg: AZFdTZcPqi4Vn0WAizWtEN8SppzfFO6gJN6hfeTdoy+ZmzDgHYRdfpdol6K40kM+rr2
	TCAx/nzLiDrbQI1s99EszklXgFChJt36F9dE9lFnqArSqHp9Jh4tTmWU6Kp0UqIUqsaWbMT0OsY
	Go1K9dheLB/gzG5LgQHEJXNxiNUdH6NggdTovYcBvvSMu7PSUXLx7ixJqu22NvDe1Z0mpwhooLJ
	dXRjVBgSxRVbyy3/c1DqQwja16IfS5uInWeor75R+ccj0GTBtdh5EZ7BXRqaOTLYDrqw+0Rcyuj
	s/69Kb7t/V4SnKT2KFS3P+/RPexHGWZwlnL6SD7KT2gzmiGQPVjiREuYRu/tu99pclTqrsShL8f
	LUixKsPzIktCVyG+jM5E+sKt8Zs+o8IuxvO5Pjhn2Jjv8AHT505cFNsam7JEIXnTQzW1gxV3oFO
	Ykuts3ZZeZaOTNnn0NLMi56tYWgpfR66IuNTkyFt+yGYmNwPlAhm3vewG1tN3dbJlPkYV0n3xSx
	gCGih8+8hM7K6uVH7FM+zs078EOQeN5kjbUuQtRsb96NduTi7o381E9zIOLUOZfQMtV6I2Sjify
	0uv1vds2pmOOah2eRSHA39Hfqz/JbthkjSB9VwBqQ/WEaFaAC6OmJ+REUTlWVIxl4Or1DzEQwcN
	lJbPStn9O3rUYPxsRG8Qd5/KW5MIS+dytlXeL39VM6x+CS5IEyP72FLIYeanEjxpzm2syz9TMp/
	vYECXEU/3kl48/b2cehnH4KhfPI4TkMNSfGQfQrXvgptW9xYCUY74qeOG8nO3NGvempFhcgphYT
	zDLhZQXslrMyaOjl53xC+5ykditopVvZumvefi8BU3kpWN12NukidEIfM37VoYJ+k4GobBsA7Rs
	EkDo
X-Received: by 2002:a05:7022:f118:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1b5568d34cbmr19307557c88.33.1795752834420;
        Thu, 26 Nov 2026 20:13:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 32/39] tomlplusplus: upgrade 3.4.0 -> 3.5.1
Date: Thu, 26 Nov 2026 20:13:36 -0800
Message-ID: <20261127041343.1772294-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133202
Content-Type: text/plain; charset="utf-8"

3.5 adds TOML 1.1.0, std::chrono and C++20 module support and fixes
many crashes; 3.5.1 is a tag-only re-release.

Meson builds are header-only by default now; pass -Dbuild_lib=true so
the shared library is built and packaged as before, and
-Dregenerate=false so meson does not rerun the derived-file generator.
Fetch by tag and check upstream release tags.

The test runner calls std::locale(""), which libstdc++ on musl only
accepts for "C", so run the ptests with LC_ALL=C. On musl also exclude
the "round trips - floats" test case, which expects strtod() to leave
the floating-point exception flags clear.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/tomlplusplus/files/run-ptest | 12 +++++++++++-
 .../tomlplusplus/tomlplusplus_git.bb              | 15 +++++++++++----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
index 4f682c5eb2..64e157c6d0 100755
--- a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
+++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
@@ -1,9 +1,19 @@
 #!/bin/sh
 
+# The tests call std::locale(""), which libstdc++ on musl only accepts for "C"
+export LC_ALL=C
+
+# Set at build time for libcs where some tests cannot pass
+args=""
+
 cd tests
 for atest in tomlplusplus_* ; do
     rm -rf tests.log
-    ./${atest} > tests.log 2>&1
+    if [ "${atest}" = "tomlplusplus_tests" ] && [ -n "${args}" ]; then
+        ./${atest} "${args}" > tests.log 2>&1
+    else
+        ./${atest} > tests.log 2>&1
+    fi
     if [ $? = 0 ] ; then
         echo "PASS: ${atest}"
     else
diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
index 074c9b6f75..50544b57ac 100644
--- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
+++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
@@ -3,18 +3,19 @@ HOMEPAGE = "https://github.com/marzer/tomlplusplus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90960f22c10049c117d56ed2ee5ee167"
 
-SRC_URI = "git://github.com/marzer/tomlplusplus.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/marzer/tomlplusplus.git;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest \
 "
 
-PV = "3.4.0"
-SRCREV = "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
+PV = "3.5.1"
+SRCREV = "efd80e03356af65c7d4e61c56ffb326b34f8d0f4"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "cmake-native"
 
 inherit meson ptest pkgconfig
 
-EXTRA_OEMESON += "-Dbuild_tests=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "true", "false", d)} \
+EXTRA_OEMESON += "-Dregenerate=false -Dbuild_lib=true -Dbuild_tests=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "true", "false", d)} \
 "
 
 # See - https://github.com/marzer/tomlplusplus/issues/279
@@ -26,3 +27,9 @@ do_install_ptest () {
     cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
     cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
 }
+
+# musl's strtod() leaves floating-point exception flags set, which the
+# float round-trip test checks for
+do_install_ptest:append:libc-musl () {
+    sed -i -e 's|^args=""$|args="~round trips - floats"|' ${D}${PTEST_PATH}/run-ptest
+}
