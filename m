Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AADC624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:48:18 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3011.1788374896367613709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iGc9hepY;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1673641a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788374896; x=1788979696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/2OJRhyi6EBfHij83tGUErw3adoigsw3GY8mrUQWp8=;
        b=iGc9hepYJWon7DeaF3zBSGte0jzRoa815u+zkY0L/CoG/lVYLObPAK83/5d63pBlZh
         hkbVKIv9RTJBaqOpArUCehdwPFDvcWPk4mLX5LmneOCW4CPX8/EoTe0DEVXLJrLWvV6d
         Hxh8lNjDBS3/VObIpp1S62cvKXFJp/cZ8MGEev7LXshSDl1707Nb5V36atPU6ML69++C
         bOxX6HLWaJG7y8V0B1H1Q/xB/ecGCXIY7J0gD5pzT6+HBcfeNhOVHLNW52HvXfvBclI6
         RcbO8poG3SH+9U8jv2nm4kuOCTp7U1j6gI21sIsHrZg3ZYdEzgBdwwCc+fEK4AqmG3Xp
         VFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374896; x=1788979696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/2OJRhyi6EBfHij83tGUErw3adoigsw3GY8mrUQWp8=;
        b=BcakjHO5LPgNNX3Javz145oWEP0NarrkLLyN9SFgo9bdYkfAZL51ak3/kwl1D3NWnm
         x9AA5ppkhMMzcA7AIqGQB9bav5qKOAstEEFCCx5uyNibGN6DlwtCScvFfXsPy2yOOEyQ
         Ov5wObVMtlPs4DJ/AhxeJL8D5bBM4REcaxhMkhbPSCq+/hGCniLSeWHAx17ajFWyempf
         zM9jTUoGVxcKUIBgKrkVZFoQJemwIQo3UP/V2Pl/mm5fb2SBNRzauutMEODYyx8q7Uki
         QpvxG7F3mpec5qtvw5LzYeCh6hUhQdbtARJoleG2GeGMAZ16irFUntPWO34FnZC8B5PZ
         lm7Q==
X-Gm-Message-State: AFuF++nl/z+fBasnxyHtM9AVPRlfPSyo1rDVCZye6h0RHWTGNO2n9SeK
	fJDGOGASD7hEFR1HalnzqGf5L8bASLNP4ENTODFfqjJS6vI02gfBW4kh2QoayDi0
X-Gm-Gg: AYBFou3pQ8bC/36585U3WAqxZZH8I8u08gy0K956ad17umjxUgn41M05CZ7s+ZdXU/c
	hfY1Jn9MVv6KtmJGf4bouulhTh+vQEAEcELUufJfOAuRpjXQZPwZkTsRPGvCe81iEAHkMmYZQ2v
	L1seBtvnKyUGoiTUiuMzaJDrJ1o4+vrmR3KK4NCZgiDWoe9LUUp7fWPuGrW/nBrE3fvDFlIAnYQ
	BIP3hQTWApL5Zfw4JKs4xVceTr1xrCollXCmJJgT1ujszz+XoPZzVYWJv0AKS5YoGX6X73dEC8Q
	Eafszm6skFBGxDfv0I3Mbq7Z5Ba0l/icpXMFUc4UmnqASr7TOBiWNp41AfSZxsyGF+ngMOAROZf
	fzMN3j8AVW7kscvfQvkO5ltvfRdZ1n8qeMp5vSbpW2ub7aINJaHp8zol6AMpI0RSqd64Lxe8vFn
	PbIJcTUhinoXsRcF7t36sspTjgUDhdchnql1nqxBql+/+Gn4gTuIj9ZjNM9nAMNLts/WDSceq/t
	9SqYYGn0ORvyufd2kJzZwgOK8x3PReM/NdTcSG+Td1re983ZyYvFabh3QbuaYWWguZVYcafywh2
	xZpekXquReQT+utxsMTyC5mYSteTSxkocvGbBEtytyTPLVdLzdX1bMrMWNU2CAV5Y7HIDGj8hFC
	gen0F+ClLtIBlKuSdx0YkQFZgBgfUgwVzn2SItnntUND7A30=
X-Received: by 2002:a17:90b:524c:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr10608807a91.7.1788374892899;
        Wed, 02 Sep 2026 11:48:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm228567eec.0.2026.09.02.11.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:48:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] ldns: Disable GOST support
Date: Wed,  2 Sep 2026 11:48:09 -0700
Message-ID: <20260902184809.473100-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 18:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129700

ldns implements GOST exclusively through the OpenSSL ENGINE API, which was
removed in OpenSSL 4.0

Causes

  ./keys.c:664:5: error: use of undeclared identifier 'ldns_key_new_frm_fp_gost_l'
    664 |                                 ldns_key_new_frm_fp_gost_l(fp, line_nr));
        |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

USE_GOST gets defined because configure probes for a
working GOST engine using AC_RUN_IFELSE, which cannot run when cross
compiling and therefore falls back to "maybe", which is treated as success.

Pass --disable-gost since the feature cannot work at all without ENGINE
support.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
index 6e50cc2b1e..d7a4e31422 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
@@ -15,7 +15,7 @@ inherit autotools-brokensep
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[drill] = "--with-drill,--without-drill"

-EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR}"
+EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR} --disable-gost"

 do_install:append() {
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \

