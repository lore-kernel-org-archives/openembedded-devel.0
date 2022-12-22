Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6809AC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 03:36:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.37882.1671680182633111023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 19:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ycl8tbS1;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id p4so615294pjk.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 19:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmxmUJ0ACVMW+VfwJsMBVlC1J+9mzfF77wnH+VH06tk=;
        b=Ycl8tbS1lXotXEtTih3C+L0UT+lTDMr75cdKeow3jVMW17ol3pdYIXf2H/2uCrWi7A
         a8aQRChU+m3m2eRHW7act29oATxqOlHl2Ask4AzwDGqrGAXNV7K62iIXBX7JoaB9SZdx
         OVzBQsjbVXZDJTtRL27iaPtNN66kGAu3QbrRPNTFqYkd/9e0QBpfMy46vhBWK0gzt81C
         DXVe7tBjpR2fYns2c3p4vqKBE9Ye2no6ci4lyZZItaYnnu+kqBMhfU5laGjvym5ziaZ9
         sRMr28AjfUlSKWvC1mUG1j7T5pRVbgRPBNFKqklgN801HYNnN5T2Y29CMynNrVUnpMLN
         8kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmxmUJ0ACVMW+VfwJsMBVlC1J+9mzfF77wnH+VH06tk=;
        b=RmnVHnFRpb2B8PFzF5g3e2M6H9yCRVSYR8EaPtVxhaLEYZe0Vj9SFqpLKLLLrc9U4G
         U59lVPhiU6qxMqXoNrmBsNdqXgalbtVjDklYquWG11ZJA+3/CJRk533qbdMjJxAyUlGY
         aR5zlK45B5HWlbIqT0x1hemtsDVqHe8w0gLoX3eb2ehlEpR1TrBAC6KEO/JuVDbB2rth
         UnU009qaOPAI7zatyT6abpnko9e64v5sH6kOPOGX1U0cGYQEIqQc3yBSNb73P4Lkf0c3
         z48rnZq1p1HPHJQPFa67fAeWOAZtTYyE80bABkEv4tav2PwX1XAhasUq9Y+NVQXleW4M
         tznQ==
X-Gm-Message-State: AFqh2koyRzFh/IeJSkG9fn1a9NL7n4GTRDb+T1LbD5EyEvtjNb3HT03e
	SW5kFfsptFIwIC4YIbx618m4LGGXavg=
X-Google-Smtp-Source: AMrXdXvuZMUxq3yrAIFyiDqe4PnfDGZFpowVWj3No1tbtvftu3c8uIVWNxYOB/O2d/B1bgnXk45lGQ==
X-Received: by 2002:a05:6a20:b047:b0:ac:10:adfe with SMTP id dx7-20020a056a20b04700b000ac0010adfemr4665183pzb.30.1671680181793;
        Wed, 21 Dec 2022 19:36:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902778b00b0018941395c40sm12181244pll.285.2022.12.21.19.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 19:36:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] drbd,drbd-utils: Upgrade to 9.2.1 and drbd-utils to 9.22.0
Date: Wed, 21 Dec 2022 19:36:17 -0800
Message-Id: <20221222033617.1014467-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 03:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100185

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-replace-off64_t-with-off_t.patch     | 48 ++++++++++
 ...-of-GLOB_MAGCHAR-use-strchr-heuristi.patch | 96 +++++++++++++++++++
 ...d-utils_9.20.2.bb => drbd-utils_9.22.0.bb} |  9 +-
 .../drbd/{drbd_9.0.24-1.bb => drbd_9.2.1.bb}  |  4 +-
 4 files changed, 151 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.20.2.bb => drbd-utils_9.22.0.bb} (90%)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.24-1.bb => drbd_9.2.1.bb} (82%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
new file mode 100644
index 0000000000..2841d0feaf
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-replace-off64_t-with-off_t.patch
@@ -0,0 +1,48 @@
+From 5adae6737e919d957a08df437951ccb6996f9882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 19:16:03 -0800
+Subject: [PATCH 1/2] replace off64_t with off_t
+
+off_t is already 64-bits when _FILE_OFFSET_BITS=64
+using off_t also makes it portable on musl systems
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ user/v9/drbdadm_main.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/user/v9/drbdadm_main.c b/user/v9/drbdadm_main.c
+index 91e9507d..2030946c 100644
+--- a/user/v9/drbdadm_main.c
++++ b/user/v9/drbdadm_main.c
+@@ -1264,11 +1264,11 @@ static int adm_resource(const struct cfg_ctx *ctx)
+ 	return ex;
+ }
+ 
+-static off64_t read_drbd_dev_size(int minor)
++static off_t read_drbd_dev_size(int minor)
+ {
+ 	char *path;
+ 	FILE *file;
+-	off64_t val;
++	off_t val;
+ 	int r;
+ 
+ 	m_asprintf(&path, "/sys/block/drbd%d/size", minor);
+@@ -1289,9 +1289,9 @@ int adm_resize(const struct cfg_ctx *ctx)
+ 	char *argv[MAX_ARGS];
+ 	struct d_option *opt;
+ 	bool is_resize = !strcmp(ctx->cmd->name, "resize");
+-	off64_t old_size = -1;
+-	off64_t target_size = 0;
+-	off64_t new_size;
++	off_t old_size = -1;
++	off_t target_size = 0;
++	off_t new_size;
+ 	int argc = 0;
+ 	int silent;
+ 	int ex;
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch b/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
new file mode 100644
index 0000000000..45f7d6d415
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch
@@ -0,0 +1,96 @@
+From b70e5bf5bfa5fa2c2fffe08bcf300da1d3583602 Mon Sep 17 00:00:00 2001
+From: Lars Ellenberg <lars.ellenberg@linbit.com>
+Date: Wed, 9 Nov 2022 11:01:54 +0100
+Subject: [PATCH 2/2] drbdadm: drop use of GLOB_MAGCHAR, use strchr heuristic only
+
+Fixup for
+2022-09-05 4a1b5900 drbdadm: allow files from an expanded include glob to vanish
+
+When using the `include` statement, if the glob did not match any file,
+there is nothing to do, silently ignore.  Unless it was no glob, but a literal,
+which we would expect to exist.
+
+Also, there is a race between expanding a glob and accessing the file.
+That also should not happen for literals, though.
+
+Since we still had the heuristic anyways, because apparently |GLOB_MAGCHAR
+does not happen for GLOB_NOMATCH returns, and there exist non-GNU libc that
+don't (and likely won't) implement that extension, just forget about
+(gl_flags & GLOB_MAGCHAR) but use the incomplete strchr heuristic only.
+
+Sourced From Alpine: https://git.alpinelinux.org/aports/tree/main/drbd-utils/drop_use_of_GLOB_MAGCHAR.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ user/v9/drbdadm_parser.c | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/user/v9/drbdadm_parser.c b/user/v9/drbdadm_parser.c
+index b2f6ed8a..9a0a775d 100644
+--- a/user/v9/drbdadm_parser.c
++++ b/user/v9/drbdadm_parser.c
+@@ -1947,14 +1947,29 @@ void include_stmt(char *str)
+ 	size_t i;
+ 	int r;
+ 
+-	cwd = pushd_to_current_config_file_unless_stdin();
+-
+-	/* """
++	/*
++	 * If the glob did not match any file,
++	 * there is nothing to do, silently ignore.
++	 * Unless it was no glob, but a literal,
++	 * which we would expect to exist.
++	 *
++	 * """
+ 	 * As a GNU extension, pglob->gl_flags is set to the
+ 	 * flags specified, ored with GLOB_MAGCHAR if any
+ 	 * metacharacters were found.
+ 	 * """
++	 *
++	 * But apparently |GLOB_MAGCHAR does not happen for GLOB_NOMATCH returns,
++	 * at least not consistently :-(
++	 * Also, there exist non-GNU libc
++	 * So we have this incomplete strchr heuristic anyways.
+ 	 */
++	bool contains_glob_magic_char =
++			strchr(str, '*') ||
++			strchr(str, '?') ||
++			strchr(str, '[');
++
++	cwd = pushd_to_current_config_file_unless_stdin();
+ 	r = glob(str, 0, NULL, &glob_buf);
+ 	if (r == 0) {
+ 		for (i=0; i<glob_buf.gl_pathc; i++) {
+@@ -1965,7 +1980,7 @@ void include_stmt(char *str)
+ 			if (f) {
+ 				include_file(f, strdup(glob_buf.gl_pathv[i]));
+ 				fclose(f);
+-			} else if (errno == ENOENT && glob_buf.gl_flags & GLOB_MAGCHAR) {
++			} else if (errno == ENOENT && contains_glob_magic_char) {
+ 				/* Noisily ignore race between glob expansion
+ 				 * and actual open. */
+ 				err("%s:%d: include file vanished after glob expansion '%s'.\n",
+@@ -1979,17 +1994,7 @@ void include_stmt(char *str)
+ 		}
+ 		globfree(&glob_buf);
+ 	} else if (r == GLOB_NOMATCH) {
+-		/*
+-		 * If the glob did not match any file,
+-		 * there is nothing to do, silently ignore.
+-		 * Unless it was no glob, but a literal,
+-		 * which we would expect to exist.
+-		 * Apparently |GLOB_MAGCHAR does not happen for GLOB_NOMATCH returns,
+-		 * at least not consistently :-(
+-		 * So we have this strchr heuristic anyways.
+-		 */
+-		/* if (!(glob_buf.gl_flags & GLOB_MAGCHAR)) { */
+-		if (!strchr(str, '?') && !strchr(str, '*') && !strchr(str, '[')) {
++		if (!contains_glob_magic_char) {
+ 			err("%s:%d: Failed to open include file '%s'.\n",
+ 			    config_save, line, str);
+ 			config_valid = 0;
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
similarity index 90%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
index deaab641e2..89bf529165 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
@@ -8,14 +8,15 @@ SECTION = "admin"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV};protocol=https \
+SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;protocol=https \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
+           file://0001-replace-off64_t-with-off_t.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
            "
-
-SRCREV_drbd-utils = "087ee6b4961ca154d76e4211223b03149373bed8"
-SRCREV_drbd-headers = "f1529aa84e9d2f66c96ad283a1bbb708aabf03f7"
+SRC_URI:append:libc-musl = " file://0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch "
+SRCREV_drbd-utils = "409097fe02187f83790b88ac3e0d94f3c167adab"
+SRCREV_drbd-headers = "9a0f151fa0085f57910a2dcbbd658d6069554f62"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb b/meta-networking/recipes-support/drbd/drbd_9.2.1.bb
similarity index 82%
rename from meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.2.1.bb
index 0766f7f4bd..48ce2abf09 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.2.1.bb
@@ -8,10 +8,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 DEPENDS = "virtual/kernel"
 
-SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
+SRC_URI = "https://pkg.linbit.com//downloads/drbd/9/${BP}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            "
-SRC_URI[sha256sum] = "14970459f55bc465503b88b24d1a266b2ace0d69fe3cb387005b8477cd6475ed"
+SRC_URI[sha256sum] = "f59ee795188f21d4a62c5319c371ebad65ab3fb9b55e5212c3f1dd558978a843"
 
 inherit module
 
-- 
2.39.0


