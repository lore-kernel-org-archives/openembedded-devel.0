Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ED5C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 16:59:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.450.1643302789191247193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 08:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=F1oYuluw;
 spf=pass (domain: mvista.com, ip: 209.85.214.170,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d18so3025557plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 08:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LR6Q19faibvflGXFy3ikJyVAHaowEDbngkVcSfkPU2A=;
        b=F1oYuluwbYALzWgHf74Aw8F/ILafVpu4NXgWezik8LCUByspG4JKi/1NI/jn8uT8cy
         /qw7/K95jrIml24soMLEeV39kE34//7wdTBaa4N+7qh4NJY+LXWDbCxRh+iNp4DuXbIr
         YEl/AeICNCk/ODbmqq1V/xwqFuEaFncPo9JZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LR6Q19faibvflGXFy3ikJyVAHaowEDbngkVcSfkPU2A=;
        b=Xp2Tw+Qzrp5y4+1jmcKhNyUDTAFyBOKYcx5NW2MN1UNuX8hjtC5aF6zQE4Pmd3X7ut
         gYzA24suKocPpmYqHTj72tipEs8j3FA5DE+DwJxWZWRfTiGxnD3JvlruI+FplybtElXF
         ia5fwrqSvnVpZj65DWqTmqcyr1J1Zuun/BSeWpMdXeBwMo/E9HYC5FMK+F03bzavkgBm
         67HyHPDQYJm2jsB6hR9KF8svKPRWdFenZ2zcltqAABw4XZGzcu4CMaqdfIZXpcnkkXpX
         lteyXYvqiEmUUj73fAnxXV3dsbKooQ5+7VLQ62V68cQcLojrM35n9rJoXoOaM2I4HqA9
         SNqA==
X-Gm-Message-State: AOAM533/fV0nPDu4TGoya+m28nYXd0j5or2yaFSztPuhiy3Zv0HNBARj
	Th5y7jzCvM8ZIMYsnwwGL0PvRIMXPSBW/g==
X-Google-Smtp-Source: 
 ABdhPJy0rA5oTT2Cb8IaTQaVoOmh4XWYRKpjOj0dF77Xu/GDWMRaDaVno7FqybGfIRjSubU9OmEiAQ==
X-Received: by 2002:a17:902:7fc9:: with SMTP id
 t9mr4070337plb.53.1643302788437;
        Thu, 27 Jan 2022 08:59:48 -0800 (PST)
Received: from black.maotig.mine.nu
 (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 189sm6092892pfg.142.2022.01.27.08.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 08:59:48 -0800 (PST)
Received: by black.maotig.mine.nu (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 11:59:45 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][dunfell][PATCH v2] CVE-2021-4034: polkit Local privilege
 escalation in pkexec due to incorrect handling of argument vector
Date: Thu, 27 Jan 2022 11:59:44 -0500
Message-Id: <20220127165944.8000-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 16:59:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95126

Upstream-Status: Backport
CVE: CVE-2021-4034

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../polkit/files/CVE-2021-4034.patch          | 74 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.116.bb   |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
new file mode 100644
index 000000000..cab1c83c0
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4034.patch
@@ -0,0 +1,74 @@
+From ed8b418f1341cf7fc576f6b17de5c6dd4017e034 Mon Sep 17 00:00:00 2001
+From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
+Date: Thu, 27 Jan 2022 00:01:27 +0000
+Subject: [PATCH] CVE-2021-4034: Local privilege escalation in pkexec due to 
+ incorrect handling of argument vector
+
+Upstream-Status: Backport https://gitlab.freedesktop.org/polkit/polkit/-/commit/a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
+CVE: CVE-2021-4034
+
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
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


