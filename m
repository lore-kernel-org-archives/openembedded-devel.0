Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CCCB67D656
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:04:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44q7WP1FJ9z4R
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 20:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556129089;
	bh=PsSjWIf+eNdrxiXs5LuBrA9wsu3NZMsNDsY+Bat1PdI=;
	h=From:To:Subject:Date:From;
	b=BAkB8gkTcgSY+Rp/aYQtCt5/a5cMu+3wQh0GEZ49fHQ6diQ3qfaoA6enuZomK61Bj
	EBOwQYRFMWYWEKl/rjyUYMSkcbKMZXSHnAiNUWr5MrqfUZp4eZCCfYzcxEo6XxiFJR
	f78Nfs9rQdW3ShE6BPm7FIFUVf3An0TGc9938d/xmB1mXYigpmMNm8uCOkDIAW9dTB
	KQNy7HhS/8HwJHAfZyIzvcpfIg9IMwsqtD3JTIhy+dtqv2/pYJjRPouR7PPnotNQTs
	/fwbkVUJzF6hg+QtaCvUHnPrrXaqpNrXg5mluQKzcOsRUsM3icViV6kLWJfuuGOB9q
	9N3CcbYpImiEWO9QsJVLIAvPwDJEbMpvGZrg/2h4mjAnpQHgIYEJccwZ50vOtW+Zl8
	hobqU1ygao7GRD4XfmvjMKnfiJ4g5K2pK6ouT3gmfoM6UoqEeQsVijEOaDh7Tgd/ea
	BD9ac9UtdcXPviVetG2VcC+hrVBNZ5XdUW9lJbzt35XNbygHN5AdJop08Uwv1ra9w3
	oCkBYgp8FSl0ZDP3Zoq5/S/E/M8Z4qpvNnDbPpKc8Poh2u0qc8O/bCenQraiqeuPE3
	HlqziI0I2fqnezul2nl8sdM1MM6IC6vv5xjmefezuyn4c9RiZO6gsNEEqNme55h8bo
	4dhLR2o90UMTGS2nr5WY/1aY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:04:48 +0300
Message-Id: <20190424180448.19524-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ledmon: Mark as incompatible on musl instead of adding bogus patch
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
X-List-Received-Date: Wed, 24 Apr 2019 18:04:50 -0000

atexit is not a drop-in replacement for on_exit,
mark as incompatible with musl instead of adding
a broken patch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ad-of-on_exit-for-musl-compatibility.patch | 53 -------------------
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb      |  2 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch
deleted file mode 100644
index de5ce9fc8..000000000
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 8aba09b743b4e89ef581a679943ce39a5c7fd4a5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Apr 2019 21:25:21 -0700
-Subject: [PATCH 1/2] use atexit insead of on_exit for musl compatibility
-
-musl does not support on_exit which is used in clean up.
-Instead use atexit with is supported by musl and glibc.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ledctl.c | 2 +-
- src/ledmon.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/ledctl.c b/src/ledctl.c
-index 2aa1abc..2c97dcf 100644
---- a/src/ledctl.c
-+++ b/src/ledctl.c
-@@ -689,7 +689,7 @@ int main(int argc, char *argv[])
- 	status = _init_ledctl_conf();
- 	if (status != STATUS_SUCCESS)
- 		return status;
--	if (on_exit(_ledctl_fini, progname))
-+	if (atexit(_ledctl_fini))
- 		exit(STATUS_ONEXIT_ERROR);
- 	if (_cmdline_parse(argc, argv))
- 		exit(STATUS_CMDLINE_ERROR);
-diff --git a/src/ledmon.c b/src/ledmon.c
-index 0ea2583..2333c7c 100644
---- a/src/ledmon.c
-+++ b/src/ledmon.c
-@@ -860,7 +860,7 @@ int main(int argc, char *argv[])
- 	set_invocation_name(argv[0]);
- 	openlog(progname, LOG_PID | LOG_PERROR, LOG_DAEMON);
- 
--	if (on_exit(_ledmon_status, &terminate))
-+	if (atexit(_ledmon_status))
- 		return STATUS_ONEXIT_ERROR;
- 
- 	if (_cmdline_parse_non_daemonise(argc, argv) != STATUS_SUCCESS)
-@@ -930,7 +930,7 @@ int main(int argc, char *argv[])
- 	}
- 	_ledmon_setup_signals();
- 
--	if (on_exit(_ledmon_fini, progname))
-+	if (atexit(_ledmon_fini))
- 		exit(STATUS_ONEXIT_ERROR);
- 	list_init(&ledmon_block_list, (item_free_t)block_device_fini);
- 	sysfs_init();
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
index 4376ad394..74ae56c67 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
@@ -16,13 +16,13 @@ inherit systemd
 SYSTEMD_SERVICE_${PN} = "ledmon.service"
 
 SRC_URI = "git://github.com/intel/ledmon;branch=master \
-           file://0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch \
            file://0002-include-sys-select.h-and-sys-types.h.patch \
           "
 
 SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+COMPATIBLE_HOST_libc-musl = "null"
 
 S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
-- 
2.17.1


