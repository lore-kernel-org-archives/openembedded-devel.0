Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BD0C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:47:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.10361.1718290033610310434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QwayX2V4;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f6a045d476so920212b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718290033; x=1718894833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Cp+xgzpn+uuvi++EQJuYR3vcqijq1vIL3qhfVmjKOE=;
        b=QwayX2V4ft32LxKqSqDxiwrrUEjT8MFxA/40aZ3VEtYjUhWHYjFyZiJGJEul9+pj0J
         Pqs/sMNTMBi7WD2i51Zj/NT7r/ehETGPvzfg9OMf8D7S/52xGqkqQR01c72fSRcr6NPK
         I9eznJ1mhDhE0i/4UL9Bkv8HC8qo4i8jNExtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718290033; x=1718894833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Cp+xgzpn+uuvi++EQJuYR3vcqijq1vIL3qhfVmjKOE=;
        b=cPqzZz1mLbRENd113Ei0VwjX0EPneaY9yFFTCd8HYDeWMWoSlWm/V84FyjqZjFhXN7
         ZyjQorjNIB9Kr7MJVc4hZh97kQ92DgXY/BjPSBQEUsELYDqb3LET+aXyuicVYPBPyg/p
         O5f+pf5XUsvU8K/e2vKjFmtwc61T2i0ZXhNEdRkmLhUnrAUvkYfmAt/s44nEdE93Sjlb
         +srMuY2lY15Z5BLdwpsrynGdQ0mU311fJmiWIVDFvKI6PoLQ27DvOEhS0UJeDpCtbSCF
         YUxOkKbzCAkaZLpQwN73SPl3QV8r3/ZE2hu6sb9aoazpzwZnwgISIv60Eif7R0oiFB5y
         BFHg==
X-Gm-Message-State: AOJu0YwYug+K0lo6XTo89ARI8VJsi8ieM6hHmKx4ZmYBEol28acyI2F9
	Ql+t48XeAZ3j1y50oIvcoh4II9UrOVOgy+JDnU9AczXYDDDdP9bMHcIdJaMu5IlmPZSOMa0Zmqq
	8
X-Google-Smtp-Source: AGHT+IFxwL/sChx9y9U8G8P+hG05t7aOEkhK32dVmLlJo3Dfq6I4f0iDjhAhjorQYhT9q88d8QVVfA==
X-Received: by 2002:a05:6a21:32a5:b0:1b8:a188:53da with SMTP id adf61e73a8af0-1bae7f0bb4bmr46061637.29.1718290032599;
        Thu, 13 Jun 2024 07:47:12 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.45.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fede16af41sm1197629a12.33.2024.06.13.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:47:12 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] nano: Security fix for CVE-2024-5742
Date: Thu, 13 Jun 2024 20:17:01 +0530
Message-Id: <20240613144701.7311-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 14:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110894

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://git.savannah.gnu.org/cgit/nano.git/commit/?id=5e7a3c2e7e118c7f12d5dfda9f9140f638976aa2]

CVE's Fixed:
CVE-2024-5742 nano: running `chmod` and `chown` on the filename allows malicious user to replace the emergency file with a malicious symlink to a root-owned file

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../nano/files/CVE-2024-5742.patch            | 101 ++++++++++++++++++
 meta-oe/recipes-support/nano/nano_7.2.bb      |   4 +-
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.patch

diff --git a/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch b/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
new file mode 100644
index 000000000..f29b73c53
--- /dev/null
+++ b/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
@@ -0,0 +1,101 @@
+From aad1439553de8ce0ef8815a65ac0732dc804507b Mon Sep 17 00:00:00 2001
+From: Benno Schulenberg <bensberg@telfort.nl>
+Date: Sun, 28 Apr 2024 10:51:52 +0200
+Subject: [PATCH] files: run `chmod` and `chown` on the descriptor, not on the
+ filename
+
+This closes a window of opportunity where the emergency file could be
+replaced by a malicious symlink.
+
+The issue was reported by `MartinJM` and `InvisibleMeerkat`.
+
+Problem existed since version 2.2.0, commit 123110c5, when chmodding
+and chowning of the emergency .save file was added.
+
+Upstream-Status: Backport from [https://git.savannah.gnu.org/cgit/nano.git/commit/?id=5e7a3c2e7e118c7f12d5dfda9f9140f638976aa2]
+CVE: CVE-2024-5742
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/definitions.h |  2 +-
+ src/files.c       | 13 ++++++++++++-
+ src/nano.c        | 12 +-----------
+ 3 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/definitions.h b/src/definitions.h
+index 288f1ff..04614a3 100644
+--- a/src/definitions.h
++++ b/src/definitions.h
+@@ -283,7 +283,7 @@ typedef enum {
+ } message_type;
+ 
+ typedef enum {
+-	OVERWRITE, APPEND, PREPEND
++	OVERWRITE, APPEND, PREPEND, EMERGENCY
+ } kind_of_writing_type;
+ 
+ typedef enum {
+diff --git a/src/files.c b/src/files.c
+index c6eadc1..88397d3 100644
+--- a/src/files.c
++++ b/src/files.c
+@@ -1760,6 +1760,8 @@ bool write_file(const char *name, FILE *thefile, bool normal,
+ #endif
+ 	char *realname = real_dir_from_tilde(name);
+ 		/* The filename after tilde expansion. */
++	int fd = 0;
++		/* The descriptor that is assigned when opening the file. */
+ 	char *tempname = NULL;
+ 		/* The name of the temporary file we use when prepending. */
+ 	linestruct *line = openfile->filetop;
+@@ -1843,7 +1845,6 @@ bool write_file(const char *name, FILE *thefile, bool normal,
+ 	 * For an emergency file, access is restricted to just the owner. */
+ 	if (thefile == NULL) {
+ 		mode_t permissions = (normal ? RW_FOR_ALL : S_IRUSR|S_IWUSR);
+-		int fd;
+ 
+ #ifndef NANO_TINY
+ 		block_sigwinch(TRUE);
+@@ -1969,6 +1970,16 @@ bool write_file(const char *name, FILE *thefile, bool normal,
+ 		}
+ #endif
+ 
++#if !defined(NANO_TINY) && defined(HAVE_CHMOD) && defined(HAVE_CHOWN)
++	/* Change permissions and owner of an emergency save file to the values
++	 * of the original file, but ignore any failure as we are in a hurry. */
++	if (method == EMERGENCY && fd && openfile->statinfo) {
++		IGNORE_CALL_RESULT(fchmod(fd, openfile->statinfo->st_mode));
++		IGNORE_CALL_RESULT(fchown(fd, openfile->statinfo->st_uid,
++											openfile->statinfo->st_gid));
++	}
++#endif
++
+ 	if (fclose(thefile) != 0) {
+ 		statusline(ALERT, _("Error writing %s: %s"), realname, strerror(errno));
+ 
+diff --git a/src/nano.c b/src/nano.c
+index c6db6dd..c8e5265 100644
+--- a/src/nano.c
++++ b/src/nano.c
+@@ -337,18 +337,8 @@ void emergency_save(const char *filename)
+ 
+ 	if (*targetname == '\0')
+ 		fprintf(stderr, _("\nToo many .save files\n"));
+-	else if (write_file(targetname, NULL, SPECIAL, OVERWRITE, NONOTES)) {
++	else if (write_file(targetname, NULL, SPECIAL, EMERGENCY, NONOTES))
+ 		fprintf(stderr, _("\nBuffer written to %s\n"), targetname);
+-#if !defined(NANO_TINY) && defined(HAVE_CHMOD) && defined(HAVE_CHOWN)
+-		/* Try to chmod/chown the saved file to the values of the original file,
+-		 * but ignore any failure as we are in a hurry to get out. */
+-		if (openfile->statinfo) {
+-			IGNORE_CALL_RESULT(chmod(targetname, openfile->statinfo->st_mode));
+-			IGNORE_CALL_RESULT(chown(targetname, openfile->statinfo->st_uid,
+-													openfile->statinfo->st_gid));
+-		}
+-#endif
+-	}
+ 
+ 	free(targetname);
+ 	free(plainname);
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-support/nano/nano_7.2.bb b/meta-oe/recipes-support/nano/nano_7.2.bb
index 0642287c9..73d46949d 100644
--- a/meta-oe/recipes-support/nano/nano_7.2.bb
+++ b/meta-oe/recipes-support/nano/nano_7.2.bb
@@ -12,7 +12,9 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
-SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
+SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz \
+           file://CVE-2024-5742.patch \
+          "
 SRC_URI[sha256sum] = "86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
-- 
2.34.1


