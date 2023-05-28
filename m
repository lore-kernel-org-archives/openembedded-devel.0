Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AB5C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 00:44:04 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.21145.1685234639057724283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 17:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NKnViBAc;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-53033a0b473so1310877a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 17:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685234638; x=1687826638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In+BlBgKgpGCyD3qk9A/kVloS3ilUrzn+1S53wxjfoQ=;
        b=NKnViBAcYIF6/9l+9SrbiNkafpvKDGPuVNfI9ErpVwe8/fGF9m3mZ6W24VdgnpW8D8
         Pj3tPyqUY/epYffRSKpSvPj0UCvAC3xrgjSd117m6YKBC6EJWJR6cT3D2B/LM5ThXr5r
         xYlKvqOIP/wYfZDJ3np3qmvmXMsZ9k08VExVHjO0IQpGLDI1IWF6xrS5EgC/LRpx8tOK
         8UfiMeuSe6jzFdrjLg593XP3YmUm+IgBdB0EYrteyKm/x+pQUEA/7Yq/6k2I/HFbuqoV
         /XUoXF3F2zH5uDQl07QPbCNWIZj3R607NU5mDBcxmzq4HPFksKxG+OUP0yYgAGnqwvOx
         zoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685234638; x=1687826638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In+BlBgKgpGCyD3qk9A/kVloS3ilUrzn+1S53wxjfoQ=;
        b=WzdihQVPArcSJptv86IRcTnAkGWo9CeUAumFyArERIoc9lowEzKrKx1MvDkyHSOdIV
         AmeAwcMM3ft6dUCJiRlI7tS9tJ0yyI6dYXb7Rf9cHmpiKmkWlRJnG6CGuKuAZ3cWy6p5
         CfDvAoZi96uBObJmeHjMsBxEZKq+0Hpm2mg5zZOGATjiX5X1KcGUJIDYC/uDfvQkwt3w
         Kv5LV7L4l4kQIZN2hHEX64TGQLbEj9fBZFarF5kYrA2wxmjSB60OfU/r4sVMA8k5VXQ0
         LwfpRLr7bHsxrAk2V+JQYLy/V6Fb2YXNJFDkUXwR/xXENtSuTpYK9KwacicRyzufh2HB
         VnoQ==
X-Gm-Message-State: AC+VfDylSoarsuVQ0S7uadp3hGhhMdbthc0ND1002QKglZb8RqODoKfZ
	2Wu0v1zFjkq+8kjts/9HfsqCcLrHoaM=
X-Google-Smtp-Source: ACHHUZ4189p97e95TgUTBTOIIfuq1a5iRLXRxkrj12iApoYVN8/YqpuEDZeezAHXp7d5LEzBHJ6yNw==
X-Received: by 2002:a17:903:1251:b0:1ab:29bc:bd87 with SMTP id u17-20020a170903125100b001ab29bcbd87mr7331967plh.35.1685234638064;
        Sat, 27 May 2023 17:43:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027d8b00b001ac7c6fd12asm5415735plm.104.2023.05.27.17.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:43:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] rdma-core: Use target path for systemctl
Date: Sat, 27 May 2023 17:43:53 -0700
Message-Id: <20230528004354.1655629-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528004354.1655629-1-raj.khem@gmail.com>
References: <20230528004354.1655629-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 00:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102885

Fixes
WARNING: rdma-core-46.0-r0 do_package_qa: QA Issue: File /usr/lib/udev/rules.d/60-srp_daemon.rules in package rdma-core contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...EMCTL_BIN-to-be-overridden-from-envi.patch | 33 +++++++++++++++++++
 .../rdma-core/rdma-core_46.0.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
new file mode 100644
index 0000000000..03ba872616
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
@@ -0,0 +1,33 @@
+From 92747aab189aa3cee954ab31ee019205f8984155 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 May 2023 17:22:10 -0700
+Subject: [PATCH] cmake: Allow SYSTEMCTL_BIN to be overridden from environment
+
+This allows to encode correct paths which are inside the target rootfs
+for systemctl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b7462861..c4d82fb49 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -226,7 +226,10 @@ else()
+   set(CYTHON_EXECUTABLE "")
+ endif()
+ 
+-find_program(SYSTEMCTL_BIN systemctl HINTS "/usr/bin" "/bin")
++if (NOT SYSTEMCTL_BIN)
++  find_program(SYSTEMCTL_BIN systemctl HINTS "/usr/bin" "/bin")
++endif()
++
+ if (NOT SYSTEMCTL_BIN)
+   set (SYSTEMCTL_BIN "/bin/systemctl")
+ endif()
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
index c4c4387988..a6927f566d 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_46.0.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
+           file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
 SRCREV = "f2789cbd394c5839e8942d585a494ab72fd97e39"
 S = "${WORKDIR}/git"
 
@@ -16,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING.BSD_FB;md5=0ec18bae1a9df92c8d6ae01f94a289ae \
 
 EXTRA_OECMAKE = " \
     -DCMAKE_INSTALL_SYSTEMD_SERVICEDIR=${systemd_system_unitdir} \
+    -DSYSTEMCTL_BIN=${base_bindir}/systemctl \
     -DCMAKE_INSTALL_PERLDIR=${libdir}/perl5/${@get_perl_version(d)} \
     -DNO_MAN_PAGES=1 \
 "
-- 
2.40.1


