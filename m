Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78870C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13595.1785620735876615173
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e2CU2ARy;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1409135a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620735; x=1786225535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3dV+5HCy+MzHADv6mgNGZL6exM6ReNrSG/Ap7e0W5M=;
        b=e2CU2ARybbzz1GiamYE6b/WQfrgqJcNH3L+7obvDDWCfOnLId/1s7s8AFZehaiwkap
         FllA5oJXk5+xI8L1N9c0vgH7iSSSHs79+HDvCevbXZ7Oz03sYEJOc/WK0zfGnuHo1Wu9
         hpTBGlVedBDeiV+ygHFQA/0KOL0duAEouF8qfpI+PK+len4ElH5MPz4mpPBvOnmSQThY
         slEmk5ZjEzlHAJFnFH4UfSWB8vH/YrGt2A/cQWxXChwQ+CKFbybHQzP9pCAfJI41Phyr
         AeEq2PfEUtD21NmBXDaRf9NeVRd2j8zs6XpbeNzS/EwnPtSWvnBRoQtoTSmZ1KW87pTs
         jnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620735; x=1786225535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3dV+5HCy+MzHADv6mgNGZL6exM6ReNrSG/Ap7e0W5M=;
        b=jhTer6nrLYqY5FeNVKmSK+44BKDd7tATcjwWnPr4KREcyd1aisVtQEiViuROTwXmog
         HCLu3c3poJto2J8uMAqD981mZkwedgXl7Wo4uqWjKA9elGwoDTegU2aYlRIWpOPw5K7o
         DlvfSagTwbqwC4iBl56UWv/UoymSw4WVqTRd4zgdoJTpd1LHo4ZV3XFoW0lWdFPNpRj8
         JujnM8bZiKNrXqfeWklgFtZNoKtV3y9HRwzTPJyBrf1zex3m80nyOIvJD96EcpWc+IXt
         TMXenamOZYm9eFMaZdUE3ais6qllzI9mac8Is1+wMNdUORSjiriGr8jfhJnqrGe1Hdzo
         YVBA==
X-Gm-Message-State: AOJu0YyhUqablOcDf/Uqa3z3MAiAgoKAlkclL33fM9M/BkUTO68hKu4W
	NOsvm/nzOBvt0Dx4DzZ/Yxo+hAcXu+7Dw2WqjLU4v/88oSz+7PM42/vX14Cl3JHV
X-Gm-Gg: AR+sD10YccyqKE+r+DbMF9WZeDr0jPcYs16Svvsf4eze45WtAR5FtZMvfdFEvCMFbMg
	0+NBqSahY83wkT60e11ySPc6JX6+o7zok7rttu3MX8As/NUzusEpO6fzaUbRpGnTZlPC9ZHKlGN
	VoMWsJWUU2r+rdpd1qV2AZCx1bb2iPcKC5/7C88bSXoiEOxnYwR/AJanl+M+BtCHhTXF9g8f8mx
	qngPy+p3JZdyzNccxJXzLVxXqHCxorgg5eQpq1KDAcJUBjkKOoksMeq+bjN19PzH1gnF+ytqm3J
	8GLQ5srJBXdzqlunuafJD6P8XIXskbgDaQSUYABAYUb1vxAzaw4aPpk9IE54Qv4jh0vvHdE4/cj
	cxRjCEX7nI9J56np8W1DoFHiUS5mxjWldCnND8kXZwGjZfie6zJ5sDZvrT/m1KQKOxGKvLPIjR2
	EqT1OAJrs+Ll8v0K3q6K+vthtFtx9/ReYp9UzBFgkYYHkFgy7NmggfMZsIZeF6JmBtivBeREgD1
	MgG6mYf7wlhOY8p7qfvs8YlcccnuQ28HCPyneIWkCo67DkLdLeQoSXZfvvghLZS95WGvBt6cZZc
	/5uFKBPgHUGZLxIx53JmhmTNlS3k9/Wm1XtwFR/a/5E1BM2ImwR4ftvZ5tlKfNV/NR7qDOHrayw
	x5A==
X-Received: by 2002:a05:6a21:501:b0:3c3:a969:2cf with SMTP id adf61e73a8af0-3c92a8f5e8cmr5197774637.53.1785620735135;
        Sat, 01 Aug 2026 14:45:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 07/31] libavif: upgrade 1.4.1 -> 1.4.2
Date: Sat,  1 Aug 2026 14:45:02 -0700
Message-ID: <20260801214526.788343-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128624

Upstream changes (CHANGELOG.md, 1.4.2):
 * Require C11 for compilation (public headers remain C99).
 * avifgainmaputil: add --jobs flag for multi-threaded read/write and
   enable auto tiling; use AOM_TUNE_IQ for layered inter-frame encoding.
 * Fix memory leak of altICC on early return; avoid MT loop-restoration
   crash with libaom < 3.13.3; fix decoding of layered images with
   multiple scaled alpha layers; fix NaN bypass of AVIF_CLAMP in gain-map
   tone mapping; fix NULL deref in avifImageCopy().
 * Refreshed bundled dependency pins (aom v3.14.1, libyuv, libpng 1.6.58,
   etc.) - not used here; the recipe fetches libargparse/libyuv at their
   own pinned SRCREVs.

Version-only bump of SRCREV_libavif; sub-source SRCREVs unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libavif/{libavif_1.4.1.bb => libavif_1.4.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libavif/{libavif_1.4.1.bb => libavif_1.4.2.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.2.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
rename to meta-multimedia/recipes-multimedia/libavif/libavif_1.4.2.bb
index c4dde341b8..aa1a7e4cec 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0"
 SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV};name=libavif"
 SRC_URI += "git://github.com/kmurray/libargparse.git;protocol=https;nobranch=1;name=libargparse;subdir=${S}/ext/libargparse"
 SRC_URI += "git://chromium.googlesource.com/libyuv/libyuv;protocol=https;nobranch=1;name=libyuv;subdir=${S}/ext/libyuv"
-SRCREV_libavif = "6543b22b5bc706c53f038a16fe515f921556d9b3"
+SRCREV_libavif = "c5240fc79fe5c2407e10afd35f5505ef6333ea49"
 SRCREV_libargparse = "ee74d1b53bd680748af14e737378de57e2a0a954"
 SRCREV_libyuv = "6067afde563c3946eebd94f146b3824ab7a97a9c"
 SRCREV_FORMAT = "libavif"

