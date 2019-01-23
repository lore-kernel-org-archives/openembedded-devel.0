Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D802860069
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2019 09:29:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0N9TlY7013362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2019 01:29:51 -0800 (PST)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 01:29:45 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Jan 2019 11:29:51 +0200
Message-ID: <20190123092951.14152-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [thud][meta-oe][PATCH] polkit: Fix CVE-2019-6133
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
X-List-Received-Date: Wed, 23 Jan 2019 09:29:51 -0000
Content-Type: text/plain

In PolicyKit (aka polkit) 0.115, the start time protection mechanism can
be bypassed because fork() is not atomic, and therefore authorization
decisions are improperly cached. This is related to lack of uid checking
in polkitbackend/polkitbackendinteractiveauthority.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-6133

Upstream patch:
https://gitlab.freedesktop.org/polkit/polkit/commit/c898fdf4b1aafaa04f8ada9d73d77c8bb76e2f81

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../polkit/polkit/CVE-2019-6133.patch              | 190 +++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2019-6133.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2019-6133.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2019-6133.patch
new file mode 100644
index 000000000..6fd20dc75
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2019-6133.patch
@@ -0,0 +1,190 @@
+From 6cc6aafee135ba44ea748250d7d29b562ca190e3 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2019-6133
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ src/polkit/polkitsubject.c                    |  2 +
+ src/polkit/polkitunixprocess.c                | 71 ++++++++++++++++++-
+ .../polkitbackendinteractiveauthority.c       | 39 +++++++++-
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
+index b02b258..78d7251 100644
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
+index a1630b9..80e8141 100644
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -3031,6 +3031,43 @@ temporary_authorization_store_free (TemporaryAuthorizationStore *store)
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
+@@ -3073,7 +3110,7 @@ temporary_authorization_store_has_authorization (TemporaryAuthorizationStore *st
+     TemporaryAuthorization *authorization = l->data;
+ 
+     if (strcmp (action_id, authorization->action_id) == 0 &&
+-        polkit_subject_equal (subject_to_use, authorization->subject))
++        subject_equal_for_authz (subject_to_use, authorization->subject))
+       {
+         ret = TRUE;
+         if (out_tmp_authz_id != NULL)
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index ad0f66a5e..8d592054f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -23,6 +23,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
     file://0001-make-netgroup-support-configurable.patch \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+    file://CVE-2019-6133.patch \
 "
 SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
 SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
-- 
2.13.3


