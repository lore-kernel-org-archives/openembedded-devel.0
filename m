Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.1029.1626368452884435519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nedwwO04;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id 17so6052835pfz.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xtC7WbtZC1R0BPdDdhWig3Ow1CBR5mqNSGvrR7+C5WM=;
        b=nedwwO04IlFYYk0SO9Y9srFdxHj6XqwD+qc0Jy1JUmw/tVKPxE5JQa+fCpxD/zYd4+
         W7vTnlqQBrb8yG5TypfSendHgfJJ4Awz1HIp+hN/0vn0j8TZkjmzzqquSAQCSGlZ1K8P
         W1cDbLvxTSrLy9sSLuLjRC+82LVZ0Hub3yKC2a4qd9cfdypcb6Hc1D7cGLwZ6xx92Vii
         HrlN/xtlaqFUHsrNRPeTKDmzvGqtg5W05l3ayT660Cp+mXAY+e+MygpatOkl3udJbwNr
         9QPKzHS96gKkduJajGxoDg/HzDOZKbA1JMm5bK8nu17FMHmMk8jq5VaJJ6a05Le6gDe2
         a6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtC7WbtZC1R0BPdDdhWig3Ow1CBR5mqNSGvrR7+C5WM=;
        b=O2BgiKQIKV2E2VS8ZE0HMyEzS3Nd41LYoy20iX0LOyTdRczFI7eZgbndvGTjgVc84x
         QKPsy9gSPQ245fe0Zdk9v350JOdXkDZ4g60NETnCQqseIGKfMWTSmpt6ix+8yyuXe1Y7
         aQfS8e2MBeaupZbN2/RMMxv36keJoa8QDMFLMlHF05vNUN/mcsi066TkrRR+rTIA5RIX
         nszmIh57cKbA738PuOKOmTSOQAussL+A46zzEQZer5xorF5Sxwew4IhM8ETvtonIqej7
         TQyoe537eViq39VzgSUDOzcDVlODKG994KhAL6Mm6cpF07N9IKpgwf0oyORRnfjd/In8
         a4IQ==
X-Gm-Message-State: AOAM532F3rt7gGgg4HsuN1PNQmR3vB2axlIRJQBlXZl9/TCSmCl1LkVB
	tpYrK/Dr+uPZfXYrC8Bp3gP+SE+DSl8=
X-Google-Smtp-Source: ABdhPJx8tIs53K8aBEmTLcB0O+s4mekpYcXushu1akLSe7KVo0DmMkvM3s8iGPzESPrx9ddZltNJEQ==
X-Received: by 2002:a65:56ca:: with SMTP id w10mr5499055pgs.107.1626368452026;
        Thu, 15 Jul 2021 10:00:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 6/7] libiio: fix installing libiio when python3 bindings are enabled
Date: Thu, 15 Jul 2021 10:00:41 -0700
Message-Id: <82cca6d4edd3bb3a3d888f2647d43256b5f4691c.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

This patch fixes the following error when libiio is installed when
python3 bindings are enabled:

ERROR: Execution of '.../libiio/0.21+gitAUTOINC+565bf68ecc-r0/temp/run.do_install.2349473' failed with exit code 1:
running build
running build_py
running install
Traceback (most recent call last):
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/build/bindings/python/setup.py", line 77, in _check_libiio_installed
    raise OSError
OSError

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/build/bindings/python/setup.py", line 106, in <module>
    setup(**config)
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/setuptools/__init__.py", line 153, in setup
    return distutils.core.setup(**attrs)
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/recipe-sysroot-native/usr/lib/python3.9/distutils/core.py", line 148, in setup
    dist.run_commands()
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/recipe-sysroot-native/usr/lib/python3.9/distutils/dist.py", line 966, in run_commands
    self.run_command(cmd)
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/recipe-sysroot-native/usr/lib/python3.9/distutils/dist.py", line 985, in run_command
    cmd_obj.run()
  File ".../libiio/0.21+gitAUTOINC+565bf68ecc-r0/build/bindings/python/setup.py", line 52, in run
    self._check_libiio_installed()
  File "/libiio/0.21+gitAUTOINC+565bf68ecc-r0/build/bindings/python/setup.py", line 83, in _check_libiio_installed
    raise Exception(msg)
Exception: The libiio library could not be found.
            libiio needs to be installed first before the python bindings.
            The latest release can be found on GitHub:
            https://github.com/analogdevicesinc/libiio/releases

Some time ago a fix for this issue was already discussed here [1].
However in the same discussion also a second issue was being handled.

A fix for the second issue was merged in 51f98865da0. The first issue
didn't pop up anymore and so a fix was never applied.

Recently however after switching from build machine, I started seeing
the first issue. I suspect due to build caching the first issue didn't
pop up anymore before up until now. With this patch, fixes are now
available for both issues handled in [1].

[1]: https://github.com/openembedded/meta-openembedded/issues/248

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...rify-whether-libiio-is-installed-whe.patch | 37 +++++++++++++++++++
 meta-oe/recipes-support/libiio/libiio_git.bb  |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch

diff --git a/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch b/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
new file mode 100644
index 0000000000..5566aa0ffd
--- /dev/null
+++ b/meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
@@ -0,0 +1,37 @@
+From 3a26f0536706fa7c241c9de986799ae440c68c8a Mon Sep 17 00:00:00 2001
+From: Julien Malik <julien.malik@unseenlabs.fr>
+Date: Mon, 27 Jul 2020 14:34:44 +0200
+Subject: [PATCH] python: Do not verify whether libiio is installed when
+ cross-compiling
+
+This should fix #561
+
+Upstream-Status: Backport
+
+Signed-off-by: Julien Malik <julien.malik@paraiso.me>
+Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
+---
+ bindings/python/setup.py.cmakein | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/bindings/python/setup.py.cmakein b/bindings/python/setup.py.cmakein
+index cd14e2e..96d58a8 100644
+--- a/bindings/python/setup.py.cmakein
++++ b/bindings/python/setup.py.cmakein
+@@ -54,6 +54,13 @@ class InstallWrapper(install):
+         install.run(self)
+ 
+     def _check_libiio_installed(self):
++        cross_compiling = ("${CMAKE_CROSSCOMPILING}" == "TRUE")
++        if cross_compiling:
++            # When cross-compiling, we generally cannot dlopen
++            # the libiio shared lib from the build platform.
++            # Simply skip this check in that case.
++            return
++
+         from platform import system as _system
+         from ctypes import CDLL as _cdll
+         from ctypes.util import find_library
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 00c016db44..d7e4cc60a9 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 SRCREV = "565bf68eccfdbbf22cf5cb6d792e23de564665c7"
 PV = "0.21+git${SRCPV}"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https \
+           file://0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

