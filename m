Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59443CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:33 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1478.1790722648036733333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aJ0fXg3P;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34c4a0868b6so339365eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722647; x=1791327447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhN4lXgh3+n6kgvieqnPTDLQYB+tbvSqli0iREbtuR8=;
        b=aJ0fXg3PqMJldZ1yQTPfbT3W9iqW6OXXigRGUHvwXx3ZCYpHzlXZMx/Q2jc+BSoT+q
         tCQK61HwUr5MgT4VajUO0KZ60GmSM2C4UNhfw2FuKifU9/TvAeio7qFVT/odY1E0M0GS
         lY/sHpaI2IvjIuT5DnDZa0/kYBGQQNKd3JCmUZXGQlHNg0XIrG+mj3nY2IyylASfEsRs
         uuLDh4QGqTN5p0nIeJJaDsJtvMCUjCWWHPlVWBCMq/DKZ/ndTwBKIl+UxHo8YwQPBboG
         cy2L2XRwzGfYYDvo6auzxMxtRBTIYQC97svw5tqeo0BCdnGLJszdnZ9lH67fpNn1SUpn
         nqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722647; x=1791327447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhN4lXgh3+n6kgvieqnPTDLQYB+tbvSqli0iREbtuR8=;
        b=Yk9MZb+WQ9S9eYeGq92jkAWU8xVlrB1pjpg36yF/BFZQvL9cAnOTyDcg7kTwdaQZGQ
         LIZvYLf2Md5tOaaVTe5RDRB5bgHXq2Cdt84Iq4mJWCM8DGbUOFGkXKDzu4qJ67kA9g66
         ia9llWnNyFsPLBxpX+bpiHb9x2b3t3lxW54RD/mtJNWCxqeAx7cgwrTnbGnKoegh7umM
         J6WPl9rE/dO7/mZJKvt5fZmHfn+lkCh8CXr/APG5B/FQL3bqjMfaEx/F0OBInNkTxNEC
         X9zyLnhmCuPNhWdtpad6/OKMFsYzY/YTCg2JV6Le4fK1HkwxR8i7MJ3cByb12JtsPjKH
         qwjA==
X-Gm-Message-State: AFuF++mX7wU5npweypK8e5Rd25Gbilp5xNdip1ksirZZ9Y4x9p4DkDtc
	uNhtucAu/v+UUtTIMpXlkxz7VrMYVIyXoHI75UXSErzZ4Qms5CERm/mF2ZMdhNQteoE=
X-Gm-Gg: AYBFou2RpkVCnZ0pDKKyQ7S2BGWnR7uXNs79Xi2DVKVMaPwS6JviITmASKR6HxLFwTf
	uVbNVcvbOA6UmIONqjtQSGVApKOoMkWlt11G4jG0fxM2swR34KJ70NeeyEzsAYtuDGlwZjVu43D
	KfsBOliM8F+AQcScjxKdoUMz3zZbETfhgCUjF8KBSZs71Q36rXhTkfDeeMD/A7817cehmjp8six
	7R3fxfh6M+o0UqOas5VWj/HdA9uheZT87mH/zCjyFgU8v8T5kIUNuWzO3yLIzoCRkQfVp306F2x
	DF7c2bBw2U4nK0Cq4TnhWUbH5AJUv7V2iI2KrcFeR3MTLBGMEoJM6MC0T+rEbSqhPRQWpS0NEJ4
	PgE+31uvpuFondrVLUfrQ5CpCV2TUvGKGKOuWpP3Rw5zdg/zsxirXtbKJ1JV7QoAyxfDri0GfX/
	XQJfS1/UtWstibKOjy6k3gJRH75ttP9ppERhze77/+we5ipsD4Lc0SitUuePgTYMFAcsqs4BEZR
	QdjhN0hYwyy9o2IfuDqERtiFqnQawSM2vu63+Iq44D3yTD2Jrlw5d5Z7wzq4acbppW2A3i1Hu2c
	FQSbzB/mjfJ6Ck5eayJb6aQG1YXuPyOqGfno9+BN7BTUV9BTvDhBlyNby/UXnXwy5rm7yBXYu9o
	u76OB/yvkTu0pkT0g9YO+p2V0hzfWw7dxOrIxPikWDYkaT9AdqTiXKnO4PGlmvZd25erYYEzn8Y
	YkUzHI+cJfXY4wmm7SC69+TNuOKCrvjVgFnI4l8gGppQPRJRZy
X-Received: by 2002:a05:701b:260b:b0:143:1bb1:3302 with SMTP id a92af1059eb24-14b2e52d8f0mr5020502c88.19.1790722647131;
        Tue, 29 Sep 2026 15:57:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/26] canvenient: include <sys/time.h> for struct timeval on musl
Date: Tue, 29 Sep 2026 15:56:58 -0700
Message-ID: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130488

canvenient_socketcan.c uses struct timeval without pulling in a header
that declares it; glibc gets it transitively, musl doesn't.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../canvenient/canvenient_1.02.bb             |  4 ++-
 ...etCAN-include-sys-time.h-for-struct-.patch | 30 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/canvenient/files/0001-CANvenient_SocketCAN-include-sys-time.h-for-struct-.patch

diff --git a/meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb b/meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb
index ea5634ec07..ec4a568f01 100644
--- a/meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb
+++ b/meta-oe/recipes-devtools/canvenient/canvenient_1.02.bb
@@ -17,7 +17,9 @@ DEPENDS = "libsocketcan"
 
 PV .= "+git"
 
-SRC_URI = "git://github.com/CANopenTerm/CANvenient.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/CANopenTerm/CANvenient.git;protocol=https;branch=main \
+           file://0001-CANvenient_SocketCAN-include-sys-time.h-for-struct-.patch \
+           "
 
 SRCREV  = "23408935f230f59632eafd56056824f8e91cd896"
 
diff --git a/meta-oe/recipes-devtools/canvenient/files/0001-CANvenient_SocketCAN-include-sys-time.h-for-struct-.patch b/meta-oe/recipes-devtools/canvenient/files/0001-CANvenient_SocketCAN-include-sys-time.h-for-struct-.patch
new file mode 100644
index 0000000000..86369edb6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/canvenient/files/0001-CANvenient_SocketCAN-include-sys-time.h-for-struct-.patch
@@ -0,0 +1,30 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:54:51 +0000
+Subject: [PATCH] CANvenient_SocketCAN: include sys/time.h for struct timeval
+
+On glibc, <linux/can.h>/<sys/socket.h> transitively pull in a full
+definition of struct timeval via <sys/time.h>. musl's headers do not
+provide this transitive include, so struct timeval is only forward
+declared (via <sys/types.h>) and the file fails to build with
+"variable has incomplete type 'struct timeval'". Include
+<sys/time.h> explicitly so the type is fully defined regardless of
+libc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/drivers/CANvenient_SocketCAN.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/drivers/CANvenient_SocketCAN.c b/src/drivers/CANvenient_SocketCAN.c
+index 1111111..2222222 100644
+--- a/src/drivers/CANvenient_SocketCAN.c
++++ b/src/drivers/CANvenient_SocketCAN.c
+@@ -24,6 +24,7 @@
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
+ #include <libsocketcan.h>
++#include <sys/time.h>
+ #include <time.h>
+ #include <unistd.h>
+ #endif

