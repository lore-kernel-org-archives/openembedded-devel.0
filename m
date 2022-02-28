Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:33:16 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.22259.1646065995778548425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IboM+lXL;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso15242324pjj.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4VMutE5IQxE9K4fuqYJoy4khiPBMKih6YNUTGjSVNk=;
        b=IboM+lXLr7ixRC9OI7LobVcPaa8Y1SZBW38MbWYA9evtvo319l7EyBF8018u+p3XJC
         a48A93C6n5bzn42GSfyKnnSckZIBGcYVrb1rBNyt4Qe2V3bvstYb2nfIC3a7E5ZY7aBo
         ZYAYdw5V2T4ryFOd2Eap1RtnXQoZzee4YrbZL3Z8OwHJ5pAiiTV8wsCrmI1EhypAp9KD
         kDaw65nAR9K/d68F6p8HLNeX7BpGMcbyqJmFl95Z/HhRS8woQGujNgyxJsuiGmJc5ieN
         +6Uo7qDW+WxrAydGpwemEwOODOJanPO0Ipt6Y26VzMd+Qj0tmaXbdA4dA5yAmsCck0CR
         pUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4VMutE5IQxE9K4fuqYJoy4khiPBMKih6YNUTGjSVNk=;
        b=lNrI+/5howaVzNkL9LqO0/UtOo+zK72GdyBR4UK5FYVDglzaY5K0iWhTZ3QjtKtZ3h
         tGtJy3r2lqGNV2ZScS8dMZC4/ct0KYxOvck8gkSluXM9aUEUhb8Uc95wVPyH+hlm5KAm
         jGciu9o6fs5d90oVzhtaGwmfoyXxbNfRprtXcECqRTwOIwQibSWl6abglY+/C9y/BvjV
         ex+kaqwsEMgI3yUZWuKkX5H8ofGOybLI2rkfPPfFm5YZh8mDLSt9ZMHFE2EF9zZnXbvt
         qwwOBYkmgyahvGJ+ndZhM1GBB98pXhlcZnaDu09H+Z51xF+oibEjQpnrvcqxdtscsBse
         inOg==
X-Gm-Message-State: AOAM532CQnNRXcZ8bVsv+FJ2xJ/wjLwHvsaN89pMvPG055qXhN2qcWZ9
	Z1WzyWCMsSbevOFBiSahDTaC7PYD6Bc=
X-Google-Smtp-Source: 
 ABdhPJwaqS6QbecXTNUm/hm3rsWa1CRxjW3wIyY9SvW+DkGdBmnlawQ6AJDtWHIGML0DxI2iuPIM+Q==
X-Received: by 2002:a17:902:d103:b0:14f:a3a5:3974 with SMTP id
 w3-20020a170902d10300b0014fa3a53974mr21455388plw.74.1646065994822;
        Mon, 28 Feb 2022 08:33:14 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 gm19-20020a17090b101300b001bc87f9a75dsm11036519pjb.49.2022.02.28.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:33:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pynetlinux: patch to use setuptools
Date: Mon, 28 Feb 2022 08:33:05 -0800
Message-Id: <20220228163305.1263840-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 16:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95588

setup.py bdist_wheel does not work with distutils (which is deprecated
anyway). Add a patch to switch to setuptools to allow the wheel to be
built.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-setup.py-switch-to-setuptools.patch  | 32 +++++++++++++++++++
 .../python/python3-pynetlinux_1.1.bb          |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch
new file mode 100644
index 0000000000..35bc4a6bd1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux/0001-setup.py-switch-to-setuptools.patch
@@ -0,0 +1,32 @@
+From a36abadfb2d135260bef7703a1d0b56e6aa7eeff Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Mon, 28 Feb 2022 08:21:33 -0800
+Subject: [PATCH] setup.py: switch to setuptools
+
+In Python 3.10, 'distutils' has been deprecated and is slated for
+removal in Python 3.12.
+
+Switch from 'distutils.core' to 'setuptools'. This also allows for the
+'wheel' binary archive format to be built with 'setup.py bdist_wheel'.
+
+Upstream-Status: Submitted
+[https://github.com/rlisagor/pynetlinux/pull/12]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 670e064..45f1053 100755
+--- a/setup.py
++++ b/setup.py
+@@ -1,4 +1,4 @@
+-from distutils.core import setup
++from setuptools import setup
+ 
+ setup(
+     name = "pynetlinux",
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
index c80a166177..a5ac74fd68 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "http://github.com/rlisagor/pynetlinux"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
 
-SRC_URI[md5sum] = "3336e5d4a478acca4e35bf3125b4f883"
 SRC_URI[sha256sum] = "4ad08298c9f5ba15a11cddc639ba8778cabdfc402b51066d9e0a325e5a5b391c"
 
+SRC_URI += "file://0001-setup.py-switch-to-setuptools.patch"
+
 inherit pypi setuptools3
-- 
2.30.2


