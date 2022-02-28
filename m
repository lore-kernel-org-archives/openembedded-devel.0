Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D5C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:03:48 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.867.1646071427114277953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQeZQH7d;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u2so3851601ple.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FjmT6u8KC2Qsnz8qHdM7JayHCDoCuXZrovamr0mTmwk=;
        b=lQeZQH7dM5jSzYdeERJrJKrZg916MmJ4HifWaXJg8xWiv5xilChsJFkBNarTx7BkqM
         0igQ1ZZQbev7WQv68Tx5pFBwVHpqvWORot1HKGzbdRqAQfgdFujc0o2s21RoZIf8Rw5V
         Wa0r7katcTZeXD4YaJIVF6FGhAwjpEVp/m857zu2hOfTqWpo7lqnarabl0oLj/u0L8q6
         oOQ/6m1YHpK67K6vl1IcZKrTsVxrRmjI8Q9uHNGIjvKSO67o0JyYmCCrf28weVzCJ4KQ
         L5cRIHfL0jkuAVfX/bIXb8S7Ci6Q1C18VOj/xfVNUZLCR9S71UJ/zuJMikfa+xdljxRS
         eAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FjmT6u8KC2Qsnz8qHdM7JayHCDoCuXZrovamr0mTmwk=;
        b=JKrIaiNbLYD97/xX455Wz71bM7POY6TA7BNY91y+cCN7CQwvrpuY+aLWAyXAghdsdS
         YKy5ASdcGkJSqg35FRzLATnV/LtxHbTf/K8JJAlKHOyjY7gwDK1OpAvfDdj8txku5VU7
         z0cVQ+SAyjr4dK36lMxjYGgm+pBRD8y5BYmbNuCNVo2wwDuVbvOgAY6s7xDVZ/UncFj8
         X3lbZqOKsxxBt6Wf+9gJTd00SONwyhc8Crs5yG522vtuM8safSzHhchD8hNjzx8ELjQ7
         KMozpd/v8ckL8MELZ7oyQHAmlNx5oS1vOA+f9UIdJxoS5vCetrxurhB9qOrA8LTeH7GE
         rlqg==
X-Gm-Message-State: AOAM530ISpGZFt/6Kw+IJ9XkvYMhPxhgZO9dbPsJwK5JZqckjbMSO8yC
	ycMp3AEolV1vx2Us6AGGffNXiCFZV2M=
X-Google-Smtp-Source: 
 ABdhPJzfT+jDlPTANpMv4zMPriYa+ZT7GpKgg9NkZY2LuckaX8DBUI4dkj/8E2TlOT7/igtyjhFEGQ==
X-Received: by 2002:a17:902:a613:b0:151:7d6d:aa69 with SMTP id
 u19-20020a170902a61300b001517d6daa69mr282303plq.89.1646071426187;
        Mon, 28 Feb 2022 10:03:46 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:197f:1785:dac1:56d3])
        by smtp.gmail.com with ESMTPSA id
 c72-20020a624e4b000000b004f3ff3a3fb2sm6022853pfb.118.2022.02.28.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 10:03:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-meh: patch to use setuptools
Date: Mon, 28 Feb 2022 10:03:39 -0800
Message-Id: <20220228180339.1286220-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 18:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95590

* Add patch to switch from 'distutils' to 'setuptools'
* Set PIP_INSTALL_PACKAGE = "python_meh"
* Install files to ${datadir} as intended

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-switch-from-distutils-to-setuptools.patch | 32 +++++++++++++++++++
 .../python-meh/python3-meh_0.50.1.bb          | 11 ++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch

diff --git a/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
new file mode 100644
index 0000000000..b616b3fad3
--- /dev/null
+++ b/meta-python/recipes-extended/python-meh/python3-meh/0001-setup.py-switch-from-distutils-to-setuptools.patch
@@ -0,0 +1,32 @@
+From 034ac41561409ffc7836683331b6b94a641436e4 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Mon, 28 Feb 2022 09:41:02 -0800
+Subject: [PATCH] setup.py: switch from distutils to setuptools
+
+In Python 3.10 'distutils' is deprecated with removal slated for Python
+3.12. Switch from 'distutils.core' to 'setuptools'.
+
+This also allows for a 'wheel' binary archive format to be built with
+'setup.py bdist_wheel'.
+
+Upstream-Status: Submitted
+[https://github.com/rhinstaller/python-meh/pull/37]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 9c12180..3ba5195 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,6 +1,6 @@
+ #!/usr/bin/python3
+ 
+-from distutils.core import setup
++from setuptools import setup
+ 
+ setup(name='python-meh', version='0.50.1',
+       description='Python module for handling exceptions',
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
index bf0df021a4..96dba96123 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
@@ -9,8 +9,17 @@ inherit setuptools3
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=rhel9-branch"
+SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=rhel9-branch \
+           file://0001-setup.py-switch-from-distutils-to-setuptools.patch \
+          "
 SRCREV = "c321ce22950aff76611a3c6beffa02b5ea3adbed"
 
+PIP_INSTALL_PACKAGE = "python_meh"
+
+do_install:append () {
+    install -d ${D}/${datadir}/python-meh
+    mv ${D}${PYTHON_SITEPACKAGES_DIR}${datadir}/python-meh/* ${D}/${datadir}/python-meh/
+}
+
 FILES:${PN} += "${datadir}/*"
 
-- 
2.30.2


