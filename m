Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AD3C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 08:56:57 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.2863.1648198615919588046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 01:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1nXfka-0002TR-Q1; Fri, 25 Mar 2022 10:56:53 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1nXfka-000Bze-Mw; Fri, 25 Mar 2022 10:56:52 +0200
From: mikko.rapeli@bmw.de
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][PATCH v3 1/2] polkit: add patches for CVE-2021-4034 and
 CVE-2021-4115
Date: Fri, 25 Mar 2022 10:56:26 +0200
Message-Id: <20220325085627.45116-2-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220325085627.45116-1-mikko.rapeli@bmw.de>
References: <20220325085627.45116-1-mikko.rapeli@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220325085627.45116-2-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 08:56:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96206

From: Mikko Rapeli <mikko.rapeli@bmw.de>

They were available in polkit master branch and cherry-pick to
0.119 version works so pick the patches.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 ...l-privilege-escalation-CVE-2021-4034.patch | 84 ++++++++++++++++++
 ...0002-CVE-2021-4115-GHSL-2021-077-fix.patch | 88 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |  2 +
 3 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch b/meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch
new file mode 100644
index 000000000..c725c001d
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch
@@ -0,0 +1,84 @@
+From 85c2dd9275cdfb369f613089f22733c0f1ba2aec Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Tue, 25 Jan 2022 17:21:46 +0000
+Subject: [PATCH 1/3] pkexec: local privilege escalation (CVE-2021-4034)
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+---
+ src/programs/pkcheck.c |  5 +++++
+ src/programs/pkexec.c  | 23 ++++++++++++++++++++---
+ 2 files changed, 25 insertions(+), 3 deletions(-)
+
+CVE: CVE-2021-4034
+Upstream-Status: Backport [a2bf5c9c83b6ae46cbd5c779d3055bff81ded683]
+
+diff --git a/src/programs/pkcheck.c b/src/programs/pkcheck.c
+index f1bb4e1..768525c 100644
+--- a/src/programs/pkcheck.c
++++ b/src/programs/pkcheck.c
+@@ -363,6 +363,11 @@ main (int argc, char *argv[])
+   local_agent_handle = NULL;
+   ret = 126;
+ 
++  if (argc < 1)
++    {
++      exit(126);
++    }
++
+   /* Disable remote file access from GIO. */
+   setenv ("GIO_USE_VFS", "local", 1);
+ 
+diff --git a/src/programs/pkexec.c b/src/programs/pkexec.c
+index 7698c5c..84e5ef6 100644
+--- a/src/programs/pkexec.c
++++ b/src/programs/pkexec.c
+@@ -488,6 +488,15 @@ main (int argc, char *argv[])
+   pid_t pid_of_caller;
+   gpointer local_agent_handle;
+ 
++
++  /*
++   * If 'pkexec' is called THIS wrong, someone's probably evil-doing. Don't be nice, just bail out.
++   */
++  if (argc<1)
++    {
++      exit(127);
++    }
++
+   ret = 127;
+   authority = NULL;
+   subject = NULL;
+@@ -614,10 +623,10 @@ main (int argc, char *argv[])
+ 
+       path = g_strdup (pwstruct.pw_shell);
+       if (!path)
+-	{
++        {
+           g_printerr ("No shell configured or error retrieving pw_shell\n");
+           goto out;
+-	}
++        }
+       /* If you change this, be sure to change the if (!command_line)
+ 	 case below too */
+       command_line = g_strdup (path);
+@@ -636,7 +645,15 @@ main (int argc, char *argv[])
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
+2.20.1
+
diff --git a/meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch b/meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch
new file mode 100644
index 000000000..fcad872dc
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch
@@ -0,0 +1,88 @@
+From c86aea01a06ad4d6c428137e9cfe2f74b1ae7f01 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Mon, 21 Feb 2022 08:29:05 +0000
+Subject: [PATCH 2/3] CVE-2021-4115 (GHSL-2021-077) fix
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
+
+---
+ src/polkit/polkitsystembusname.c | 38 ++++++++++++++++++++++++++++----
+ 1 file changed, 34 insertions(+), 4 deletions(-)
+
+CVE: CVE-2021-4115
+Upstream-Status: Backport [41cb093f554da8772362654a128a84dd8a5542a7]
+
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
+index 8ed1363..2fbf5f1 100644
+--- a/src/polkit/polkitsystembusname.c
++++ b/src/polkit/polkitsystembusname.c
+@@ -62,6 +62,10 @@ enum
+   PROP_NAME,
+ };
+ 
++
++guint8 dbus_call_respond_fails;      // has to be global because of callback
++
++
+ static void subject_iface_init (PolkitSubjectIface *subject_iface);
+ 
+ G_DEFINE_TYPE_WITH_CODE (PolkitSystemBusName, polkit_system_bus_name, G_TYPE_OBJECT,
+@@ -364,6 +368,7 @@ on_retrieved_unix_uid_pid (GObject              *src,
+   if (!v)
+     {
+       data->caught_error = TRUE;
++      dbus_call_respond_fails += 1;
+     }
+   else
+     {
+@@ -405,6 +410,8 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+   tmp_context = g_main_context_new ();
+   g_main_context_push_thread_default (tmp_context);
+ 
++  dbus_call_respond_fails = 0;
++
+   /* Do two async calls as it's basically as fast as one sync call.
+    */
+   g_dbus_connection_call (connection,
+@@ -432,11 +439,34 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+ 			  on_retrieved_unix_uid_pid,
+ 			  &data);
+ 
+-  while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
+-    g_main_context_iteration (tmp_context, TRUE);
++  while (TRUE)
++  {
++    /* If one dbus call returns error, we must wait until the other call
++     * calls _call_finish(), otherwise fd leak is possible.
++     * Resolves: GHSL-2021-077
++    */
+ 
+-  if (data.caught_error)
+-    goto out;
++    if ( (dbus_call_respond_fails > 1) )
++    {
++      // we got two faults, we can leave
++      goto out;
++    }
++
++    if ((data.caught_error && (data.retrieved_pid || data.retrieved_uid)))
++    {
++      // we got one fault and the other call finally finished, we can leave
++      goto out;
++    }
++
++    if ( !(data.retrieved_uid && data.retrieved_pid) )
++    {
++      g_main_context_iteration (tmp_context, TRUE);
++    }
++    else
++    {
++      break;
++    }
++  }
+ 
+   if (out_uid)
+     *out_uid = data.uid;
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index 8a326a981..b68ecaf08 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
            file://0003-make-netgroup-support-optional.patch \
            file://0002-jsauthority-port-to-mozjs-91.patch \
            file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
+           file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
+           file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
            "
 SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
-- 
2.20.1


