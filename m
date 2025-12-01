Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB28D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 20:34:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1606.1764621291103135437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 12:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iC3AkBSD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so34410665e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 12:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621289; x=1765226089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOKJLVwA2RwTN+07vKW/G6AUxhJpSzPZuEVhcsB5nm0=;
        b=iC3AkBSDZ1Dxf3ok+Oep9eS8Pgfg8B8gmTFp+7Em1qq5xJk1+y0QDPWosnsTfH8BJz
         a8VID6RE7LuZB6MAQcbp/isFPwfvTWw31RmiS7eYD9HmmB1YGHMhghIBks0MwljXCj7G
         nFyAG4uZxykDB1tPWfBeLTXcUHY2Xp+O5JtYJLLUusy/X7O7IYOpi4MWjrArwknFmXRw
         PujSra9k17eyf2gOJM/Rf/rH8DWZDyjwx3Fy4SXTnKVU1TT4PmflN4Tt5cHwnDW35SBM
         rs2pDTWXCYgX5Paefn5xHdLag1pzCkxUdLA4YISeCFpHkrgXYwKk3+xhvJvRAFCvLArd
         lR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621289; x=1765226089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOKJLVwA2RwTN+07vKW/G6AUxhJpSzPZuEVhcsB5nm0=;
        b=Ww1glDSvBH5K8prBhOtT8x8iwlcfA0iR/sSlP1aBpgw+EhobGR2ld+SWZ0i1ybnxSx
         NVmLYVfNJ1PBiVoA6Cy1OFKLurxSSNCP2b2HV5q89AvzEvCaKQzgKVa7B75RhtSbbKBz
         2GS27bpMrzbc2wpoLCu8pq0Axcx38AmhCEOsA3ut6hyrkdCiQEcsQLw7KvsfpnrCX6u1
         mQWnAnXLgz4jpMzcE6S/juaq2KfMX+5FL0jPU/hx4YacOs4C57wNyhHJYNTrGP9REWpr
         M2s4N+lKbOauzQB8iKw5goDL+69n9KHbpTJOe8mr+Ix4b9GqTCGfm7IgokO/F2wZ15nv
         STDg==
X-Gm-Message-State: AOJu0YwVaauQgZVlz0e7WZfGocz1EZDcWma6vHFXT2F06KB9h6Dksvd/
	71HpUL91riK0gB68oS6pC9iVb2OGrFFIQPCLHdl3nGYVZLMNiRUk3GLwEfmypw==
X-Gm-Gg: ASbGncvrd9Zm1Epiy4pX+1SRvudfLfJZqMC/qY9YOL6TnzfRGru64fIMd7FnVU+UOc7
	OB1wKRYZQAoi5D73K3Gn+mT0CmkiB8SZ8bsXrlNNibF1ngCHN0uAq+Rx9dJdvLAVctfMaldVS3j
	ZOhIce3sdek46CVAzpL/dRTa8Ck+GKIG2l/Bc7CARJcF1hf3SpCFXJLfbp82KMCjrs9FBxzfIzr
	F9XPBZY0kTd+EDV8f2GgcRIc5GeiiZrUG5USg5BC//cRSWNAk/sW4CZ9zPjianlzSWKQxH/JSx5
	jMEd5dFDaA91qkYI2d+hrchZAoZqC4EiewOP9rXVMMov6bfloCAps2BHz81Wbt0Hm880oij/SFe
	mS7rNK8kpwUP3Ce5c36hoqN0+8FIxh0GKOAL1rjqEBkW6VmCODw0TzuDzYBQiE8SatlRaPlDLvA
	qy5vboI9xX
X-Google-Smtp-Source: AGHT+IGIWKzsnNp7yR4DNm/MZ0WBwf+YP1voLjbersVwpgW2ymL+LLQLA6voaURAv0N/r+57ABjfKw==
X-Received: by 2002:a05:600c:354e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47904ac4380mr259712955e9.5.1764621288911;
        Mon, 01 Dec 2025 12:34:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c44dcsm319118255e9.11.2025.12.01.12.34.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:34:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] lowpan-tools: drop recipe
Date: Mon,  1 Dec 2025 21:34:46 +0100
Message-ID: <20251201203447.2776360-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 20:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122217

The application has received its last upstream update
11 years ago. It has been on the skiplist[1] of meta-networking
for the past 6 years due to being severly outdated.

There are no recipes that would depend on this recipe in the meta-oe
layers, nor in the layer-index[3].

Let's bid farewell.

[1]: https://github.com/linux-wpan/lowpan-tools/commits/master/
[2]: https://github.com/openembedded/meta-openembedded/commit/13830393555adbb70ccec18bea177131ff405edc
[3]: https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alowpan-tools

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fix-build-errors-with-clang.patch    |  34 -----
 ...tential-string-truncation-in-strncpy.patch | 139 ------------------
 ...0001-Remove-newline-from-format-line.patch |  34 -----
 ...fig-parse.y-add-missing-time.h-inclu.patch |  46 ------
 ...oordinator-Fix-strncpy-range-warning.patch |  32 ----
 ...iz.c-Undef-dprintf-before-redefining.patch |  29 ----
 .../lowpan-tools/no-help2man.patch            |  41 ------
 .../lowpan-tools/lowpan-tools_git.bb          |  38 -----
 8 files changed, 393 deletions(-)
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch
 delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch
deleted file mode 100644
index 8e906f7ce0..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5f9e80acb0a1ac399839bf160e43f6120c4b5128 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Oct 2016 23:49:09 +0000
-Subject: [PATCH] Fix build errors with clang
-
-| ../../../../../../../workspace/sources/lowpan-tools/src/coordinator.c:313:50: error: format specifies type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
-|                 fprintf(stderr, "Opt: %c (%hhx)\n", (char)opt, opt);
-|                                           ~~~~                 ^~~
-|                                           %x
-| 1 error generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/coordinator.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/coordinator.c b/src/coordinator.c
-index c139aae..f0de6d2 100644
---- a/src/coordinator.c
-+++ b/src/coordinator.c
-@@ -310,7 +310,7 @@ int main(int argc, char **argv)
- #else
- 		opt = getopt(argc, argv, "l:f:d:m:n:i:s:p:c:hv");
- #endif
--		fprintf(stderr, "Opt: %c (%hhx)\n", opt, opt);
-+		fprintf(stderr, "Opt: %c (%hhx)\n", opt, (unsigned char)opt);
- 		if (opt == -1)
- 			break;
- 
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch
deleted file mode 100644
index e621d8f2a8..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-strncpy.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 58b6d9a2efe101e5b80fd708e6f84c7ca779ce93 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 May 2018 20:27:43 -0700
-Subject: [PATCH] Fix potential string truncation in strncpy()
-
-GCC 8 complains about the string truncation during copy
-
-error: 'strncpy' specified bound 16 equals destination size
-
-Upstream-Status: Inappropriate [depricated component]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/listen-packet.c | 3 ++-
- tests/listen.c        | 3 ++-
- tests/test2.c         | 4 ++--
- tests/test3.c         | 3 ++-
- tests/test4.c         | 3 ++-
- tests/test5.c         | 3 ++-
- tests/test6.c         | 3 ++-
- tests/test7.c         | 3 ++-
- 8 files changed, 16 insertions(+), 9 deletions(-)
-
-diff --git a/tests/listen-packet.c b/tests/listen-packet.c
-index e40af81..eae0c71 100644
---- a/tests/listen-packet.c
-+++ b/tests/listen-packet.c
-@@ -50,7 +50,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, iface, IF_NAMESIZE);
-+	strncpy(req.ifr_name, iface, IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFINDEX, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFINDEX");
-diff --git a/tests/listen.c b/tests/listen.c
-index 75c320b..5ce1ed9 100644
---- a/tests/listen.c
-+++ b/tests/listen.c
-@@ -47,7 +47,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, iface, IFNAMSIZ);
-+	strncpy(req.ifr_name, iface, IFNAMSIZ - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFHWADDR");
-diff --git a/tests/test2.c b/tests/test2.c
-index 58eb74b..5d02838 100644
---- a/tests/test2.c
-+++ b/tests/test2.c
-@@ -45,8 +45,8 @@ int main(int argc, char **argv) {
- 		perror("socket");
- 		return 1;
- 	}
--
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFHWADDR");
-diff --git a/tests/test3.c b/tests/test3.c
-index fb36627..2f50a5a 100644
---- a/tests/test3.c
-+++ b/tests/test3.c
-@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFHWADDR");
-diff --git a/tests/test4.c b/tests/test4.c
-index 33c274c..8737149 100644
---- a/tests/test4.c
-+++ b/tests/test4.c
-@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFHWADDR");
-diff --git a/tests/test5.c b/tests/test5.c
-index 4439dfa..28db562 100644
---- a/tests/test5.c
-+++ b/tests/test5.c
-@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFADDR, &req);
- 	if (ret < 0) {
- 		perror("ioctl: SIOCGIFADDR");
-diff --git a/tests/test6.c b/tests/test6.c
-index e375bfb..ce7de59 100644
---- a/tests/test6.c
-+++ b/tests/test6.c
-@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
- 		return 1;
- 	}
- 
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFADDR, &req);
- 	if (ret < 0) {
- 		perror("ioctl: SIOCGIFADDR");
-diff --git a/tests/test7.c b/tests/test7.c
-index e9a5a55..37da22d 100644
---- a/tests/test7.c
-+++ b/tests/test7.c
-@@ -58,7 +58,8 @@ int main(int argc, char **argv) {
- 	if (ret)
- 		perror("setsockopt");
- 
--	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
-+	strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
-+	req.ifr_name[IF_NAMESIZE - 1] = '\0';
- 	ret = ioctl(sd, SIOCGIFHWADDR, &req);
- 	if (ret < 0)
- 		perror("ioctl: SIOCGIFHWADDR");
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
deleted file mode 100644
index b8fe66f346..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a36afac485745cf980fba1809526f2025cb4d101 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Apr 2017 00:16:45 -0700
-Subject: [PATCH] Remove newline from format line
-
-Fixes
-
-error: '__builtin___snprintf_chk' output truncated before the last format character [-Werror=format-truncation=]
-     "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
-                                               ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- addrdb/addrdb.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/addrdb/addrdb.c b/addrdb/addrdb.c
-index 4bb7f79..05d53f3 100644
---- a/addrdb/addrdb.c
-+++ b/addrdb/addrdb.c
-@@ -178,7 +178,7 @@ int addrdb_dump_leases(const char *lease_file)
- 			continue;
- 		}
- 		snprintf(hwaddr_buf, sizeof(hwaddr_buf),
--				"%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
-+				"%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x",
- 				lease->hwaddr[0], lease->hwaddr[1],
- 				lease->hwaddr[2], lease->hwaddr[3],
- 				lease->hwaddr[4], lease->hwaddr[5],
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
deleted file mode 100644
index 81a3f52d90..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ab725a3faaeead90ae3c63cbcd370af087c413a5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 27 Mar 2017 17:55:06 -0700
-Subject: [PATCH] addrdb/coord-config-parse.y: add missing <time.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The %union definition uses the time_t structure. In order to use this
-structure, the <time.h> header has to be included. Otherwise, the build
-breaks with some C libraries, such as musl:
-
-In file included from coord-config-lex.l:23:0:
-coord-config-parse.y:107:2: error: unknown type name ‘time_t’
-  time_t timestamp;
-  ^
-
-This patch includes <time.h> using the '%code requires' directive of
-Yacc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- addrdb/coord-config-parse.y | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/addrdb/coord-config-parse.y b/addrdb/coord-config-parse.y
-index 2e10a88..85ee058 100644
---- a/addrdb/coord-config-parse.y
-+++ b/addrdb/coord-config-parse.y
-@@ -102,6 +102,10 @@
- 
- %}
- 
-+%code requires {
-+#include <time.h>
-+}
-+
- %union {
- 	unsigned long number;
- 	time_t timestamp;
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
deleted file mode 100644
index aadfae238d..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f017353b8f3170ce79e7addc127056c0142f087b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 1 Apr 2018 14:31:05 -0700
-Subject: [PATCH] coordinator: Fix strncpy range warning
-
-Fixes
-error: 'strncpy' specified bound 4096 equals destination size [-Werror=stringop-truncation]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/coordinator.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/coordinator.c b/src/coordinator.c
-index c139aae..ca49418 100644
---- a/src/coordinator.c
-+++ b/src/coordinator.c
-@@ -296,7 +296,8 @@ int main(int argc, char **argv)
- 	if(!lease_file)
- 		lease_file = LEASE_FILE;
- 
--	strncpy(pname, argv[0], PATH_MAX);
-+	strncpy(pname, argv[0], PATH_MAX - 1);
-+	pname[PATH_MAX - 1] = '\0';
- 
- 	pid_file = getenv("PID_FILE");
- 	if (!pid_file)
--- 
-2.16.3
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
deleted file mode 100644
index fec9b5736d..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ad088233608ba2205511da4f270f8ba29844b84c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2017 09:02:02 -0700
-Subject: [PATCH] src/iz.c: Undef dprintf before redefining
-
-Clang is picky and warns about macros redefinition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/iz.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/iz.c b/src/iz.c
-index 32be1a8..886f0a5 100644
---- a/src/iz.c
-+++ b/src/iz.c
-@@ -60,6 +60,7 @@ static int iz_seq = 0;
- /* Parsed options */
- static int iz_debug = 0;
- 
-+#undef dprintf
- #define dprintf(lvl, fmt...)			\
- 	do {					\
- 		if (iz_debug >= lvl)		\
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch
deleted file mode 100644
index 9ecd707b41..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Disable building manpages so that make install doesn't fail due to lack of help2man
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 46c4017..d6ed312 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -9,11 +9,6 @@ izcoordinator_DESC = "simple coordinator for IEEE 802.15.4 network"
- iz_DESC = "configure an IEEE 802.15.4 interface"
- izchat_DESC = "simple chat program using IEEE 802.15.4"
- 
--if MANPAGES
--dist_man_MANS = $(manpages)
--endif
--EXTRA_DIST = $(manpages)
--
- izattach_SOURCES = serial.c
- 
- iz_SOURCES = iz.c iz-common.c iz-mac.c iz-phy.c
-@@ -27,18 +22,6 @@ izcoordinator_LDADD = ../addrdb/libaddrdb.la $(LDADD) $(NL_LIBS) $(LEXLIB)
- iz_CFLAGS = $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
- iz_LDADD = $(LDADD) $(NL_LIBS)
- 
--izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
--	-$(HELP2MAN) -o $@ -s 8 -N -n $(izattach_DESC) $(builddir)/izattach
--
--izcoordinator.8: $(izcoordinator_SOURCES) $(top_srcdir)/configure.ac
--	-$(HELP2MAN) -o $@ -s 8 -N -n $(izcoordinator_DESC) $(builddir)/izcoordinator
--
--iz.8: $(iz_SOURCES) $(top_srcdir)/configure.ac
--	-$(HELP2MAN) -o $@ -s 8 -N -n $(iz_DESC) $(builddir)/iz
--
--izchat.1: $(izchat_SOURCES) $(top_srcdir)/configure.ac
--	-$(HELP2MAN) -o $@ -s 1 -N -n $(izchat_DESC) $(builddir)/izchat
--
- install-data-hook:
- 	$(mkinstalldirs) $(DESTDIR)`dirname $(leasefile)`
- 	$(mkinstalldirs) $(DESTDIR)`dirname $(pidfile)`
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
deleted file mode 100644
index b442fb9f56..0000000000
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Utilities for managing the Linux LoWPAN stack"
-DESCRIPTION = "This is a set of utils to manage the Linux LoWPAN stack. \
-The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 802.15.4-2006) compatibility."
-SECTION = "net"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "flex-native bison-native libnl python"
-
-PV = "0.3.1+git"
-SRC_URI = "git://github.com/linux-wpan/lowpan-tools;branch=master;protocol=https \
-           file://no-help2man.patch \
-           file://0001-Fix-build-errors-with-clang.patch \
-           file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
-           file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
-           file://0001-Remove-newline-from-format-line.patch \
-           file://0001-coordinator-Fix-strncpy-range-warning.patch \
-           file://0001-Fix-potential-string-truncation-in-strncpy.patch \
-           "
-SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
-
-
-inherit autotools python3-dir pkgconfig
-
-CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
-
-CFLAGS += "-Wno-initializer-overrides"
-
-do_install:append() {
-    rmdir ${D}${localstatedir}/run
-}
-
-FILES:${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
-
-PACKAGES =+ "${PN}-python"
-FILES:${PN}-python = "${libdir}/python*"
-
-SKIP_RECIPE[lowpan-tools] ?= "WARNING these tools are deprecated! Use wpan-tools instead"

