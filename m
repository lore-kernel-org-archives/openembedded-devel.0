Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFD9CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 14:13:57 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17682.1758291228601053891
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 07:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tzpz47Rp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b04770a25f2so347591166b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758291227; x=1758896027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVhmP89pgjlqQiD1gZJdzldewl6vIcT1XvlFh8GQHks=;
        b=Tzpz47RpHbPSEkRdksoueHwc1nvKJmUi8pK+fJlSuTP2E/R6GFDM9/XePWEC2TSzNX
         3fx5rPRqIKnt/W1cysmdjIvrQKZAhtXt/+//I5jKbqnxzL43cllPZWkPjsVMPcquKwng
         H0Qp0b31SzOzVTXKepgvHnWmd6Psn9UdEHPe6jfkJCpi/AebGjxIA3k8+RpgpxYRFetV
         WtfLZvvPhXdaDFUTRUgTfjEYwXgJ7sa0tfum5B3goq1uDnSfSfJHVXV73kl/ZFTaqKhz
         E9JMGlxammVmrdbTPojqWCCosbg7RZUFfvZnHtWbhmKInH0SDuRQ8thJft2p8j/azHf3
         kvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291227; x=1758896027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVhmP89pgjlqQiD1gZJdzldewl6vIcT1XvlFh8GQHks=;
        b=KXlMg7ww18ILE4Bdlaet/a+A0JyEvqrh1K6sghBTGaf2IAQk7er9aF/gqsEEBoCrro
         +8nip2VCW1ZQ23t26y4TYVzwlPIDk0ZJ0SJSMvQujS+UHHGyvEH4EydBIjy5E+sOlKdS
         B1+A9c3uLRySieYFwm/nkPPWR29tEB8eYoEk2Of7uLSOJbnEHVyVQZyEf8/j23DAKhoq
         +jDQCgAeX+z3L6hPOCe1LqO76eHiBzsjZJGxh3iR8cajg1EHPG+LqEYc5krdU8fSgA6v
         nCmoHiPqugxj8XkjEZaJEhZi8LIToIHXSDnoEm2CnE8+Z9CQxrkcr/iG42IwNID1qoZT
         EV0g==
X-Gm-Message-State: AOJu0YyzcUg+oZylXEfOCogkd/T+VVXzuRU+6nFKOKn3CryYOlffLK9G
	ytBK3urihazoos6i4o/z1/R96gJvDERG+0JNGSJYFrpzI7uDR7Te52gDOynnMg==
X-Gm-Gg: ASbGncsH0UhfemgApdF1JKfMuCxHlpGrq6hrzCo4JOdNppR5Jw/4pZtBDpo9CeHU8r2
	WKeXsi2pP8jrb7xA3ZmQd7ERR7keGHbN0wXd90mH9QfXOaSi03GX4fFBhWBWZEdlFObCelXbg7F
	IzNDgiawXUjbfgOwqSb//avrtEavg2ceyvqsRiGhWLoJjkZc8HQFrhqSZlY9MQNbBMO9bjR2ZDq
	ZY4XRLWUgdjYoeGuI1ErjF8Hwo/49yRPmPtiWxYOjOM3yRzX+Ai5x6a97Q7PT6/dW7XzZnHgXLy
	KwUPbqdTlNWr2/t8MimibkSXKA5eAFIqnwukAOj4uNHPj/n3LSln4VPaFg2fYhbLUoMq/k0iBPX
	uuJXauVPa93SIl+Qf8E4x
X-Google-Smtp-Source: AGHT+IG1APZb+oLA+umgwdCf6hnVMgO3LM3tP0pM931IxhIASb7kVHNekst+ZYydGe4O500NcDtU1g==
X-Received: by 2002:a17:907:2d2b:b0:b04:6338:c95a with SMTP id a640c23a62f3a-b24f442916amr341575266b.45.1758291226860;
        Fri, 19 Sep 2025 07:13:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd2816bb6sm441759166b.110.2025.09.19.07.13.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:13:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] daemonize: update to latest revision
Date: Fri, 19 Sep 2025 16:13:42 +0200
Message-ID: <20250919141342.934718-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 14:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119607

Drop a patch that has been incorporated into this version.

(That is also the changelog - the only change is the accepted patch)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index bae04ca7a3..fef237e882 100644
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
 
 

