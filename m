Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F76C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 00:14:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.21472.1643242470964663074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 16:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D98szyBb;
 spf=pass (domain: mvista.com, ip: 209.85.214.173,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id u11so1002467plh.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 16:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqDvmww4AYoIzNM8PFntBxCdsmRRji4ioCmgaWyK3hY=;
        b=D98szyBb9PdkkQtnrzTqG7IBah+qJDFYF0fKZR5bdgovHWy22viR+ShchhgvbOGpvq
         2wUNDF/lDOw8oWB6SQ6tdMW5RVrbqJJ/agY36ct15E39SVG8IZKHE0vWy5LY30bkuVda
         Ty03ZDda6uf5cWJlUAVSBfPcx221jrzLEaios=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqDvmww4AYoIzNM8PFntBxCdsmRRji4ioCmgaWyK3hY=;
        b=2e37kgj+qvq781GpeyopEL8a+a3lsxsYxE4uY1XriJeWUzL+zzz6Ki52dcDO3fkM5J
         FqF/MI11FxTWV17P0tSLLB+x8LEdYR9suRanzbq7s7hbD998cPptkWcgS3Fz5iQYNpn1
         gkOF4Y7Nx9SMKTHtLCzcBrkm3CVRneSmggNeTdx2iZNQ/VzhO/QU2IJjTiDRGJa16Niq
         TWbBM3ePhnUg1D4dKL3SMPwRsaCnXS0kb11xsmzgZ0Ha4QjJd3/71VqjlQb5FiBZt8GB
         VOdhp6JaKPhoKxA0C3ntkk+p4WJxvl5Sv6V14KKV6ndfyNoh+CPzipIu9mHXWb+1ebvy
         Rsdg==
X-Gm-Message-State: AOAM5305MR0Ef3/yX/MV+tIWW9ILfrCVT61ES12Ja482K3IUhpHEjUGC
	l7zYdXtdSMjlpfz873l6NClalxDz+R8CQg==
X-Google-Smtp-Source: 
 ABdhPJzivXb/QOnqzU++bPGBQkjUN4ufvbZA/kebLAJQPx8UfLkU/3pwJwEiLu0lZJImOQ3eONVeLw==
X-Received: by 2002:a17:903:2093:: with SMTP id
 d19mr1089010plc.29.1643242469990;
        Wed, 26 Jan 2022 16:14:29 -0800 (PST)
Received: from black.maotig.mine.nu
 (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 h6sm3462160pfk.110.2022.01.26.16.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 16:14:29 -0800 (PST)
Received: by black.maotig.mine.nu (sSMTP sendmail emulation);
 Wed, 26 Jan 2022 19:14:27 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][dunfell][PATCH] CVE-2021-3466: polkit Local privilege
 escalation in pkexec due to incorrect handling of argument vector
Date: Wed, 26 Jan 2022 19:14:25 -0500
Message-Id: <20220127001425.7392-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 00:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95110

Upstream-Status: Backport
CVE: CVE-2021-3466
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../polkit/files/CVE-2021-4034.patch          | 71 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.116.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
new file mode 100644
index 000000000..294ada961
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
@@ -0,0 +1,71 @@
+From ed8b418f1341cf7fc576f6b17de5c6dd4017e034 Mon Sep 17 00:00:00 2001
+From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
+Date: Thu, 27 Jan 2022 00:01:27 +0000
+Subject: [PATCH] CVE-2021-4034: Local privilege escalation in pkexec due to 
+ incorrect handling of argument vector
+
+Upstream-Status: Backport https://gitlab.freedesktop.org/polkit/polkit/-/commit/a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+---
+ src/programs/pkcheck.c |  6 ++++++
+ src/programs/pkexec.c  | 21 ++++++++++++++++++++-
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/src/programs/pkcheck.c b/src/programs/pkcheck.c
+index f1bb4e1..aff4f60 100644
+--- a/src/programs/pkcheck.c
++++ b/src/programs/pkcheck.c
+@@ -363,6 +363,12 @@ main (int argc, char *argv[])
+   local_agent_handle = NULL;
+   ret = 126;
+ 
++  if (argc < 1)
++    {
++      help();
++      exit(1);
++    }
++
+   /* Disable remote file access from GIO. */
+   setenv ("GIO_USE_VFS", "local", 1);
+ 
+diff --git a/src/programs/pkexec.c b/src/programs/pkexec.c
+index 7698c5c..3ff4c58 100644
+--- a/src/programs/pkexec.c
++++ b/src/programs/pkexec.c
+@@ -488,6 +488,17 @@ main (int argc, char *argv[])
+   pid_t pid_of_caller;
+   gpointer local_agent_handle;
+ 
++
++  /*
++   * If 'pkexec' is called wrong, just show help and bail out.
++   */
++  if (argc<1)
++    {
++      clearenv();
++      usage(argc, argv);
++      exit(1);
++    }
++
+   ret = 127;
+   authority = NULL;
+   subject = NULL;
+@@ -636,7 +647,15 @@ main (int argc, char *argv[])
+           goto out;
+         }
+       g_free (path);
+-      argv[n] = path = s;
++      path = s;
++
++      /* argc<2 and pkexec runs just shell, argv is guaranteed to be null-terminated.
++       * /-less shell shouldn't happen, but let's be defensive and don't write to null-termination
++       */
++      if (argv[n] != NULL)
++      {
++        argv[n] = path;
++      }
+     }
+   if (access (path, F_OK) != 0)
+     {
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
index ad1973b13..77288b008 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -25,6 +25,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
+           file://CVE-2021-4034.patch \
            "
 SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
 SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
-- 
2.20.1


