Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25825C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:41:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21196.1788982899229592379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bo0ODqS3;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e907853eso104204e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982897; x=1789587697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzcxqS0LDH434sn1tw6e8YxTF+2vTckX90p1aHcLdPM=;
        b=Bo0ODqS3Nouj8C/s9F/NCJ3ZPmpdB9CUZcfNRK2EMl5uzAKOBs3yHLeGFM9DWgjMJb
         uuQusH/JahP7U/yqFSYTl5ZKd1E275HMEY9y8RiMsf5NpViEKZEV+Yh4MZugZv16fk8v
         nCP70guxmS3J7TVjolyMa70t2ablBtRjGNo0d3erutXdd52vSKt/rpmE5Qsedv3d+AAa
         8TeowugROVGNcZW9j1ax6NjZBskI8kyfPR0m/0pe/pbWQv+b77JZ6n7fBse61CW0GpPR
         NNpAAaV4DtBToXkBwY8HZepMorjKemJIpR9jnN+FfNMbWBB5BZrFxVHaZ1CQj7YTSQaG
         DrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982897; x=1789587697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzcxqS0LDH434sn1tw6e8YxTF+2vTckX90p1aHcLdPM=;
        b=CO4dRTt1F3OF2au2JgRnatSrPzF/5paYo6dQNQqZ6JnLlg2BP7nfOQ+uISTZ0LCN7z
         UzGhTAV8Pgdv5aQmA+QUeDqdhbKdyVdG/+YH8D33Tj9xxGuZwaUsFja2mJLZQfFZm/iV
         MZlCUr8y0dp+I0Pwgr1/Qb1DIjWA+Mv9zblnN4+fuZlPz7A+vEiNoWwtoiEouaDQb31+
         iYu2p8OybIreJQOqxR8haLpflRspbWYZtRmcbTlVnf0s9llJTuCh957Icb9IMUsA+hvL
         Qf1BdksjhvR7kYh2cSIXu1RDmjyP/SAvOQz6QNi8BHP1VvSDHTPL+DrbIH7QhLNNZI+o
         HbRQ==
X-Gm-Message-State: AFuF++k+2W1p/MM/vFPIPorngzR9UahhvpQ4MH44Fl9pr4pWSxbdPDCJ
	t4+D+CZ/6AiZXS/hjrLz/EBvgNcjgoB+mdKr6CtfBkzcvuoUdzlln5SR0jU/BQ==
X-Gm-Gg: AYBFou2d5e2Wv9xg9OXCRQaq/oC2JNcXwa5kQK9UcZynLspSt1P2/m+mUHO3xBmsTwx
	O7zhp7uacQWBEwFJwtqwGhnl/Vd1v6i6Xk08boao4L/QicdiWt5tUdkrFmJj1IZ4PjIR8MDhhQz
	BaUO8ctZ3h8fO+0r/ybaLXAiLhpZ8GA2K482ykdiYPqEwdyH/DRY5RbT3YQOGkKpc4lqOEeJOAk
	0E5mtjWZmVZ6l/Mns52EdKiG/WXDx08apd4AGmNbtVItWZ1AlOsdB3m+vXlXeGYSSjvIp/w3MXM
	oIGf/EB2T2PELn1ZzCaVnwMezRp12iwX6mr9E/prybe0j+L5rkvti3/o86W1nxvs1HPn20J6TRJ
	Dea5sNCBldVjJuyPQ48HDj/cbVepCdbsoXlgx0/ktJ/1o2cgEpAKiwqm848bRjBJMwS3pR8WMXj
	p+Z5KJexZ3sLg/ty/wUiDlpNDC+rgjwFATM+11vK1KHRgHCDQZE3o1T9DRlMQVzzKXDGpiUZVoz
	HriP83IC2TtU4rBpTJLRs0yGykPbfTlTnq2QQTMRy06Vy60N3HyWFXOQFXXGKDdoZ3YW1VSX9P0
	qFZDsaE3anM=
X-Received: by 2002:a05:6512:2308:b0:5b6:1a7c:59cf with SMTP id 2adb3069b0e04-5b61a7c5ae7mr6568860e87.41.1788982896751;
        Wed, 09 Sep 2026 12:41:36 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fea24sm4222799e87.48.2026.09.09.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:41:36 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] intel-speed-select: inherit pkgconfig
Date: Wed,  9 Sep 2026 22:41:26 +0300
Message-ID: <20260909194126.172815-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 19:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129896

do_compile fails with:

  cc1: error: include location "/usr/include/libnl3" is unsafe for
  cross-compilation [-Werror=poison-system-directories]

The kernel tools Makefile gets the libnl flags from pkg-config. The
recipe does not inherit pkgconfig, so there is no PKG_CONFIG_SYSROOT_DIR
and the host pkg-config answers with the host include path.

Drop the manual CFLAGS entry, pkg-config now gives the same path.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-kernel/intel-speed-select/intel-speed-select.bb    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
index 3b5866180d..cecf310189 100644
--- a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
+++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
@@ -6,7 +6,7 @@ for optimized total cost of ownership."
 
 LICENSE = "GPL-2.0-only"
 
-inherit kernelsrc
+inherit kernelsrc pkgconfig
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
@@ -17,7 +17,6 @@ do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 B = "${WORKDIR}/${BPN}-${PV}"
 
-CFLAGS += "-I${STAGING_INCDIR}/libnl3"
 EXTRA_OEMAKE = "-C ${S}/tools/power/x86/intel-speed-select O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.43.0


