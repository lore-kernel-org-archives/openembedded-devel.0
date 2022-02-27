Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C32C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 19:45:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.12492.1645991119268294017
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 11:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BDEVYFKd;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z2so8967907plg.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 11:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us2MihzjOBB6o22LsCq7OFc2AHAQSOxcnRk9gEd69+I=;
        b=BDEVYFKdJGvepMh7xN6RA/UJgsl7Fv0NYveNI0+fefWqfjZiCs4d/C3w33tY1W+aE2
         028l8rYzzzRKABrbysmfcxNsuYeUkVr7qDFdxcisyeFSRBi5/IpGjvT76t00K1hTxwEM
         t8My4Zl8mbtrhNL4EDj0bVx2sA0X2FNzV1G2fN4Nlr26huxd8bkfiRtOGkzIKMW5a42U
         zPVmvmDAdYLLiWZvtYHG23Rpdr8BNCtz2r/huxubPtAC5nM02xCrSmfRE/nM32lO+bpL
         hW7Zz6js4TwCmK6xWXkHL4bMztP05aTJZXu4gPs11q+CbiIN1zU8wfkho702N7Lp0l3o
         H4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us2MihzjOBB6o22LsCq7OFc2AHAQSOxcnRk9gEd69+I=;
        b=2kwmcEUBdfl3e4inweMGzxXUIyYw6VvVSO+JMLaFBLRuwotYGcBr3Xh+z9qT7id52V
         XAbSlRUbITZ5UdghRp9orS6QgoLXXONXMrYQfsOxNBKiZrjKN4BC4Dl67mEioH8rExk1
         lMEAtjnJOZyZ/HY7BjQhAkZgdjTHV7fMKpfAlJmLUEjr18oxBGfWwF7bGB4vl72BYjsq
         itNvkhWk8yN4BJuRkPoBHiUYdj9ZAmwavk4pqKdy5Va4wJh7NSILUdUr9BIllcx7ZDbs
         74BJN7/yUm8tZWddGUcXaiT6Ln+0K9hS52VIAk8O/2qEKddaMdXHN6bX+vM+9UEEG74c
         hsOA==
X-Gm-Message-State: AOAM531cGAiJ1uyuwXL8BNPjYj4KQpyz+KBYKWlNjks929O4HUb5feJT
	OG0crq0+Ia0icr7aYPHXeQrCJ7a8kxs=
X-Google-Smtp-Source: 
 ABdhPJxIyIDbKyWmMsQjqu43cCDqInqJdTZQvwTIfpFUinlM1ySdqxOqKlbtVWPCMClogTPTlJm7CQ==
X-Received: by 2002:a17:903:110d:b0:14d:ca32:cae9 with SMTP id
 n13-20020a170903110d00b0014dca32cae9mr17167211plh.30.1645991118321;
        Sun, 27 Feb 2022 11:45:18 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a056a001a4500b004e177b8cbfdsm10502532pfv.197.2022.02.27.11.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 11:45:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-twofish: patch to use setuptools
Date: Sun, 27 Feb 2022 11:45:11 -0800
Message-Id: <20220227194511.384330-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 19:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95561

setup.py bdist_wheel does not work with distutils (which is deprecated
anyway). Add a patch to switch to setuptools to allow wheel to be built.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0002-setup.py-switch-to-setuptools.patch  | 26 +++++++++++++++++++
 .../python/python3-twofish_0.3.0.bb           |  6 +++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch
new file mode 100644
index 0000000000..99e5c6c517
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twofish/0002-setup.py-switch-to-setuptools.patch
@@ -0,0 +1,26 @@
+From fe10781bd15ed7a5c384dbf121f78f129995aa8f Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Sun, 27 Feb 2022 11:02:36 -0800
+Subject: [PATCH] setup.py: switch to setuptools
+
+Upstream-Status: Submitted
+[https://github.com/keybase/python-twofish/pull/9]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index fcc9546..bfc3273 100644
+--- a/setup.py
++++ b/setup.py
+@@ -8,7 +8,7 @@ Copyright (c) 2013 Keybase
+ setup.py - build and package info
+ """
+ 
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ 
+ twofish_module = Extension('_twofish',
+                           sources=['twofish-0.3/twofish.c', 'twofish.c'],
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
index 94fb71090e..f45772d507 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -5,9 +5,11 @@ HOMEPAGE = "http://github.com/keybase/python-twofish"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
 
-SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
+SRC_URI += " \
+    file://0001-Fix-missing-return-statements-in-module-stubs.patch \
+    file://0002-setup.py-switch-to-setuptools.patch \
+"
 
-SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
 SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
 
 inherit pypi setuptools3
-- 
2.30.2


