Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8126.1794465753929019162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GjZOXr4H;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso1571176a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465753; x=1795070553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XAXsuSiYGwuYG3OmdpWgtvav2Qu7kHj5a6AX7l6Rvs=;
        b=GjZOXr4HbHjSqtqkN9U/gHWJATVqap5+oagbWUZt7zgxaxK3WPQDy0+iFc6rzEqu5h
         Q6PrQcltF6RwT14rRUxl7zkEzTNMMcaDjTn95Cofyvig8ysmhUmvQ4YJ4Kl3CQVZIAPr
         S45fJhK/pohU47b9rlN6CIbbmtmicaXC5Kog4QPqwmgp2b7Hlh0JiibxH2T5McNxP3LK
         QcNm0B/Z9fK27sTrBJiNuu+2Beus+ZuRaAwu5XG+7ZDawb1CF8LRJQ1Is9UmH/AN2baE
         BGruxJcyUef2nHMyaeh+GN9E/aAu1PpBdA1ZkU1HtBhcXt12t5hJfatGqLx1xs6CoPHM
         pwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465753; x=1795070553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XAXsuSiYGwuYG3OmdpWgtvav2Qu7kHj5a6AX7l6Rvs=;
        b=eejerqArD/Q2q5FaPOzoXzsIZ21cMHfLOFS7q+H6tIygGpVHKZ6uaNWfRG8BCWCOqH
         tOIUAcX+/FEqg+RKjLEIRo+aDgSQ9cR5okHaJ1RaB+Afkgq9NKKP5pFilQ5RhZzb00j3
         n6Wcr99lAYXGYHl7WoceaMsEuOYUvNCZGvvuyOb4tELRkqfTakpMf6yuvKPsTWl63umb
         ScUXVKJkIHW9AndNqZAi9aYajUY71fgAcqw94NS3xLq/Um4xwhZcW0ZMRvAHX2VZUn+H
         pp5req6p+mLgz91Nasy9nrl4iat5uKpA8hRhGCa/3aO7pGeWJYieuROeSJrk99oA19IM
         4bYA==
X-Gm-Message-State: APuU4Z/uQdWXhNQjdltxav5Tx6L3cPz64FBAcD8vSLdWmW9/u/7lS9DV
	HMRqBvMxoI0BPMTvvRZGQIWgmPgeGSFOVsR5khbao1XMcvHsrzmB7e4qsi8lWyZLkRw=
X-Gm-Gg: AYBFou2Q3vQ+w/f4UbPhLqk0zJxOMrBKqtK2k/r/IitrthoikP3ndOnS37tbGoXkdCC
	HXWxfszgslnNsK0NG5Dhke6q5H2Nleb+4WM9ZPrtaOWTOjwggZptg5V/DWA5w//uSIZYyaObRt6
	WgEo1ds5TFxR3alSmgEPpKaWR8XNeo/MbIJ21/4i95rWdJfhzCeg47EKp3tbAO6+x3p7v+5ntJu
	zweStNIa6UekBmejjlFmt3INFySohBi2W/no+t9mfnOwxsL1VUozuc10bHBkY8MkUxmwvyXYwGY
	W8cWNPsXjGFBatSx+uvYA42vSfWBOdCK8dRYx1DoOch/pHb2QeoxPhEPKilznm8tXCDHkxGCn8Z
	DHU9wa3vvmy24GEBYaSr5N8nBor/uVeElGbMa3p8GUqxuKzmqTdLUkh3/MA9fqZqKrfr5b1qFtq
	vUC3TEDKVbf4t3isCHPr6+KvflMTbO6yCKdzL7l9pscAtuZW+vDbLIVCsOBA4QyPn39YDiJtASi
	Y/EiGAQrXO5te/87MfI3p9Fm3JntMg2U9MdZIjLcLWHCoxLW+894saydj+umkdlBO0zfraq1OCP
	65ogOW7taUx7TbpiATsLILUAaMNrllsAYFMHGAnjiqIYoReMZpJZbABUD3ZxeVBuc8ciZJuPhci
	3f/hVul1Bw0nqaoskPR0Q49jVFfkXrNLBRuHS2XSe9+9eMS+Zd7f2ronQLrwBhZ61wNi5X8FbPO
	xROJrBflouZQWIWjTxqzL40qSGqT3MCG3esE13Nwce2qt2Zq9t0obgomnYKOqcLfKTvDeDSPoxp
	VCfsL6rMkFP3nTaLHQCMNN5sWtyKVprVtgTBTciON2N0dqLnlFpF4UV8VuybMgDCzIowHqn0QOM
	p3Jn
X-Received: by 2002:a17:90b:2884:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b182f83739mr4365552a91.64.1794465753081;
        Wed, 11 Nov 2026 22:42:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 04/24] nbdkit: upgrade 1.49.4 -> 1.49.5
Date: Wed, 11 Nov 2026 22:42:04 -0800
Message-ID: <20261112064225.2410019-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132173
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nbdkit/{nbdkit_1.49.4.bb => nbdkit_1.49.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.49.4.bb => nbdkit_1.49.5.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.49.5.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.49.5.bb
index c1d9b18356..4df3d4c6dd 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.49.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "9ac3038efcb2d9be603788bfb7e1b1ba2eb06f57"
+SRCREV = "4915a2cbaffdd74856be52574c22ae3cfd5985c9"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
