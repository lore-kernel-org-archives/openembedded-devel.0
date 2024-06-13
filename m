Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E43C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:45:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.10338.1718289950870623787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JLsbbQNA;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f6f38b1ab0so9360595ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718289950; x=1718894750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/23iDN522yEP1rTPoh6KOWbD9GrAvSIERz/9vjhnXY=;
        b=JLsbbQNAjCpI2GxisaILSFmfy1Z0qtqEPKr5kClZcGA75WZ1qnxOKjQTu+RS41LlVh
         8p03nNjMZM/1wPXx4X/Enxx3kGlvHQqhtWFonoc/39mTHlFph3a4Ua74AP+HMLkmG3B5
         s6BQeLC3b82iuTp1beYkaxUpttrjMZWs0YEZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289950; x=1718894750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/23iDN522yEP1rTPoh6KOWbD9GrAvSIERz/9vjhnXY=;
        b=C1EV4lrSHz8BDCgf1p0qr3WqGkUrtEQBnmSSJWGsBi2WJqKvjTSJiqe/LGG8iml5aU
         0Oe6eqpEv6oPriCCYwPm4EkE42+MuEWrwSyfk9Xcr7HqgB1eUsd8OujEosZGhE4/+1Yf
         dBG1h3DWqhz1AQlcbS52rXEzzqrFhz8rlwD6QFTPARJe9Oyjkqqr6IPS619SjC8TnVyo
         QFbE6HFHR8FRVTtGEyLzgqgOOyMQygVDwAZuNL0bjxKGJfKWP7n6JZ4m7UPB2Sdab3td
         ibmkj6YnDva8dLFGXq8mq5hypvUK9ZpemXH738LdHsEPptKcSKCNN2YTW0AlBydXM7TI
         h0gQ==
X-Gm-Message-State: AOJu0YxfYmUvYQwTrk8itY6Im948RwPaS2RJkPs9ururVJN5vsglhggO
	0IJg937CQKT9TvPUbIjrXITA9oZyWMyvvYq7fzhH9XBbZvP84G4/R6A8ELhViISQ3dFQQlNvV8M
	u
X-Google-Smtp-Source: AGHT+IHhYukMVS5h6OqrPTRoLgVjI9BEVkK36hhsfTIorFoeuIenqmqtPE+CJjzj1LFazIZsQYTgVw==
X-Received: by 2002:a17:902:e844:b0:1f7:317e:f4e0 with SMTP id d9443c01a7336-1f83b566164mr58891195ad.12.1718289949707;
        Thu, 13 Jun 2024 07:45:49 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.45.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70777sm14822675ad.87.2024.06.13.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:45:49 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] nano: Security fix for CVE-2024-5742
Date: Thu, 13 Jun 2024 20:15:40 +0530
Message-Id: <20240613144540.7223-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 14:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110893

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://git.savannah.gnu.org/cgit/nano.git/commit/?id=5e7a3c2e7e118c7f12d5dfda9f9140f638976aa2]

CVE's Fixed:
CVE-2024-5742 nano: running `chmod` and `chown` on the filename allows malicious user to replace the emergency file with a malicious symlink to a root-owned file

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../nano/files/CVE-2024-5742.patch            | 100 ++++++++++++++++++
 meta-oe/recipes-support/nano/nano_6.2.bb      |   4 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.patch

diff --git a/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch b/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
new file mode 100644
index 000000000..64a395f2d
--- /dev/null
+++ b/meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
@@ -0,0 +1,100 @@
+From 5e7a3c2e7e118c7f12d5dfda9f9140f638976aa2 Mon Sep 17 00:00:00 2001
+From: Benno Schulenberg <bensberg@telfort.nl>
+Date: Sun, 28 Apr 2024 10:51:52 +0200
+Subject: files: run `chmod` and `chown` on the descriptor, not on the filename
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
+index 2bdc782..e9d0de3 100644
+--- a/src/definitions.h
++++ b/src/definitions.h
+@@ -277,7 +277,7 @@ typedef enum {
+ } message_type;
+ 
+ typedef enum {
+-	OVERWRITE, APPEND, PREPEND
++	OVERWRITE, APPEND, PREPEND, EMERGENCY
+ } kind_of_writing_type;
+ 
+ typedef enum {
+diff --git a/src/files.c b/src/files.c
+index 62cc8f2..c5527a6 100644
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
+@@ -1970,6 +1971,16 @@ bool write_file(const char *name, FILE *thefile, bool normal,
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
+index 04ecdbb..2ce3462 100644
+--- a/src/nano.c
++++ b/src/nano.c
+@@ -337,18 +337,8 @@ void emergency_save(const char *filename)
+ 
+ 	if (*targetname == '\0')
+ 		fprintf(stderr, _("\nToo many .save files\n"));
+-	else if (write_file(targetname, NULL, SPECIAL, OVERWRITE, NONOTES)) {
++	else if (write_file(targetname, NULL, SPECIAL, EMERGENCY, NONOTES))
+ 		fprintf(stderr, _("\nBuffer written to %s\n"), targetname);
+-#ifndef NANO_TINY
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
+2.35.7
+
diff --git a/meta-oe/recipes-support/nano/nano_6.2.bb b/meta-oe/recipes-support/nano/nano_6.2.bb
index 0be022467..10e74869c 100644
--- a/meta-oe/recipes-support/nano/nano_6.2.bb
+++ b/meta-oe/recipes-support/nano/nano_6.2.bb
@@ -12,7 +12,9 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
-SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
+SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz \
+	   file://CVE-2024-5742.patch \
+	  "
 SRC_URI[sha256sum] = "2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
-- 
2.34.1


