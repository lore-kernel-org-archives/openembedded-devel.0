Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64201CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:58:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11994.1791563540358818647
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EQIfKxBa;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: joel.winarske@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so2914930a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791563540; x=1792168340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A4evgyBA/ks3CKz8B7MyCpviKzQhLrC5FYleF2XzkMw=;
        b=EQIfKxBaJt4pLVeDVoMH/XOah4QJHNUP+dD4SgxF86d5Ns1dy8mnfkBvFk/3Z0BVRS
         3yAmXHJiM9nVVsfNThmn1dZ8mm2tlryOJZfFIfgBSmi0U7Jhp5I90A1XcBL+ONUV1vfS
         Gp3PPM7xQwcyu104olg37gHIIiSwsbb29CVrBXWBZoJ/aB80IeOTJd2W2QwuUbLIMxvz
         o3dh92luLxzXBfJuLV43jD55vzZJ2tPpSJQd9ZCjo+t+e7VHyVeHy1D4/Gu4RYjEVZt4
         vj2KJBkRzlkhez/y2kxAOifdrarnJE8OvClSSVQk3TA265PYJJjyzvBSv4yvmxb/GWXL
         E+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563540; x=1792168340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A4evgyBA/ks3CKz8B7MyCpviKzQhLrC5FYleF2XzkMw=;
        b=GWBcQKMhS5eoLY7u1KAshbkxCXFEYjoIs+F8ksqxHdqJsRyfhIG49MEBfsE9FUJUIn
         kKk2242tC5RzFZrtynwP2cmW6eEWytZ5m7xCvRNdshK5gGtFgRNWTn4oVEABfBKzwBJW
         JvKPCWsxd0RoFxVclxdYzeuqwGrK99AgRH4ko9IO2VFmgOqq2P0EyXzfc+oMKQnjTpjB
         1hPBejRLJqiNx1DD/oerBTD1ibJPRiNdyeRzwGFiJ5zd4tDkvdEmAQxMwcn67Phtiv1O
         Abakr+6jICRD1CUHcmvreWqk1HQ2QZpBmd7/AHYKY1Q40+YrCrMel/bV4MRTeuqBmaXl
         FpEA==
X-Gm-Message-State: AFq9FYLWsNdBUp5cn58JnFHqDLxCgR6notEHpkTTSrOHTS/24JBaRULT
	2fTBtC0lR0rBrTKj1Qp1Im0fj4a9iAnBKowa3f1Feslm5mLd0+nWw/fpuder/G6Y
X-Gm-Gg: AYBFou0hfKP/a9Pa/vTNRl3ROZidYoCj7QZR4nxFjkPM4z/uGj/RALOAFLyp0lJlT97
	GAQ3M1Wv1aUu4V63ddm6gCotAmdYxQnu16Qqs77HZfsAwqA6SsPg6AlYro5jWu/jdZi6sHMg6Rd
	OnqTNIMKoMl1Jpve2lVJD+5x7p8YdQfoFLlt097xSscZHsGJmgtc6+72hKW3JatAM1SfkGf6l07
	9JSCVdzLlsAponIFu0lfwiRM172Sof8xv0Q+4A5ZK23X/T0ok56mDrpq/eDfj5p/4wB3HL8TdUC
	pUngfJqr/wOk01df2Fwk0fofdDPlMgX2r6zcXOi/aiiH+Lxm7wbBKKZ+tcgy7Tdbh9nLlV2om9O
	7lcxmc9WXxl43wfftALz7EMSJnN9+ImFyZC/RBniAws3Xv9GIzfaOKH4FDT/XYi/ORaQZuMcLp5
	sbF6gd31mRanZzpgCoP1n5nXmqUYSs8MtcQ60Ja1sSiE5OsqMeroyMsTAD+p/HrbK3FPeY3ORIp
	ia5HYPNaPsh4Znhz5hVGk7TT2PQow87COmy/BpUOyn/IF5qGQ==
X-Received: by 2002:a17:90b:3145:b0:3a4:bbb9:e912 with SMTP id 98e67ed59e1d1-3ab3ab5a44emr2046449a91.23.1791563539373;
        Fri, 09 Oct 2026 09:32:19 -0700 (PDT)
Received: from air ([2601:602:580:a250:62eb:81a:51d8:6bf6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm4335102a91.0.2026.10.09.09.32.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:32:18 -0700 (PDT)
From: "Joel Winarske" <joel.winarske@gmail.com>
X-Google-Original-From: Joel Winarske <joel.winarske@linux.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] python3-gammu: set PYPI_PACKAGE_SDIST
Date: Fri,  9 Oct 2026 09:32:14 -0700
Message-ID: <20261009163214.3203833-2-joel.winarske@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009163214.3203833-1-joel.winarske@linux.com>
References: <20261009163214.3203833-1-joel.winarske@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 18:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130706

From: Joel Winarske <joel.winarske@gmail.com>

oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name and
derives the sdist name from it by replacing - with _. The sdist here predates
PEP 625 and is still python-gammu-3.2.4.tar.gz, so do_fetch asks for
python_gammu-3.2.4.tar.gz and gets a 404.

PYPI_PACKAGE stays: the project is python-gammu, while BPN derives gammu, so
dropping it would repoint HOMEPAGE, UPSTREAM_CHECK_URI and the SPDX purl at
the wrong project.

Checksum is unaffected, only the URL. Verified against oe-core master with an
empty DL_DIR: do_fetch fails before and succeeds after.

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
index f5e2cc4da1..e9138462a3 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PYPI_PACKAGE = "python-gammu"
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.56.0


