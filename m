Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1468.1587668284593128635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 11:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CZAU4MuM;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c21so1894499plz.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPkamBybHgPdCnHgDsTZca3JdT+1vv0h8snwNwIRmlc=;
        b=CZAU4MuM4ZgW9PvPAuS1JkJr/whBTMKzU/p2rupkpLvmZ4cdyaJFIYIfFBf+4KBOr0
         FG7Km+b/BxnmJGXE8qOMOEdXWWDUhBjdx+mTycKNAYnrFUoJ9zbRgE2VQ8IIe+2euj1d
         3VMTGz1U5AHFxHWD3warmCsT+fz7BFMAdbxlBwg1TE/Qo9WN0MTq0CyzRwvaXg4nv+KE
         Eo+2he6Wo/GyBWm21rTmKn6QkGWuieEqjxQIU0pphKfHX7al0yRfcUSLrR9AXcB2RXii
         +mEX+eV4aDgTlHI4EsBPXsDaF7nyCtkkQfHn7WpHRqaC6NYOOAlWF48WSjUBRUhTtu96
         aDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPkamBybHgPdCnHgDsTZca3JdT+1vv0h8snwNwIRmlc=;
        b=uKKflvl/C3hVGCBJzh4swjEU1M3EYFDjYQ2JuQ5+gjBe3rxgpf150Lwtt64Ys+zEr5
         YDDga4GXYJU4+kpPV1fJWNgHxVAhekE+E/2PErDW3fobtK5z46j52yAovB9ac2qcD8Dw
         IXCQt8g0aX+Yd2VIaR6hnAiKA6SWwWTwWlrntritcq0mSaxP36aKX0GDonRDyKIi24LE
         La/vglVrd1MWZ/8Hc/g4DyECMt0eLCZCYyDaX0KKGC+SrTQD9aMYv+eS9kn4EUfidXhR
         vrO0T4mNyj4LHkZ4LqyFXvc17Z/laTAv8c9OtPNZBEWzdWJ+QwWBZV9MKfPf7NwL8TM3
         oe4w==
X-Gm-Message-State: AGi0PubSQOXQ/Y3XyT9gZb2jG9PoQ1zGrquJUi2PJoBcEIdxMo5OJAvT
	UZuYNHxrrwvpzReYNv7Fv4G8BzslmRc=
X-Google-Smtp-Source: APiQypL3ZhABwfLxylg+ozt1emZEFJvf438h3ksjSThKY7RiEqTqnlz8DwTFXb20uzjJrjIGj03oOg==
X-Received: by 2002:a17:902:8202:: with SMTP id x2mr5175340pln.287.1587668283444;
        Thu, 23 Apr 2020 11:58:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id z7sm3240507pff.47.2020.04.23.11.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:58:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gperftools: Do not build on riscv
Date: Thu, 23 Apr 2020 11:58:00 -0700
Message-Id: <20200423185800.3069512-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its not yet ported to work on RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb            | 2 ++
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb    | 4 ++--
 meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb       | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 5c3b806f22..58841ef319 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -44,6 +44,8 @@ PACKAGECONFIG ??= "tcmalloc system-pcre"
 # dmb operation. So we use system-allocator instead of tcmalloc
 PACKAGECONFIG_remove_armv6 = "tcmalloc"
 PACKAGECONFIG_remove_libc-musl = "tcmalloc"
+PACKAGECONFIG_remove_riscv64 = "tcmalloc"
+PACKAGECONFIG_remove_riscv32 = "tcmalloc"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[shell] = ",--js-engine=none,,"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d5c6288cdf..8358e933d7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -275,8 +275,8 @@ RDEPENDS_packagegroup-meta-oe-support ="\
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
-RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "uim"
-RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "gperftools uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
index e15133c1b9..b7b7839313 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/git"
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
 COMPATIBLE_HOST_mipsarch = "null"
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
 
 # Disable thumb1
 # {standard input}: Assembler messages:
-- 
2.26.2

