Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6A5C7EE43
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9084.1685521595096863509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jHdmqjSG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30ac4e7f37bso3814368f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521593; x=1688113593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwOl3g37Tki+n1HCUYiYr9C+Dvn7Z1DhffeyDbjk9YM=;
        b=jHdmqjSGV2odb2ilzSI/Su+V08OFhaNInFdMZpm6tbwoelMGVu748ewBcm/eZm5DUt
         Q4oZCWwZ2pfZbbdWmhfdrsHSsz/hZziE9Ry5LXC7suSEFt18fURaB3gJJc4xw6/Dofh7
         J4gsyttBaPrYaXpyA60Kz2xaDWMXwMStyrudmRyV3/SKTe9slcVv4GEsvSZWIS1uoA10
         Isn2kS4ugblSOVQhQq9aY8CZuBZq7J9Z281fWSHwP8SbfhEGP6oD0rOpTBj0GQxQVmYz
         xxr+SptwDuNtvKZ+UNoE7dc7UT6w08gHL/fSxZX25I8QBWNxlkEpdinpkp21Juonzhcb
         cOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521593; x=1688113593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwOl3g37Tki+n1HCUYiYr9C+Dvn7Z1DhffeyDbjk9YM=;
        b=Y279gII0/8s03xs8EodRNHbDQEjRtMCyZKi0G7KrpwP19rWD3h3kV60RTVv7NxBog7
         nnquE+xi7i6o+X3tM73xe/EONHh5pXtOY+pZOl9Lw6soXg37wblt6JWSh4g8FI9m6NLl
         dsE6RykhY+Bg9DcxCOkLK03rjURS9HNPUOV3jauXa73pzYkGOfEORKpiMX+DdnkaiCS7
         8aS4USXmeT/GgfU8XS1PxrJa/0vJmSYlyLQSvh/aldN0j0SmzU9Rcd8klFjxzygbQGZv
         Ac2gZwtUMOp8Qqh2mTgeOzlc5dGUjWXYpETmcYT74KnA5U5eGFEyTzgorTNjDoOLjrw+
         xDvA==
X-Gm-Message-State: AC+VfDxhrvuke6TgAUrvZymgzwnzls192A9mxyfzCCFtuZ4B46Z8Q6zD
	db6GijCnriY3qmj1NzGHtmw1vQ==
X-Google-Smtp-Source: ACHHUZ6Rz/DXgfa2ti+WB6MgJGHfvnKoTQGgGWG8IccIQ9DtD4e/W+GSBxXfq5DptRC2L6MmVHghsA==
X-Received: by 2002:adf:ef87:0:b0:309:4ba8:86a0 with SMTP id d7-20020adfef87000000b003094ba886a0mr3293959wro.17.1685521593695;
        Wed, 31 May 2023 01:26:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 078/149] python3-pynetlinux: fix relative imports
Date: Wed, 31 May 2023 10:23:26 +0200
Message-Id: <20230531082437.10646-79-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103005

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Pull in a patch from upstream that addresses an issue with relative
imports.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../0002-Fixed-relative-imports.patch         | 60 +++++++++++++++++++
 .../python/python3-pynetlinux_1.1.bb          |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch

diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
new file mode 100644
index 000000000..9b5d9d636
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0002-Fixed-relative-imports.patch
@@ -0,0 +1,60 @@
+From afb778669efbc658a29e6bdb1c4834fee42931aa Mon Sep 17 00:00:00 2001
+From: Robert Grant <rgrant@mdi.us.com>
+Date: Wed, 10 Sep 2014 14:56:33 -0400
+Subject: [PATCH] Fixed relative imports
+
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+---
+Upstream-Status: Accepted
+
+ pynetlinux/__init__.py | 8 ++++----
+ pynetlinux/brctl.py    | 2 +-
+ pynetlinux/tap.py      | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/pynetlinux/__init__.py b/pynetlinux/__init__.py
+index dbbf392..b6e1b8e 100644
+--- a/pynetlinux/__init__.py
++++ b/pynetlinux/__init__.py
+@@ -2,7 +2,7 @@
+ #   import pylinux
+ # does a reasonable thing.
+ 
+-import brctl
+-import ifconfig
+-import tap
+-import route
++from . import brctl
++from . import ifconfig
++from . import tap
++from . import route
+diff --git a/pynetlinux/brctl.py b/pynetlinux/brctl.py
+index f54d176..a8b926e 100644
+--- a/pynetlinux/brctl.py
++++ b/pynetlinux/brctl.py
+@@ -3,7 +3,7 @@ import fcntl
+ import os
+ import struct
+ 
+-import ifconfig
++from . import ifconfig
+ 
+ SYSFS_NET_PATH = "/sys/class/net"
+ 
+diff --git a/pynetlinux/tap.py b/pynetlinux/tap.py
+index 0a0d59c..3f8ad3a 100644
+--- a/pynetlinux/tap.py
++++ b/pynetlinux/tap.py
+@@ -2,7 +2,7 @@ import fcntl
+ import os
+ import struct
+ 
+-import ifconfig
++from . import ifconfig
+ 
+ # From linux/if_tun.h
+ 
+-- 
+2.39.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
index a5ac74fd6..c6ab07448 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
 
 SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
 
-SRC_URI += "file://0001-setup.py-switch-to-setuptools.patch"
+SRC_URI += " \
+    file://0001-setup.py-switch-to-setuptools.patch \
+    file://0002-Fixed-relative-imports.patch \
+"
 
 inherit pypi setuptools3
-- 
2.39.2


