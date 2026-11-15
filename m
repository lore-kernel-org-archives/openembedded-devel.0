Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3890.1794729070311804520
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OXqX7rw/;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1430860eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729070; x=1795333870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3C8DsPYCKdPdfZFlsGRHUnVoij3u97tVU1PylACR+g=;
        b=OXqX7rw/T9mmpZ1ef6FAjuSm4FWSS1GuodasL3fxEpB443tv9WetIu6i/6KZ0s+6Y1
         7gmnE/8BIWo450tr5/zZbGLl6Kx+VPNx7ilvH5I3JpRh0pO2svemwq1rfgPGlkrPQlWD
         M8PtLdh+ocQW217Ne1iNM/QIP3nZEIQ+FHfcQBN4PJHOrCeYy/Lo71I6NsDzwrNydm3D
         3mHWvuvf7h8A6iuDlO0CB+PX1ranI5CTdcm0D3ThFig9+uviZAhRLmLWVYbt8MBVYFUP
         Mdvx/ot+SXWNnr5BE0nLMUKwShH0C5fa4KdPwo0zzFRlqZX0FDvRkySdfPuvq1hwAxaj
         P+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729070; x=1795333870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3C8DsPYCKdPdfZFlsGRHUnVoij3u97tVU1PylACR+g=;
        b=TgoEafN33YHXzNn029f2rOv5Zbezn8tde0LYDau908lGunhMJa73czDCLL9LxM7zfw
         /c1wf6SrM2fpq2QFAKuEbazmiZB9kzVaGpDcMzXax3UtQ4d7ues62bx0U41+A8DU3FZ8
         wLyG/Ku2EgyhCrig3nT4cAIIMIF0PcHtOPbdGyoZ5eaiHwAdgLmA7gaZbKeCP+Jkc7xK
         G/t5fqdDs9i8UbEALt8QmZ3f6F62UmjFLn/bFRKS4MT5n1fqDrlpbGGm4/ajZOSYeDqg
         mDIq8on99lQ1aYn4ss2SJbF97IPdICY7wS1OmPgPzj1ab+FVc5/1X4fHX3puDRkPORHp
         Oj5w==
X-Gm-Message-State: APuU4Z+IsRI2aeyHKO1fVupr84G8izMB8h9fqZT9yL0iTlxChEKol0l7
	8odXgHbUtJuHI+pU1n9w1fV+2NeOHud8M4oUI9ca1SBQ9sXSFx72rZYoBChMURfr
X-Gm-Gg: AYBFou38vSWhyozmqflTM3UAUK1VujpluyTNTsIsPcTDHNLcXw+yexhArszHeLinMWC
	rewDDWLUC1A7th5imjkDzSpWDD+ncmalHelwasHzAhemNYnFDQLQ3XEU5z9pAPERLlg7qeAbSEl
	y++I6aEFOGxvWtnOdrWleKiUcUEqDa0RB0AbJgq6YqsE6y6sC/kRFEOGwmLxSgLkIfdjBx6w6f/
	xtOHPy2HWRoHqRlrczXd/24JSVb6rEW4SecxVuRDu/qQRpLCKFVDsV9rkPtxPJrBlfOdsReDUpb
	96HRB29ZFHhuKyBOMWMM6KpL/LhkM4PN4qcMw4l3Z+Fze3XjgOfbSBqdaduP2DN84Er12H4HySN
	wfc2sK8kHJ4aquXsTnPPscbe3SkCoiYuGvgXPQuDq5r2ZT0BQOIcR0HEIQhKzIA+EesMPjfg9e9
	+IkEMoVw7i6ZT1irS3RZi3POHAdMxcurQ0y8tKaiJduoQPHo3R9AMMqB+Ev+5fTlP8+8iycKBov
	ruyVPzO++hwa3A14mzRnmWpXq289F3iBqqdcro+z2hO+PHv841qKM0bTrBmztuiOPfbR+TSUTJD
	sZBrUESq6WBH5eVTcKqc2UZuk/V+aKSdtP1F6JcEHDe1sbtSDWA92ktsuobEU0WtluK0qNctxGC
	eFgUTaSmnlOZHNMjsqMRacCebroVOFsXdAQyGLOG0blMf2+Lfz330aRIdUyxGEHXPqRWHKa/DiV
	lG0PUfVIN9iHaiAt0eyFvRySBKVM32AnNoRuKFOa3EI5h8OCLXDO5eDHWfMpj4piuecFtD9s6g0
	/S3x8NOb1cwZgdDijQBmhakS4H+qjt1tPGq1CZSj8wB9KBfMmG78TpgneCSjfxXXF1iLoe0s9q2
	lgLsq3w0MN6HUIp87rR6CaLrSw==
X-Received: by 2002:a05:7300:b0aa:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-379655d449fmr7638145eec.12.1794729069623;
        Sat, 14 Nov 2026 23:51:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 67/96] botan: upgrade 3.14.0 -> 3.14.1
Date: Sat, 14 Nov 2026 23:48:45 -0800
Message-ID: <20261115074918.2932593-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132337
Content-Type: text/plain; charset="utf-8"

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-crypto/botan/{botan_3.14.0.bb => botan_3.14.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.14.0.bb => botan_3.14.1.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.14.0.bb b/meta-oe/recipes-crypto/botan/botan_3.14.1.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.14.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.14.1.bb
index 395def2bb4..eec7689a57 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.14.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.14.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "c22d66a08cd3c6dae683bdcb8384beaa9e2cbd75821e19a270047030fbe81ac7"
+SRC_URI[sha256sum] = "5b85cba0f014d344eb8e9919aee0a3bdc31e16acb05816410025be9bee1e0930"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
