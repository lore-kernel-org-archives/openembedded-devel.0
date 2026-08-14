Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A85C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:32 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24548.1786747647777752788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HJVg21F1;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1612178a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747647; x=1787352447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FT4ruppqEAZjlZH4UqTk3WLFcwWlYBa6Eh+HZdcc7g=;
        b=HJVg21F1wTliba0kGS5Fz56KK13FSDUkt6zttxtaagpZnhrAwNFWVR7/XyaXTsy9f8
         am7I4zpLESx6bi4vRJmY5plAA4mcSRiCT75xVDQezEgZ5XJDCT8EONQfJ1Lu1Ibw7uy2
         3uduOZsFSkW8JNmH2BQ9CcnKiefEsmPyjYOTi8cdcDr0bb7p7ckp7yiRE5qQERzCvAPE
         JlhUVQjtByHHeyXgyh8SphTPiXkN1BAUP3Z8BoGx3O0J0qu7n1kqtNFOczeLtbuhto/2
         PHTVvYmh3RDkEGBlRy+uvQlMWBR/CVW1GyAsneVVQVqIZsnTyn2NTkuB/FrtmO0+nM/4
         cRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747647; x=1787352447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FT4ruppqEAZjlZH4UqTk3WLFcwWlYBa6Eh+HZdcc7g=;
        b=m735mlCjdqNBmFou9H+XgbIRMHygLABcl2SYfaLtsPLp5kzVQIMy4tr8Mk3esmC7/H
         NCI+4pkDMeaTCEzUWs1EXXIUx89TS9XyTN7AkqoCNgyagSzufJMmmVjK/7L+EIOOLyrv
         WNM5nUjGw8iMSni1laEW8HYDQJ5to4De+COetgI9ATsDDm0Ax9A4nn329uej8YgU3XBQ
         YVpiqy0scVJaCICnjWGfNUZWRNhG1EFGMw9xFB5S3smJu9dF4Tl2FOgTiGb95pzExkbi
         lP8xdqq3Zkd1yX46RTjOsQCIkQVasSyf53w+gXwNGYeEx3dbG/ODNFfnU4ArNwnd3YX+
         wr3g==
X-Gm-Message-State: AOJu0Yyfb/YltHjAq/BCjyKfDuHp/KclenOUSNBza20r71IrxKMgqcey
	ftyp4A9+kH3N/OW2//owO5F5/I0zfLMC2ATiJHJi80VtKoHGkk/190kmPgHa+qTh
X-Gm-Gg: AR+sD13mKpxLwJI4nW3eDKY8v7RZ5N5CtvZxn2oyW4/365p19CdTZz+Ei3q16l3dI8u
	SouNYJ+4TxHwugWPUeO+L8moxie/nJzCkm1apX2eA/9eOQthKAzMZd41LOKyEykafPJzf6HoR+r
	6jPvbTn5BCbhKT9DEHYet9jEGz9UeuEMtUcvA4I1RO/pV0aZh3IEy8cqslEyi7qYKSAIRC1Jthk
	IV6bbRR21C/ilGaHuC1mYnXlgS3Ny196/5/HC0f9473d0uZqcZN0d2NmYBkiHlfkf1sc8RYbeBh
	z1hSy8mTIAqEKSWO12mpalTRrnsqrSMme+5pWkxTJJPqGtStmTFMsjCQrGIyK67WhgfhqSg5bAa
	llQY7ERR7juY7jlPg+J4pYoWeQnxUWy0VMFNDRrrB76ENGOy+oKYWpnd/bFzbAEk8LYAgIIIJN+
	Q/EOhBMlZgbMlTpJ/kpb+S7Xrvklc4ezzlVDJN3fm4dcdxnAIr6qsY3sXo6qZ77uu4CJ5JiBcuO
	P/KAdtb0HBHIFqzRUip/NwIOKLU003vjeBD0Yz1qh4BwUZcy/oIkbIFyZxQMxOAtO3HMkzWtHuy
	uNsbNAYPBQObQ+G5RmXLrulDAwoqdZfHqocwEnYAuExqO+ajpgEaM8yoHmX2zlEtiNW66U/7kIS
	dHv5KD8Ffj0zaGGsnOTxYdVjjHpPjYA2peyvick7tjZBjaQ==
X-Received: by 2002:a17:90b:2d4d:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-3931f4486d3mr13965432a91.1.1786747647089;
        Fri, 14 Aug 2026 15:47:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 088/109] htpdate: upgrade 1.3.7 -> 2.0.2
Date: Fri, 14 Aug 2026 15:45:14 -0700
Message-ID: <20260814224539.1523174-88-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129152

Upstream's vervest.org tarball archive no longer serves 2.0.x releases
(404) and htpdate's GitHub releases carry no tarball assets, so switch
SRC_URI to fetch via git protocol pinned at the v2.0.2 tag's commit,
consistent with OE's "no unstable GitHub archive tarball" QA policy.

License header block shifted by one line upstream (25-29 instead of
26-30); text and md5 are otherwise unchanged, updated LIC_FILES_CHKSUM
accordingly.

No patches involved. Build-verified with a full cleansstate rebuild.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../htpdate/{htpdate_1.3.7.bb => htpdate_2.0.2.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.7.bb => htpdate_2.0.2.bb} (81%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb b/meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb
similarity index 81%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
rename to meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb
index b6dfab0856..fe10362dd2 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_2.0.2.bb
@@ -11,10 +11,10 @@ DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's
 HOMEPAGE = "https://github.com/twekkel/htpdate"
 BUGTRACKER = "https://github.com/twekkel/htpdate/issues"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
+LIC_FILES_CHKSUM = "file://htpdate.c;beginline=25;endline=29;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
-SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2"
+SRC_URI = "git://github.com/twekkel/htpdate.git;branch=master;protocol=https"
+SRCREV = "c3666d6d107662081339a1a24cab092810d7cd00"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 

