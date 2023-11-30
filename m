Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD6FC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 10:23:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.69332.1701339814014550632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 02:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLoms3kd;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-332f4ad27d4so470477f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701339812; x=1701944612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwASFBb8CgpMzg6z0CoaMQEqfqiFPT/RQKDOGd5dXT8=;
        b=SLoms3kdmkol3ptODP5tiXZo6HbhCbK63/62dLXuJwI8A68I9c9TLSbjnh433J1sCx
         P/qX5LuRIVT2TCkXnlZX+FCsPk+o9t5n8H5mktTBr6XdvUQ/Wgk2y/ZLpZf9BdTpycD6
         sTtTPe9iP0OL/xe+2tB+HOlErYWDhC7WdSFWO3wmLHLi0X9iQmxJJv1Aiz4rIeaaTcel
         AyFy5e+A2k/jumbyNXtN4WeF+9mIp7deJnDPkZvdDboAu1yNiGm1nIqwtAcbwbFcL1iV
         XspEOZpU3R8rtv4OwJ+nHiB0+2TQMD2eIknpOHg2AM2BvYm4UMW4Mwoo5HJQuQD0Mq8W
         KlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339812; x=1701944612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwASFBb8CgpMzg6z0CoaMQEqfqiFPT/RQKDOGd5dXT8=;
        b=pXjrFe9Km0fqHtc4i8FAw+WOgG+U7SojMdFYajr0V9HaJksx3Hgmgsy+hKKztbyppX
         4IerVVQKabWgXsQBDwHiIXXCeV3ek9XnYhc+jnymabEYhHHG8Z1JjaPoo5IqKtwxBvw9
         NezwHe4mlrbiHQzzppAAriVq6LIhXWZvCG7rHeJ/VqQ28WIWr+E+eJ8eX1BTrlRQGazL
         5oROoBgiCpeo2sGwMte2B66FY4L02cVRAtf24geDFWKhgRrU38mz3CmHvouRsrLsKrlh
         WPz1My2ryTkM3ozq1sijyDdzBBavF67mB8GYgrrblG/WN0B9C6T60r89softRrqz4hoq
         uS5A==
X-Gm-Message-State: AOJu0Yy3iju68ErkqpjWuLWapwz+iL2WEwj6AN/cE1J1OOpxi7Zm+kE+
	ssRCrAPzAX22URkVYsoLNYmhFiWrlVtnYQ==
X-Google-Smtp-Source: AGHT+IEgPlC/7k+MIyG4r2rSjesbGJu4M8zVzghyIkEGREX66DQcihu8LLFC+DH6gQJPsbgqc+Dj0A==
X-Received: by 2002:adf:eb08:0:b0:333:85e:a12a with SMTP id s8-20020adfeb08000000b00333085ea12amr6656649wrn.40.1701339811615;
        Thu, 30 Nov 2023 02:23:31 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id a7-20020a5d53c7000000b00332ff21038fsm1110264wrw.106.2023.11.30.02.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:23:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] liblognorm: upgrade 1.0.1 -> 2.0.6
Date: Thu, 30 Nov 2023 13:23:15 +0300
Message-Id: <20231130102315.580807-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 10:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107170

Changelog: https://github.com/rsyslog/liblognorm/blob/46c6ee4c8e5f827893e485a4ef1aff04ea881273/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../liblognorm/liblognorm.inc                 | 17 -------------
 .../liblognorm/liblognorm_1.0.1.bb            |  5 ----
 .../liblognorm/liblognorm_2.0.6.bb            | 25 +++++++++++++++++++
 3 files changed, 25 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm.inc
 delete mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb
 create mode 100644 meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm.inc b/meta-oe/recipes-extended/liblognorm/liblognorm.inc
deleted file mode 100644
index 5a6cda6ca..000000000
--- a/meta-oe/recipes-extended/liblognorm/liblognorm.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Fast samples-based log normalization library"
-DESCRIPTION = "Briefly described, liblognorm is a tool to normalize log data."
-
-HOMEPAGE = "http://www.liblognorm.com"
-SECTION = "base"
-
-LICENSE = "LGPL-2.1-or-later"
-
-SRC_URI = "http://www.liblognorm.com/files/download/${BPN}-${PV}.tar.gz\
-"
-
-inherit autotools pkgconfig
-
-DEPENDS += "libee libestr json-c"
-
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
-PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,sphinx,"
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb
deleted file mode 100644
index 5d89e3540..000000000
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_1.0.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "7b9a826542af9686127110deab09d7a1"
-SRC_URI[sha256sum] = "1f6cdfd901a8f6a97a3cb74bc6107c6746b3e9381f7889e4cd866a488e0c59a5"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
new file mode 100644
index 000000000..f9196af92
--- /dev/null
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Liblognorm is a fast-samples based normalization library."
+DESCRIPTION = "Briefly described, liblognorm is a tool to normalize log data."
+HOMEPAGE = "http://www.liblognorm.com"
+SECTION = "base"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
+
+DEPENDS = "libfastjson libestr"
+
+SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https"
+SRCREV = "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "testbench tools"
+PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,pcre2,"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
+PACKAGECONFIG[advstats] = "--enable-advanced-stats,--disable-advanced-stats,,"
+PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,sphinx,"
+PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,,"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,,"
-- 
2.25.1


