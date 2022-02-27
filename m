Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE9EC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 23:43:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.14344.1646005380695070190
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 15:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NLvYUOw+;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id l19so9483010pfu.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xLVSu+V3braSXh00uU7Y+DN/xgN7zgU5vXBnuQNkNr0=;
        b=NLvYUOw+t3NE8CDS1Pxia8cUcpE0+pvJoCJdnBjYMfGFi8DRAdiMBchAL5ln1z78lx
         aPLRkiejLSBOPP5tmoVusrki4vfduKENqAIoj3CQDuTkqItA1acLSGmw+zdyIEe6PGh8
         mKNt/4ewGoIMd63uJjZ2ms0ChfaMH+7gueYDfvFvnSkQwQVgK9PiswmB8j0vpvZp+zg8
         bm5ALtNlqIOehuK5KB8gIajNj9swU+yoxy+j2HLNTaT2BUdDpUkOtGKzr5eZ7nYH1DpY
         kFvc5UAGkgXgRuYhJV+BPhnN63dA1JeHO8sMzQ/eLlrDqxTIwSOcHncazZwPzVDt1ZOj
         wspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xLVSu+V3braSXh00uU7Y+DN/xgN7zgU5vXBnuQNkNr0=;
        b=l3Bc/E1SJv4fp0Vigxpa57XLPj94AxV7lPYQjSf1ubaas+twmNh/znRJ1NGhSYZncu
         D4oxQLGHMeBo3QUZkrMaI8Bsmc3yLH8viDcoM7OYsLcVTCHyRvLKzjvrqt4yvFRARN8/
         4qTQ6gc1bD9/0gn+X/kVr9SGJmdThKH7UnERMuymlmxln6LZdOuv1+hM7b7k75Metsa9
         2DlN7OmUmCsQjuRCrq+ibMpeA6cR7Q+pOOGjbUR5+vBL77L/i8WpTq2vrFdSxNH5NGsI
         OWY264lgsVkV3Ze+EiSpnNOsAvjQ1t1dA4u16QUxiJWL85ImMkGD0FX9e55QzR17WZt+
         C4TA==
X-Gm-Message-State: AOAM532KK4/tXs58KMLkUwCcYI2BmFet+2qtRFE6UG3z54vsA2O++uHz
	gwCpqQTM/kbX5F0NPAbqEWywXBf/wCM=
X-Google-Smtp-Source: 
 ABdhPJx8utWCINtxF8FrU7/pvOYXrnS+A5qJPk7mUXATNJlCge8tuNEmI/eBis6kEBzNl/WYvKIIew==
X-Received: by 2002:a63:9354:0:b0:34d:e4e7:543a with SMTP id
 w20-20020a639354000000b0034de4e7543amr15071788pgm.48.1646005379753;
        Sun, 27 Feb 2022 15:42:59 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 j2-20020a655582000000b00372b2b5467asm8592162pgs.10.2022.02.27.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 15:42:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-confobj: backport patch for setuptools
Date: Sun, 27 Feb 2022 15:42:54 -0800
Message-Id: <20220227234254.1089695-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 23:43:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95564

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...h-from-using-distutils-to-setuptools.patch | 28 +++++++++++++++++++
 .../python/python3-configobj_5.0.6.bb         |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch b/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch
new file mode 100644
index 0000000000..ed6ceca8e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj/0001-Switch-from-using-distutils-to-setuptools.patch
@@ -0,0 +1,28 @@
+From ad9024e50a9df4a2b8a1a019e07bb133c3df31bf Mon Sep 17 00:00:00 2001
+From: Daniel Watkins <daniel@daniel-watkins.co.uk>
+Date: Thu, 28 Aug 2014 18:49:04 +0200
+Subject: [PATCH] Switch from using distutils to setuptools.
+
+Upstream-Status: Backport
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c6d57a6..6755ab4 100644
+--- a/setup.py
++++ b/setup.py
+@@ -12,7 +12,7 @@
+ # http://opensource.org/licenses/BSD-3-Clause
+ import os
+ import sys
+-from distutils.core import setup
++from setuptools import setup
+ # a simple import wouldn't work if we moved towards a package with __init__
+ from _version import __version__
+ 
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
index 1b85368105..1125a6389d 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
 PYPI_PACKAGE = "configobj"
 SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
 
+SRC_URI += "file://0001-Switch-from-using-distutils-to-setuptools.patch"
+
 inherit pypi setuptools3
-- 
2.30.2


