Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADB0D42BAB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:43:39 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.91506.1731429815054461612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 08:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AeoVUR13;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea339a41f1so49936367b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 08:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731429809; x=1732034609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYDvJWH1Zb4JElmiYjXxLn4KuajQPqzFyKSpHyCznFI=;
        b=AeoVUR13+HV4G2kxz4PUdz3UmHjEYmFuFfSs1ccCnP1138nX/Ij5LW30dVpqY2L+tu
         53i5WCgaRB2GI1Cp5dP8GMsZw3/hUC9u9y/RvoD/WtGaBb4jY4amQLmlY/wTjQPILeSN
         bcMAgp/6sGikhp5xERHBD8L3nGHC6tgSXtr0E1zQqBIcyGyvmbDStD/BNkRfplc7XdQh
         qpXgqosEfMUBO7lBt/MxEkqUWh1kEChDlMmp8E2jAJMosB5Aou0RMlYXuWMvWwozyCdm
         2VDh959fFmPZfkIOg+RVG8+bf716IuEVLz/oHsKQ/rYS8TVBX6le0s2DPG9rOk17/svd
         O4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731429809; x=1732034609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYDvJWH1Zb4JElmiYjXxLn4KuajQPqzFyKSpHyCznFI=;
        b=SltSMxAN+tokmoQlkofN+MopIwwIMSWog8OWs1LXJJ8WNULujCOagaewW8Mju3OPc8
         3yX3ZzlnL/Pz0CsFIjcNMU3vi05fWb9TRTwC2Qc7dlhbnU5Z7gBFc4QCGs+E0DYj7WGt
         YKl4AmHjYu8AFtb/45EA3cn3vFed0ckGLLUIT/ocqdQ9LQrmynn29ZaDarwQA7AFh+zM
         YrvPqWSQ9SyC8XLtsqX33q/N5xoB/M9o59KW6nWUiQKry66lVcHziq6BBRHiWZNeFmCf
         MAdX0TakncG4VjuY29WnngtaxSq/aKtMzy2WLobzydCCGEn7Qj8IvRNfgVMuAk9fQ5Ar
         hNJA==
X-Gm-Message-State: AOJu0YwgZTg5CVH3rBV/Ho4wSE2JExQoSrVBBLenn4Oq5P3GCGfFFgvN
	gCJuP8mMcSrGSij40nE5U+Z4k4GHzL5jNcoZE9Nvsa2IdgaRM3WLkngkkNy1
X-Google-Smtp-Source: AGHT+IF4UfyK9NrMrZnAtjFDaUXI84E33asKS0EBUNssM2y+VnE5LJDfRFuBuryTZxGuzi2Skzzp5Q==
X-Received: by 2002:a05:690c:6ac5:b0:6dd:d0fa:15a8 with SMTP id 00721157ae682-6eaddfa14bdmr185354767b3.35.1731429808742;
        Tue, 12 Nov 2024 08:43:28 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eaceb0939asm26004427b3.61.2024.11.12.08.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 08:43:28 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.27.0 -> 1.28.1
Date: Tue, 12 Nov 2024 11:42:52 -0500
Message-ID: <20241112164253.668608-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113794

Changelog 1.28.1 :

  This release contains a fix for a single significant regression introduced
  in c-ares 1.28.0.

  - ares_search() and ares_getaddrinfo() resolution fails if no search domains
    are specified. Issue #737

Changelog 1.28.0 :

  Features:

  - Emit warnings when deprecated c-ares functions are used. This can be
    disabled by passing a compiler definition of CARES_NO_DEPRECATED. PR #732
  - Add function ares_search_dnsrec() to search for records using the new DNS
    record data structures. PR #719
  - Rework internals to pass around ares_dns_record_t instead of binary data,
    this introduces new public functions of ares_query_dnsrec() and
    ares_send_dnsrec(). PR #730

Changes:

  - tests: when performing simulated queries, reduce timeouts to make tests run
    faster
  - Replace configuration file parsers with memory-safe parser. PR #725
  - Remove acountry completely, the manpage might still get installed otherwise. Issue #718

Bugfixes:

  - CMake: don't overwrite global required libraries/definitions/includes which
    could cause build errors for projects chain building c-ares. Issue #729
  - On some platforms, netinet6/in6.h is not included by netinet/in.h
    and needs to be included separately. PR #728
  - Fix a potential memory leak in ares_init(). Issue #724
  - Some platforms don't have the isascii() function. Implement as a macro. PR #721
  - CMake: Fix Chain building if CMAKE runtime paths not set
  - NDots configuration should allow a value of zero. PR #735

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.27.0.bb => c-ares_1.28.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.27.0.bb => c-ares_1.28.1.bb} (88%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb
similarity index 88%
rename from meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb
index ddd081e11..bfb46a54b 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_27_0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_28_1/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b"
+SRC_URI[sha256sum] = "675a69fc54ddbf42e6830bc671eeb6cd89eeca43828eb413243fd2c0a760809d"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


