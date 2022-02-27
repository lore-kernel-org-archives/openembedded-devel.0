Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB098C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 20:09:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.12429.1645992555060991800
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 12:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A62qGVI6;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so12999268pjt.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 12:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLa922VCaV/+cwAo43QpxxV7rH+PbnI63M4m9AV+AVY=;
        b=A62qGVI6rdwXCqG5lZLUMU1H+F6F6h+BYPcHNpXS85Dq6uvZXaumX/+Zsk+ivqu/SG
         gUSPFqRU+GFvUj3b7KDzEXYfA6kqZLRV2fPq6c/9bHwGACirlFIneCrfpdywFW1gVTQq
         IrdGsTn4TjIjZlN8CfpggakeNthutH5GTs92ZfRZKyjPZczPR/rcrhR35Kk3OA9m8tCe
         0wnP6BDSmKjW42l1jcT4DXe3lHt+ON4pyai4eYN3DGcwlCgMs2oVYbBOsq5CyEGQaY5T
         ycHTL1Ps0XXWYG3WwBX9t0HYYlslvqw+YNZqtkhO9V8oBOPm5mqUHm4ealO4eaVofhd3
         9mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLa922VCaV/+cwAo43QpxxV7rH+PbnI63M4m9AV+AVY=;
        b=CAHZVE1f59DnyqGoXjZQYDXehez4sLoBQq+PNm6EutWeN7etJVv7/N3O3apNU/Nfu9
         Arssyi/7qoEL5WNe52v3zB1pQ144nt+ux/0sRWCXWjtCK3XVZIq+XwxL8wyT12dFfRAC
         lACydo5NS4+RXxpBbmP7/HitpE2U3CY2rfndhU44p3C/SCvCfjAFpW0gwEGrecoSsWpr
         /Uw7bMzEINDwR9djZ+e7BfnQ424x94spDE60fKFb0peJ460/LTsjD30OwOLVKf5MnwDa
         YPGOj4TlXHI/rHNehvc8wB0FuEp+50r5Jg9DGXogXfNzBU5xDqXnADDIIs4pzP+9TGlx
         Borw==
X-Gm-Message-State: AOAM533CoL7gKx+GiqPahjoaiPH9+0jNowjBSf7Tin5YWxPOeL1wRWy/
	QWbY65z5kzB7EJgo4dZK8kuRnu7jY/E=
X-Google-Smtp-Source: 
 ABdhPJw0L2gdorY0QH5Q4e+w9KqBgSDQLdx6YnYolej2wtgNyPThlglXdj7IqfvZ9LqI2OoZRHCqKg==
X-Received: by 2002:a17:902:6b06:b0:14d:8b58:5432 with SMTP id
 o6-20020a1709026b0600b0014d8b585432mr17375439plk.75.1645992553942;
        Sun, 27 Feb 2022 12:09:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm10536581pfh.84.2022.02.27.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 12:09:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-systemd: patch to use setuptools
Date: Sun, 27 Feb 2022 12:09:09 -0800
Message-Id: <20220227200909.416560-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 20:09:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95562

setup.py bdist_wheel does not work with ditutils (which is deprecated
anyway). Add a patch to switch to setuptools to allow wheel to be built.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-switch-from-distutils-to-setuptools.patch | 30 +++++++++++++++++++
 .../python/python3-systemd_234.bb             |  5 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-devtools/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.patch
new file mode 100644
index 0000000000..b3180f29f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.patch
@@ -0,0 +1,30 @@
+From a681a79472df85cdc8c052bc61fb8b9e7b9a6495 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Sun, 27 Feb 2022 11:50:36 -0800
+Subject: [PATCH] setup.py: switch from distutils to setuptools
+
+In Python 3.10, distutils is deprecated and slated for removal in Python
+3.12. It also prevents 'setup.py bdist_wheel' from building a wheel.
+
+Upstream-Status: Submitted
+[https://github.com/systemd/python-systemd/pull/103]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 099819b..fe9c03a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,5 +1,5 @@
+ import sys, os
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ from subprocess import Popen, PIPE, check_output
+ 
+ def call(*cmd):
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index cbc9f44bc7..1aecb375bf 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -15,6 +15,9 @@ SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895
 # allow for common patches for python- and python3-systemd
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-systemd:"
 
-SRC_URI += "file://endian.patch"
+SRC_URI += " \
+    file://endian.patch \
+    file://0002-setup.py-switch-from-distutils-to-setuptools.patch \
+"
 
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
-- 
2.30.2


