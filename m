Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0482C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:18:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21558.1646065102495298130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IbfRcY2f;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y11so11414670pfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6d5KLPSpPrHGX1C7pjOv7F3yJXSmT3wuCP51K4oSL4=;
        b=IbfRcY2fA34bwTaMKnnhQapzSltB2Oke1QVSS/2PGHOfC2LjZ3jO28LUU3CQBRJyAQ
         bQ27+Nu14ofreTzBvcdR3mgvPtZ5k+9YCRIA8we7p3mwR0qTmzC2gMEuVyFA0MYtpzyD
         8i46hHjaEK2TKARNIKsxFsFXLWvUZJi94fR3kVObeLV3fu7DWNQ2zA8FnjvAitfj8yct
         FX5LWF9EPtriEzpCehs49SCtg4ry0YeqD6RK6g9Cq+B66vYDE+vP4mz9aGozuwQsGgrx
         lz2/dTqsgVKgJh8By0ncsd1debBOQMQ8qzNS19JGfSmlWMSMzmdO9WLTh9DHPXntxE0E
         wpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6d5KLPSpPrHGX1C7pjOv7F3yJXSmT3wuCP51K4oSL4=;
        b=MG7Q6hnwgAxQf/aXCfleIeop9olMNEJr2QHMebAAGRlLD0bqz7kRm8+IX54hiupNd+
         f0Qcq93w8/5v+MKsQbm2SjwNsTgbxfLlqEdX/SP6aKW5zyVLZYopMQhQ9vRrT8qf6CUe
         blDrWgSCLbI2JErowii4PUikTL1MXPrSMkEUUMqJRRs7IQHSnIhdTD7D8DeidXckQlM/
         /5K5HwAO8DquaoGYgyKMqT/78Nfh65xonlH+b+8ttWwOkHCnRcLozhOQ2G7sJGtTqgXR
         WoJIx5j6xNUa0tfODDPJQga0qoWKD6bIEWptiyjxeEYev29c6KzZ/lnRymzs6TMoNUMR
         3yeA==
X-Gm-Message-State: AOAM532O9FQm1uex6ZuZ7y6Cs449dxWtmAcG8V/gVIHEpwhSb43Ce3cJ
	LTXx7UsTksNQXQiwxeyxAZqdFDK3RnI=
X-Google-Smtp-Source: 
 ABdhPJwExmQ9CZuAd79xAzGrmrXWe2CZfFsDZMWXPyQD5Y8fYoAoZ4Oy4423t4GXj1pJm0EeGuR5Ng==
X-Received: by 2002:a65:6803:0:b0:378:9366:3849 with SMTP id
 l3-20020a656803000000b0037893663849mr5369013pgt.484.1646065101536;
        Mon, 28 Feb 2022 08:18:21 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00084a00b004f26d3f5d8fsm14053668pfk.25.2022.02.28.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:18:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-sdnotify: patch to use setuptools
Date: Mon, 28 Feb 2022 08:18:16 -0800
Message-Id: <20220228161816.1259930-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 16:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95587

setup.py bdist_wheel does not work with distutils (which is deprecated
anyway). Add a patch to switch to setuptools to allow the wheel to be
built.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-setup.py-switch-to-setuptools.patch  | 31 +++++++++++++++++++
 .../python/python3-sdnotify_0.3.2.bb          |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-sdnotify/0001-setup.py-switch-to-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-sdnotify/0001-setup.py-switch-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-sdnotify/0001-setup.py-switch-to-setuptools.patch
new file mode 100644
index 0000000000..cf7696aa63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sdnotify/0001-setup.py-switch-to-setuptools.patch
@@ -0,0 +1,31 @@
+From f662280b26eb1549890e88e8e9085f1937d7962d Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Mon, 28 Feb 2022 07:54:03 -0800
+Subject: [PATCH] setup.py: switch to setuptools
+
+In Python 3.10, 'distutils' is deprecated and is slated for removal in
+Python 3.12.
+
+Switch from distutils.core to setuptools. This also allows the 'wheel'
+binary archive format to be built with 'setup.py bdist_wheel'.
+
+Upstream-Status: Submitted [https://github.com/bb4242/sdnotify/pull/7]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 433222c..32b5bd6 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,4 +1,4 @@
+-from distutils.core import setup
++from setuptools import setup
+ 
+ VERSION='0.3.2'
+ 
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
index 221a8c8717..dc1961ac30 100644
--- a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.2.bb
@@ -12,7 +12,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
 
-SRC_URI[md5sum] = "749ddca1c70be1697fecc443fb1fdb16"
 SRC_URI[sha256sum] = "73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1"
 
+SRC_URI += "file://0001-setup.py-switch-to-setuptools.patch"
+
 inherit setuptools3 pypi
-- 
2.30.2


