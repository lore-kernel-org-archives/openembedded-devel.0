Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D8ECEACCC
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7586.1763151990704422516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GqQ43Odg;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4774f41628bso18393765e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151989; x=1763756789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2481unwdd0uqas1KSpueoP5yqbcwYmDboAp66MVKXIo=;
        b=GqQ43Odg5inSvEqom6aElQi/6F86dY+O2EJ0UDJad21auPnWepQK3hCBwOrKqgnV6F
         rtvddc52Bvw+p3MkVCW9j88g2VKsj0/5ntWs6MgYnRHFIO7v3RnjjiASUKaItMxqyfsD
         TagJy9i9dNdfBuYO3UKTBSlPJbaoAAvxzvkx7kCTm8TMDKW3AU0+ATo4WL2yA0N1zK4g
         65K8+5Z66zgxzgFGaIS3A8EJZTK3FP24Xp3icx6IKSUu/+mu5lt/zdLaV7YxZtwPcN3r
         4GoOEKhdsoH0elk3IJwVa4URI/9clppBYGSHWQeH3lqnrJI4BnWEuMD3FgbYMtQB/ybR
         vKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151989; x=1763756789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2481unwdd0uqas1KSpueoP5yqbcwYmDboAp66MVKXIo=;
        b=XL5myL6Z2R5NKqyLgWLsqSNdOzLLJsIevStUtvziSHha7uBoSBxtXuVvVsWZ4xbELo
         kpCFH3c09oP3O2Tv6V7VDcroFSE3v6Ezo68UDoD1ni3zJi0j1aNbDCoTu1D285k2ZG3h
         ojul3seMEPk/EtbTvsbplx1pzpW9oeF6H/6lw0BJyriJ3zXG/5rf/7rAAzwS1QgpQrM2
         q/BgOM1Hlyp44cipBMTykpfM580tehGMTD3caS3Sv/Ej4Ui8wGKM25jm+coHnWPc/if6
         FvPcVLgr9Kxr7yiPZKqmMSvKKDB1w3GNHoyq8G3NNxnnanY/CjMUdibDYU0BWJpdogif
         wCqw==
X-Gm-Message-State: AOJu0YymJF8PaGx8Q7PgPKChPgTGa046u9/0vRgprYQeuOCtl82R4ZLy
	rLhWVxIAGzBt856vBZUCN2+VSewb1CI91opdITys8vDQlJXb6LydkD9mlI7KpxIe
X-Gm-Gg: ASbGncu7SM6KV1VupAxJDYUe+8FCWiCl/loyqRaSiwjs2B915fqwsRPe98wLb2ciciF
	IYEG9N2nkK7sP9cWJijIdLzFZXk5JVVOzK7h4WZjA9+/33O26dv9inbDqBcfO/nmxVmkAFcOXpR
	Cu13NN1P3N5sYIB199Vpj1wDUtNiSQxNU2ySznpp+L2LpPkwC3fwRptkaeZAivf50jWXX/jtIf1
	RVNY65j4a/pUqlQvRXVeGVaXtqPa6krhsZydTe0qsIYNufS98M73ZvfsioVOoigk2Pfvjn+r50z
	g0aYBnLyRbH90J7r6o+oglbL+eKpp4YoWIx966QEjglIbsaPaDOFNn0dtO5OjEyxADPVeDUw53i
	HLcSi6hVvbqqFPaKxv/3ORAhm8iAJCSEqmkrPO9ATjHMoT/I2Eg2ChNWBR+foJ3nSONVesfGD7w
	==
X-Google-Smtp-Source: AGHT+IGC6WNHW7ouu5uLv6baXBkIrvoT32Rq2Tb8NU0Yn1Gt3BWFspPU5qMeTZfoSicmZxzlG75zNg==
X-Received: by 2002:a05:600c:a406:b0:477:75b4:d2d1 with SMTP id 5b1f17b1804b1-4778bd13e4amr60976185e9.15.1763151988747;
        Fri, 14 Nov 2025 12:26:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/6] libwmf: add proper CVE tag to patch
Date: Fri, 14 Nov 2025 21:26:22 +0100
Message-ID: <20251114202627.656631-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121716

CVE-2009-1364 is already patched, but the patch didn't contain
the necessary tag so the cve-checker didn't pick it up.

This change adds the required tag.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
index 4d2d285641..4436477a32 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
@@ -2,6 +2,8 @@
 http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-useafterfree.patch?view=log
 Resolves: CVE-2009-1364
 
+CVE: CVE-2009-1364
+
 --- libwmf-0.2.8.4/src/extra/gd/gd_clip.c.CVE-2009-1364-im-clip-list	2009-04-24 04:06:44.000000000 -0400
 +++ libwmf-0.2.8.4/src/extra/gd/gd_clip.c	2009-04-24 04:08:30.000000000 -0400
 @@ -70,6 +70,7 @@ void gdClipSetAdd(gdImagePtr im,gdClipRe

