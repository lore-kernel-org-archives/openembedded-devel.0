Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DC8C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:09:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41762.1789139359817803906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 08:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pcuzvFc2;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4902427c1so889241a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789139359; x=1789744159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQw7MtdKzuH9wkkWNFJFmdLQGU8lfK8NAj/v0sYCXo4=;
        b=pcuzvFc2LgWMuhw6kSNuX7XNsDjYGtpLcYPjkSbz1Pvl1ZzcVkzCu6S2HBhCTh0pXo
         8fZ51KyG9HeEplTNNmIilfI39tBHkGL/vNJjeluKDJkI46bfKeYnGcTLhcA6xjtcKS6q
         EVYpjCnlOnH8zSpYx0TA0usmoipA1T9xw/Ju3xC5AGJF7C6zPPsQauiJoi2Z6A/RxgA2
         2cxijIHY2h+GOIFI8ExycRjG6s/ZbLMUK5BbE+fsFdta9TtHfiQmjpJHrzaG/X7F2f3q
         L1PoWnx6NA3+qrvsxhRkimtozvgt1cENtJZoVZ6biS/vkAk+yz89PV7/izKUZlCn1UUG
         lwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139359; x=1789744159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQw7MtdKzuH9wkkWNFJFmdLQGU8lfK8NAj/v0sYCXo4=;
        b=eNVMQbfoj1w8ZV6j+FI3dI6/f9B00TFZypAC+BZ+hyE8utIWKKugFzlRXil6mThBmQ
         qOQ6kT9jiMee6pYTpUL9FHjpyZHPobxYRc8c/xueu4cOgF2J56UX2vllwyU06mZM0Nbe
         5Y+Y+PAwRMqJQ8vAyBEhXZtMpsQE21WJ4FVB4IquCSWyNI7caG03mmsx18u3qxslCZOB
         g6Pf7Fr4ZqpBTUDcCGpu0+Av4wOjLCknXnmBxbfL2IPHwU4GLgjK7H55xN5tLP4i2af6
         SwEWvMigfS/fKUuIE4fWkq2YRsxWM6BqXD0eopM6ran9SuvS6hADS7ZCNjqd8k2W+UAT
         Frzw==
X-Gm-Message-State: AFuF++nsj5s5i7bPADiIAs9KCutKkJ71CeNalcl47Iy1EJGgWkcFFGL5
	lPDUvwSnUBEVW1vUdxzILKB8n35CHxB/vAq5DGBQ3HR8K5QQzQ99QKyp23730A==
X-Gm-Gg: AYBFou25mkedjJJ1rxUFj3KnZ0A7EQpd9NK4CTPLsSnnZXs5fXpMQzE4bouN/nKf+8L
	WYkzCqI9HjZn0v9FudGE9j9dkJN/C6aqOq1TvfSPAfgk2exk9FNlZvUotd+2+5INsnwuX55zyHH
	Msa5ARzRnLh47YVUn1R4t8+M1yFIL8BeMK37sBYySpQ+JYhbWnCgmiOs69jL3xqjI2ywDJBD09R
	Cm0x/ca0RL1IJbdigf0ZIifoYst37sMEs+RbMb7asHabOU3879FJXP7D3YG4W/iLppVFMpPmyoh
	rqScqa4sx2PP+8Nby9igcdXI9xGM5DTyZTAMfK6R5IJXlT8kdeWkFcy/k3Rvh1YEaLZ8dR00yzc
	3PAQxX5sRNZNEu/ToxkbzfSW12kf8IKN5W0FWXDGyzR2jHPQQAd128inzYIUoQ69hAYD4KNSTid
	dGm3CofgZQFixj4plQZ8nfwPtO2DKK2B28H9N7zLmCselW+QK/Dm4Mm10FyhT81fS0qSAAcF2BD
	x+qJ0eKfpW7VtsESKh6L3VtCI3PkRg2f6CQZVNBe7uAa8jYMQ+OSME9RreimKfI+J3fVnvChAyT
	EmFsno817d48r8DtB+EBQERWT5iAaQ9RAYtCKTakbVneG74ofp4txo62QUjnvWsZLzLoliuCsKb
	t3tYIZCTV7E8r2MDZyze1qecpCSh9hVF2VQPW8UyaxCE3yXUoG3RAeR0g
X-Received: by 2002:a17:90b:380d:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39d7790f8b8mr12970400a91.2.1789139358823;
        Fri, 11 Sep 2026 08:09:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm7263888eec.12.2026.09.11.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:09:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] sedutil: upgrade to 1.49.13
Date: Fri, 11 Sep 2026 08:09:15 -0700
Message-ID: <20260911150915.2320557-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 15:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129975

The 1.4x releases are cut on the "develop" branch,

Add UPSTREAM_CHECK_GITTAGREGEX to keep the version check sane.

The release needs a few adjustments beyond the version bump:

 * linux/DtaLinux.cpp now includes <systemd/sd-device.h> and
   <nvme/types.h> unconditionally, and Makefile.am hardcodes
   LDADD = -lsystemd, with no non-systemd fallback. Add the systemd and
   libnvme dependencies (matching the package list in the BUILDING file)
   and require the systemd distro feature.

 * Makefile.am declares .INTERMEDIATE, which automake defines itself in
   distdir.am, and configure.ac uses AM_INIT_AUTOMAKE([-Wall -Werror]),
   so autoreconf fails with automake 1.19:

     automake: warnings are treated as errors
     Makefile.am:152: warning: user target '.INTERMEDIATE' defined here ...
     .../am/distdir.am: ... overrides Automake target '.INTERMEDIATE' defined here

   Add a patch dropping the declaration.

 * Clear WERROR so that upstream's -Werror does not turn new compiler
   diagnostics into build failures. clang 23 enables -Wunused-template,
   which fires on the deliberately unused sd_device_new_from_devname()
   SFINAE fallback.

 * Generate linux/Version.h up front instead of letting Makefile.am run
   "git describe --dirty", which needs git at build time and reports
   "1.49.13-dirty" because do_patch leaves the tree modified.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...rride-Automake-s-own-.INTERMEDIATE-t.patch | 35 +++++++++++++++++++
 .../{sedutil_git.bb => sedutil_1.49.13.bb}    | 20 ++++++++---
 2 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sedutil/files/0001-build-do-not-override-Automake-s-own-.INTERMEDIATE-t.patch
 rename meta-oe/recipes-extended/sedutil/{sedutil_git.bb => sedutil_1.49.13.bb} (53%)

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-build-do-not-override-Automake-s-own-.INTERMEDIATE-t.patch b/meta-oe/recipes-extended/sedutil/files/0001-build-do-not-override-Automake-s-own-.INTERMEDIATE-t.patch
new file mode 100644
index 0000000000..4a6df1000e
--- /dev/null
+++ b/meta-oe/recipes-extended/sedutil/files/0001-build-do-not-override-Automake-s-own-.INTERMEDIATE-t.patch
@@ -0,0 +1,35 @@
+From 2ef56c134de35938119105dd92ca5ae4842ab338 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Sep 2026 07:46:11 -0700
+Subject: [PATCH] build: do not override Automake's own .INTERMEDIATE target
+
+Automake defines .INTERMEDIATE itself in distdir.am, so declaring it in
+Makefile.am makes automake complain, and since configure.ac uses
+AM_INIT_AUTOMAKE([-Wall -Werror]) the warning is fatal:
+
+  automake: warnings are treated as errors
+  Makefile.am:152: warning: user target '.INTERMEDIATE' defined here ...
+  .../automake-1.19/am/distdir.am: ... overrides Automake target '.INTERMEDIATE' defined here
+  autoreconf: error: automake failed with exit status: 1
+
+The declaration only asked make to remove the generated linux/Version.h
+again once the build is done, which is not worth breaking the build over.
+Drop it.
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 112e172..8110fae 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -149,7 +149,6 @@ man_MANS = docs/sedutil-cli.8
+ linux/Version.h:
+ 	$(srcdir)/Customizations/linux/CLI/GitVersion.sh > linux/Version.h
+
+-.INTERMEDIATE: linux/Version.h
+
+ maintainer-clean-local:
+ 	rm config.status configure config.log
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_1.49.13.bb
similarity index 53%
rename from meta-oe/recipes-extended/sedutil/sedutil_git.bb
rename to meta-oe/recipes-extended/sedutil/sedutil_1.49.13.bb
index e8987b2dd0..1290b7508b 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_1.49.13.bb
@@ -7,12 +7,22 @@ LICENSE = "GPL-3.0-only"

 LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"

-PV = "1.20.0+git"
-
-SRCREV = "6270fb0e3c110572d96936a473b5e0d21a39884d"
-SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=master;protocol=https \
+SRCREV = "1b0633afbe02bf5aa084f1efbedeeb065b00d209"
+SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=develop;protocol=https;tag=${PV} \
            file://0001-Fix-build-on-big-endian-architectures.patch \
+           file://0001-build-do-not-override-Automake-s-own-.INTERMEDIATE-t.patch \
            "

+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
+DEPENDS = "systemd libnvme"
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit autotools-brokensep features_check
+
+EXTRA_OEMAKE += "WERROR="

-inherit autotools-brokensep
+do_compile:prepend() {
+    mkdir -p ${B}/linux
+    echo '#define GIT_VERSION "${PV}"' > ${B}/linux/Version.h
+}

