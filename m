Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id B52FE7E956
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:45 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s27so3424452pgl.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9Fc0R9PGhDjG/mj3Xd6dbGE22SwyOYpiPw1T8e7oRuw=;
	b=f34XihYawwenG3UjdgvwxiJFeLTPLJlQMooX+CWiledX5q3pc/GCLBR06rSquK5n1W
	r2sQ8rKZmMw7/w7hr7lHP7skf+qCFZK3POfOPl71j6c6IG+FH01nKoDrnF7X3mFgUzSA
	0UDV4J1dqcg5fdQT9QKHVZxn+K3iWOEYMqRBSAroX6E916h/9mX54g4l3+82JWQ/DfnO
	WAFJ5AldPAmC8zL9T/Cc+Tyo5/xvZ0dvMlu3XUWQF40BEYNqh3sDFbbis9tbubm3VO4h
	ohcZRnbRlProDKsfjZc+HFsYe+KiIvJdsEyiv8+tOEXGrnTk+rCYJZBIN231R45oQPTo
	Ep3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9Fc0R9PGhDjG/mj3Xd6dbGE22SwyOYpiPw1T8e7oRuw=;
	b=LUaZV8Ol3puSWTdtH7/ryxElixI/9T0Jkbm3rWa5IliUJ8+fYfaSVQ1+2TQamrpijA
	5vTRIsSzOlKRy+KeJm/PXejaF1VcYhEPUi9J12DgHUYZAEMCLQwTya5sccrZo1iyBW/M
	P5sxGZwMigLJYcJrcUqGo+9DCjQwZNNlSdft8cVy5vZl3RGSvT5PHwCoIs3zuFXIjJSt
	O0VlsRJNImqDKdkzbT6G5XnXNvvhvLE4h2DfLrsZZ+KhRNPfpk9NzAD2t0UDSIhGiZBB
	H83dAuXhnFVTCSMXl1l4/J3U8w3a7txPeiSg1XhBcD1KEbqSfg3SvEWkLmlDtuLBUYje
	xWdw==
X-Gm-Message-State: APjAAAWncOLIgdrfoYKIWgy4RBjZGjY5GGwfEmxMbSXkdbyT8UDqlzhx
	XLleFXbCtcDx6N9qcoAT92YyZk/0
X-Google-Smtp-Source: APXvYqxYjcJeDl4vI3acYq8NEpqSxdPDBhPV8cn2gY3L5dnQez5bBQry+rIt4n4wo4BPKb8b4n3mgg==
X-Received: by 2002:a65:4544:: with SMTP id x4mr42377797pgr.323.1560621466497; 
	Sat, 15 Jun 2019 10:57:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:20 -0700
Message-Id: <f15f39c6d065134e79edf019c97a03056d844eff.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 16/23] polkit: fix CVE-2019-6133
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:46 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...pare-PolkitUnixProcess-uids-for-temporary.patch | 186 +++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   7 +-
 2 files changed, 190 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch b/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
new file mode 100644
index 0000000..ae314e3
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch
@@ -0,0 +1,186 @@
+From eb1f1336e8e49b4db6243b543e0a71f7c0c9b5b1 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Fri, 4 Jan 2019 14:24:48 -0500
+Subject: [PATCH] backend: Compare PolkitUnixProcess uids for temporary
+ authorizations
+
+It turns out that the combination of `(pid, start time)` is not
+enough to be unique.  For temporary authorizations, we can avoid
+separate users racing on pid reuse by simply comparing the uid.
+
+https://bugs.chromium.org/p/project-zero/issues/detail?id=1692
+
+And the above original email report is included in full in a new comment.
+
+Reported-by: Jann Horn <jannh@google.com>
+
+Closes: https://gitlab.freedesktop.org/polkit/polkit/issues/75
+
+Upstream-Status: Backport
+CVE: CVE-2019-6133
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/polkit/polkitsubject.c                         |  2 +
+ src/polkit/polkitunixprocess.c                     | 71 +++++++++++++++++++++-
+ .../polkitbackendinteractiveauthority.c            | 39 +++++++++++-
+ 3 files changed, 110 insertions(+), 2 deletions(-)
+
+diff --git a/src/polkit/polkitsubject.c b/src/polkit/polkitsubject.c
+index d4c1182..ccabd0a 100644
+--- a/src/polkit/polkitsubject.c
++++ b/src/polkit/polkitsubject.c
+@@ -99,6 +99,8 @@ polkit_subject_hash (PolkitSubject *subject)
+  * @b: A #PolkitSubject.
+  *
+  * Checks if @a and @b are equal, ie. represent the same subject.
++ * However, avoid calling polkit_subject_equal() to compare two processes;
++ * for more information see the `PolkitUnixProcess` documentation.
+  *
+  * This function can be used in e.g. g_hash_table_new().
+  *
+diff --git a/src/polkit/polkitunixprocess.c b/src/polkit/polkitunixprocess.c
+index 972b777..7a6d48b 100644
+--- a/src/polkit/polkitunixprocess.c
++++ b/src/polkit/polkitunixprocess.c
+@@ -51,7 +51,10 @@
+  * @title: PolkitUnixProcess
+  * @short_description: Unix processs
+  *
+- * An object for representing a UNIX process.
++ * An object for representing a UNIX process.  NOTE: This object as
++ * designed is now known broken; a mechanism to exploit a delay in
++ * start time in the Linux kernel was identified.  Avoid
++ * calling polkit_subject_equal() to compare two processes.
+  *
+  * To uniquely identify processes, both the process id and the start
+  * time of the process (a monotonic increasing value representing the
+@@ -66,6 +69,72 @@
+  * polkit_unix_process_new_for_owner() with trusted data.
+  */
+ 
++/* See https://gitlab.freedesktop.org/polkit/polkit/issues/75
++
++  But quoting the original email in full here to ensure it's preserved:
++
++  From: Jann Horn <jannh@google.com>
++  Subject: [SECURITY] polkit: temporary auth hijacking via PID reuse and non-atomic fork
++  Date: Wednesday, October 10, 2018 5:34 PM
++
++When a (non-root) user attempts to e.g. control systemd units in the system
++instance from an active session over DBus, the access is gated by a polkit
++policy that requires "auth_admin_keep" auth. This results in an auth prompt
++being shown to the user, asking the user to confirm the action by entering the
++password of an administrator account.
++
++After the action has been confirmed, the auth decision for "auth_admin_keep" is
++cached for up to five minutes. Subject to some restrictions, similar actions can
++then be performed in this timespan without requiring re-auth:
++
++ - The PID of the DBus client requesting the new action must match the PID of
++   the DBus client requesting the old action (based on SO_PEERCRED information
++   forwarded by the DBus daemon).
++ - The "start time" of the client's PID (as seen in /proc/$pid/stat, field 22)
++   must not have changed. The granularity of this timestamp is in the
++   millisecond range.
++ - polkit polls every two seconds whether a process with the expected start time
++   still exists. If not, the temporary auth entry is purged.
++
++Without the start time check, this would obviously be buggy because an attacker
++could simply wait for the legitimate client to disappear, then create a new
++client with the same PID.
++
++Unfortunately, the start time check is bypassable because fork() is not atomic.
++Looking at the source code of copy_process() in the kernel:
++
++        p->start_time = ktime_get_ns();
++        p->real_start_time = ktime_get_boot_ns();
++        [...]
++        retval = copy_thread_tls(clone_flags, stack_start, stack_size, p, tls);
++        if (retval)
++                goto bad_fork_cleanup_io;
++
++        if (pid != &init_struct_pid) {
++                pid = alloc_pid(p->nsproxy->pid_ns_for_children);
++                if (IS_ERR(pid)) {
++                        retval = PTR_ERR(pid);
++                        goto bad_fork_cleanup_thread;
++                }
++        }
++
++The ktime_get_boot_ns() call is where the "start time" of the process is
++recorded. The alloc_pid() call is where a free PID is allocated. In between
++these, some time passes; and because the copy_thread_tls() call between them can
++access userspace memory when sys_clone() is invoked through the 32-bit syscall
++entry point, an attacker can even stall the kernel arbitrarily long at this
++point (by supplying a pointer into userspace memory that is associated with a
++userfaultfd or is backed by a custom FUSE filesystem).
++
++This means that an attacker can immediately call sys_clone() when the victim
++process is created, often resulting in a process that has the exact same start
++time reported in procfs; and then the attacker can delay the alloc_pid() call
++until after the victim process has died and the PID assignment has cycled
++around. This results in an attacker process that polkit can't distinguish from
++the victim process.
++*/
++
++
+ /**
+  * PolkitUnixProcess:
+  *
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index de3f752..098d343 100644
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -3035,6 +3035,43 @@ temporary_authorization_store_free (TemporaryAuthorizationStore *store)
+   g_free (store);
+ }
+ 
++/* See the comment at the top of polkitunixprocess.c */
++static gboolean
++subject_equal_for_authz (PolkitSubject *a,
++                         PolkitSubject *b)
++{
++  if (!polkit_subject_equal (a, b))
++    return FALSE;
++
++  /* Now special case unix processes, as we want to protect against
++   * pid reuse by including the UID.
++   */
++  if (POLKIT_IS_UNIX_PROCESS (a) && POLKIT_IS_UNIX_PROCESS (b)) {
++    PolkitUnixProcess *ap = (PolkitUnixProcess*)a;
++    int uid_a = polkit_unix_process_get_uid ((PolkitUnixProcess*)a);
++    PolkitUnixProcess *bp = (PolkitUnixProcess*)b;
++    int uid_b = polkit_unix_process_get_uid ((PolkitUnixProcess*)b);
++
++    if (uid_a != -1 && uid_b != -1)
++      {
++        if (uid_a == uid_b)
++          {
++            return TRUE;
++          }
++        else
++          {
++            g_printerr ("denying slowfork; pid %d uid %d != %d!\n",
++                        polkit_unix_process_get_pid (ap),
++                        uid_a, uid_b);
++            return FALSE;
++          }
++      }
++    /* Fall through; one of the uids is unset so we can't reliably compare */
++  }
++
++  return TRUE;
++}
++
+ static gboolean
+ temporary_authorization_store_has_authorization (TemporaryAuthorizationStore *store,
+                                                  PolkitSubject               *subject,
+@@ -3077,7 +3114,7 @@ temporary_authorization_store_has_authorization (TemporaryAuthorizationStore *st
+     TemporaryAuthorization *authorization = l->data;
+ 
+     if (strcmp (action_id, authorization->action_id) == 0 &&
+-        polkit_subject_equal (subject_to_use, authorization->subject))
++        subject_equal_for_authz (subject_to_use, authorization->subject))
+       {
+         ret = TRUE;
+         if (out_tmp_authz_id != NULL)
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index 13c4b02..562a754 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -23,9 +23,10 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-    file://0001-make-netgroup-support-configurable.patch \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-"
+           file://0001-make-netgroup-support-configurable.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch \
+           "
 SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
 SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
 
-- 
2.7.4


