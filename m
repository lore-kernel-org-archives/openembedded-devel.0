Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF2DC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:02:49 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.4823.1690426968050667193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 20:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=psqStDLr;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-348c8fc6eb9so1523515ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 20:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690426967; x=1691031767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zirvibW4ceusCLjRQcx9mD4cYGzPzNNYtsUMjKXaU7c=;
        b=psqStDLrfp81EoisaHoMSUGhOrIOcdqPT7SIKyx0LaUdPTJ0uOoQzFP1SX5acDSH+f
         KIMM0LbuIwobhzngoyNiBO8DXBEJcPklsrVj3Ok8IyuK8PHvoDF9Ssrq6WMLLMQDVMag
         6QjnmH38pr69UZn3kZMwEx6nTyTLxAH0R6jP2wIwetOANBhCfGaCYsThsYJ0b/fSm/P9
         b09ybJZZ7eTjCMk0FbSgM8ns4hhPrgZDM04PJtSryUKc0n7rAyy3DaHWKOr5FVbl1f0E
         8NWldeBLYPEx4hUodypq0Rja1eKh+SKiiQ4UphJwBEET1TRWOS8xXrmV6ieM4qaA9cWg
         kAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690426967; x=1691031767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zirvibW4ceusCLjRQcx9mD4cYGzPzNNYtsUMjKXaU7c=;
        b=hg6snXrP7L5CSVUP6/AcADt2L3L5zFgafugIWYdTsDdkwWsQgFT6EvTIRR/rZQAHoz
         ysmr7G7uEBvLg/E8G3cVEAXHHHo0956qUhq71zCZ02fSthEBjN4hn2jpxyIENqtvXGst
         sqo+w/cF6PA8Ps5gWnkcQBZrE8Ys3H+0WWZ6OV8Ay+2JAV0DzbDBvcNHtJaijRCOh8pr
         jDy+F9SrBYftVAB9BPJT8udLbPNSHpAuxyIySZEmJKPHHXV0BY9Mg89ZVyUE4SWU2l3A
         BtFTMnQZ1EzTGN2/PGGRb6erppVyfXn9q3du2eVLquqQjWr1dbtcwIs6f1xaK0ACULup
         fY+Q==
X-Gm-Message-State: ABy/qLZkKt3nZWpeA8FCIYA7Cfj9JvUt/IYDW8ZPf7xum6hkpPi+4A+L
	6ZLQMg81WbiTVfvKE8YEfe1QO5YVmthTBA==
X-Google-Smtp-Source: APBJJlGBwuPstbutB+IkbPX25yNNFRmdOu4OL0BAi99Vr9I6DexH+HyJvcMU4nbcEcueq2liwPqfNg==
X-Received: by 2002:a05:6e02:214f:b0:340:54f1:35dc with SMTP id d15-20020a056e02214f00b0034054f135dcmr4512585ilv.18.1690426966758;
        Wed, 26 Jul 2023 20:02:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::3e6c])
        by smtp.gmail.com with ESMTPSA id x18-20020aa793b2000000b0064928cb5f03sm316525pff.69.2023.07.26.20.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:02:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-python][PATCH] python3-pyaudio: Fix cross builds
Date: Wed, 26 Jul 2023 20:02:43 -0700
Message-ID: <20230727030243.182987-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 03:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104045

Do not poison include paths with build system include and lib dirs
these paths get appended to cflags/ldflags when building the c extention

Fixes
| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/python3-pyaudio/0.2.13-r0/recipe-sysroot/usr/include/python3.11/pyconfig.h:23:10: fatal error: 'python3.11/pyconfig-32.h' file not found
|    23 | #include <python3.11/pyconfig-32.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...paths-into-build-machine-system-dirs.patch | 28 +++++++++++++++++++
 .../python/python3-pyaudio_0.2.13.bb          |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyaudio/0001-Remove-absolute-paths-into-build-machine-system-dirs.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio/0001-Remove-absolute-paths-into-build-machine-system-dirs.patch b/meta-python/recipes-devtools/python/python3-pyaudio/0001-Remove-absolute-paths-into-build-machine-system-dirs.patch
new file mode 100644
index 0000000000..a71902a362
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyaudio/0001-Remove-absolute-paths-into-build-machine-system-dirs.patch
@@ -0,0 +1,28 @@
+From d94518b558c1812aecb87d8ef19d75c2df1b98a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jul 2023 19:54:19 -0700
+Subject: [PATCH] Remove absolute paths into build machine system dirs
+
+This ensures that it does not add /usr/include and /usr/local/include/
+into cflags
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+--- a/setup.py
++++ b/setup.py
+@@ -111,11 +111,6 @@ def setup_extension():
+         # the standard portaudio cmake settings. For details, see:
+         # https://devblogs.microsoft.com/cppblog/vcpkg-updates-static-linking-is-now-available/
+         extra_compile_args += ["/MT"]
+-    else:
+-        # GNU/Linux and other posix-like OSes will dynamically link to
+-        # portaudio, installed by the package manager.
+-        include_dirs += ['/usr/local/include', '/usr/include']
+-        external_libraries_path += ['/usr/local/lib', '/usr/lib']
+ 
+     return Extension(
+         'pyaudio._portaudio',
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
index dbeed9c2d8..1f0b5cf6e8 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.13.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "26bccc81e4243d1c0ff5487e6b481de6329fcd65c79365c267cef38f36
 
 inherit pypi setuptools3
 
+SRC_URI += "file://0001-Remove-absolute-paths-into-build-machine-system-dirs.patch"
+
 DEPENDS += "portaudio-v19"
 
 RDEPENDS:${PN} += "portaudio-v19"
-- 
2.41.0


