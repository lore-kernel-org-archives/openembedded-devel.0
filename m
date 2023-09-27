Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5054E7F15D
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 03:50:24 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.10075.1695786622172196729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 20:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4194c3cf04aso19935921cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 20:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695786621; x=1696391421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Zf+cjnyXPdNfoaO23X3QJ/1rkXt88TS5EJf/HWYwV4=;
        b=YyAMxjUlVaPiNOTvSEzaU7eQ8szEd3ddg1nuyjGcUh+ReWq4oQUNJ/KgaY/y/BsqsE
         hPiTFFcdN485IadGk/c9oM20filCiyQZe20R7kUWkuBXyeXubZ/xrzVCb5YrqonWqIwJ
         lTReRFck9HDM/I+GdpZ5cVOHJnFiD/CLkkO/b4greuygXNJEDc4Swx1enFsaqHee1pwE
         zOvSK9WAcWKfFrUEJL9Tv1eda7B9xFLkeoPxw0lnrhbg5PGio2BZqY7PVUzl3YzE6KzN
         44eEA5LzyfxqtnndvtsiWOpkP8opglLEbcL6VBYikS0NzVUWjZu29vfATPz71FOqJE14
         Vamw==
X-Gm-Message-State: AOJu0YzRGPxmRzkR9tW2689fbbUZ7SP7Wbly5aFBBif9n90ou9ahKLi2
	6TRrAQb8Pjxo2Pxg25vtCvWiBTet9RQWtQ==
X-Google-Smtp-Source: AGHT+IHnV91alMAq4lswpwQYfD8CmGSdpkkKEeNWa0PnrCbxuXGu5d2U/IN0Sbb5mb6vVDd4Oq27bw==
X-Received: by 2002:ac8:7e86:0:b0:419:573c:59a4 with SMTP id w6-20020ac87e86000000b00419573c59a4mr922843qtj.20.1695786620773;
        Tue, 26 Sep 2023 20:50:20 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id h9-20020ac85049000000b004055d45e420sm739895qtm.56.2023.09.26.20.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:50:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyiface: Update version from git -> 0.0.11
Date: Wed, 27 Sep 2023 03:50:01 +0000
Message-Id: <20230927035001.1620605-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105154

Reorganize recipe to follow recipe style guide
Migrate to release version (No functional change from latest git version)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-pyiface_git.bb => python3-pyiface_0.0.11.bb} | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyiface_git.bb => python3-pyiface_0.0.11.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pyiface_git.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pyiface_git.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
index 29a0bc86c..b5bd89de7 100644
--- a/meta-python/recipes-devtools/python/python3-pyiface_git.bb
+++ b/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
@@ -1,24 +1,18 @@
 SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
-SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
+SECTION = "devel/python"
 LICENSE = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
 DEPENDS += "python3-setuptools-scm-native"
 
+SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
+
+inherit pypi setuptools3
+
 RDEPENDS:${PN} += " \
     python3-ctypes \
     python3-fcntl \
     python3-io \
 "
-
-inherit setuptools3
-
-SRC_URI = "git://github.com/bat-serjo/PyIface.git;protocol=https;branch=master"
-SRCREV = "4557dbda96d2e4b1142c60603d4a27d007a9ffe6"
-PV = "0.1.dev33+g4557dbd"
-
-PIP_INSTALL_PACKAGE = "pyiface"
-
-S = "${WORKDIR}/git"
-- 
2.34.1


