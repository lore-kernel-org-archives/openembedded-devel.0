Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43CDC88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 23:00:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8628.1789340399363962088
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 15:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mdPe7LBj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260913225956dad37d467b000207d4-spdn2v@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260913225956dad37d467b000207d4
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 14 Sep 2026 00:59:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JV2NXLvZKFCxzKDsdgocesxigSy7Qry4rSk7WAV9ICQ=;
 b=mdPe7LBjMveDfc6+0orCTwwMT/c3DcRD9LdJYLTd2Un3qYHXzDKbz4hSqaLfaQrbCfprAC
 fg65eUm8htavX404yrzfJdXm1T2Tn/Mwxk6+tYL9rg1QyV7uYObRpDWC+9sj9qF/5rnsx/PH
 1v9JwI4bc7BmAQqLwHZm2SYWTLZ5Jkhl7B9YcwYpIbAHsRZz4rZeN+ZOLCUKDfwYfRs+trpA
 PNAiyuF8MI3cvZHuzwlhaVCeTjcJJlXFlPVdS9WYcSyEjGHJmYI1p3ZG4+sBsQLc7nuj/5CV
 LRUqJYCUXpamu7lY+spN/16naK4S6Wf9ap4hINIbcTVsodyxWXjxjfyg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] polkit: patch CVE-2026-4897 and CVE-2026-85498
Date: Mon, 14 Sep 2026 00:52:50 +0200
Message-ID: <20260913225250.569699-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 23:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130006

From: Peter Marko <peter.marko@siemens.com>

Pick patches mentioning these CVEs in their commit messages.
Note that patch for CVE-2026-4897 introduces CVE-2026-85498.
Also pick additional patch introduced between these commits which
touches the added code so the final patch applies cleanly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../polkit/files/CVE-2026-4897-01.patch       | 64 +++++++++++++++++++
 .../polkit/files/CVE-2026-4897-02.patch       | 32 ++++++++++
 .../polkit/files/CVE-2026-85498.patch         | 38 +++++++++++
 meta-oe/recipes-extended/polkit/polkit_127.bb |  7 +-
 4 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
new file mode 100644
index 0000000000..96548ca771
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
@@ -0,0 +1,64 @@
+From 7e122c8a5120c2aae2d9d44a26796dc18f5b677c Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Fri, 27 Mar 2026 15:57:01 +0100
+Subject: [PATCH] CVE-2026-4897 - getline() string overflow
+
+Report and fix by Aisle.com
+Pavel Kohout, Aisle Research
+
+Signed-off-by: Jan Rybar jrybar@redhat.com
+
+CVE: CVE-2026-4897
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/7e122c8a5120c2aae2d9d44a26796dc18f5b677c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/polkitagent/polkitagenthelperprivate.c | 23 +++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
+index 35bca85..7e4f94e 100644
+--- a/src/polkitagent/polkitagenthelperprivate.c
++++ b/src/polkitagent/polkitagenthelperprivate.c
+@@ -24,6 +24,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <errno.h>
+ #include <unistd.h>
+ 
+ #ifndef HAVE_CLEARENV
+@@ -59,21 +60,25 @@ read_cookie (int argc, char **argv)
+     return strdup (argv[2]);
+   else
+     {
+-      char *ret = NULL;
+-      size_t n = 0;
+-      ssize_t r = getline (&ret, &n, stdin);
+-      if (r == -1)
++      #define POLKIT_AGENT_MAX_COOKIE 4096
++      char buf[POLKIT_AGENT_MAX_COOKIE + 2]; /* +1 for newline, +1 for NUL */
++      if (fgets (buf, sizeof(buf), stdin) == NULL)
+         {
+           if (!feof (stdin))
+-            perror ("getline");
+-          free (ret);
++            perror ("fgets");
+           return NULL;
+         }
+-      else
++      if (buf[strlen (buf) - 1] != '\n')
+         {
+-          g_strchomp (ret);
+-          return ret;
++          /* Cookie too long - drain remaining input and reject */
++          int c;
++          while ((c = getchar ()) != '\n' && c != EOF)
++            ;
++          errno = EOVERFLOW;
++          return NULL;
+         }
++      g_strchomp (buf);
++      return strdup (buf);
+     }
+ }
+ 
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
new file mode 100644
index 0000000000..c47eee2014
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
@@ -0,0 +1,32 @@
+From 39601309eb3e5e88a1c1fbda9a272ba8691f1bf3 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Wed, 13 May 2026 14:58:32 +0200
+Subject: [PATCH] Draining loop can keep polkit busy
+
+The draining loop is not really appropriate for pipe input, especially
+in a daemon.
+
+Co-authored-by: Frantisek Sumsal <fsumsal@redhat.com>
+
+CVE: CVE-2026-4897
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/39601309eb3e5e88a1c1fbda9a272ba8691f1bf3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/polkitagent/polkitagenthelperprivate.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
+index 7e4f94e..c0a9825 100644
+--- a/src/polkitagent/polkitagenthelperprivate.c
++++ b/src/polkitagent/polkitagenthelperprivate.c
+@@ -70,10 +70,6 @@ read_cookie (int argc, char **argv)
+         }
+       if (buf[strlen (buf) - 1] != '\n')
+         {
+-          /* Cookie too long - drain remaining input and reject */
+-          int c;
+-          while ((c = getchar ()) != '\n' && c != EOF)
+-            ;
+           errno = EOVERFLOW;
+           return NULL;
+         }
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch b/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
new file mode 100644
index 0000000000..891d9215c9
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
@@ -0,0 +1,38 @@
+From eea172967848bb4c5a407329f40c0e45de0d187e Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Thu, 27 Aug 2026 15:02:45 +0200
+Subject: [PATCH] CVE-2026-85498: Unsanitized underflow in cookie input
+
+Credits for the report:
+Sunwoo Lee, Korea Institute of Energy Technology (KENTECH)
+Daeyoung Kang, Korea Institute of Energy Technology (KENTECH)
+Haeryong Park, Korea Internet & Security Agency (KISA)
+Hyuk Lim, Korea Institute of Energy Technology (KENTECH)
+Seunghyun Yoon, Korea Institute of Energy Technology (KENTECH)
+Juthawong Naisanguansee
+
+Co-authored-by: Jan Rybar <jrybar@redhat.com>
+
+CVE: CVE-2026-85498
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/eea172967848bb4c5a407329f40c0e45de0d187e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/polkitagent/polkitagenthelperprivate.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/polkitagent/polkitagenthelperprivate.c b/src/polkitagent/polkitagenthelperprivate.c
+index c0a9825..e2d2c9b 100644
+--- a/src/polkitagent/polkitagenthelperprivate.c
++++ b/src/polkitagent/polkitagenthelperprivate.c
+@@ -68,6 +68,11 @@ read_cookie (int argc, char **argv)
+             perror ("fgets");
+           return NULL;
+         }
++      if (buf[0] == '\0')
++        {
++          errno = EINVAL;
++          return NULL;
++        }
+       if (buf[strlen (buf) - 1] != '\n')
+         {
+           errno = EOVERFLOW;
diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
index f97c6efbf7..8c0a2d75d1 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -5,7 +5,12 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main;tag=${PV}"
+SRC_URI = "\
+    git://github.com/polkit-org/polkit.git;protocol=https;branch=main;tag=${PV} \
+    file://CVE-2026-4897-01.patch \
+    file://CVE-2026-4897-02.patch \
+    file://CVE-2026-85498.patch \
+"
 
 SRCREV = "9e4894c969eecf26a3ba762f4f7a268aa0fb3e51"
 

