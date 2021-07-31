Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.5293.1627748160502242592
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 09:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9DxFJ5t;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id m11so2509516plx.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcXj1C0kuodGtyYxfakyVmdfxfgOrwdXLWTf0wxQ/uI=;
        b=G9DxFJ5tI+Zd5SF3V3DoK2M0+MLVeQMbrTYLOxAVGLKn+Lk9Pvxl9TsOXbrxSTQzIr
         RbsY5o2QLBJGfgrRDFW5fpeJd+idd2Gley7GiNqQVrBP27A3uoxv6d/2F3niOhsHrgUW
         Xn5jTMNILb+zeIkFoXJQzxMA5yRdFXgYSH4NEWCGZUT9lJ+Bmn5RxYBGNeBh/1ZF9QbW
         XbxFQQrn3FE9eiZWdvKEG7gJI895kjQQx0JV1TSL0jc4agVuwsRIUcP6kwqWM20V+lpA
         AdPHNxy50OOm4w3+XGdenYmT9aI7sNPv/jRiHy5qZJ+Tzmgj08Zvh3vWBGuJf3i8Z6BU
         uOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcXj1C0kuodGtyYxfakyVmdfxfgOrwdXLWTf0wxQ/uI=;
        b=AB7lfGH+ko0T+VSPouvZ1kpJfCgS6flx9kMZa67DRZr4KW7mr46ctJctQMcLRFaaVh
         xONVK/WD7hUOY558PdE6F/ok3uL8POd31JnmWcP/xlfuqqJM2rnD7N+2tCdQZfLehcM/
         f24BR0C/11aAl/3JHAW15bR3ZFU02PHySt41rieAI4mu5jh0aK6odaXeGJ/M/gjouuVN
         i+bLJQ5PMSaxHxKu345O0tp8gOgwZc9kmzZ5YVXuhaHbO+tBbML4dzABbkucGoET02vI
         GWs179hfDPNB94ojseziuGrmSBbFcX355krelzzrCin01YrwbzYbdHZF61JA+Ci8rFvn
         QK0w==
X-Gm-Message-State: AOAM532PtsYij0YukunYmBj8LsVrRpB5MBZ1cyHqOW6ypBefV0+YI6Pg
	c/0eNe9q+SJqryppBidprN/A2YuGMtJWKw==
X-Google-Smtp-Source: ABdhPJxbyRuRjRLdJhP2sGZkX5ovZjFBfAGh0bs8pbdp2vUJ5qPJUKBxkL+5X2MXWsBfAu7Z12DbBA==
X-Received: by 2002:a63:6602:: with SMTP id a2mr986768pgc.228.1627748159524;
        Sat, 31 Jul 2021 09:15:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id l1sm5581648pjq.1.2021.07.31.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 09:15:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] fuse: Define closefrom if not available
Date: Sat, 31 Jul 2021 09:15:57 -0700
Message-Id: <20210731161557.3562310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with glibc 2.34+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rver.c-conditionally-define-closefro.patch | 51 +++++++++++++++++++
 .../recipes-support/fuse/fuse_2.9.9.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch

diff --git a/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch b/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch
new file mode 100644
index 0000000000..3607304e05
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch
@@ -0,0 +1,51 @@
+From: Sam James <sam@gentoo.org>
+Date: Sat, 24 Jul 2021 22:02:45 +0100
+Subject: [PATCH] util/ulockmgr_server.c: conditionally define closefrom (fix
+ glibc-2.34+)
+
+closefrom(3) has joined us in glibc-land from *BSD and Solaris. Since
+it's available in glibc 2.34+, we want to detect it and only define our
+fallback if the libc doesn't provide it.
+
+Bug: https://bugs.gentoo.org/803923
+Signed-off-by: Sam James <sam@gentoo.org>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,6 +55,7 @@ fi
+
+ AC_CHECK_FUNCS([fork setxattr fdatasync splice vmsplice utimensat])
+ AC_CHECK_FUNCS([posix_fallocate])
++AC_CHECK_FUNCS([closefrom])
+ AC_CHECK_MEMBERS([struct stat.st_atim])
+ AC_CHECK_MEMBERS([struct stat.st_atimespec])
+
+--- a/util/ulockmgr_server.c
++++ b/util/ulockmgr_server.c
+@@ -22,6 +22,10 @@
+ #include <sys/socket.h>
+ #include <sys/wait.h>
+
++#ifdef HAVE_CONFIG_H
++	#include "config.h"
++#endif
++
+ struct message {
+ 	unsigned intr : 1;
+ 	unsigned nofd : 1;
+@@ -124,6 +128,7 @@ static int receive_message(int sock, voi
+ 	return res;
+ }
+
++#if !defined(HAVE_CLOSEFROM)
+ static int closefrom(int minfd)
+ {
+ 	DIR *dir = opendir("/proc/self/fd");
+@@ -141,6 +146,7 @@ static int closefrom(int minfd)
+ 	}
+ 	return 0;
+ }
++#endif
+
+ static void send_reply(int cfd, struct message *msg)
+ {
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 2c272d4527..64414305ee 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
+           file://fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch \
            file://fuse.conf \
 "
 SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
--
2.32.0
