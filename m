Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A2AC4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:35:06 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.3063.1706906104197113853
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c009016d5bso92779339f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706906103; x=1707510903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrg7hldVnfhQJI+hO0hexU7Rt3IYz+0PtpOrd+20Knk=;
        b=tcpfg/CdBdvUsHQaNiU0tCCeHl6+DiaDFMBSe/QfOODEI94jRcWC8FgP9RUtM3U18B
         ElvsS2jVZ0Tlh8iOhAmBGOjvrvPpsdBUhiTnl8khYfyzNWcmV0ecteTJnq3g82gnVMbN
         qBLHcCXr8wFHDjWy8Tw1faHlxJhDJPE3gyDmuKZfXvEw3giLrfLm54PBwtIJX8pSmraY
         er8QkR6uOTYYGmoAberdE1cucAJ7aun3nJg9MEPDRE+tXCFWaJMf3M4k5dog0Ev3+Lpk
         dLfEmRV5ci0fDSRbkghgBzVgEbH8rJ/7TH6kg9CYpC8r7hLePl4yv/oeuCZSw6c61aQv
         vk6w==
X-Gm-Message-State: AOJu0YxOd99LBurNIfcHBcL8sVo/xr5FH7t5gdRaJ+Xk4nmUnFpJcW2H
	Kd5Ju6IrmHxAu32eIYet0zMWhE3Sz3ayKD9ZHBZdb/24mSQ0gFXw9xQJ+7HSQecuCQ==
X-Google-Smtp-Source: AGHT+IFoc04uusH2oFmv1Ea7WpAifpUEvblZL9HhMvuX4bIDvKhPVe/0/TwRjwYNO9fkQKqKY1OL0A==
X-Received: by 2002:a05:6602:42c2:b0:7bf:dc9e:decc with SMTP id ce2-20020a05660242c200b007bfdc9edeccmr9757438iob.13.1706906103044;
        Fri, 02 Feb 2024 12:35:03 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l5-20020a02cce5000000b00470fdc2fc93sm662824jaq.15.2024.02.02.12.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:35:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-pyroute2: update to version 0.7.11
Date: Fri,  2 Feb 2024 20:34:53 +0000
Message-Id: <20240202203453.1576669-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108544

Leverage git repo as src is not published in latest pypi release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...route2_0.7.10.bb => python3-pyroute2_0.7.11.bb} | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.7.10.bb => python3-pyroute2_0.7.11.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
index 6b340a18c..7b170147b 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
@@ -4,9 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02"
+SRCREV = "cd8b8947f18f102875ce64c6d2094ba2be59dc35"
+SRC_URI = " \
+           git://github.com/svinota/pyroute2.git;branch=master;protocol=https \
+           file://run-ptest \
+"
+
+inherit setuptools3 ptest
 
-inherit setuptools3 pypi ptest
+S = "${WORKDIR}/git"
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
@@ -22,10 +28,6 @@ RDEPENDS:${PN} += " \
     python3-unixadmin \
 "
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-fcntl \
-- 
2.34.1


