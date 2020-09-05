Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.3140.1599324977620301684
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NvETy10l;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id b16so4633468pjp.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T/4MVal6iNwnCxMj+M3qSMy6gLx8WrutmghrRXBWCa0=;
        b=NvETy10lvjE1oYF7IWHKtJR4cD9Z+rF7w394c4b0llTA05yXjZ0UABy0uoeuWZjBzQ
         uC85hO9pwD8nTjCKIQ25X9/I1K+SlZJb+Cp0ZwCPtTwUAhiIhsyXwhEXXmjht3KQGLmt
         6WvGlhxxrtXklRaE3MLdBXZcQfwTQSH2IDNHUwEnJsuGLkdVsqfIS31+M/FYUHSwPBxv
         PkCQwSe+1tWxexaJ1uyPPgcuyYkJATlP69AM7lqBKAtkS2XjaN8/ai2jkp+xoR+jpCk9
         3CWfFAhNUMl17eywwbCM/FQpCMwD4K6SCVUqe4TkijczALxrak+eCw25/LLAX3EemNW/
         c4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T/4MVal6iNwnCxMj+M3qSMy6gLx8WrutmghrRXBWCa0=;
        b=N3VCikSSu6GFdubhS5wgqjYzb7X8aCztS1z77O/IgFpIsDTZkbC7mBKqJQF8tXDoMw
         srKYGOAQHQCqBIPHLx3U1aW/okDqkCihuBGH4xsW9mNw30w9sG7NDmbB1AguuT8sPWPM
         g5ASOqDU2tzxWYdqPKeY9NU1pjIVoXgrd2ZUSZ21Mcs066bKU/yhNHgrPzRzAyLek+ob
         XaP5pKbL9L3rtuk6f/XdfbNF4EHcpky7HhTzc8fTDBieeAt5QEHmCDBbDzjFeIL+IFSS
         hbk9ZP45JDYHo+jFTwCrO0kSG1s6XVKbg/SpgLO9hafCojEpHCAbqYUbE/1cigA2TRi0
         /qlQ==
X-Gm-Message-State: AOAM5318O3H9+CYxKE1hd3c0hwjcwBdpteIS6pVTGKK4mTuedABngaKs
	zTDGz++fjWWhPxGz/8OO5rMXuB1nXzA=
X-Google-Smtp-Source: ABdhPJzKkkAQGteOcW3vZRzu+30dD7v2QoUwXkbfA++q0zTXjFAbe/QjNUlEyat/Ms8rSQndR/pfpQ==
X-Received: by 2002:a17:902:8489:: with SMTP id c9mr13213821plo.82.1599324976977;
        Sat, 05 Sep 2020 09:56:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/20] rdist: fix parallel build
Date: Sat,  5 Sep 2020 09:55:55 -0700
Message-Id: <57b629543eb22242180c67f48f653b5b0abbd717.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

It fails to compile rdist occasionally when system load of build server
is high:

| In file included from common.c:57:
| ../include/defs.h:49:10: fatal error: y.tab.h: No such file or directory
|    49 | #include "y.tab.h"
|       |          ^~~~~~~~~
| compilation terminated.

Make $(COMMONOBJS) which include common.o to depends on related header files
and y.tab.h to fix the parallel build failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1bb990c6ca1b149c19404fbe006fb6b372af8c4c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rdist-6.1.5-fix-parallel-build.patch      | 31 +++++++++++++++++++
 .../recipes-connectivity/rdist/rdist_6.1.5.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch

diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch
new file mode 100644
index 0000000000..f35e96a34f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch
@@ -0,0 +1,31 @@
+It fails to produce common.o when system load is high:
+
+| In file included from common.c:57:
+| ../include/defs.h:49:10: fatal error: y.tab.h: No such file or directory
+|    49 | #include "y.tab.h"
+|       |          ^~~~~~~~~
+| compilation terminated.
+
+Make $(COMMONOBJS) which include common.o to depends on related header files
+and y.tab.h to fix the parallel build failure.
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/Makefile.real | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.real b/src/Makefile.real
+index e0f0dfc..53d4944 100644
+--- a/src/Makefile.real
++++ b/src/Makefile.real
+@@ -41,7 +41,7 @@ $(SERVER_BIN): $(SERVEROBJS) $(COMMONOBJS) $(MISSINGOBJS)
+ $(CLIENT_BIN): $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS)
+ 	$(CC) -o $@ $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS) $(LDFLAGS)
+ 
+-$(CLIENTOBJS) $(SERVEROBJS): $(HFILES) y.tab.h
++$(COMMONOBJS) $(CLIENTOBJS) $(SERVEROBJS): $(HFILES) y.tab.h
+ 
+ y.tab.h: gram.c
+ 
diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index 3a27c2c5b3..37b3eebe4b 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://rdist-6.1.5-linux.patch \
             file://rdist-6.1.5-fix-msgsndnotify-loop.patch \
             file://rdist-6.1.5-bb-build.patch \
             file://rdist-6.1.5-makefile-add-ldflags.patch \
+            file://rdist-6.1.5-fix-parallel-build.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/rdist/files/rdist/"
-- 
2.17.1

