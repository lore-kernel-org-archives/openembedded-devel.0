Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EFFE88D9E
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:57 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34601.1775393393654647542
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HULe3djT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d932cc948so1712709a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393393; x=1775998193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugh7UrQSoT0YJxTyFFaDPx4/rtBxMUMQ6crFMLVjNy8=;
        b=HULe3djTWbBORGa6VDuI0/F/5W7Ry3HECF2mErrCGGfnDHueHiuci7wmWUm6kAvvev
         qmA++FZmEoKkXIfgfUo95PuxFNomqmujXb7Ku0lLUXZWbJPDL5zKs4f+7QoP0izW1B/C
         RdJJDpx3B5MafDvDetSPOvaVo1WSVNNAASGrjF8uLtRYgvOvbziq3rPMSqzAzigBdm+5
         mVgHWUQHc1zkVtheObMFk+04XrYuLHHsl5pQa+q8gNaAVCjWZ7BWcuhkeaNf0eNXEDAs
         PPoQ1frcprinYX4merqOGK4nH/8VHeaBlKzF3UJ9/UI99yWHpKkCuowUDdwKSCBWH3Mm
         VO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393393; x=1775998193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ugh7UrQSoT0YJxTyFFaDPx4/rtBxMUMQ6crFMLVjNy8=;
        b=IyD1LDgywuZyLbzNcyFgAWEhtyvGPpWdkihw66kT76jGHHmtWxBfr1GCPyqh0rJ3lr
         xcz+10tJlhuDE5xU5CwxYBYFJT/Nx/zLb5YB0Dd+I0uKSgb91Cu2bHmGhnLWPApMiWD9
         Hb8ugm9/3T/wieexqlCuNndTYJw8FdhWgHnrQHSq5wgXhLM5dJzS3n89DhKF8o6dOt2q
         c2nwo4UDkDHpQTGR1PYHT0EGmxavpupqJ+XwLVkDCqVv67Uw/FX1w8TTKMAba/+6fUwa
         9n3WQLOOICztFuk1HfiDNElaaO1cEyXJSSenUAAzyuBRaMpqzVWiGM7LBQ5rQ6bZ6oh5
         OL8g==
X-Gm-Message-State: AOJu0YxMiLKgLXhpNioRA/mBnDLhgChcCoOu/LkRfllktdNzOBQXf5rt
	cK0mAw8J8rNHcKYCOlT3yAjhwgJqfQK1y6Wsl/bDT4KmWy7KyJqZMl+4KX3Ad8z89K0=
X-Gm-Gg: AeBDietYBNhl0VlenzR9jfokeSa/HGObQKUEUqx51uO3TGE1bOqDPr2L7RDoTMOwfvw
	oYr6w3ZswKdRfGZHhczsSVpp27lxPxbc0iZyQ+Hm9+e02eTBTCtfagGEDn0gki5zfg2m9Fp9fCQ
	8xlgYTI+Z85YJW7g3Y3Xwffc9qVz90+r5UIPGLfjlh3r1J7M5vYv2kgNMj6T8MVoDs/0vxBGWiN
	jjz0gQ3GAxFmsQEzTyKMTcQV8gxKd9DiDVHB5CU+uQ/d8ovbegrbL/uHQFWXci862WubMy/ilxu
	Bz8fZ/GaAtSx/3wofHC6xy8SAsE15WRwSr5Xblv9n3SfTHSL+mdCw4voC0UTwh/sE1vgoC/Zci7
	V1JMeEvOFL1V8jWgAfE2A0br2jVERgeD9Np2aZ/p+Iz8hJ6Kg+Px9d8kLXCrFWQURmi9tFyNyPQ
	VPloHE1XZ1Vxe0FUdCQlVyCcu/e2I29e0GVMk=
X-Received: by 2002:a17:903:2ac5:b0:2b2:42da:25cc with SMTP id d9443c01a7336-2b28163ad55mr99560545ad.1.1775393392842;
        Sun, 05 Apr 2026 05:49:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 10/14] tigervnc: patch CVE-2026-34352
Date: Mon,  6 Apr 2026 00:49:12 +1200
Message-ID: <20260405124916.2881008-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126009

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-34352

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tigervnc/files/CVE-2026-34352.patch       | 31 +++++++++++++++++++
 .../tigervnc/tigervnc_1.15.0.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2026-34352.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2026-34352.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2026-34352.patch
new file mode 100644
index 0000000000..5e869af886
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2026-34352.patch
@@ -0,0 +1,31 @@
+From da8952d2c1ebc3bb89c01c2d0d055017348685c0 Mon Sep 17 00:00:00 2001
+From: Pierre Ossman <ossman@cendio.se>
+Date: Tue, 24 Mar 2026 09:52:01 +0100
+Subject: [PATCH] Prevent other users reading x0vncserver screen
+
+Prevent other users from observing the screen, or modifying what is sent
+to the client. Malicious attackers can even crash x0vncserver if they
+time the modifications right.
+
+(cherry picked from commit 0b5cab169d847789efa54459a87659d3fd484393)
+
+CVE: CVE-2026-34352
+Upstream-Status: Backport [https://github.com/TigerVNC/tigervnc/commit/0b5cab169d847789efa54459a87659d3fd484393]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ unix/x0vncserver/Image.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unix/x0vncserver/Image.cxx b/unix/x0vncserver/Image.cxx
+index bd48c88d..abc421d7 100644
+--- a/unix/x0vncserver/Image.cxx
++++ b/unix/x0vncserver/Image.cxx
+@@ -268,7 +268,7 @@ void ShmImage::Init(int width, int height, const XVisualInfo *vinfo)
+ 
+   shminfo->shmid = shmget(IPC_PRIVATE,
+                           xim->bytes_per_line * xim->height,
+-                          IPC_CREAT|0777);
++                          IPC_CREAT|0600);
+   if (shminfo->shmid == -1) {
+     perror("shmget");
+     vlog.error("shmget() failed (%d bytes requested)",
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 9fb7abf8f3..4f01cd22d0 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.15-branch;protocol=ht
            file://0001-do-not-build-tests-sub-directory.patch \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+           file://CVE-2026-34352.patch \
 "
 
 # Keep sync with xorg-server in oe-core

