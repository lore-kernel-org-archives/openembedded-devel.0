Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2581C77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 06:20:27 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.43431.1684304425003923083
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 23:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JPNoOWdy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-969f90d71d4so48051566b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 23:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684304423; x=1686896423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJmu4JYLTcAxhxd7jUfI+7WYcZog+EEGDfWU1yEnGsk=;
        b=JPNoOWdyH238JRg0XcO9lTPHdzAUXSALMHcsUgUUDyWh769OZAWKiZLn3leVWCS+Q0
         q8VwYG7U3CkUdVhgSIbshKmlH3pPxPBZRRMOV4Sbvs8NDsjS2OjyYAdLR8IrSoLSnQ07
         bJu6myH9e4YIiGKYpt7fmCruDdFLbtTgbgWHVeVSxGYq5TjQ3i83fpketYHyaeb4wFEe
         UgM26l6IGmJgi2uYqyUQfQtNNYAqA1XDkpbZ3kwgrMNgpjIa11OBn14qqp893ugFnFVX
         e/V4Ic98+TmUHc4GTpVrekgCrVlY+Av1RKY/ZuJvS9zR/UgVd0SWo8xFXYHNPDALu5b3
         A3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684304423; x=1686896423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJmu4JYLTcAxhxd7jUfI+7WYcZog+EEGDfWU1yEnGsk=;
        b=iGzvX+rNjPyk+8ot8O0oc3t/tdmKRKVY2bbnbHKrV5kIp4ID9mtxMK2Fl1Cyp/weRp
         hq1mF9+8hVV2ughoWrS+pJWZxp451wki6aQyJqwCPRPadiwS2irGxdQbOvdMMS4wGzpv
         2AYrWlsrlFOt7bMpXZwTqRPCvfOq0lVjXdUzFAJc/ZYizlCT0QLTLYo4cqXXsj+bAY2p
         FBEUP5pPbdKXAKwLIjldi0eWfxZeJCTKRqqXL+6Sp0MC7Hf2MrS1XIkQ3FLu+FMF7uPn
         A2oY46Bv5xyf+MV7H3GOItiBBGur8b7Y28CuDiK/JFcYX5fdX8WB9T1Y6MMBQel2GY2i
         +40w==
X-Gm-Message-State: AC+VfDzKHA1ZYgFSgOY8SK3kJC9J25SmONw5DLcbycv6wuE4FwuX0gn4
	Hnzg9A4AXnXqCCiBRiGizdJpMEZ0OCo=
X-Google-Smtp-Source: ACHHUZ5VdpwLYCaB61xquOu0T3jkK3wpbxm/LBl3wnSE2ZUDSTRngY4XDonnhzDJf50d6obM6SwNIA==
X-Received: by 2002:a17:906:da88:b0:93a:353d:e38b with SMTP id xh8-20020a170906da8800b0093a353de38bmr37716739ejb.37.1684304423182;
        Tue, 16 May 2023 23:20:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090660d400b00965ac8f8a3dsm11983141ejk.173.2023.05.16.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 23:20:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] nodejs: fix native node-gyp to work with python-3.11
Date: Wed, 17 May 2023 08:20:19 +0200
Message-Id: <20230517062019.97793-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 06:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102641

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nodejs/python-3.11-invalid-mode-rU.patch  | 46 +++++++++++++++++++
 .../nodejs/nodejs_12.22.12.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/python-3.11-invalid-mode-rU.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/python-3.11-invalid-mode-rU.patch b/meta-oe/recipes-devtools/nodejs/nodejs/python-3.11-invalid-mode-rU.patch
new file mode 100644
index 0000000000..588ffc1eee
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/python-3.11-invalid-mode-rU.patch
@@ -0,0 +1,46 @@
+From e4d6f2e4091a4c7b6f3281be0e281b32ee6e5a33 Mon Sep 17 00:00:00 2001
+From: Christian Clauss <cclauss@me.com>
+Date: Thu, 26 Nov 2020 12:39:11 +0100
+Subject: [PATCH] Fix ValueError: invalid mode: 'rU' while trying to load
+ binding.gyp
+
+Fixes nodejs/node-gyp#2219
+File mode `U` is deprecated in Python 3 https://docs.python.org/3/library/functions.html#open
+https://github.com/asottile/pyupgrade#redundant-open-modes
+
+Upstream-Status: Backport [https://github.com/nodejs/gyp-next/commit/3f8cb33ea4d191df41f4fb7a1dfbd302507f7260]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 2 +-
+ tools/gyp/pylib/gyp/input.py                          | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
+index d174280..2f34bc0 100644
+--- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
++++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
+@@ -226,7 +226,7 @@ def LoadOneBuildFile(build_file_path, data, aux_data, includes,
+     # Open the build file for read ('r') with universal-newlines mode ('U')
+     # to make sure platform specific newlines ('\r\n' or '\r') are converted to '\n'
+     # which otherwise will fail eval()
+-    if sys.platform == 'zos':
++    if PY3 or sys.platform == 'zos':
+       # On z/OS, universal-newlines mode treats the file as an ascii file. But since
+       # node-gyp produces ebcdic files, do not use that mode.
+       build_file_contents = open(build_file_path, 'r').read()
+diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.py
+index 1f40abb..fd12e78 100644
+--- a/tools/gyp/pylib/gyp/input.py
++++ b/tools/gyp/pylib/gyp/input.py
+@@ -226,7 +226,7 @@ def LoadOneBuildFile(build_file_path, data, aux_data, includes,
+     # Open the build file for read ('r') with universal-newlines mode ('U')
+     # to make sure platform specific newlines ('\r\n' or '\r') are converted to '\n'
+     # which otherwise will fail eval()
+-    if sys.platform == 'zos':
++    if PY3 or sys.platform == 'zos':
+       # On z/OS, universal-newlines mode treats the file as an ascii file. But since
+       # node-gyp produces ebcdic files, do not use that mode.
+       build_file_contents = open(build_file_path, 'r').read()
+-- 
+2.38.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index 3ededae562..c1d66eeffb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2022-35255.patch \
            file://CVE-2022-43548.patch \
            file://CVE-llhttp.patch \
+           file://python-3.11-invalid-mode-rU.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.40.1


