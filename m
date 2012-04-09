Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTN-0001du-Mv
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:41 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so2626913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1u2XGNtTpK6kZ0jQPIWvoh0p/fcBpAwtOR62kgAgGZ0=;
	b=I9U8dhZJFz4i8H5+VpZCz5npjPgfTZ+6Ap08fa3PAKC3pFHg0duEWQH/xw1blieJZ6
	pZWf5ncdo6t2uDsHKDYVQkXGMvlVej2hjLcGgvfG3WtKnjCbxbGnHZhi/Ycs9gUEMBj8
	PURjp4HUfOevhL/T/90njZcyuyNX36ZCMARCXO4oZYE8W0OmsyHnxD6PyR+cDnc/BxGk
	AJXyfVhqGz4/gBnRd0kIfeRVDZJgWTbskjiEs93e224YwxR5zkbO1BuEcqOFnlnZIid0
	rHzPgnOzePuFfHcSXAhJBtxe2jGjf31tKCx+QiYhO4dM37xaf7kR1BykNVZmJmWAX1SE
	6WsQ==
Received: by 10.180.76.240 with SMTP id n16mr16546342wiw.10.1333984587367;
	Mon, 09 Apr 2012 08:16:27 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm50083990wib.8.2012.04.09.08.16.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:09 +0200
Message-Id: <1333984573-28464-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQljX8Qvj4W9izAv9dpIo586IH45EJWsF81pChkDAjN31tkyU+8BrLHCnN4iaK4rBTcL7g73
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 06/10] systemd: bump SRCREV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 15:25:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...nald-allocate-PAGE_SIZE-bytes-for-selinux.patch |   34 --------------------
 ...-logind-don-t-kill-user-processes-on-exit.patch |   31 ------------------
 meta-oe/recipes-core/systemd/systemd_git.bb        |    6 +--
 3 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch
 delete mode 100644 meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch

diff --git a/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch b/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch
deleted file mode 100644
index 9c74f67..0000000
--- a/meta-oe/recipes-core/systemd/systemd/0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9d3226c3a3dd34e7299aa693544e45b8ebe9410b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 18 Mar 2012 09:18:39 +0100
-Subject: [PATCH] Revert "journald: allocate PAGE_SIZE bytes for selinux label length"
-
-This reverts commit 2d44fc7ba5aaf700672baa7b0697caefddafdc53.
----
- src/journal/journald.c |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/src/journal/journald.c b/src/journal/journald.c
-index baad3ab..3dde891 100644
---- a/src/journal/journald.c
-+++ b/src/journal/journald.c
-@@ -29,7 +29,6 @@
- #include <sys/ioctl.h>
- #include <linux/sockios.h>
- #include <sys/statvfs.h>
--#include <sys/user.h>
- 
- #include <systemd/sd-journal.h>
- #include <systemd/sd-login.h>
-@@ -2144,7 +2143,7 @@ static int process_event(Server *s, struct epoll_event *ev) {
-                                 uint8_t buf[CMSG_SPACE(sizeof(struct ucred)) +
-                                             CMSG_SPACE(sizeof(struct timeval)) +
-                                             CMSG_SPACE(sizeof(int)) +
--                                            CMSG_SPACE(PAGE_SIZE)]; /* selinux label */
-+                                            CMSG_SPACE(LINE_MAX)]; /* selinux label */
-                         } control;
-                         ssize_t n;
-                         int v;
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch b/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
deleted file mode 100644
index c28f189..0000000
--- a/meta-oe/recipes-core/systemd/systemd/0002-systemd-logind-don-t-kill-user-processes-on-exit.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From eccbcfd37d41e1cb66bdf19cded899a36cc3842d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 7 Feb 2012 10:12:51 +0100
-Subject: [PATCH 2/2] systemd-logind: don't kill user processes on exit
-
-This fixed screen and tmux
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-status: Unknown
-
----
- src/login/systemd-logind.conf |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/login/systemd-logind.conf b/src/login/systemd-logind.conf
-index 9909804..ba69b6c 100644
---- a/src/login/systemd-logind.conf
-+++ b/src/login/systemd-logind.conf
-@@ -9,7 +9,7 @@
- 
- [Login]
- #NAutoVTs=6
--#KillUserProcesses=no
-+KillUserProcesses=no
- #KillOnlyUsers=
- #KillExcludeUsers=root
- #Controllers=
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index e3aec31..d38bbc1 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,15 +14,13 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r23"
+PR = "r24"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "5ebff5337594d690b322078c512eb222d34aaa82"
+SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://0001-Revert-journald-allocate-PAGE_SIZE-bytes-for-selinux.patch \
-           file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
-- 
1.7.2.5



