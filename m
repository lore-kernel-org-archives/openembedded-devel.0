Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD5C25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 07:29:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.14412.1674372575349063499
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 23:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RVmRLN15;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso8586936pjf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2q0bLFADRNKzPBlJzf7a8ZcD74qK5+Ww73Yz4U25rI=;
        b=RVmRLN15/vxL0Eojpt8pCcLMW0diheXAi222nS2GU1EDjhU1PL3xpCYra0CKdToYaI
         T5CxMV3LuZ3TwuPcBpWfEWNyZ38OTibZDb/tMxB5dpUeQneKHfRmwYPSg6BJA+1RHjWk
         ydYx0e+lM6LxtnZu67R0FUtKOFxd6429Yrhvsz8XKMA2JuOTp+Kyt/LkzmFRKKRju5TH
         Mt02cJR1Rl2FfobqkEM0YOLyJxG3h1w9+p2Cl0wyEo9CYoa6JkwpUOdVnLOqhfr3ccTr
         ID8zKikNxPLr/tOOzcMweFokO71V20jmoTQmpYaLEdKosqBJ4LHPvNN1nqCzLM6WENiU
         Fp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2q0bLFADRNKzPBlJzf7a8ZcD74qK5+Ww73Yz4U25rI=;
        b=K2nAPYswaOJxYHlo3eocLicRgfK5fHddTaMxjk/kEdotpxhbgskMMaEjxHYwjMM9El
         zIQKpnZ6EB9cVfQlEkBL5sX6N90RWFWfOeFICzK8KWV6f8ML2nSOFAe/bTOXScmL4mM2
         AFxD/wY1weW70deKQCBpD8idjIJDPj4gXSTtL8A6l7tuLkiIUavjAIE/0pK64FVpkDTc
         xXMxjMRLQ4gyWEHSlteknP08Cj7Jm3durutaF/Cj9hEnxCx3wo80KmWiwDGqmRmNCVU9
         Z0PC+HV6NvDgTYnZFDTZ/ILWz9QOnn24333UJrGCLnrfFhU7boX7c+XwBXAx+Xzogz5c
         xCnQ==
X-Gm-Message-State: AFqh2kqCyqdaqHwNDMRd0Rxh5m1/03JyaTd8R4ddFDKZuymqIygsxqCF
	SdVDcsvmnwjG6zbWYUV4qKQPia/NfS/UFA==
X-Google-Smtp-Source: AMrXdXsvEJ1SvzN/Awha192+atBMVS/pR38/GZt4+Qm2EtotN9Z+zMCdZHVGY8gMvUcKzV0m9FZPIg==
X-Received: by 2002:a17:902:e214:b0:194:8805:13dd with SMTP id u20-20020a170902e21400b00194880513ddmr18395172plb.28.1674372574352;
        Sat, 21 Jan 2023 23:29:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090341cc00b001888cadf8f6sm11084998ple.49.2023.01.21.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 23:29:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] uftreace: Fix a build race
Date: Sat, 21 Jan 2023 23:29:31 -0800
Message-Id: <20230122072932.1721979-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100700

Fixes a build race seen after 0.13 upgrade

| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c: In function 'dump_mermaid_footer':
| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c:1347:10: fatal error: utils/mermaid.html.cstr: No such file or directory
|  1347 | #include "utils/mermaid.html.cstr" /* This file is a converted of mermaid.html to one string literal in build-time */
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| make[1]: *** [Makefile:310: /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/build/cmds/dump.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-related-to-utils-mermaid.html.cstr.patch | 38 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.13.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-a-build-race-related-to-utils-mermaid.html.cstr.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-a-build-race-related-to-utils-mermaid.html.cstr.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-a-build-race-related-to-utils-mermaid.html.cstr.patch
new file mode 100644
index 0000000000..3e003e0e8f
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-a-build-race-related-to-utils-mermaid.html.cstr.patch
@@ -0,0 +1,38 @@
+From 0996625e71e5f726b8829f01d87ff85446453378 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Jan 2023 10:35:46 -0800
+Subject: [PATCH] Fix a build race related to utils/mermaid.html.cstr
+
+Sometimes build fails like below
+
+| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c: In function 'dump_mermaid_footer':
+| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c:1347:10: fatal error: utils/mermaid.html.cstr: No such file or directory
+|  1347 | #include "utils/mermaid.html.cstr" /* This file is a converted of mermaid.html to one string literal in build-time */
+|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
+| compilation terminated.
+| make[1]: *** [Makefile:310: /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/build/cmds/dump.o] Error 1
+
+Create a dependency on c-str-conversion for dump.o
+
+Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/1622]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 70dc12f0..1eaf1663 100644
+--- a/Makefile
++++ b/Makefile
+@@ -304,7 +304,7 @@ $(objdir)/misc/dbginfo.o: $(srcdir)/misc/dbginfo.c $(objdir)/version.h $(COMMON_
+ $(objdir)/misc/bench.o: $(srcdir)/misc/bench.c
+ 	$(QUIET_CC)$(CC) $(BENCH_CFLAGS) -c -o $@ $<
+ 
+-$(UFTRACE_OBJS_VERSION): $(objdir)/version.h
++$(UFTRACE_OBJS_VERSION): $(objdir)/version.h c-str-conversion
+ 
+ $(filter-out $(objdir)/uftrace.o, $(UFTRACE_OBJS)): $(objdir)/%.o: $(srcdir)/%.c $(COMMON_DEPS)
+ 	$(QUIET_CC)$(CC) $(UFTRACE_CFLAGS) -c -o $@ $<
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
index a429f7948e..51ebb722a6 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
@@ -12,6 +12,7 @@ inherit autotools
 
 SRCREV = "53ec12d40701cf73ddcf5db8cff63b54736d0eda"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
+           file://0001-Fix-a-build-race-related-to-utils-mermaid.html.cstr.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.39.1


