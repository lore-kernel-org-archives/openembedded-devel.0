Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC65CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:23:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11617.1758194630678765632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDDKK/lo;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b079c13240eso144722766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194629; x=1758799429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MACcQa78PnR9Iz+np4xbR01tSA+UL/dmd8UR7rNf1I8=;
        b=RDDKK/loYhvYNcthLAkjugWU96MIkSuv9TMAK3FLi8uBBWtMsbfKvtoUP6fvXRzRCY
         yPfzrvH8129JIes7ChsURlKRYmnFRdWVeXlbCWUH+DAC4tQ8olpCc2AebA1AVUE4zXZi
         N9h6l0ABPNzolX7SYC9MDF6EVEgwiqbNcqpIvKyehial0P+nxsfrV1U4H0wPg+/TF1ko
         D6uczUiLNpZaQOAymkit8bp6HVRURw0Da87NL1Qs8I/uVgrTt45Z5WNqySHrEntKBgEe
         tl9BQX7d6dXxV3hx2/iAweu8Yy0ndcnFITShIfCkMu8/G0lPtRQ6N1LGICtgkaxLnuRM
         VzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194629; x=1758799429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MACcQa78PnR9Iz+np4xbR01tSA+UL/dmd8UR7rNf1I8=;
        b=Rj7KiVzx66rSJpyfNh4cMtgAJKDZDijdQ1zNhPh2l6//KxFNMuyHZkuLIrD00gKv2a
         5IX+P4qcwOFYBnn3rxXGW2lNaSyANIVYckOJYZP/lNt+MWfVZ3oMEsTnRIxvZh3OSfXy
         ucRxfTtrETAUmpjxRNkZ/llLs9ZArWakixHnK7wucz9oPYF44bF7bJd8lChDECJEoQSL
         6WqajGQP8cqj2TAG7xP30hncuNKHoxxC4ndKRB6vYOTfSjtXhHLUyyTwjZCoLdKGjuB2
         +s4pzYY39n/tuvub0NLA6FoftG37zv7x6eZUK1XwXAfNlsC60k50x2k5b5BVrKuCMsmn
         qXRg==
X-Gm-Message-State: AOJu0YzMSUAHbcaW3TdfUvSuYrCmjpZdYhrrFiJCEEITg1wcdHS4TSUt
	qOG+lF4mdCnkqlkIYXelSkc9XG91dWayWTcrJAXbOA3fBIHtrexZNzFZOv2Ddg==
X-Gm-Gg: ASbGncvwdodDe6+Kf9j4Sn7Z2vRgk2/4n1Y4kyOnijJ3uEt8sphH0CLx7lYwaDcrIk8
	d+pk/DLKRYHmw2HoiOWZm13FOn6ksWI+t8+qAolEmSQ1wy0u0wKiO9NhgLZQ5MdQWMraI5XVTTC
	cV/qeLUy3UrtYCK2kEq1lS5ToIEsVLH1fAvrkPIqg2NTQBa6KuhyeDm/Nev+zKJ7LMgALMuhbRL
	Ch5IIBO5JZM1h5kNKRyKjMUptvNn/HqO0ILKpMuIOhh9F2R9E17r6FI9E+xoM0ZW35ForB9jeWZ
	UgbIUsnmAeREQ5OsCowuCHaum0MWBziN9YmkOZ3SH2vZWiCTTptNf0Rsoob0nvJ2mUdG4vNKCKE
	+6vnSXyDLBdFCeLO7yoylyG2jA8sUZljYpjJLwuzEX7RfWs6uhg==
X-Google-Smtp-Source: AGHT+IGfkHcXjDmi8U3KDFsZ9J27dhamDwf5ey3XKqOtZ4/7WnjqBy+1fXwNim6vT1Po8aumE5cvxA==
X-Received: by 2002:a17:907:94c3:b0:b04:1edf:a42b with SMTP id a640c23a62f3a-b1baf60e243mr587068366b.11.1758194628882;
        Thu, 18 Sep 2025 04:23:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/10] pm-qa: fix build with gcc-15.0.1
Date: Thu, 18 Sep 2025 13:23:36 +0200
Message-ID: <20250918112347.1331393-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119561

From: "mark.yang" <mark.yang@lge.com>

* fix following error:
  http://errors.yoctoproject.org/Errors/Details/850314
    utils/uevent_reader.c: In function 'main':
    utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
    33 |         signal(SIGINT, exit_handler);
        |                        ^~~~~~~~~~~~
        |                        |
        |                        void (*)(void)
    In file included from utils/uevent_reader.c:4:
    TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
    88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
        |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
    utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
    15 | void exit_handler()
        |      ^~~~~~~~~~~~
    TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
    72 | typedef void (*__sighandler_t) (int);
        |                ^~~~~~~~~~~~~~
    make: *** [<builtin>: utils/uevent_reader] Error 1

  Set PATCHTOOL to git because this recipe compiles all .c files including those in .pc/ directory which causes build errors.
  .pc/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch/utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
   15 | void exit_handler()

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a0b88afd798221b0751fc506e6ea224cd6745ec7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...cc-15-Wincompatible-pointer-types-er.patch | 69 +++++++++++++++++++
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |  7 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
new file mode 100644
index 0000000000..7efd8dd71a
--- /dev/null
+++ b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
@@ -0,0 +1,69 @@
+From b6b968d1c8fbba79b33d63874b551225e663435e Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 2 Apr 2025 16:59:00 +0900
+Subject: [PATCH] fix build with gcc-15 -Wincompatible-pointer-types error
+
+See more details: http://errors.yoctoproject.org/Errors/Details/850314
+utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+   33 |         signal(SIGINT, exit_handler);
+      |                        ^~~~~~~~~~~~
+      |                        |
+      |                        void (*)(void)
+In file included from utils/uevent_reader.c:4:
+TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
+   15 | void exit_handler()
+      |      ^~~~~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+* Set the parameter of exit_handler() to int.
+  Changed to use exit_handler(0).
+  The parameter is not used inside exit_handler() anyway.
+
+Upstream-Status: Inactive-Upstream [lastrelease: 6 years ago]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ utils/uevent_reader.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/utils/uevent_reader.c b/utils/uevent_reader.c
+index afbb426..75d445c 100644
+--- a/utils/uevent_reader.c
++++ b/utils/uevent_reader.c
+@@ -12,7 +12,7 @@
+ 
+ FILE *fp;
+ 
+-void exit_handler()
++void exit_handler(int sig)
+ {
+ 	fprintf(stdout, "exiting from uevent reader...\n");
+ 	fclose(fp);
+@@ -42,20 +42,20 @@ int main(int argc, char *argv[])
+ 	pfd.fd = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
+ 	if (pfd.fd == -1) {
+ 		perror("error: socket()");
+-		exit_handler();
++		exit_handler(0);
+ 	}
+ 
+ 	if (bind(pfd.fd, (struct sockaddr *) &nls,
+ 				sizeof(struct sockaddr_nl))) {
+ 		perror("error : bind()");
+-		exit_handler();
++		exit_handler(0);
+ 	}
+ 
+ 	while (-1 != poll(&pfd, 1, -1)) {
+ 		int i, len = recv(pfd.fd, buf, sizeof(buf), MSG_DONTWAIT);
+ 		if (len == -1) {
+ 			perror("error : recv()");
+-			exit_handler();
++			exit_handler(0);
+ 		}
+ 
+ 		i = 0;
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index fc21e6192e..5cb51cb9eb 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -10,12 +10,17 @@ BRANCH ?= "master"
 
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
-SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
+SRC_URI = " \
+    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
+    file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
+"
 
 S = "${WORKDIR}/git"
 
 CFLAGS += "-pthread"
 
+PATCHTOOL = "git"
+
 do_compile () {
     # Find all the .c files in this project and build them.
     for x in `find . -name "*.c"`

