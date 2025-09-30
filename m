Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41082CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:39 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.21014.1759223978097675984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCcZ0gmf;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-4258bd8c19bso49550335ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223977; x=1759828777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5lp/Bj+8BK2ARlgSeLGTYRz+X0Y4D9/adwaVLT59B4=;
        b=ZCcZ0gmf8w5eP6am8wpLZq7F0gsbV5iHqO1EjiQ5bhEqnKtlldN5FwzH3cIlNTWWbY
         DNgD2iagqbT2r90ASrP/WtDj1n0phXAsOnxXFw9wpgTIdK+UgFptjhmE/fqHbyxaBVZk
         3OB8xanGZksnIMsaOl/UH5RA6nf0hFziLm/EF3Bjz/QJ+aJWOPeFjPl2/zgzJqWVHAem
         HV57Kq9N6qHkRDclUdO/y+ofCbQQ6tBFx1Za+Ia3FcvhaROnDekHdV7f1j2wQggm13Sj
         ikXRiYu3Ppox2759UhSzCurz6MNZf+RgTw9xBnTuCtSxc+lGpJ1kWxpkn5liZOo6jEEh
         XjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223977; x=1759828777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5lp/Bj+8BK2ARlgSeLGTYRz+X0Y4D9/adwaVLT59B4=;
        b=ZtAdIpl0a6eoBcpynHgJ320ZJ5LHIfp1+o/0KrPz31njxZZIpuyP0BENeNDRnZaU12
         cSobOPkbFo6ynYYJuxP7AUQAeXy5fMRd0UHvdEYoBuUjDgReUZJw5O7nIjTXvylY7He4
         ZfTIh+7WuID9RhVmz37VidD3vSHmz3aTwNuRbVCoMkxp795ZcckyD0G8tm3NlnER2SbT
         lg0LYtshTgxS1iYhAjxIkgqiF6zabQMyfrqvxeNUXA1NzGX5aZxfN8WgMVe2V8jnWhTo
         UT1qNLdId1ZUuFNg/X+alslJNon9jH2FBi16uo5y8wbna/3voEuScM3sIAfG2+7C55eH
         ls6Q==
X-Gm-Message-State: AOJu0Yzs72Bz8a12JFuM/wlLAvaD+BtAXo2zkBoc/+jqnJkPJVxb3wUa
	sD0ZXg9jZjTEBBxhM8D336NLddR4My2OMx+Q9nbAV1iwu2CMsrCTtxOCLNOaP8nY
X-Gm-Gg: ASbGncu72Z55SwwoMVpfa9XJ4S0K2eo2KYGv9/KSVs8ixtw8dr5uJsY+5W5wh/Ar+nK
	+E4CKIYPPY+8RM5OY53cFbgZv4pZTTyelQVDQEOAW9/EtwBpBMsk08lM4pZV/rwuA+mlUnqJXDm
	wKf9SSbbc0ZpH15HYA37GlZ/y5m2AAsF4dYHTgmsoOt//NAfeOKqJJeshgGpCmwalxySRdxUWDl
	ooI8YX2nIngkaLWKytBL/BBrsBMtOkLy2sDxiv5ND9reuzWmtf712ozxXZpru0p/pmDZzTY0Dtk
	GGnTROC8bKpf4QmBHiqjC+OWjTrz7fuhIWtPy0yH12eme5JXsuwuebuD9SyPIYS4a8FT8K2t1bR
	ejPXlqSbt5MNoh4skUZqVmFiasdtkKot1beroIslNln/zH6PBNvnL3MgvVx92BnpQuolJ93oZ9m
	o=
X-Google-Smtp-Source: AGHT+IFWTFt3mrD47ZyvIrzGgB+LjLpY00WuZGIt1RJ/H+zTmZZyP2FkK4NvAfVjyVOr7u5OdHPUhA==
X-Received: by 2002:a05:6e02:1a0e:b0:428:e8eb:9272 with SMTP id e9e14a558f8ab-428e8eb95b2mr160710045ab.4.1759223977094;
        Tue, 30 Sep 2025 02:19:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:36 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 19/22] daemonize: update to latest revision
Date: Tue, 30 Sep 2025 22:18:38 +1300
Message-ID: <20250930091841.1693131-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120071

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop a patch that has been incorporated into this version.

(That is also the changelog - the only change is the accepted patch)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a5cfc39eceb8d5bd0e563458e2d55e7c51cd6beb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-many-arguments-to-function-write-er.patch | 46 -------------------
 .../daemonize/daemonize_git.bb                |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch

diff --git a/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch b/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
deleted file mode 100644
index 3a79dba682..0000000000
--- a/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c47fdcc0a900aea93b1967c20db42743171ab1ac Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Thu, 27 Mar 2025 16:46:42 +0900
-Subject: [PATCH] fix getopt.c too many arguments to function 'write' error in
- gcc-15.0.1
-
-In the original code, write() was declared as 'extern int write();',
-which is interpreted as a function taking no parameters.
-This caused errors when actually calling it with 3 parameters.
-The current fix to declare it as 'extern int write(int, const void *, unsigned);'
-is the correct solution.
-This properly defines the write function to accept 3 parameters.
-
-../git/getopt.c: In function 'x_getopt':
-../git/getopt.c:51:16: error: too many arguments to function 'write'; expected 0, have 3
-   51 |         (void) write(2, argv[0], (unsigned)strlen(argv[0]));\
-      |                ^~~~~ ~
-../git/getopt.c:78:17: note: in expansion of macro 'ERR'
-   78 |                 ERR(": illegal option -- ", c);
-      |                 ^~~
-../git/getopt.c:48:20: note: declared here
-   48 |         extern int write();\
-      |                    ^~~~~
-      
-Upstream-Status: Submitted [https://github.com/bmc/daemonize/pull/37]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/getopt.c b/getopt.c
-index 3f37c55..f298da7 100644
---- a/getopt.c
-+++ b/getopt.c
-@@ -45,7 +45,7 @@
- #include <string.h>
- 
- #define ERR(s, c)	if(x_opterr){\
--	extern int write();\
-+	extern int write(int, const void *, unsigned);\
- 	char errbuf[2];\
- 	errbuf[0] = c; errbuf[1] = '\n';\
- 	(void) write(2, argv[0], (unsigned)strlen(argv[0]));\
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index b0712e521b..f0b083c37e 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -6,10 +6,9 @@ PV = "1.7.8"
 
 inherit autotools
 
-SRCREV = "18869a797dab12bf1c917ba3b4782fef484c407c"
+SRCREV = "58237626e6999e68b9583ed1b4b08136f118f68c"
 SRC_URI = " \
     git://github.com/bmc/daemonize.git;branch=master;protocol=https \
-    file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch \
 "
 
 S = "${WORKDIR}/git"

