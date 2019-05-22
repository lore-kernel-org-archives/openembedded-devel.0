Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D699F7E403
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:45:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c6so2141356pfa.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=imXLS2nGv/QCAbuP7thFgvh/B4pq5gvGrRuOI3wGDZI=;
	b=si/SPwuahI3SwsalzMS3oaTWBucT7xGfvDny75E32fULZ+V7uHAUq2HAT3r2v3HLz4
	IhojLMSOAKM5hTdYPeW2fNh+eWUyWUqCuljWyn784OwoqO7+acjVVJSsubIVssTWYxe9
	1NvjQwAIfsauwNJOMGYJQ3StAxpmOqDETucEw/cWgIr3McHDFVXWPSjSJDtxwPu0K/tt
	/h/qunbKmRg3nWTsRKmtgm9NZCW0/RoNxNuYkgqq5WZpiuRUna+l44VDj0lU6yE1fVgd
	/L4w20AWUsiQzFjUxZhfAu8hmxCdqGoUL5dKf0NeL52/X1uVHJO3UXOjUTTzeFnAhaya
	msWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=imXLS2nGv/QCAbuP7thFgvh/B4pq5gvGrRuOI3wGDZI=;
	b=UT8R9YWgs5Zxu+xl0FZEI3CW9OC4fLK0CThh9v/AMVHYYSpIIDCaNWZMwp6ifx3rrV
	UM2ttEiISPoeZJAX0x+M4Ni8/TLraD+p+9s3QNbDYIl3lUaGDDQ+sxb3fpSDhMX1pOcY
	SZ9gLZPj2uoIeZjsQGuVSppr3N+/f0l5nxXuMVJ13OHEsy2ywC5oPsAjWn/oo7VU7wsX
	tzHcZQHlhlNnqqMF2AvnXCuTGRXWdvTbxcJaLXdbzG5WPTQAlIZX8/CfQgvFLNRVagQI
	yI3sN76XqxTeAUQzKlzAdoL56fHSIFgnvTSJDHcM6Edh1Gyj3l9ZMiQWPyG+ixrovNd+
	PCZg==
X-Gm-Message-State: APjAAAVQ/Ra9YNFMGEYZZeL/GWJ+0X2FTvwpE+15xT4KuuphBbi/MPv0
	gJREEv4+fNWmpWW64r9a/VoJ195z93Y=
X-Google-Smtp-Source: APXvYqyVxxDMt4ViXM7KE7M50BlW6BnQAK0v6Xe94r5ORYELST/5eJtF5VbcQWYba+DLEj/QZD4xzQ==
X-Received: by 2002:a63:5964:: with SMTP id j36mr92458517pgm.384.1558568705384;
	Wed, 22 May 2019 16:45:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	k27sm18567808pfh.147.2019.05.22.16.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:45:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 16:44:55 -0700
Message-Id: <20190522234455.13121-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522234455.13121-1-raj.khem@gmail.com>
References: <20190522234455.13121-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Jann Horn <jannh@google.com>
Subject: [meta-oe][PATCH 4/4] polkit: Upgrade to 0.116
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2019 23:45:05 -0000
Content-Transfer-Encoding: 8bit

Make netgroup support optional so it can be disabled on musl
Drop backported patch 0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...PolkitUnixProcess-uids-for-temporary.patch | 186 --------------
 ...1-make-netgroup-support-configurable.patch |  93 -------
 .../0003-make-netgroup-support-optional.patch | 232 ++++++++++++++++++
 .../{polkit_0.115.bb => polkit_0.116.bb}      |   7 +-
 4 files changed, 235 insertions(+), 283 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
 rename meta-oe/recipes-extended/polkit/{polkit_0.115.bb => polkit_0.116.bb} (88%)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch b/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
deleted file mode 100644
index ae314e3c17..0000000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From eb1f1336e8e49b4db6243b543e0a71f7c0c9b5b1 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Fri, 4 Jan 2019 14:24:48 -0500
-Subject: [PATCH] backend: Compare PolkitUnixProcess uids for temporary
- authorizations
-
-It turns out that the combination of `(pid, start time)` is not
-enough to be unique.  For temporary authorizations, we can avoid
-separate users racing on pid reuse by simply comparing the uid.
-
-https://bugs.chromium.org/p/project-zero/issues/detail?id=1692
-
-And the above original email report is included in full in a new comment.
-
-Reported-by: Jann Horn <jannh@google.com>
-
-Closes: https://gitlab.freedesktop.org/polkit/polkit/issues/75
-
-Upstream-Status: Backport
-CVE: CVE-2019-6133
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/polkit/polkitsubject.c                         |  2 +
- src/polkit/polkitunixprocess.c                     | 71 +++++++++++++++++++++-
- .../polkitbackendinteractiveauthority.c            | 39 +++++++++++-
- 3 files changed, 110 insertions(+), 2 deletions(-)
-
-diff --git a/src/polkit/polkitsubject.c b/src/polkit/polkitsubject.c
-index d4c1182..ccabd0a 100644
---- a/src/polkit/polkitsubject.c
-+++ b/src/polkit/polkitsubject.c
-@@ -99,6 +99,8 @@ polkit_subject_hash (PolkitSubject *subject)
-  * @b: A #PolkitSubject.
-  *
-  * Checks if @a and @b are equal, ie. represent the same subject.
-+ * However, avoid calling polkit_subject_equal() to compare two processes;
-+ * for more information see the `PolkitUnixProcess` documentation.
-  *
-  * This function can be used in e.g. g_hash_table_new().
-  *
-diff --git a/src/polkit/polkitunixprocess.c b/src/polkit/polkitunixprocess.c
-index 972b777..7a6d48b 100644
---- a/src/polkit/polkitunixprocess.c
-+++ b/src/polkit/polkitunixprocess.c
-@@ -51,7 +51,10 @@
-  * @title: PolkitUnixProcess
-  * @short_description: Unix processs
-  *
-- * An object for representing a UNIX process.
-+ * An object for representing a UNIX process.  NOTE: This object as
-+ * designed is now known broken; a mechanism to exploit a delay in
-+ * start time in the Linux kernel was identified.  Avoid
-+ * calling polkit_subject_equal() to compare two processes.
-  *
-  * To uniquely identify processes, both the process id and the start
-  * time of the process (a monotonic increasing value representing the
-@@ -66,6 +69,72 @@
-  * polkit_unix_process_new_for_owner() with trusted data.
-  */
- 
-+/* See https://gitlab.freedesktop.org/polkit/polkit/issues/75
-+
-+  But quoting the original email in full here to ensure it's preserved:
-+
-+  From: Jann Horn <jannh@google.com>
-+  Subject: [SECURITY] polkit: temporary auth hijacking via PID reuse and non-atomic fork
-+  Date: Wednesday, October 10, 2018 5:34 PM
-+
-+When a (non-root) user attempts to e.g. control systemd units in the system
-+instance from an active session over DBus, the access is gated by a polkit
-+policy that requires "auth_admin_keep" auth. This results in an auth prompt
-+being shown to the user, asking the user to confirm the action by entering the
-+password of an administrator account.
-+
-+After the action has been confirmed, the auth decision for "auth_admin_keep" is
-+cached for up to five minutes. Subject to some restrictions, similar actions can
-+then be performed in this timespan without requiring re-auth:
-+
-+ - The PID of the DBus client requesting the new action must match the PID of
-+   the DBus client requesting the old action (based on SO_PEERCRED information
-+   forwarded by the DBus daemon).
-+ - The "start time" of the client's PID (as seen in /proc/$pid/stat, field 22)
-+   must not have changed. The granularity of this timestamp is in the
-+   millisecond range.
-+ - polkit polls every two seconds whether a process with the expected start time
-+   still exists. If not, the temporary auth entry is purged.
-+
-+Without the start time check, this would obviously be buggy because an attacker
-+could simply wait for the legitimate client to disappear, then create a new
-+client with the same PID.
-+
-+Unfortunately, the start time check is bypassable because fork() is not atomic.
-+Looking at the source code of copy_process() in the kernel:
-+
-+        p->start_time = ktime_get_ns();
-+        p->real_start_time = ktime_get_boot_ns();
-+        [...]
-+        retval = copy_thread_tls(clone_flags, stack_start, stack_size, p, tls);
-+        if (retval)
-+                goto bad_fork_cleanup_io;
-+
-+        if (pid != &init_struct_pid) {
-+                pid = alloc_pid(p->nsproxy->pid_ns_for_children);
-+                if (IS_ERR(pid)) {
-+                        retval = PTR_ERR(pid);
-+                        goto bad_fork_cleanup_thread;
-+                }
-+        }
-+
-+The ktime_get_boot_ns() call is where the "start time" of the process is
-+recorded. The alloc_pid() call is where a free PID is allocated. In between
-+these, some time passes; and because the copy_thread_tls() call between them can
-+access userspace memory when sys_clone() is invoked through the 32-bit syscall
-+entry point, an attacker can even stall the kernel arbitrarily long at this
-+point (by supplying a pointer into userspace memory that is associated with a
-+userfaultfd or is backed by a custom FUSE filesystem).
-+
-+This means that an attacker can immediately call sys_clone() when the victim
-+process is created, often resulting in a process that has the exact same start
-+time reported in procfs; and then the attacker can delay the alloc_pid() call
-+until after the victim process has died and the PID assignment has cycled
-+around. This results in an attacker process that polkit can't distinguish from
-+the victim process.
-+*/
-+
-+
- /**
-  * PolkitUnixProcess:
-  *
-diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index de3f752..098d343 100644
---- a/src/polkitbackend/polkitbackendinteractiveauthority.c
-+++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -3035,6 +3035,43 @@ temporary_authorization_store_free (TemporaryAuthorizationStore *store)
-   g_free (store);
- }
- 
-+/* See the comment at the top of polkitunixprocess.c */
-+static gboolean
-+subject_equal_for_authz (PolkitSubject *a,
-+                         PolkitSubject *b)
-+{
-+  if (!polkit_subject_equal (a, b))
-+    return FALSE;
-+
-+  /* Now special case unix processes, as we want to protect against
-+   * pid reuse by including the UID.
-+   */
-+  if (POLKIT_IS_UNIX_PROCESS (a) && POLKIT_IS_UNIX_PROCESS (b)) {
-+    PolkitUnixProcess *ap = (PolkitUnixProcess*)a;
-+    int uid_a = polkit_unix_process_get_uid ((PolkitUnixProcess*)a);
-+    PolkitUnixProcess *bp = (PolkitUnixProcess*)b;
-+    int uid_b = polkit_unix_process_get_uid ((PolkitUnixProcess*)b);
-+
-+    if (uid_a != -1 && uid_b != -1)
-+      {
-+        if (uid_a == uid_b)
-+          {
-+            return TRUE;
-+          }
-+        else
-+          {
-+            g_printerr ("denying slowfork; pid %d uid %d != %d!\n",
-+                        polkit_unix_process_get_pid (ap),
-+                        uid_a, uid_b);
-+            return FALSE;
-+          }
-+      }
-+    /* Fall through; one of the uids is unset so we can't reliably compare */
-+  }
-+
-+  return TRUE;
-+}
-+
- static gboolean
- temporary_authorization_store_has_authorization (TemporaryAuthorizationStore *store,
-                                                  PolkitSubject               *subject,
-@@ -3077,7 +3114,7 @@ temporary_authorization_store_has_authorization (TemporaryAuthorizationStore *st
-     TemporaryAuthorization *authorization = l->data;
- 
-     if (strcmp (action_id, authorization->action_id) == 0 &&
--        polkit_subject_equal (subject_to_use, authorization->subject))
-+        subject_equal_for_authz (subject_to_use, authorization->subject))
-       {
-         ret = TRUE;
-         if (out_tmp_authz_id != NULL)
diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch b/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
deleted file mode 100644
index 3b0ef5e5a3..0000000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 7d5e205aa58a10e7b1ccc2fa75b443508a5c3e18 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 04:31:59 +0000
-Subject: [PATCH] make netgroup support configurable
-
-Disable using innetgr and *netigrent function if not available
-
-These functions are not available on all libc implementations e.g. musl
-doesnt have them.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
-Rebase to 0.115
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac                                          | 2 +-
- src/polkitbackend/polkitbackendinteractiveauthority.c | 6 +++++-
- src/polkitbackend/polkitbackendjsauthority.cpp        | 2 ++
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8b3e1b1..1c392df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
- 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
- AC_SUBST(EXPAT_LIBS)
- 
--AC_CHECK_FUNCS(clearenv fdatasync)
-+AC_CHECK_FUNCS(clearenv fdatasync getnetgrent innetgr)
- 
- if test "x$GCC" = "xyes"; then
-   LDFLAGS="-Wl,--as-needed $LDFLAGS"
-diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index cb6fdab..de3f752 100644
---- a/src/polkitbackend/polkitbackendinteractiveauthority.c
-+++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2224,7 +2224,7 @@ get_users_in_group (PolkitIdentity                    *group,
-  out:
-   return ret;
- }
--
-+#if defined HAVE_GETNETGRENT
- static GList *
- get_users_in_net_group (PolkitIdentity                    *group,
-                         gboolean                           include_root)
-@@ -2285,6 +2285,8 @@ get_users_in_net_group (PolkitIdentity                    *group,
-   return ret;
- }
- 
-+#endif
-+
- /* ---------------------------------------------------------------------------------------------------- */
- 
- static void
-@@ -2369,10 +2371,12 @@ authentication_agent_initiate_challenge (AuthenticationAgent         *agent,
-         {
-           user_identities = g_list_concat (user_identities, get_users_in_group (identity, FALSE));
-         }
-+#if defined HAVE_GETNETGRENT
-       else if (POLKIT_IS_UNIX_NETGROUP (identity))
-         {
-           user_identities =  g_list_concat (user_identities, get_users_in_net_group (identity, FALSE));
-         }
-+#endif
-       else
-         {
-           g_warning ("Unsupported identity");
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 517f3c6..6042dd2 100644
---- a/src/polkitbackend/polkitbackendjsauthority.cpp
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-   user = JS_EncodeString (cx, args[0].toString());
-   netgroup = JS_EncodeString (cx, args[1].toString());
- 
-+#if defined HAVE_INNETGR
-   if (innetgr (netgroup,
-                NULL,  /* host */
-                user,
-@@ -1509,6 +1510,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-     {
-       is_in_netgroup =  true;
-     }
-+#endif
- 
-   JS_free (cx, netgroup);
-   JS_free (cx, user);
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
new file mode 100644
index 0000000000..fd7251369e
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
@@ -0,0 +1,232 @@
+From 21aa2747e8f0048759aab184b07dd6389666d5e6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 May 2019 13:18:55 -0700
+Subject: [PATCH] make netgroup support optional
+
+On at least Linux/musl and Linux/uclibc, netgroup
+support is not available.  PolKit fails to compile on these systems
+for that reason.
+
+This change makes netgroup support conditional on the presence of the
+setnetgrent(3) function which is required for the support to work.  If
+that function is not available on the system, an error will be returned
+to the administrator if unix-netgroup: is specified in configuration.
+
+Fixes bug 50145.
+
+Closes polkit/polkit#14.
+Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                                     |  2 +-
+ src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
+ src/polkit/polkitunixnetgroup.c                  |  3 +++
+ .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
+ src/polkitbackend/polkitbackendjsauthority.cpp   |  2 ++
+ test/polkit/polkitidentitytest.c                 |  9 ++++++++-
+ test/polkit/polkitunixnetgrouptest.c             |  3 +++
+ .../test-polkitbackendjsauthority.c              |  2 ++
+ 8 files changed, 43 insertions(+), 8 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXP
+ 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
+ AC_SUBST(EXPAT_LIBS)
+ 
+-AC_CHECK_FUNCS(clearenv fdatasync)
++AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
+ 
+ if test "x$GCC" = "xyes"; then
+   LDFLAGS="-Wl,--as-needed $LDFLAGS"
+--- a/src/polkit/polkitidentity.c
++++ b/src/polkit/polkitidentity.c
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gcha
+     }
+   else if (g_str_has_prefix (str, "unix-netgroup:"))
+     {
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine ('%s')",
++                   str);
++#else
+       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
++#endif
+     }
+ 
+   if (identity == NULL && (error != NULL && *error == NULL))
+@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVaria
+       GVariant *v;
+       const char *name;
+ 
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine");
++      goto out;
++#else
+       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
+       if (v == NULL)
+         {
+@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVaria
+       name = g_variant_get_string (v, NULL);
+       ret = polkit_unix_netgroup_new (name);
+       g_variant_unref (v);
++#endif
+     }
+   else
+     {
+--- a/src/polkit/polkitunixnetgroup.c
++++ b/src/polkit/polkitunixnetgroup.c
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUni
+ PolkitIdentity *
+ polkit_unix_netgroup_new (const gchar *name)
+ {
++#ifndef HAVE_SETNETGRENT
++  g_assert_not_reached();
++#endif
+   g_return_val_if_fail (name != NULL, NULL);
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
+                                        "name", name,
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
+   GList *ret;
+ 
+   ret = NULL;
++#ifdef HAVE_SETNETGRENT
+   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
+ 
+-#ifdef HAVE_SETNETGRENT_RETURN
++# ifdef HAVE_SETNETGRENT_RETURN
+   if (setnetgrent (name) == 0)
+     {
+       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
+       goto out;
+     }
+-#else
++# else
+   setnetgrent (name);
+-#endif
++# endif /* HAVE_SETNETGRENT_RETURN */
+ 
+   for (;;)
+     {
+-#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
++# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
+       const char *hostname, *username, *domainname;
+-#else
++# else
+       char *hostname, *username, *domainname;
+-#endif
++# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
+       PolkitIdentity *user;
+       GError *error = NULL;
+ 
+@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
+ 
+  out:
+   endnetgrent ();
++#endif /* HAVE_SETNETGRENT */
+   return ret;
+ }
+ 
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext
+ 
+   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
+ 
++#ifdef HAVE_SETNETGRENT
+   JS::RootedString usrstr (authority->priv->cx);
+   usrstr = args[0].toString();
+   user = JS_EncodeStringToUTF8 (cx, usrstr);
+@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext
+ 
+   JS_free (cx, netgroup);
+   JS_free (cx, user);
++#endif
+ 
+   ret = true;
+ 
+--- a/test/polkit/polkitidentitytest.c
++++ b/test/polkit/polkitidentitytest.c
+@@ -19,6 +19,7 @@
+  * Author: Nikki VonHollen <vonhollen@google.com>
+  */
+ 
++#include "config.h"
+ #include "glib.h"
+ #include <polkit/polkit.h>
+ #include <polkit/polkitprivate.h>
+@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_tes
+   {"unix-group:root", "unix-group:jane", FALSE},
+   {"unix-group:jane", "unix-group:jane", TRUE},
+ 
++#ifdef HAVE_SETNETGRENT
+   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
+   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
++#endif
+ 
+   {"unix-user:root", "unix-group:root", FALSE},
++#ifdef HAVE_SETNETGRENT
+   {"unix-user:jane", "unix-netgroup:foo", FALSE},
++#endif
+ 
+   {NULL},
+ };
+@@ -181,11 +186,13 @@ main (int argc, char *argv[])
+   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
+   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
+ 
++#ifdef HAVE_SETNETGRENT
+   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
++  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
++#endif
+ 
+   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
+   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
+-  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
+ 
+   add_comparison_tests ();
+ 
+--- a/test/polkit/polkitunixnetgrouptest.c
++++ b/test/polkit/polkitunixnetgrouptest.c
+@@ -19,6 +19,7 @@
+  * Author: Nikki VonHollen <vonhollen@google.com>
+  */
+ 
++#include "config.h"
+ #include "glib.h"
+ #include <polkit/polkit.h>
+ #include <string.h>
+@@ -69,7 +70,9 @@ int
+ main (int argc, char *argv[])
+ {
+   g_test_init (&argc, &argv, NULL);
++#ifdef HAVE_SETNETGRENT
+   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
+   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
++#endif
+   return g_test_run ();
+ }
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
+@@ -137,12 +137,14 @@ test_get_admin_identities (void)
+         "unix-group:users"
+       }
+     },
++#ifdef HAVE_SETNETGRENT
+     {
+       "net.company.action3",
+       {
+         "unix-netgroup:foo"
+       }
+     },
++#endif
+   };
+   guint n;
+ 
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
similarity index 88%
rename from meta-oe/recipes-extended/polkit/polkit_0.115.bb
rename to meta-oe/recipes-extended/polkit/polkit_0.116.bb
index 562a754b21..8754383efa 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -23,12 +23,11 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-           file://0001-make-netgroup-support-configurable.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch \
+           file://0003-make-netgroup-support-optional.patch \
            "
-SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
-SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
+SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
+SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
 
 EXTRA_OECONF = "--with-os-type=moblin \
                 --disable-man-pages \
-- 
2.21.0


