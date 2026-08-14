Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04F9C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:30:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14302.1786717801471420061
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ihKXiOI2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de0093c42so936230f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786717800; x=1787322600; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NVCogBR3xYNwrI21Km5VguCz4NmbwSpsgRapk9haEXc=;
        b=ihKXiOI2moqXJhi4QFOe+5I606/UpDhzOlq9DMeLxGmsrTqdaE0o+rz9soluDSqidj
         pIxSc/o6T9n58TENfdMHyKUFqPARg7CbWyA2bUO3ubCYrfwUJ8BkxCoL7ZjDIqo5+sfe
         kjONGP4n42c83ycqBUd2Uuau4BNL0FuUUComVp/OQg3CsXySykxmFsNGPengx1jn7Ad/
         mLob9zMGigE6F11gBqRf0hRT44HhxlL7m6sJ+0XtMzckLBzlZ0aE3NqI4fvI4gT1Ymtb
         /AVSAsUmEZEoxxGN3JKHcBQRK/UesYflhzen4xUBGNmAGhlpDOFZ9e+Q9QFznXrgLH0W
         hQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717800; x=1787322600;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NVCogBR3xYNwrI21Km5VguCz4NmbwSpsgRapk9haEXc=;
        b=das3xFHqXl3PQWDJFYYBz8wTL/5SL7NjCvyqS1XHy56t/Xel1W/vC6wMAP2zPcb6JM
         RRzGuDyRBopMYhSxYuQy6E2Ujb8ZZZ08LBA/pGuJqNmIysRDlXe+s9nwOcvxAZknvkmm
         o1GzDEM+83DxyuHSynP3Fz5zm7bK5pBGyAKe8QrbuUInBLvg/iaEWNv0z2J05HMt9D+g
         SdzgnqgvqGxBL6oZpmPRqFk3bp2U9Ec7wA/sGgSZybHtkyu/f/3e27eVNPTJ5o34cMyv
         C1aZTwZ1gnjVh8+t5l/fA8YvLQBk3nraohiDnW9uKd1H8u/g+sM1Cf0beVAb95KEcski
         ouug==
X-Gm-Message-State: AOJu0YyB97JI2vPP5gBHGBFp6LQapJrCqJPjQlxiWKb/bNGQyxtSIjLk
	3FUzrZYLbVYsABb0Xb7LkZW64DsZDc43etnAOul88OdiPYlbmOMpbekp
X-Gm-Gg: AR+sD11ts9tfGkp3EoRgYnTwh9vVmeAAimushD4RgwmnY6cZqxmvLz0KyUHSAFVT+wl
	eJbrdVPjZ+HPPXL5ZQzdxvzc135vW1vyEyIBsqFxU2ZkRciAZDilp3Y41a3XQme4FPQjP9ajCKd
	Oxd4CyCQxTlsr6GG6Kszqi1clqfDFDJTngDsPXM5vMCZlHuM2cG09RRf8T+Ub7/cxlDr/0KtWQZ
	sHkP0JM2ZN0hjF3LVI1vOJJd8EXCGZU0l1GcJcpcWQEFb2VN6k9y4wAyB9YG2YeQDAtyPQIPep4
	yyNM1cfVX6YBv4iPVZJEF9280Qemiew0t0bIpM5H4IvN0mdk4o2s++df24gR0suJg+Ajv0h2RJb
	IJ7B37x621qdWnhfI3GwX4H+H5X8x6nG8XbJg0unrk5Hb2pKLjlBNXYUsCshjCnvSF86whNVybo
	gdP/uM0+R7ucxk7DknFGrcWet2rGOu2HVBxEHelk1REyeI3E18Uh382xIUFH9m8DYTI2BAihcfi
	RgFqDO9rXPlwI8g7Aze8xmi6mHPzJTKgoHbn25Lb7CA777DWNBFYoRwAGD/YIK7ZMs=
X-Received: by 2002:a5d:6d44:0:b0:481:474a:9a05 with SMTP id ffacd0b85a97d-4816078593emr7347330f8f.26.1786717799384;
        Fri, 14 Aug 2026 07:29:59 -0700 (PDT)
Received: from [192.168.5.15] (host81-148-255-151.range81-148.btcentralplus.com. [81.148.255.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20058fsm9973661f8f.4.2026.08.14.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:29:58 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 0/2] cpufrequtils: fix latent do_install build
 failure
Date: Fri, 14 Aug 2026 15:29:44 +0100
Message-Id: <20260814-cpufrequtils-v1-0-5ac5e77bf5ff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgmf2oC/yXMSw6CMBRG4a2QO7ZJH8SoWyEMSv2r1yBgb2tMC
 Hu36PAbnLOSIDGELs1KCW8WnqcKc2go3P10g+JrNVltj/pkWhWWEhNeJfMoSvv2HJ2z3gRLNVk
 SIn9+u67/W8rwQMj7o3siezWjp237Al9lqUF5AAAA
X-Change-ID: 20260814-cpufrequtils-0a49f332a1c2
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 14:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129049

do_install runs make with -e, and install: depends on all:, so anything out
of date at install time gets recompiled under -e. -e makes the environment
beat the makefile's own assignments, and every CPPFLAGS and CFLAGS use in
this makefile is +=, seeded from the environment. bitbake exports CPPFLAGS
(empty by default), so the makefile's

  CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
              -DPACKAGE_BUGREPORT=\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE

is discarded. print_header() in utils/info.c and utils/set.c uses PACKAGE and
VERSION unconditionally, so the recompile fails:

  utils/info.c:447:16: error: 'PACKAGE' undeclared (first use in this function)
  utils/set.c:38:16: error: 'PACKAGE' undeclared (first use in this function)
  make: *** [Makefile:166: cpufreq-info] Error 1

A from-scratch build does not hit this: do_compile leaves everything up to
date, so all: has nothing to redo and nothing is compiled under -e. It bites
only when something is newer than the binaries by the time do_install runs,
which is why it survived this long. To reproduce on an unpatched tree:

  bitbake cpufrequtils -c compile
  touch .../cpufrequtils-008/utils/info.c
  bitbake cpufrequtils -c install

Dropping -e fixes it, and also makes do_install compile with the same flags
do_compile used - the install-time relink was otherwise losing -pipe and
$(WARNINGS) too.

-e is also why 0001-dont-unset-cflags.patch exists: it was there to override
the makefile's CC/LD/AR/STRIP/RANLIB assignments. CC is the only one the
makefile ever references, so passing it on the make command line replaces
the patch entirely.

Patch 1 is source provenance and whitespace only; patch 2 is the fix above,
plus NLS as a PACKAGECONFIG.

Verified with clean cleansstate builds for a 32-bit Arm target, and the
reproducer above no longer fails.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (2):
      cpufrequtils: fetch from git.kernel.org, mark PV as post-release
      cpufrequtils: fix do_install, drop the toolchain patch, add nls PACKAGECONFIG

 .../cpufrequtils/0001-dont-unset-cflags.patch      | 32 ----------------------
 .../recipes-bsp/cpufrequtils/cpufrequtils_008.bb   | 27 ++++++++----------
 2 files changed, 12 insertions(+), 47 deletions(-)
---
base-commit: 58dbc84826947c9436d4b527a4569fdd1ce5ea19
change-id: 20260814-cpufrequtils-0a49f332a1c2

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


