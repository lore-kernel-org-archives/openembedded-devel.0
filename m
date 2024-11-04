Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101D4D132C1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 13:25:03 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.57202.1730726701353323188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 05:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gn4Nr3Iu;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb599aac99so35231501fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 05:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730726699; x=1731331499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn8JdQiFEJA8gprQf57gTYTq4GZOhig0eY+ERx6YS5w=;
        b=gn4Nr3IuQ+MO3wS70TLiRG6lCUyortxj1J8OmPz3y2p2SRSn2JCB1iaHFlNyUkmu89
         22lXzsjPVB34cfgtHM2XEdXRTb0yWnzx8Z1dFTsd+pUyQ+sg/1XpNMRxftFbPiFbHMDA
         CUqqEjjOrRFHbawoSnAX5mILjn8w2av3atq4FV9X2Woo6OGCYamcWp2Axq9mQG1wovlO
         GjzvW/hEQcQzaLtKQ/1UQK3/3RGBgSJI+DFYpm7EQxoA9pUGe0t2A+H58r6piKUzEIgI
         CMOD/mJMfdTC01higPohjYZhJQhQxVCxhTDdnibVlP87XY0NLHXglzb6yxkUocoNmK/k
         /PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726699; x=1731331499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn8JdQiFEJA8gprQf57gTYTq4GZOhig0eY+ERx6YS5w=;
        b=ZzZGb5kVjsnZcJNlUo6iyPumwYZJwE+ZyENJ0uwoTUM9S0oy97zRw+hBsnrhyriczI
         oCl6xaAh9wi0quy1VUlvjtxzWIGruivBYpN6/gvEfpMuBSflnu+K9L2Ucrwbsoxu+q61
         OVcGKbV75HEWTTdt49SIRjg+xM4FtqnRRY/2aEbXLmVs19l73Rt5xg73zPu4MMCQQlod
         Q72j1Wn8XGQeGzr2ejiQB7HAPZylI7Msg94X9CXfz2KN1XNJwV6zIlGfdEZx5nfvvgC7
         /tlX9xl+J8AEEK0+dRS7XRPfmmjEHapkeg9oexS/qJTcHhNScBR2zWrb6ujfLxKDLguE
         rmvQ==
X-Gm-Message-State: AOJu0YxF3dr+rC712XfBpYuUG9/tJFjEK0Lsr7KANVdCSmtR5gCFGQoK
	bAUH1BEXoRRGtY+0PJoTewXmc3kA626PQ7u3PlIGgTuVuTIGZ30W5Q70Vg==
X-Google-Smtp-Source: AGHT+IFAQhDqHhyNAmLmN5s6owNjx9IhOi5I9A52SwzzFtD5B0PeZBRsb/2c22i+/D0Bv+kRzl+gsw==
X-Received: by 2002:a2e:bd15:0:b0:2fb:34dc:7beb with SMTP id 38308e7fff4ca-2fedb7a2114mr62214761fa.12.1730726699201;
        Mon, 04 Nov 2024 05:24:59 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cecb0d4b23sm2300831a12.59.2024.11.04.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:24:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] xmlrpc-c: improve the fix for parallel build a bit
Date: Mon,  4 Nov 2024 14:24:53 +0100
Message-ID: <20241104132453.1872268-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 13:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113405

* still needs some improvements, but should work a bit better
  I've rebuilt it 30 times without triggering the issue now
  with previous version it failed on 5th iteration already

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...nsuring-Sequential-Execution-of-rm-a.patch | 77 +++++++++++++++++--
 1 file changed, 70 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
index 02b5244f3a..152667661e 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
@@ -1,23 +1,86 @@
 From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Oct 2024 22:52:38 -0700
-Subject: [PATCH] unix-common.mk: Ensuring Sequential Execution of rm and ln commands
+Subject: [PATCH] unix-common.mk: Avoid race condition between mutliple make calls running in parallel
 
 With high parallel execution, it results in race condition where
 its trying to create symlink while the original symlink while rm is
 not done deleting the existing file yet.
 
-force sequential execution by adding dependencies between the steps
-or combining them into a single shell command
+The issue is that submake for libxmlrpc_util.so is called 12 times
+which can run in parallel and then some of them will try to create
+target link at the same time (after both already finished rm call).
 
-Here, && ensures that the ln -s command only runs after rm -f target
-successfully completes.
+Use -f which should be supported even by relatively old ln and
+should avoid the need for rm (and hopefully will avoid this race)
+
+For libutil++ it calls "all" and "libxmlrpc_util++.so" only once,
+but for libutil it calls "all" and then 12 times libxmlrpc_util.so
+(after-clean-j1.log is the make output with -n and -j1 instead of
+-j70), still trying to figure out why, my autofoo is rusty :).
+
+Ideally we should prevent calling it 12 times, but until we figure
+out why we can at least avoid the random build failures.
+
+Another interesting fact is that I haven't seen this issue until
+the upgrade to 1.60.03 from 1.59.01 from:
+https://lists.openembedded.org/g/openembedded-devel/message/112706
+but I don't see any changes which should cause this in the git since
+1.59.01, but the gentoo bug report is against 1.54.06 already.
+
+martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable $ grep -A 1 lib/libutil++/Makefile after-clean-j1.log
+make -C libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/Makefile \
+    all 
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/Makefile \
+    libxmlrpc_util++.so
+
+martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable $ grep -A 1 lib/libutil/Makefile after-clean-j1.log
+make -C libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    all 
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
+--
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+    libxmlrpc_util.so
 
 Similar error reported here [1]
 
 [1] https://bugs.gentoo.org/932835
 
 Upstream-Status: Pending
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  unix-common.mk | 6 ++----
@@ -33,14 +96,14 @@ index 6954faf5..983c48cd 100644
  $(SHLIB_LE_TARGETS):%:%.$(MAJ)
 -	rm -f $@
 -	$(LN_S) $< $@
-+	rm -f $@ && $(LN_S) $< $@
++	$(LN_S) -f $< $@
  
  SONAME_TARGETS = $(SHLIB_LE_TARGETS:%=%.$(MAJ))
  
  $(SONAME_TARGETS):%:%.$(MIN)
 -	rm -f $@
 -	$(LN_S) $< $@
-+	rm -f $@ && $(LN_S) $< $@
++	$(LN_S) -f $< $@
  
  .PHONY: $(SHLIB_INSTALL_TARGETS)
  .PHONY: install-shared-libraries
-- 
2.47.0


