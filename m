Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7740.1793266029820664072
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EP07Qr4t;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so965836a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266029; x=1793870829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2vj7RornLKYc++uyp99Qdq4ZPQUnFaj2VBHUN7VfLo=;
        b=EP07Qr4twAu1toDFXsd2wQNZh38h+a6do1uUJWsvk6ucIIVC2G46N2xlds54JEw9lL
         hk0DsxNw7HSn44H+lu/vhpzHd6MSU48nFi5neWlVx52fpCacUGoJRkJIpGhiVJTc81ut
         fQRdtkUCuNU6IVVJFn4aKJdJ20KXwJF8lxKfHFFjsEd8YZfGPBuDFgORWF72y8HaiJm6
         p1AENv/C9ObR4ZO82fhkoUUa2eQbeTDxJzTJ9HLgO78PtKa0WGolttu9HSNkYZIn5FGh
         nPwEa41yFYrQNjXCnGkql5l0kvKXgwGAUMlcWjoBwqdHmhK4GR4jSNqXNyG6ow21mzKr
         RS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266029; x=1793870829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2vj7RornLKYc++uyp99Qdq4ZPQUnFaj2VBHUN7VfLo=;
        b=jzDLlYcDwQD3dfvpitZ3O42m1vhE5+dQIvAdZvzHEpmSw7QFcHNwtquF4q1EpI7m6J
         yP4J2XxjkmsG7fj48qf4tG97iIg15xEMJdZc9dqX8GXJsjbqXqvBzvy9EmUmSGbjm2tf
         C8Bw9ZiWSdJqlc3HVy2sUfI88BBG9HQqqSLHoKwzBgUv1jM1tRJ+mC09dlqDwcMS1Bwm
         iC5Ti83cqw4yIXNNhmLPgnKd6+b3auyAKj+iigtPvAEL99uBiOwlv3IH8Y2RolgpP8N/
         zsh8rvVJr5u7W9jzmE9YKqC3FipN0u1nv6yzq+lZ6Dsng1P7U1TWD6UwIBP/9B20daac
         DE8g==
X-Gm-Message-State: AFq9FYK2pMsnbsG2hEqOcmuNht21AVp4bNPaYlv9F0MO6XWP6qXzcsk6
	bqDnQDf5T3Z9GngaHjhAH2x6zIqsdy264pQLVog4h/ustbno68gHh31XIgXveA==
X-Gm-Gg: AYBFou2eIj61U/57Fv318m7J6XmC3pS1CuUhkTLnc4QPUCY1EgxIQxsCIdyYomUZdrV
	jaIGG8hg+UfSaeGe+icNE7/4IUqDDlfglz/0QITri1D3qsS8xSy5jw82dNGngTt+snmKOamMVW8
	22oaDUP0tRaCpolZpT1B8o6kgApGlfmYxo52b15hHQ0pOuHF5enNSvQjtPvtzHnWO0gCY9azgPi
	iA4JQ7ENSCiEauv2Kr6Asg6n83WNe/f4t63Bp5pMAq3WyEvo2XktO8NJGLWfGqTe0vvzHrOfkVE
	Q6bTc1b+ShsLU1cGIJ9Vr71mioXgadvEgTIk1WCwomlZE+5fWqnnZ3zMCaeytaRXLNT7ArnuePG
	yO2LjUOrclkO4XiTwsjCO1/WmJyOmqYx23Fs/GLMmtzJjUTt27ZXnsgx+yqGnMIIsnRf8RiQkR8
	7gsInSlJndY9cECTSSgv75wWnHtIBN4ml54emqAEqXZ9bZ0oFPzJyhNXkzfhwECtoSNqR5sS9HC
	VxSZU4oluKcTKPZyAhfGeifUZedJGcPHeiLREi7BVwaE/+CMWlnxN9WqpSyiUEBk7ieGKLKsqH8
	AJffVd9r+8yP/1i3NuUYruRl8ihM/9Q1deK0wiMtAQE/V81xDN9TBMQGKmniR4VAuyKVKWbXXRE
	vY4UDwz0=
X-Received: by 2002:a17:90b:a09:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae57e35220mr2613700a91.4.1793266029101;
        Thu, 29 Oct 2026 02:27:09 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:27:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/7] polkit: upgrade 127 -> 128
Date: Thu, 29 Oct 2026 22:26:46 +1300
Message-ID: <20261029092646.3634215-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
References: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131655
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patched that are part of the upstream version.

Changelog:
https://github.com/polkit-org/polkit/blob/128/NEWS.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../polkit/files/CVE-2026-4897-01.patch       | 64 -------------------
 .../polkit/files/CVE-2026-4897-02.patch       | 32 ----------
 .../polkit/files/CVE-2026-85498.patch         | 38 -----------
 .../polkit/{polkit_127.bb => polkit_128.bb}   |  5 +-
 4 files changed, 1 insertion(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
 rename meta-oe/recipes-extended/polkit/{polkit_127.bb => polkit_128.bb} (95%)

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
deleted file mode 100644
index 96548ca771..0000000000
--- a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7e122c8a5120c2aae2d9d44a26796dc18f5b677c Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Fri, 27 Mar 2026 15:57:01 +0100
-Subject: [PATCH] CVE-2026-4897 - getline() string overflow
-
-Report and fix by Aisle.com
-Pavel Kohout, Aisle Research
-
-Signed-off-by: Jan Rybar jrybar@redhat.com
-
-CVE: CVE-2026-4897
-Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/7e122c8a5120c2aae2d9d44a26796dc18f5b677c]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/polkitagent/polkitagenthelperprivate.c | 23 +++++++++++++---------
- 1 file changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
-index 35bca85..7e4f94e 100644
---- a/src/polkitagent/polkitagenthelperprivate.c
-+++ b/src/polkitagent/polkitagenthelperprivate.c
-@@ -24,6 +24,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <stdlib.h>
-+#include <errno.h>
- #include <unistd.h>
- 
- #ifndef HAVE_CLEARENV
-@@ -59,21 +60,25 @@ read_cookie (int argc, char **argv)
-     return strdup (argv[2]);
-   else
-     {
--      char *ret = NULL;
--      size_t n = 0;
--      ssize_t r = getline (&ret, &n, stdin);
--      if (r == -1)
-+      #define POLKIT_AGENT_MAX_COOKIE 4096
-+      char buf[POLKIT_AGENT_MAX_COOKIE + 2]; /* +1 for newline, +1 for NUL */
-+      if (fgets (buf, sizeof(buf), stdin) == NULL)
-         {
-           if (!feof (stdin))
--            perror ("getline");
--          free (ret);
-+            perror ("fgets");
-           return NULL;
-         }
--      else
-+      if (buf[strlen (buf) - 1] != '\n')
-         {
--          g_strchomp (ret);
--          return ret;
-+          /* Cookie too long - drain remaining input and reject */
-+          int c;
-+          while ((c = getchar ()) != '\n' && c != EOF)
-+            ;
-+          errno = EOVERFLOW;
-+          return NULL;
-         }
-+      g_strchomp (buf);
-+      return strdup (buf);
-     }
- }
- 
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
deleted file mode 100644
index c47eee2014..0000000000
--- a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 39601309eb3e5e88a1c1fbda9a272ba8691f1bf3 Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Wed, 13 May 2026 14:58:32 +0200
-Subject: [PATCH] Draining loop can keep polkit busy
-
-The draining loop is not really appropriate for pipe input, especially
-in a daemon.
-
-Co-authored-by: Frantisek Sumsal <fsumsal@redhat.com>
-
-CVE: CVE-2026-4897
-Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/39601309eb3e5e88a1c1fbda9a272ba8691f1bf3]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/polkitagent/polkitagenthelperprivate.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
-index 7e4f94e..c0a9825 100644
---- a/src/polkitagent/polkitagenthelperprivate.c
-+++ b/src/polkitagent/polkitagenthelperprivate.c
-@@ -70,10 +70,6 @@ read_cookie (int argc, char **argv)
-         }
-       if (buf[strlen (buf) - 1] != '\n')
-         {
--          /* Cookie too long - drain remaining input and reject */
--          int c;
--          while ((c = getchar ()) != '\n' && c != EOF)
--            ;
-           errno = EOVERFLOW;
-           return NULL;
-         }
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
deleted file mode 100644
index 891d9215c9..0000000000
--- a/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From eea172967848bb4c5a407329f40c0e45de0d187e Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Thu, 27 Aug 2026 15:02:45 +0200
-Subject: [PATCH] CVE-2026-85498: Unsanitized underflow in cookie input
-
-Credits for the report:
-Sunwoo Lee, Korea Institute of Energy Technology (KENTECH)
-Daeyoung Kang, Korea Institute of Energy Technology (KENTECH)
-Haeryong Park, Korea Internet & Security Agency (KISA)
-Hyuk Lim, Korea Institute of Energy Technology (KENTECH)
-Seunghyun Yoon, Korea Institute of Energy Technology (KENTECH)
-Juthawong Naisanguansee
-
-Co-authored-by: Jan Rybar <jrybar@redhat.com>
-
-CVE: CVE-2026-85498
-Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/eea172967848bb4c5a407329f40c0e45de0d187e]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/polkitagent/polkitagenthelperprivate.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
-index c0a9825..e2d2c9b 100644
---- a/src/polkitagent/polkitagenthelperprivate.c
-+++ b/src/polkitagent/polkitagenthelperprivate.c
-@@ -68,6 +68,11 @@ read_cookie (int argc, char **argv)
-             perror ("fgets");
-           return NULL;
-         }
-+      if (buf[0] == '\0')
-+        {
-+          errno = EINVAL;
-+          return NULL;
-+        }
-       if (buf[strlen (buf) - 1] != '\n')
-         {
-           errno = EOVERFLOW;
diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_128.bb
similarity index 95%
rename from meta-oe/recipes-extended/polkit/polkit_127.bb
rename to meta-oe/recipes-extended/polkit/polkit_128.bb
index acd4386354..61dcdd0cb8 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_128.bb
@@ -7,12 +7,9 @@ BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
 SRC_URI = "\
     git://github.com/polkit-org/polkit.git;protocol=https;branch=main;tag=${PV} \
-    file://CVE-2026-4897-01.patch \
-    file://CVE-2026-4897-02.patch \
-    file://CVE-2026-85498.patch \
 "
 
-SRCREV = "9e4894c969eecf26a3ba762f4f7a268aa0fb3e51"
+SRCREV = "e6373dc19975d8583568c6cd7025d03e682ca956"
 
 DEPENDS = "expat glib-2.0 duktape"
 
