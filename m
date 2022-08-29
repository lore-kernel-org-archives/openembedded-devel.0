Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47053ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:56:54 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.67754.1661756212992908185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=APDLwUPN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 142so7299176pfu.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fXzxST30ALsGhZ0x0FcxjQmvnNMi2SHgWVaWCsCiVlY=;
        b=APDLwUPNUEr3Qc0Z3FcuQ/ZOaTrVBdp9ouN1VoUbXVpeF5vha2+Pn6kCUvwtkYjR6/
         JRKIFWiLNKTZX4+DTFPBD9Q4nlFPzIpIhER38NJ/j+JYtygQjDtsHLen0QQ3bY4/9X4x
         zfovVXjnwdh+okiSovSk+9DYbfugyg89pTImWcO+37HOclaScG8H4/XK3la3sZ/2WVFh
         vrVS1o7K/nXstQ0zwtof2YqWXTn3/79XX7vu29tLUy1j3xdvheVPWa2ijLAm+x/KFCdI
         H9itchtYQQtWPgpn6J/yTqfGjxZnj0Hsy8fXCON5Yv2yRgj+SAblbynWmPlM/JphWlNN
         YlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fXzxST30ALsGhZ0x0FcxjQmvnNMi2SHgWVaWCsCiVlY=;
        b=z32eTBKXYOP+7uaMOY4EV+k9sipITZwsWlC3QeQGShd11JhTfD5AAU6sqwT11O9KNo
         o0qS9bft1RLOFj6X/QWNohF2VH/r4F2WVwXZD2Dj1AlKFHR32noVdcX+FE08AIVjLvWK
         2C0wT9eoWDre/VusXfx009AEBFWGYjxEsrgSFXt/uTyr5lEsFWGa+qS+/VvHRoyclMGY
         n/RTe3IGzDIzynQ1qcYt3V3fVPY7tWuMglADyTqmLTvMuAAi3vEpvAaw6wCL5j+gyAGI
         B1mUZNj2iy3luGonRqrfXZicYAP7JZRcqV7Q6jv7WI5DufpyXZD9TpIyp0H0nlxml7qg
         CzIw==
X-Gm-Message-State: ACgBeo1eegKTikEv6eCWIY9PpikpFFLGRwBUZl/71loUkxgTKfgis3jh
	Uf3ZoWOQ8NZk22jdScXIzDzAqepfJWOVAw==
X-Google-Smtp-Source: 
 AA6agR5hyODCnVsCwVVQ2fvDfcc6l0kJFlc2YKg8ousGKfGI0bHMo5BY+p344NPwRaWANgsnDOR4Gg==
X-Received: by 2002:a05:6a00:1496:b0:52f:734f:9122 with SMTP id
 v22-20020a056a00149600b0052f734f9122mr15411248pfu.85.1661756212041;
        Sun, 28 Aug 2022 23:56:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/7] python3-netifaces: Fix build with python3
 and musl
Date: Sun, 28 Aug 2022 23:56:43 -0700
Message-Id: <20220829065649.808556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:56:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98512

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-initialize-msghdr-in-a-portable-way.patch | 49 +++++++++++++++++++
 .../python/python3-netifaces_0.11.0.bb        |  6 ++-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-netifaces/0001-netifaces-initialize-msghdr-in-a-portable-way.patch

diff --git a/meta-python/recipes-devtools/python/python3-netifaces/0001-netifaces-initialize-msghdr-in-a-portable-way.patch b/meta-python/recipes-devtools/python/python3-netifaces/0001-netifaces-initialize-msghdr-in-a-portable-way.patch
new file mode 100644
index 0000000000..7ff86cc8be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-netifaces/0001-netifaces-initialize-msghdr-in-a-portable-way.patch
@@ -0,0 +1,49 @@
+From cbcd19f38ae4b31c57c57ce3619b8d2674defb68 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 28 Aug 2022 08:11:27 -0700
+Subject: [PATCH] netifaces: initialize msghdr in a portable way
+
+musl has padding bytes inside the msghdr struct which means initializing
+full structure will cause wrong assignments, doing partial assignment is
+more portable and assign the elements after that
+
+Fixes
+netifaces.c:1808:9: error: incompatible pointer to integer conversion initializing 'int' with an expression of type 'void *' [-Wint-conversion]
+        NULL,
+        ^~~~
+
+Upstream-Status: Inappropriate [Upstream Repo is read-only]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ netifaces.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/netifaces.c b/netifaces.c
+index 839c42c..7da78e7 100644
+--- a/netifaces.c
++++ b/netifaces.c
+@@ -1800,15 +1800,12 @@ gateways (PyObject *self)
+     do {
+       struct sockaddr_nl sanl_from;
+       struct iovec iov = { msgbuf, bufsize };
+-      struct msghdr msghdr = {
+-        &sanl_from,
+-        sizeof(sanl_from),
+-        &iov,
+-        1,
+-        NULL,
+-        0,
+-        0
+-      };
++      struct msghdr msghdr = { 0 };
++
++      msghdr.msg_name = &sanl_from;
++      msghdr.msg_namelen = sizeof(sanl_from);
++      msghdr.msg_iov = &iov;
++      msghdr.msg_iovlen = 1;
+       int nllen;
+ 
+       ret = recvmsg (s, &msghdr, 0);
+-- 
+2.37.2
+
diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
index 09e54b0baa..f211c69543 100644
--- a/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netifaces_0.11.0.bb
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
-SRC_URI[sha256sum] = "043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32"
-
 inherit pypi setuptools3
+
+SRC_URI += "file://0001-netifaces-initialize-msghdr-in-a-portable-way.patch"
+
+SRC_URI[sha256sum] = "043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32"
-- 
2.37.2


