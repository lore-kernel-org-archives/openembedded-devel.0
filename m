Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BCDF013E0
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:49:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46152.1773650942831999290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YANbQh8e;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c739561f0d3so2678640a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650942; x=1774255742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRb21PRXqmQJnP4Vv8mkBQnR7snl/RMyYg4h7AmsI48=;
        b=YANbQh8e3EpawHJcIEq3iHkzMeOvL65WRAG7L8e6cTafI52btJNeKVd/xLgPR5c1Ej
         I4uy0sZeFo/gDBCsnjcUj/eo1EgGVY/bfZcfHfAyqyHZ8rSgS410awPM4ES/JgrVkM8g
         SZmUsTX9MK1hQkhHlfaLEySsb73Gp/LwPDJanwVXpv6EfIdeET/hmGDIOI3rgTcscEFW
         GdyBX7qUbMvOfomiTpHQ/biKTDUEn2rAdVeQ+TnPN43IjhplNY63K+PN692unuR4bW4A
         tvGdhkPQl5ZVcu7hAVtMPh2zcw6FRZpAZoNAWC8O7qiJqQB9VqgVt2PlRFmcDu9xweMk
         n+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650942; x=1774255742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRb21PRXqmQJnP4Vv8mkBQnR7snl/RMyYg4h7AmsI48=;
        b=pp8srMZOYLVz1IpEijMSt7n1sUqpn0UZTpP6HD6erAaE/g45GeCMsFMx02T1s8ZKvq
         muGMDBUIrJ+D7L3MnJfLye3FdSTk3qzF3yuXlwe09RtTyNpCsgIBuJOXDp3R2t7bQmlI
         uEMRc/tYDU25p1AHlprG/XSo0YAF/h0RC+JcirfFTRbTrGSjop0ebObqsQOWc6OLfnj6
         UOfyVku5FFojacVq6TaVdk59fbqxPVd0lwXgxpthdi7CwGvYnZRbqnnGB4qyp2mBgwGP
         RbWxfodDD10WX5YDuinIGTBOfg76fybUEGe/GWBTsWkRdNDX85CWyg6eYcU9zNnfRttr
         iBhw==
X-Gm-Message-State: AOJu0YwgTdVrnSHcDfBaHoK970yJKPDrfh7PvhrgS17HePw4f7nbUI4G
	yp9MuOYo5x7RkU5P70dHZb8ddkfraMjBvc+akMUUnlv0bTmadMgxj7A1tE/Afw==
X-Gm-Gg: ATEYQzw8ij/Y3eJcLl28iwGK4ZZLwNmNCv5sTnSVme6SQKoheZ5zDNobIvoy90KKXCF
	UU8PXr7hl0pobIrz9zwXxHVJaQJEEvHnt2bBMlQWxmyFO7MAu97LPdoWf81a9vEk8RNyKhKds4U
	xTlItdvonIJoE7MRUYxP8GLGqoOa5mHV2ocTypxkcyLJ8OFHtPyMgJ5LCwoOBcg9SUtQvwmwtFG
	n00ryPq+78Q+ascpUlc602gupmRuo5GTSqsyNhY9Yccfzdo3/fgnfCfte22daNfjf6JX/xziIm3
	WX/kvtAd8pxgvDVuk/KVIofs7zUxVKBjjD7eT9zRye9PYAB6pfXdwrJexsHrDHjZ7BuIEqx6ghQ
	H3p+ONI8O822I/5NBLrpH47/ID4cml4M4v+rsE8pjIkuQNjXoxwgvaDtaaynFtXHQsi4EGPLT2Y
	rkW+yi+a32aWeJi0iHLfXoRyVQBBRdOg==
X-Received: by 2002:a17:903:3806:b0:2ae:506e:471b with SMTP id d9443c01a7336-2aecab1f442mr133800085ad.32.1773650941865;
        Mon, 16 Mar 2026 01:49:01 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.47.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee4a1sm129790295ad.54.2026.03.16.01.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:49:01 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [meta-oe][scarthgap][PATCH] openjpeg: patch CVE-2023-39327
Date: Mon, 16 Mar 2026 14:17:33 +0530
Message-Id: <20260316084733.1381408-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125264

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39327

Take the patch that is used by OpenSUSE to mitigate this vulnerability.
Upstream seems to be unresponsive to this issue.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit fdddf2bdd3dea0ac53effbae904b4dcf0e8adf45)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../openjpeg/openjpeg/CVE-2023-39327.patch    | 51 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.4.bb                |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
new file mode 100644
index 0000000000..97296c1554
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
@@ -0,0 +1,51 @@
+From a3504b2484cf7443c547037511c40f59aff8ae5a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 23 Feb 2026 17:22:18 +0100
+Subject: [PATCH] CVE-2023-39327
+
+This patch fixes CVE-2023-39327.
+
+This patch comes from OpenSuse:
+https://build.opensuse.org/projects/openSUSE:Factory/packages/openjpeg2/files/openjpeg2-cve-2023-39327-limit-iterations.patch
+
+Upstream seems to unresponsive to this vulnerability.
+
+CVE: CVE-2023-39327
+Upstream-Status: Inactive-Upstream [inactive, when it comes to CVEs]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/openjp2/t2.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/src/lib/openjp2/t2.c b/src/lib/openjp2/t2.c
+index 4e8cf601..ad39cd74 100644
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -441,6 +441,8 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+          * and no l_img_comp->resno_decoded are computed
+          */
+         OPJ_BOOL* first_pass_failed = NULL;
++        OPJ_UINT32 l_packet_count = 0;
++        OPJ_UINT32 l_max_packets = 100000;
+ 
+         if (l_current_pi->poc.prg == OPJ_PROG_UNKNOWN) {
+             /* TODO ADE : add an error */
+@@ -457,6 +459,17 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+ 
+         while (opj_pi_next(l_current_pi)) {
+             OPJ_BOOL skip_packet = OPJ_FALSE;
++            
++            /* CVE-2023-39327: Check for excessive packet iterations */
++            if (++l_packet_count > l_max_packets) {
++                opj_event_msg(p_manager, EVT_ERROR,
++                              "Excessive packet iterations detected (>%u). Possible malformed stream.\n",
++                              l_max_packets);
++                opj_pi_destroy(l_pi, l_nb_pocs);
++                opj_free(first_pass_failed);
++                return OPJ_FALSE;
++            }
++            
+             JAS_FPRINTF(stderr,
+                         "packet offset=00000166 prg=%d cmptno=%02d rlvlno=%02d prcno=%03d lyrno=%02d\n\n",
+                         l_current_pi->poc.prg1, l_current_pi->compno, l_current_pi->resno,
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 945abbcc35..d559cc9f7a 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2023-39327.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 S = "${WORKDIR}/git"
-- 
2.34.1


