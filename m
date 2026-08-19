Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A660AC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.926.1787117858159740706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ThHr/Ysc;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38deea72eebso748276a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117857; x=1787722657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ma0RsJC7BcGTKILRbEwzCHo6oPV6RHKjrVCqPmwJYQ=;
        b=ThHr/YscirlQ7VQIg35k+AOD1596F6Y3sO86ZA6FJKxrpHoFjH2Xg0QqdfTvH2HRDV
         1yvkmuv+cjS4oRJjMnR4lYHQJwaJruIlhrje5DvMG0D5kEYUclInV5YWKjOeytWrIKeT
         hbv0usLT9cnMlEi3OEW7hMyuU3LzJPEFCHGvvYy2aqB0uvVGidGUU4WWAM6Tzec1KnuF
         k2pfTMacBdP3HKs/AbrpHBWI/ipu2T/83x5AIsl+SSTgD0fS6lKb4Jo4Eru9LcaaxTT9
         hRUrIpgLklRGUCWbMA6NdmvQQ4I8MC1qqOAznBPpCCsNYFbO/+mG2aeODy+5e9KEacg+
         xtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117857; x=1787722657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ma0RsJC7BcGTKILRbEwzCHo6oPV6RHKjrVCqPmwJYQ=;
        b=TQeyWmSq19DmxoHvAF0VqKE4s+SilaiSZjnWyGEqxuxnfrw/piTPUNaOmQ11YfwvyT
         A+NPD58grlpr4Jz0una8g1utlqIE3Sdr02PC6UOCX8zaaq7PsVcbqkS0N70DVyC0truu
         etKterZYSyBGxVYWRZYtK0ab9PnLq/YpqZ5ubv3pttd/ZpeMUELLdOrdTbfHvymqaI0f
         CZFCYeK1OHvyF6BkzomCG+efJfSlBZ6aQn9lC1s70ltaT7tyMV6LjK/Y5Mfg+dXGt37k
         cfvKZlRWt32dpU0pSGaKwEk3Nky1lgRxOghPwFoRNax4W8bTRwSRx9PMzf9Nfb0FPFSo
         06Bw==
X-Gm-Message-State: AOJu0YyjYcpTf732gVuE0CexbJjwvawYSlVNP0v4vTjwVh4sR1Y9UrYl
	kNpjxGP1S8oN1TODR1lPWgntWi4f/svVY68KsKAEwpg3n7GEOIACMVZBiF6ehn0h
X-Gm-Gg: AR+sD10wu1R8Ac/sxwhUMkeaTCYWmiSb7c6YsYFcmFLxjV8+fDpdQsprHmTig1+oKCM
	10tGvPfZO0hhKam13Ej9W8C4lSbuJHykLNfxQcoDcFhKgQT0Lc3MzZYs4JhzB/N3vB72rEgHVi/
	iTQHytjJTOSANQhzP+DHHr0v+5MsICxSkmupO6jmOjZMbYcRqmUaNzF4hM6cA1HGwPmn4rIyzpF
	twvPSI83WMM6KDyiQYi8FTCa4lTITaTSoYg4UHQSsoPXkvFMY4ylOWv8JNJWC5TLaGm8xYH+YA+
	SBrOdsLt5hmpWEaX3tTEKphwM9raHYm/C+USUrKTcuZVgGiDq1zKerxOhjLddy0V/WdOb05VYzL
	HgTEf+iveaeJsotlyK6k18HLlBd2BGK0AXVWNWp/KaFK0nYzJ9tX85QaosresiHs8qgujA0MQUn
	NYqVV9uG2yb8Ec/sj31cKgB/bPGmJg1Nf+WxPaOKNU4ihPBUog9ip7L0XH6GjzSMhMgjBZ1iDel
	IVenvGUv2dp
X-Received: by 2002:a17:90b:280a:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-39580a81304mr4346850a91.2.1787117857486;
        Tue, 18 Aug 2026 22:37:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 24/25] ostree: upgrade 2026.2 -> 2026.3
Date: Wed, 19 Aug 2026 17:36:28 +1200
Message-ID: <20260819053629.391864-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129268

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ostreedev/ostree/releases/tag/v2026.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ostree/{ostree_2026.2.bb => ostree_2026.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2026.2.bb => ostree_2026.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.2.bb b/meta-oe/recipes-extended/ostree/ostree_2026.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2026.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.3.bb
index 69df97f7ef..5e2e9ee078 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.3.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a281f2db631f3721ecd4b9e2779a1eaf56e2d03f2cc47629a9f0117f12016a83"
+SRC_URI[sha256sum] = "e560e47631d1f703e9ed3425e8909ccd87fa2992422c07348ca88ec98943c8fb"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 

