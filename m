Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3234CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 16:27:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.3113.1725294437033283674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 09:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlbhlQN8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so21443005e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725294435; x=1725899235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zomSUcT6Eyyt4s82gydgEtApvRBXLoJqv/1j5+OQ7A=;
        b=OlbhlQN8wKYALpoI9wreEpy1ywvek1HbCDa1DzPpJgjDKAT/N0Um14K2Lhx007SSvr
         0tFPSMZxbDNc9sri1F7Wl4ckFb5XIZNkZK6UyLsw0CH5EnBO/pEwzdAIgX6pSc3USGZz
         3bzQ8L1M1uqX/fa7DnmXvmZ4MgUqC+o9Ipl4zDXofH3Rj7Cdg5Ib0fohOeKqe0yPfRrY
         0ljm7X5JINhjkU6dOtxAAI7atpgbobL840dPVj5cVdqHLFAJmIEokhKF2DqUURI+c+7H
         th7PnjpLeiuwsQhBy2x2QFamoQjBI/fl/EN+MczW/wulVt/842v7WIhiEJ6mmw+ZOIVd
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294435; x=1725899235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zomSUcT6Eyyt4s82gydgEtApvRBXLoJqv/1j5+OQ7A=;
        b=QEHTgHpLSl75SG9Q7f/KuQCcfOAmG91CKUch5EK7UAn1I2s9u5PgDZeZhsgCWUFtaE
         FbiIS32Y9pUjy0aIoDaNNgJuShU9Dn8bcxE/zlnf8lsuR4GAo4KofITxNgl4uQ3w+7nV
         AlHwd7+flcUZ4iGusJEj0tXRzybPioRPPDjrh0Kc+hDhks5K6YY2AaWPpeVLURIP35iO
         ASCaQpcEfuL5VdxBjwQlnK5Mp/7+AUCYWBhPeqHE2xjK64MQtpzMH84ventU7N0bXijz
         ZyA58H/OlVhKnszAza5Vu5v3AQ8N9pkpXAWmY6pKF2XMdkzbDUEyXkpP87CiLhaJp+cM
         h6cw==
X-Gm-Message-State: AOJu0YyhG70bJXxye1N4XvR6Wq7W93RVml19s0hHewiVkhVWDC3odL3A
	UbGZjWQNf9/uDjROEyfUyGTzr8pgRP6m/pkpdx/ndenx95GphgV1P+xQqQ==
X-Google-Smtp-Source: AGHT+IE0kpgKRR86OxL4hQbs6FWad3WUf5B/S/r7oSw0tudYqPIFi2eGo39QUTveAqmw1R2ijmjBvQ==
X-Received: by 2002:a05:600c:4693:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-42bb01fd12dmr120233855e9.34.1725294434789;
        Mon, 02 Sep 2024 09:27:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6da24bbsm143434225e9.0.2024.09.02.09.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:27:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-matplotlib: add native RSS to -fmacro-prefix-map to fix buildpaths QA
Date: Mon,  2 Sep 2024 18:27:10 +0200
Message-ID: <20240902162710.1284914-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 16:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112074

* fixes:
  ERROR: lib32-python3-matplotlib-3.7.2-r0 do_package_qa: QA Issue: File /usr/lib/python3.12/site-packages/matplotlib/_tri.cpython-312-i386-linux-gnu.so in package lib32-python3-matplotlib contains reference to TMPDIR [buildpaths]

* there is native RSS already but only in -fdebug-prefix-map

* it fails only with multilib where target RSS isn't substring of native RSS

* comparing _tri.cpython-312-*-linux-gnu.so cmdline for regular x86-64 and lib32-python3-matplotlib i586 build shows:

--fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/python3-matplotlib/3.7.2 \
--fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/python3-matplotlib/3.7.2 \
--fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/python3-matplotlib/3.7.2 \
--fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/python3-matplotlib/3.7.2 \
--fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/recipe-sysroot= \
--fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/recipe-sysroot= \
--fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/recipe-sysroot-native= \
+-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/lib32-python3-matplotlib/3.7.2 \
+-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/lib32-python3-matplotlib/3.7.2 \
+-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/lib32-python3-matplotlib/3.7.2 \
+-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=/usr/src/debug/lib32-python3-matplotlib/3.7.2 \
+-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
+-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
+-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native= \

* the buildpaths are header files from native pybind11 (Pybind11Extension)
  https://github.com/pybind/pybind11/blob/master/pybind11/setup_helpers.py#L89

$ strings package/usr/lib/python3.12/site-packages/matplotlib/_tri.cpython-312-i386-linux-gnu.so | grep oemllib32
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/../detail/common.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/../detail/../pytypes.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/class.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/../detail/type_caster_base.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pybind11.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil.h
/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil_safe_call_once.h

* I'm not familiar enough with pybind11 to find a way how to configure it to
  use correct include dir, the issue already exists in regular x86-64 dir, but
  not caught by buildpaths, because, the:
  -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/python3-matplotlib/3.7.2/recipe-sysroot=
  is enought to mangle the hardcoded paths (leaving only '-native') like this:

strings ../3.7.2-x86-64/package/usr/lib64/python3.12/site-packages/matplotlib/_tri.cpython-312-x86_64-linux-gnu.so | grep pybind11/include/pybind11
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/common.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pytypes.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/class.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail/type_caster_base.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pybind11.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil.h
-native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil_safe_call_once.h

* there is also:
  WARNING: lib32-python3-matplotlib-3.7.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
  but just changing the inherit doesn't work in this case, I'll leave that
  to someone actually using python3-matplotlib

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/python/python3-matplotlib_3.7.2.bb      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
index 72c369100a..2886060a9e 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
@@ -68,3 +68,8 @@ do_compile:prepend() {
 }
 
 BBCLASSEXTEND = "native"
+
+# otherwise pybind11 paths from STAGING_DIR_NATIVE end in _tri.cpython-312-i386-linux-gnu.so
+# when STAGING_DIR_NATIVE doesn't start with STAGING_DIR_HOST (e.g. for lib32-python3-matplotlib)
+# http://errors.yoctoproject.org/Errors/Details/801217/
+DEBUG_PREFIX_MAP:append = " -fmacro-prefix-map=${STAGING_DIR_NATIVE}="
-- 
2.46.0


