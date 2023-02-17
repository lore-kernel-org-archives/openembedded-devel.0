Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774B1C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 20:42:15 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.5661.1676666529031194498
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 12:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BzqgddO8;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id l11so9321218edb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 12:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3X1RN2HuWV2BYQFKk7r5PW33lvxWF0CakWg/Eho+x3k=;
        b=BzqgddO8lTmI33pyhdaIWjnsrGQ0M5n75MLxqD0gVB35Rnrjx+yleVBPWDtlzA5Rus
         6DroEe6bYpafOBbikWBragkhmwEoc/BRUTjrV7/5SxXkOYrp7AsRtkYe3k7t3GSRXpxM
         J+Z6NE3+OpAtnKP3wY+iKkEr6mHwoD21oTosvynRR5DDGSCTcKk6p246gfN63yPoa6md
         TceZPijjhBFFc7UWwsv2zRkR24sZ+N6vaPA3Fqjf0o3ZWqmYionTKqSqQWRIAO3pUH8x
         wiViDOfJ4rjHqm4teNHm8qksO3G/QDoqcoNkkbMR3T3fltvYjfs9mtau7NIHIyqQ7xVL
         laeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X1RN2HuWV2BYQFKk7r5PW33lvxWF0CakWg/Eho+x3k=;
        b=JBO1wpX1jzjq1IfU1oFR0A3K0q7ldQBXCKT8q86O90EGIt06sd+zYCWgpPQ8OrEyX9
         v00i71CRRfsKrZlByxsLc/Lw7Cz2dvkW0LZPwHyKeFdKBmkXNNKPYfJ4JthlHXnsfWMc
         5E4EqVGqjqDvTTeAZxjyN6YmiHUpbffHZud9TedT2SkLhEb/Z83fMOrpdue0DHs7JSVP
         MGvqgFMrOFMK+A9nVnnaGlqGXhAx11uXCl35YXHivC8KIp+ZayzZ1Iy1tAC9LNhcgDbl
         VVWU+7Zk143/JCCsmzgT1/jTfnYslO5bYld+50UUpDyLUnQx8yE4YU8yJznw/KA6yc6S
         axRA==
X-Gm-Message-State: AO0yUKV1RuuqeoBxqra3I3Edl5Rz4bAKW9pXsIQABGjIr8xM1yw7tse0
	pkaWO6xbtHT/8dwKbFfRdeijoNhhRB4=
X-Google-Smtp-Source: AK7set/uW7Z6gJsFbv1pJHXwuS1aUzSX1QjTBOzvL4dP+uzdonDBmNu2p3rzGyH8kdYOoAErJ6cnYA==
X-Received: by 2002:a17:906:b84c:b0:878:7c18:8fd9 with SMTP id ga12-20020a170906b84c00b008787c188fd9mr1717139ejb.44.1676666527223;
        Fri, 17 Feb 2023 12:42:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090635d200b0087fa83790d8sm2570963ejb.13.2023.02.17.12.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:42:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: add Upstream-Status
Date: Fri, 17 Feb 2023 21:41:51 +0100
Message-Id: <20230217204152.3902725-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 20:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101123

* unfortunately all 3 have very long unclear history, I've tried to at least partially
  document in commit message

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...e-running-gyp-files-for-bundled-deps.patch | 26 +++++++++++++++++++
 .../nodejs/0001-Using-native-binaries.patch   |  7 +++++
 .../nodejs/nodejs/mips-less-memory.patch      |  5 ++++
 3 files changed, 38 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index d6e439ba22..e949c635b0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -3,6 +3,32 @@ From: Zuzana Svetlikova <zsvetlik@redhat.com>
 Date: Thu, 27 Apr 2017 14:25:42 +0200
 Subject: [PATCH] Disable running gyp on shared deps
 
+Upstream-Status: Inappropriate [embedded specific]
+
+Probably imported from:
+https://src.fedoraproject.org/rpms/nodejs/c/41af04f2a3c050fb44628e91ac65fd225b927acb?branch=22609d8c1bfeaa21fe0057645af20b3a2ccc7f53
+which is probably based on dont-run-gyp-files-for-bundled-deps.patch added in:
+https://github.com/alpinelinux/aports/commit/6662eb3199902e8451fb20dce82554ad96f796bb
+
+We also explicitly prune some dependencies from source in the bitbake recipe:
+
+python prune_sources() {
+    import shutil
+
+    shutil.rmtree(d.getVar('S') + '/deps/openssl')
+    if 'ares' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/cares')
+    if 'brotli' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/brotli')
+    if 'libuv' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/uv')
+    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/nghttp2')
+    if 'zlib' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/zlib')
+}
+do_unpack[postfuncs] += "prune_sources"
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
index feafe38fdb..66e10a0d00 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
@@ -3,6 +3,13 @@ From: Guillaume Burel <guillaume.burel@stormshield.eu>
 Date: Fri, 3 Jan 2020 11:25:54 +0100
 Subject: [PATCH] Using native binaries
 
+Upstream-Status: Inappropriate [embedded specific]
+
+Originally added in:
+https://git.openembedded.org/meta-openembedded/commit/?id=1c8e4a679ae382f953b2e5c7a4966a4646314f3e
+later extended and renamed in:
+https://git.openembedded.org/meta-openembedded/commit/?id=feeb172d1a8bf010490d22b8df9448b20d9d2aed
+
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
  node.gyp                 | 1 +
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
index 56e93c50cf..16776cb762 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
@@ -6,6 +6,11 @@ Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=10586
 This ensures that we reserve 500M instead of 2G range for codegen
 ensures that qemu-mips can allocate such large ranges
 
+Upstream-Status: Inappropriate [embedded specific]
+
+Imported from debian https://salsa.debian.org/js-team/nodejs/-/blob/master-12.x/debian/patches/mips-less-memory.patch
+https://buildd.debian.org/status/fetch.php?pkg=nodejs&arch=mipsel&ver=12.17.0~dfsg-2&stamp=1591050388&raw=0
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/deps/v8/src/common/globals.h
-- 
2.39.2


