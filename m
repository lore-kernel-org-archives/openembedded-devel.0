Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.5920.1602814931395204658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F/BKqgEM;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id u3so571144pjr.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NBWxbJNC1VdoFNL2BbcPrViAnK/m3CByfjY7pzCw8k=;
        b=F/BKqgEMwFrifUUc+r+JhnGXhsoyieq8Ymed/xKy7fK79NHNIilsIhhr3pvEl1EIZE
         j6wJktoO+Y67Krq5g3ei1XVJvc3pEEWroqWz9ixKoU6h2F99TFeSj0TvDdv4SO/2vyXT
         IJ7KqbNYl57ZeGGSsGLwTfJVn/QxeBBZ8IN2/GBCulPCxNFxCfrsgTM5D93VEgucJQE9
         +h9ve/f35Z4duCBjswZ2kFoanjZNRrS2GFEMH/ZrJ+nvv4LFaflFLDYwPTDcfGJY8iOm
         PaFnFuJMByjwA13PZh/QDf+6dB1o8XOSzUAIdPCSGZwpJERwmG9AoqBXtKLJL2coAWJ7
         Vcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NBWxbJNC1VdoFNL2BbcPrViAnK/m3CByfjY7pzCw8k=;
        b=Btk4vTYSVVkJYv2GXBkOANd3lEXdpzlmoZIpYWfjTNZ4xDhqtviCEpS2bft6tgTsEn
         017HsjLVUUp6HUP9PfJ2+Xj8sQy4VfNC96X9XWb7aQ5fgj3gXzSqC1+XYQ17u951Kq6j
         cPxeez4buLzRkxJDCh2O+rI6FbGW7NAqGiNsX2MWBzOZIw7FktVw9vYU/SAG9Ix7ur0Y
         P5DP1rNZORdV2NPdE4UrsU3SlcC/HI3UuicglKP1OSLXG53evW5WyxsGKhP/wEr+YyBB
         tJlA9a960r4XW+56WnAFiB/QxGVxuguPLkUDhAPbojsZg955GJzQDPgYCvC2SRdEmje5
         eS4A==
X-Gm-Message-State: AOAM533DjwVjfuxKwatXxhDgaTzUjuoZ1vvnVRn33wUG4nJjTf5PoKCO
	30ZCfNBq4u6s62PeM0MFz1s5mxp9rtcPdw==
X-Google-Smtp-Source: ABdhPJxpdjMLUEs582O0AgcP3PLpjAhJLPZlaUdJnWNLx34+KCurB6yOv1ycR8u4Uyx3CShYRnAorQ==
X-Received: by 2002:a17:90a:680b:: with SMTP id p11mr1657476pjj.232.1602814930239;
        Thu, 15 Oct 2020 19:22:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id gi20sm711123pjb.28.2020.10.15.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 19:22:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new license names in LIC_FILES_CHKSUM
Date: Thu, 15 Oct 2020 19:22:05 -0700
Message-Id: <20201016022206.489864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb | 4 ++--
 meta-networking/recipes-support/arptables/arptables_git.bb  | 2 +-
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index b5085c913b..cfbb113c7f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -3,8 +3,8 @@ SECTION = "console/network"
 
 LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
-                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 "
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-only;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 SAMBA_MIRROR = "http://samba.org/samba/ftp"
 MIRRORS += "\
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index c02a19944d..5afec7663a 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
 PV = "0.0.5+git${SRCPV}"
 
diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index f42223b1f8..a2f0ccc069 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -4,7 +4,7 @@ security or integrity checking, no throttling, no features, except \
 one: you don't have to type the coordinates of your peer."
 HOMEPAGE = "http://www.fefe.de/ncp"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
 SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
-- 
2.28.0

