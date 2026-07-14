Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB99C4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 17:26:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1819.1784049975274204457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jul 2026 10:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VvafOFbz;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce9e39fccbso10898195ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784049975; x=1784654775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aieLJ3ibScslkKX2qIv+O6oN++XtMzpp3HbBohJwqQ=;
        b=VvafOFbzQ65Py6srqi63tlYkcxWkR29J7fOeTWC+8mZdA/qtz+nfZPr5McFhULp1Zg
         l+doWLC6MRbZx2haEUT+IJUus0aLhAnQgxoDhcwXM9fTUw2O/rTkLEy6AAt136i5Y6sq
         EDxvQsymDbjr/w43oBurpEJbQNngq2RR/vM5Voo2R/KAK4TO1m0rQZPniEq8F1xTvuG7
         9tWxkW6S8N3vlRJh06kD0EJLs8gFYA8j/URdWdbotZ9HS6RnMq4IBejjtN/xBwh+RZiQ
         MXZBzWfzyf/cbJgePN9isD/L5BASPpuUAOTbWw1N/KMjbIriucq/g+eSuHRMhkixyZVM
         CKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049975; x=1784654775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aieLJ3ibScslkKX2qIv+O6oN++XtMzpp3HbBohJwqQ=;
        b=Smc+T7AEi3KSYPGUv5xRtOc0JeWpkhEav7z+u93TxPgK2jxZKdyZB+YyTissr5EYye
         wBoWEngpy00qm+S+M9Qa77aY2GtlZoWoIEKtlxBk4beQULJlOKI1hBUZFg9OF2mOQWUJ
         VDW1O3D74NDiVUmEpCUX1cAqr64+UIUaec3RzH5Qn09loLdSBuk/SGDnMXMLGMpMmNtC
         RSU8RSH66VX4aH+NoJfgtDPn/ZUE22zV45PqVNanIOkqiTwHYE0fT0sZkqj0ZSISTnSv
         95NqBiUVPEeJo35+LTeV6R0qiV1SFQ9G5zbN4M/XaxpKXz103VIPWg8TMAnsOFKN3sf6
         bwmQ==
X-Gm-Message-State: AOJu0YzU6OkvIJzaTm3pkL0GY3DJnpePNXEJA/fAA/pAInHNIx9r1j41
	gUYhhfBTpL+53Q2z7czCqbej3UeumHzSUZ1sW1pa3sWkgU5ONWZIFN5oZ0kRxAqFeqg=
X-Gm-Gg: AfdE7clF8QG6JJsET8XJLAk3XoXXOemShp7BLlZJkVgsg37DY92phHdREzkuh8IKpfs
	F0AHkUT1AuR5F+HD4xrydQNJmAVuBDUsgUOnAMOo8/WRg84mbwMxAjLT0E1Bmy6g4q1riwrfoAR
	YqsPxyfS+3/J8o6LnewAtbenoB3NB6ecdVa9cIj3F7UXzV98biB/AKD8zJ1iDrCTlLb2SXafIzM
	x6DX2f/Fkf1DV2uG3qHtDUv+1PvyaHPk+BEmw4a3xd25/VL6YFiC6nYemIj4n2vivfL4Bg7gd8q
	xjdcIhnG53iXiXpaYGGbh1JM6hwvpSvzaRoZ7mevkqUDcg/DMKSrRfMZ4svD1RneG5NhsnjA6nc
	4qZtakM1k5zA+I51pZ84KsregFieNNmIKk6/JVKI9aWWhNbo2H3F/AeMwY+W43jYcphXuE4a4Jj
	xZre8aDcZxE+DOgEieUtEf7KXLEKFGCfmJ7pOEdkYLSM1aavYRCagSNr4w/QJbwf0MswsjOani3
	WanPtAAo3WJa85OPuuNTPKk5N04NYDHbpp+1rIHMk/RcVWm6TvoYTm2p6Y6+mAyKLTxoodRerVZ
	rOOYy86kZi8atzmqXkMZQdjV4317zvKLzBq3ayxW
X-Received: by 2002:a17:903:ac8:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2ce8285a7fdmr177949565ad.4.1784049974418;
        Tue, 14 Jul 2026 10:26:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b93ae3b45sm28831463c88.15.2026.07.14.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:26:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] frr: Fix native clippy failing to load libatomic.so.1
Date: Tue, 14 Jul 2026 10:26:11 -0700
Message-ID: <20260714172611.1370181-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 17:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128167

frr's configure links libatomic whenever the toolchain merely has it:

  AC_CHECK_LIB([atomic], [main], [LIBS="$LIBS -latomic"], [], [])

This probe only asks whether -latomic links, never whether frr needs a
symbol from it. On x86-64 the atomics frr uses are inlined, so the
resulting native clippy references no __atomic_* symbol at all, yet
still records a DT_NEEDED on libatomic.so.1.

Nothing prunes it: ASNEEDED is part of TARGET_LDFLAGS only, so native
links get no --as-needed. Nothing can satisfy it either: clippy's
RUNPATH points solely into recipe-sysroot-native, there is no
libatomic-native, and uninative only rewrites the ELF interpreter.

buildtools-extended-tarball ships nativesdk-libatomic, so on hosts using
buildtools (Rocky 8, Alma 8, openSUSE on the autobuilder) the probe
succeeds at link time while the loader cannot find libatomic later, and
the target do_compile dies executing clippy:

  clippy: error while loading shared libraries: libatomic.so.1:
  cannot open shared object file: No such file or directory

Hosts with a system libatomic in the default loader path, such as Ubuntu
with libatomic1 installed, only avoid this by accident.

Link native clippy with --as-needed so the unused libatomic dependency is
dropped, making the frr-native artifact independent of the build host.

Fixes [YOCTO #15590] and [YOCTO #15590]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/frr/frr_10.6.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
index 1cd102f0da..8f53cf68d5 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -67,6 +67,14 @@ LDFLAGS:append:mipsel = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"

+# configure links -latomic whenever the toolchain merely has it
+# (AC_CHECK_LIB([atomic],[main])) rather than when it is needed. buildtools ships
+# libatomic, so clippy gets a DT_NEEDED that the loader cannot resolve later:
+# BUILD_LDFLAGS has no --as-needed, there is no libatomic-native, and uninative
+# only rewrites the interpreter. Hosts without a system libatomic then fail with
+# "clippy: error while loading shared libraries: libatomic.so.1".
+LDFLAGS:append:class-native = " -Wl,--as-needed"
+
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"

