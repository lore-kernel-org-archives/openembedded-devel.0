Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A810C61DA7
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.96463.1674798889474202405
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NYml532w;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id b10so3625190pjo.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPm75PhwJN1SS/fXStfTMg6Rd2ntnkxrbx+9PX7m3xY=;
        b=NYml532wIgVS1cAJpJZam4VDs706+iRzeUbKsbnTOGDw/UqrHz+mroBbqlQTpr/16n
         UeWSYkSS8dgs90w0TVGChwQLWxe4cc/g5c2u0FL6x25F2GwabxqyWMGhN8kDJn/pLKdw
         HAzKF59MV7DNE5jAa4JhZEvSETTGfpNdTKcPotpsqwwIIMzqN93zjqfqWayc+gxkoQfK
         2U2c3ZlsCm1P7lHfEYzEi3uFzw1ntJv89G32zMiWtYFGGsx5iSYTxO4ZxAz5+YTgeF2e
         XLxWf1CO5y4In0/aLh/pw+D+r4f+ZEql0TVj2MWC+1sPbSg5xyIHycmbifAmaVNFiWap
         b84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPm75PhwJN1SS/fXStfTMg6Rd2ntnkxrbx+9PX7m3xY=;
        b=b2DO0vy10YCGE3Fph+dXopmL+sKKK5Zie1H4n9olY9+VCZ4jh6JCmOllR95dMpnM94
         2P3SL8mAbnCDnjfhf+UJyAnIprBeUgNj5fLHCXl0XO0JcWPhI77vcp3x9QqFzFNy2Def
         Jn8Qwt11+id5FmWfgOqeplo5EBg5IIiNa8YFT5b95HEEoZDTL07RoYPcqxR8vi+bKtBm
         NEetc/VidFfdG1Z6Bv5SkAEgfnDEwo8maMT3rdgwne2ym/LAllL1vMr99DaATOWGMTVj
         wL6IxFV6sRs6b3STQNszXqkpoTLGdLoWPkzdEzaE4a6vtiSz9cDsS7TKwTM8eSn9ZOej
         x2bg==
X-Gm-Message-State: AFqh2koI4qvFESx04vBrgPYPQi2CTtNsg+moxSkd/NzXZPMC/xUxU0x3
	agNsXq8xkwxUqubiMbMcgomv9L5K4zr1+w==
X-Google-Smtp-Source: AMrXdXtZv1L5zCKmjnUL6D393Q9iEEDoFOdr2H/HovI34zInLqI/fT/C1ASXZwUbQyiPGiLdHA5ulQ==
X-Received: by 2002:a17:903:1252:b0:194:d9ca:7c56 with SMTP id u18-20020a170903125200b00194d9ca7c56mr33352599plh.58.1674798888555;
        Thu, 26 Jan 2023 21:54:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/10] libinih: Upgrade to version 56
Date: Thu, 26 Jan 2023 21:54:38 -0800
Message-Id: <20230127055440.2108933-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100812

Change SRC_URI to benhoyt fork, it seems to be well maintained.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/inih/libinih_56.bb  | 14 +++++++++++++
 meta-oe/recipes-support/inih/libinih_git.bb | 23 ---------------------
 2 files changed, 14 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-support/inih/libinih_56.bb
 delete mode 100644 meta-oe/recipes-support/inih/libinih_git.bb

diff --git a/meta-oe/recipes-support/inih/libinih_56.bb b/meta-oe/recipes-support/inih/libinih_56.bb
new file mode 100644
index 0000000000..89d68c6e16
--- /dev/null
+++ b/meta-oe/recipes-support/inih/libinih_56.bb
@@ -0,0 +1,14 @@
+SUMMARY = "inih (INI Not Invented Here)"
+DESCRIPTION = "A .INI file parser written in C that was designed to be small and simple."
+HOMEPAGE = "https://github.com/benhoyt/inih"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
+
+SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+SRCREV = "5e1d9e2625842dddb3f9c086a50f22e4f45dfc2b"
+
+inherit meson pkgconfig
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
deleted file mode 100644
index cf390800b9..0000000000
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "C and C++ INI Library"
-HOMEPAGE = "http://code.google.com/p/inih/"
-PV = "0.0+gitr${SRCPV}"
-PKGV = "${GITPKGVTAG}"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
-
-PR = "r3"
-
-# The github repository provides a cmake and pkg-config integration
-SRCREV = "c858aff8c31fa63ef4d1e0176c10e5928cde9a23"
-SRC_URI = "git://github.com/OSSystems/inih.git;branch=master;protocol=https \
-           file://0001-include-install-header-files-without-prefix-dir-inih.patch \
-           "
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-S = "${WORKDIR}/git"
-
-inherit gitpkgv cmake
-
-# We don't have libinih since we only have static libraries
-ALLOW_EMPTY:${PN} = "1"
-- 
2.39.1


