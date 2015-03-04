Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CD0DF60144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 15:59:33 +0000 (UTC)
Received: by qgdq107 with SMTP id q107so247327qgd.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=nO2yrPuFv3cQnLTRh3BrOzzDCVey3xd3SnHZUZ8HfZ4=;
	b=xrWSZSFyYjGUH1DN0sl0OeGDiuxyo/b1M48u0XCCvMy46nNkJknvyx7113OZhAOVDd
	wr/d6JUyELKv96YVzbZyAPbpoMFSEuvDOdQe4HtGnAf+56Qi1IKoCZ155NeqEKqN7yug
	QT64AraOH0A9ThPJSucow0M/C2LwPBKhigSmQnyLknzhotzAXPNy2QwCY+J7NQujRiQH
	zPz2+coTaWOJEGBUH2pseCuh1vnq/KhK7PgkjxaIGDoqGcO7wvIw8Bem754ylbaG874V
	CIkiHny8S4pH5UGKIT3eYv27XDbEk1K8i/gcBqE2s/u/1tjxFrYMvfCfRIXTX3cMJqrC
	Lffw==
X-Received: by 10.140.238.73 with SMTP id j70mr6709219qhc.37.1425484774446;
	Wed, 04 Mar 2015 07:59:34 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 11sm2432759qhh.7.2015.03.04.07.59.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 07:59:34 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2015 09:59:31 -0600
Message-Id: <1425484771-20079-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [OE-core][PATCH] systemd: don't create duplicate ACL entries
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 15:59:35 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

On systems where /var/log is not a volatile systemd-tmpfiles creates
duplicate ACL entries. This causes systemd-tmpfiles service to fail.

Backport the fix from systemd master to fix this.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...iles-avoid-creating-duplicate-acl-entries.patch | 132 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
new file mode 100644
index 0000000..c9fc865
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
@@ -0,0 +1,132 @@
+Upstream-Status: Backport
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+
+From 33d36e28b0a23fb7ac33435a1329d65bff1ba4ec Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 23 Feb 2015 23:19:54 -0500
+Subject: [PATCH] tmpfiles: avoid creating duplicate acl entries
+
+https://bugs.freedesktop.org/show_bug.cgi?id=89202
+https://bugs.debian.org/778656
+
+Status quo ante can be restored with:
+  getfacl -p /var/log/journal/`cat /etc/machine-id`|grep -v '^#'|sort -u|sudo setfacl --set-file=- /var/log/journal/`cat /etc/machine-id`
+---
+ src/shared/acl-util.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++--
+ src/shared/acl-util.h |  4 +++
+ 2 files changed, 81 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/acl-util.c b/src/shared/acl-util.c
+index a4ff1ab..cbe09d7 100644
+--- a/src/shared/acl-util.c
++++ b/src/shared/acl-util.c
+@@ -282,6 +282,77 @@ int parse_acl(char *text, acl_t *acl_access, acl_t *acl_default, bool want_mask)
+         return 0;
+ }
+ 
++static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
++        acl_tag_t tag_a, tag_b;
++
++        if (acl_get_tag_type(a, &tag_a) < 0)
++                return -errno;
++
++        if (acl_get_tag_type(b, &tag_b) < 0)
++                return -errno;
++
++        if (tag_a != tag_b)
++                return false;
++
++        switch (tag_a) {
++        case ACL_USER_OBJ:
++        case ACL_GROUP_OBJ:
++        case ACL_MASK:
++        case ACL_OTHER:
++                /* can have only one of those */
++                return true;
++        case ACL_USER: {
++                _cleanup_(acl_free_uid_tpp) uid_t *uid_a, *uid_b;
++
++                uid_a = acl_get_qualifier(a);
++                if (!uid_a)
++                        return -errno;
++
++                uid_b = acl_get_qualifier(b);
++                if (!uid_b)
++                        return -errno;
++
++                return *uid_a == *uid_b;
++        }
++        case ACL_GROUP: {
++                _cleanup_(acl_free_gid_tpp) gid_t *gid_a, *gid_b;
++
++                gid_a = acl_get_qualifier(a);
++                if (!gid_a)
++                        return -errno;
++
++                gid_b = acl_get_qualifier(b);
++                if (!gid_b)
++                        return -errno;
++
++                return *gid_a == *gid_b;
++        }
++        default:
++                assert_not_reached("Unknown acl tag type");
++        }
++}
++
++static int find_acl_entry(acl_t acl, acl_entry_t entry, acl_entry_t *out) {
++        acl_entry_t i;
++        int r;
++
++        for (r = acl_get_entry(acl, ACL_FIRST_ENTRY, &i);
++             r > 0;
++             r = acl_get_entry(acl, ACL_NEXT_ENTRY, &i)) {
++
++                r = acl_entry_equal(i, entry);
++                if (r < 0)
++                        return r;
++                if (r > 0) {
++                        *out = i;
++                        return 1;
++                }
++        }
++        if (r < 0)
++                return -errno;
++        return 0;
++}
++
+ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
+         _cleanup_(acl_freep) acl_t old;
+         acl_entry_t i;
+@@ -297,8 +368,12 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
+ 
+                 acl_entry_t j;
+ 
+-                if (acl_create_entry(&old, &j) < 0)
+-                        return -errno;
++                r = find_acl_entry(old, i, &j);
++                if (r < 0)
++                        return r;
++                if (r == 0)
++                        if (acl_create_entry(&old, &j) < 0)
++                                return -errno;
+ 
+                 if (acl_copy_entry(j, i) < 0)
+                         return -errno;
+diff --git a/src/shared/acl-util.h b/src/shared/acl-util.h
+index 90e88ff..fdb9006 100644
+--- a/src/shared/acl-util.h
++++ b/src/shared/acl-util.h
+@@ -41,5 +41,9 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl);
+ DEFINE_TRIVIAL_CLEANUP_FUNC(acl_t, acl_free);
+ #define acl_free_charp acl_free
+ DEFINE_TRIVIAL_CLEANUP_FUNC(char*, acl_free_charp);
++#define acl_free_uid_tp acl_free
++DEFINE_TRIVIAL_CLEANUP_FUNC(uid_t*, acl_free_uid_tp);
++#define acl_free_gid_tp acl_free
++DEFINE_TRIVIAL_CLEANUP_FUNC(gid_t*, acl_free_gid_tp);
+ 
+ #endif
+-- 
+2.3.1
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 24486f1..3832071 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
            file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
+           file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
            file://tmpfiles-pam.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
2.3.1


