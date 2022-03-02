Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AD8C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:30:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.2571.1646253043576187607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MKLl20Dx;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b8so2804910pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oh1V9xff7D4wrqboT5fhhw9jbqMMRgHUbuLh3ohnjG4=;
        b=MKLl20DxEN4tAmwwu/ODBriVyj5D1ATwb8Zs0D1nVVJGo2u8+Ho4P4EQk+iekEZ7cZ
         iejTko/EHZStS+IdZxExW1QgnceQ3D4x6HawzeFLHVpthh8cXgZqNciigqEnQPSdVy9T
         YigCFEaMVeXkP/KOXQ0j/iZpjwFIfj50dFEE/rBibAKmly3MakFbRLdeeizuVuNeiOpg
         mqBdtSxvqDPEYU2n3JfVCd39Zstkh9ebmP2pztIKSJCrgJk11EybgeifLkqD889nXQYv
         n51qIOAG5smp1g+eMoWPG3TCXFKtqnFWzX2lyXPF33l+vaJH4Dp3vrUgwsQRAf+Mrd6D
         CehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oh1V9xff7D4wrqboT5fhhw9jbqMMRgHUbuLh3ohnjG4=;
        b=OMa/P+bHcMVJnBHJpgzbRZIGRpTiePimMW/HxnzyOQobi2Sw78c40AoZ4oZ13oEXwv
         hL2UHTQtCSiBC48oWonoWPcngz2EtauZc3LO+DqZttgIEvNnIgOmO9nWeWGSKUX87H+H
         asn0QNlENJI/+0ikOjWGFyMjdHWNTqQFIz6vxJNJMJ4bVjv/EUbSbaj0mLFqJtAEpTdY
         +r2akXlUD5X6pdRAdqEGLVqV4PtKFNugsX1PlOxRKCc7EdZIA5Vs82nIjV5Sbls3yz/2
         90vdbxppOODMwC1g2Ev33hA2yNCHr2aGoRkIa6pDwK+26YJzrq6p7l/c89zXMflOllQ+
         nKtA==
X-Gm-Message-State: AOAM533WokzF1A0/qZnk+qLacv91bjFUqUlN33CflZ5g5BGyr8t6s2S6
	jtE3AqiW9fnZNnkz39Jn3zX22sFYV/PrQQ==
X-Google-Smtp-Source: 
 ABdhPJwGV0/xJ9VQg5W8sPyoOGprM76IC+WsNKKIq3cfb2XAvbOCaYb7/OMs7BSfL9AUWSUVwEH0cg==
X-Received: by 2002:a17:90b:1e53:b0:1bf:ac1:2a0b with SMTP id
 pi19-20020a17090b1e5300b001bf0ac12a0bmr514507pjb.87.1646253042801;
        Wed, 02 Mar 2022 12:30:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 t5-20020a654b85000000b00373cbfbf965sm26745pgq.46.2022.03.02.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:30:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-blivetgui: Upgrade to 2.3.0
Date: Wed,  2 Mar 2022 12:30:40 -0800
Message-Id: <20220302203040.718605-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:30:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95713

Backport a fix to migrate to use setuptools instead of distutils
Changes in this release are [1]

[1] https://github.com/storaged-project/blivet-gui/releases/tag/2.3.0-1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ols-instead-of-distutils-in-setup.py.patch | 30 +++++++++++++++++++
 ...ui_2.2.1.bb => python3-blivetgui_2.3.0.bb} |  6 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.2.1.bb => python3-blivetgui_2.3.0.bb} (78%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
new file mode 100644
index 0000000000..c88912bfa0
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
@@ -0,0 +1,30 @@
+From 54014061be2fed20d6c35aba9719ea70a9fea9ea Mon Sep 17 00:00:00 2001
+From: Vojtech Trefny <vtrefny@redhat.com>
+Date: Wed, 1 Sep 2021 08:59:19 +0200
+Subject: [PATCH] Use setuptools instead of distutils in setup.py
+
+The distutils module is deprecated and will be removed in Python
+3.12.
+
+Upstream-Status: Backport [https://github.com/kraj/blivet-gui/commit/54014061be2fed20d6c35aba9719ea70a9fea9ea]
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index aa8ef57..77849a1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,7 +1,7 @@
+ from __future__ import print_function
+ 
+-from distutils.core import setup
+-from distutils.command.sdist import sdist
++from setuptools import setup
++from setuptools.command.sdist import sdist
+ import glob
+ import sys
+ 
+-- 
+2.35.1
+
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
similarity index 78%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index 632b313a86..9522770eff 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -8,8 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "adb6bd69fb3cfa709265db66ddcee04c0b5e070f"
-SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https"
+SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https \
+           file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
+          "
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 systemd"
-- 
2.35.1


