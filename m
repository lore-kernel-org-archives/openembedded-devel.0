Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49487F589B5
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:48:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18650.1776948524904531786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fy6uEy5v;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad9516a653so33491625ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948524; x=1777553324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaY1O2O8lS7g4LAnRXst2arbGik5FBoK/caQLD5hj3s=;
        b=Fy6uEy5vk8pMhFG7P14vCx1oWqHSoajVgpeM+XPXzeaqYwy7RF2uckT0RHWXQ82Rrn
         a7+c1mN88Rjr5I/Z8rf4yjB2dZZXrxSlA9nMiXkIaxEkrEM1wV2DNsJzesRtQTV96bBc
         XdTE/cjR3W+38gbgg4HXL45/MsmtEKKSKirMW65+b7I9f6iZN28m0zOpTTpbnm5V26J7
         64OybvCvQ7tDFU6OgODfdwKDp0I1vJbR4NUQUd/Q3irh6mEy0p9ABUrPXhUFTksyWIkZ
         f3f2qisbOB7tQcf1f+hYn84saUp6xRIWM+2VegpFJU36qUlzdp370jb8iAFqFVgJ/qpU
         PpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948524; x=1777553324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaY1O2O8lS7g4LAnRXst2arbGik5FBoK/caQLD5hj3s=;
        b=OCBH2F+sE1WdqHW2aLhPXeFHH3MnQwZZK8YqzvOq9/308xvKUWMLEfbROx7aY4k5fW
         i35brtmS2syN0MiwYEpultvpQg0JjCmxFEKO/hBG4Ree/i3Vqosk33LvPk+EjdUBg5Z8
         MiNs74Uovo8qIHpLTXghAQWEgWoe4QstxR7yCOMDXsCq8xIlRYUaYwVzbYWGloYs0d3G
         brOubCPsV/BbPcLcM2aQzbDgvFzxD6vRVTxwj4iuVqVhkwKjT9aO7tWf7liYn/DPaEsm
         7uZVx5sbsS3en94kZjromGVnkGJKB0AM433A8wlCcZRtRCJi2QSJzbEFzVaZhR8cOKu1
         xWSg==
X-Gm-Message-State: AOJu0YxMQeWHsOZm2G2QY0kl/yRZf3RRs28SRJ2kQKmUxb7e+zlZECY9
	Ka9dftHg2p1OTbzrL1iP4ww0nf8wUy6oiHwHEW295Etko5/g5CDhZ8bEr+QiEcWP
X-Gm-Gg: AeBDievLrPzCQNEtDZGKu+0n71Rsz0QfYN0LWvkQfN4SsOUKtFeolj3orLGQWrLmZTp
	xL1hc2cETm6XzAqZPunG5BoLtvvIdPKM+RVY8ChfJjRLIT1w2v+2rPQLyyStfhEPx/J3wkZFjgj
	FVMDnIW1zVbr+PWfZqpaGjBxPTdgwy6HVmzrjGOLujHw5WZbWG/5RlcVZCYqHuRhbTnrHBa6RR2
	in4J8q+nkZMOJ2597OtHzuIG/Nf8GgHLN6N3/iWuz8gh6y58UblI5jvu2PlG1ZNzlNM32lkPVEy
	fU5lbfPe+lByBOcvo1iXAhH2YtRvfQkthPUMsAWqeeESqn4SfS3hnOItqEnLs/8IhcTppr6lilg
	99uv1XKzMxcCFBMAob5D0oFUZRSQHecW31JwAsmftRRGV+qEy1ggaMkV7tJ8rS/tfp3sddgJqK0
	u/JFTkywDZOM17gPs5XY/zoHP19enOcg/6Qo3FA2wICWDQCOQ=
X-Received: by 2002:a17:903:8c4:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b5f9f1c601mr263731825ad.25.1776948524036;
        Thu, 23 Apr 2026 05:48:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:48:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/19] jq: Use Git to fetch the code
Date: Fri, 24 Apr 2026 00:47:59 +1200
Message-ID: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126577

From: Peter Kjellerstedt <pkj@axis.com>

There is a bug (see https://github.com/jqlang/jq/issues/434), which
results in an empty version being used if autoreconf is run on the jq
sources when using a release tar ball. The incorrect assumption is that
autoreconf is only used when fetching the code using Git.

The empty version results in an incorrect libjq.pc file being created
where the version is not set, which results in, e.g.,
`pkgconf --libs 'libjq > 1.6'` failing even if version 1.8.1 of jq is
actually installed.

Switch to fetching the code using Git to workaround the bug.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ed33569f822a3a8d41f82f6980a046d17aca37d5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-with-disable-maintainer-mode-and-so.patch | 44 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 14 +++---
 2 files changed, 52 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch
new file mode 100644
index 0000000000..12a64a75ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintainer-mode-and-so.patch
@@ -0,0 +1,44 @@
+From 27f417f4812e688a59fc5186b7768cec004cd6e5 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@gmail.com>
+Date: Wed, 8 Apr 2026 05:58:49 +0200
+Subject: [PATCH] Support building with --disable-maintainer-mode and source !=
+ build dir (#3518)
+
+If --disable-maintainer-mode is enabled, then the rules for generating
+parser.[ch] and lexer.[ch] did nothing. This worked fine if the source
+and build directories are the same as the pre-generated parser.c and
+lexer.c files would suffice. However, if the build directory is not the
+same as the source directory, then the rest of the Make rules expect
+parser.[ch] and lexer.[ch] to have been created in the build directory
+if their source files (parser.y and lexer.l) are newer than the target
+files, which can happen in case the source is fetched using Git.
+
+Avoid the problem by copying the files to the build directory if needed.
+
+Co-authored-by: Peter Kjellerstedt <pkj@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/27f417f4812e688a59fc5186b7768cec004cd6e5]
+---
+ Makefile.am | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 96d6038..acb9443 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,9 +41,14 @@ src/lexer.h: src/lexer.c
+ else
+ BUILT_SOURCES = src/builtin.inc src/config_opts.inc src/version.h
+ .y.c:
+-	$(AM_V_YACC) echo "NOT building parser.c!"
++	$(AM_V_YACC) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(@F) $@
++	$(AM_V_YACC) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(*F).h $*.h
++	$(AM_V_YACC) touch $@ $*.h
++
+ .l.c:
+-	$(AM_V_LEX) echo "NOT building lexer.c!"
++	$(AM_V_LEX) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(@F) $@
++	$(AM_V_LEX) [ "$(<D)" = "$(@D)" ] || cp $(<D)/$(*F).h $*.h
++	$(AM_V_LEX) touch $@ $*.h
+ endif
+ 
+ # Tell YACC (Bison) autoconf macros that you want a header file created.
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index b9383c76f7..6eaa2de6df 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -8,15 +8,17 @@ SECTION = "utils"
 LICENSE = "MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
-GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
-SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+SRCREV = "4467af7068b1bcd7f882defff6e7ea674c5357f4"
+
+SRC_URI = " \
+    git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
     file://run-ptest \
-    "
-SRC_URI[sha256sum] = "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0"
+    file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
+"
 
-inherit autotools github-releases ptest
+inherit autotools ptest
 
-UPSTREAM_CHECK_REGEX = "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= "oniguruma"
 

