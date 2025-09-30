Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D21CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:29 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.21078.1759223967330081596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ml1DWEHw;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-4258bd8c19bso49549055ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223966; x=1759828766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/s3f0Mhx42BRvDSBwdLTLTfySYlqH5PjlhdVE9Woko=;
        b=Ml1DWEHwyfpqAonjX9s5sX4L1FetHvJVzr9DI7uVuQXjXC8RpCwJSJzq7pZo5y0tIT
         Zl/XkzCRwLwLkeY5oHHiolR8Dk/56egiY9svCfUcgXgA1S5O3Gi/hHB4sLgVkgUL0feK
         +Q4ukh6tES9moNVLE8SjavTavTyEyeFYSTFPwkpOxWCDjU8T/kk7Uia9KD1xQB9R188H
         HUxRdbSc0ycVS/rFBXuyb2RjmP9zgowCF5ErhmmRVLVA+XgcFaNAWK3EkBDZEXW/xHdt
         XPLIDAbnqMhgojC1pJ2D+feRJAu2UR6wWsmK0nDOYk1h/hSavdJG74os8/pFTGwLVsu7
         aG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223966; x=1759828766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/s3f0Mhx42BRvDSBwdLTLTfySYlqH5PjlhdVE9Woko=;
        b=YJtBXvtfMWf3xo92UrXe+XzszYjHAG6G7k00kB9haFBXIBKmwjyDwB9+qInukrdYXL
         5sEK1PeCrLJIYwuOSAD00qPL3D4wQD6LCeuy0kmZrMIM5LYRH4DDMvzAN4ZU6gvVOo4X
         tx0qAGC9HzWPD6OcaRB35jJW5TLk7cIJ0Z/3t3Kk3pFWXBIErvhA0t59GLd4aiIlSnjA
         V5U0YqLVgxMn7l0NLQT94OifBVMPSFR75w36DoGVX1KTpC+Y/1Yw8nAcOGcyjA+Wnpqt
         gTmJJsl1/V//fMM+kdsm2Pba+ghAsOqTY13PFcqeWezAAEjK228KXdbNrqmRHFC45nEG
         4tyg==
X-Gm-Message-State: AOJu0Yz/AGT5huqu9hsQXo4ISuDfxWKfW9e9uPA7u9I/00rNAQ+SNLAt
	YPI+N5YBZ/oa+jo9JT73ulBvnFR0Gydbi4LlafgZQ1AuBP4BGxIqd0zSq3pcV0h4
X-Gm-Gg: ASbGnctWHwWKQUHCka12cZOfQi2m7jsODxYiSk9BDFOD4KFiYzsBUoPg+ljiP/uqHB4
	+EQlhm/19uyIM3fLoaDkdexPR2BBd1IJrHjqNn8wOrkOBZT4NxLkPcbBPDYMMN14teLm/DIBDYS
	1UpPcadyWXl7UQ9MbbfDTqleeipAqgj7CRxnkilBaAqCcMwSBdaC2+I8d0b0xgNZIGsNA2rRksP
	T+XKHCCI/sqyc3OWEgXkEEXzony3LDu74LD21ur04HTU5GVsg9T/K0qGDjTLSqOtd2Zbgr7wyUC
	ToVl6Vl2sxIAoBeC1vDGSKL5zz2iJ+6R2JJpR/pMYympbxNpSS41zrCr+fDv0vDV2v6LPk2MuQ/
	xkGhCn8TVhwj7+tHEj4uONl9wKgllerMCd+nfvP8V++6prYJ5FOw4We/rThVxUARHAyQ6Cka+nU
	q8jVDtZ7dd0A==
X-Google-Smtp-Source: AGHT+IHstoMcy5fcnSpQAsEo12J+b/zcd8rHgvDYDnXxHlvWjriLH58JyaoetI1RFFkR/W2evum/3w==
X-Received: by 2002:a05:6e02:16cb:b0:426:a72f:1c7a with SMTP id e9e14a558f8ab-426a72f1cfbmr260408955ab.28.1759223966330;
        Tue, 30 Sep 2025 02:19:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 15/22] nmap: set UPSTREAM_CHECK_REGEX
Date: Tue, 30 Sep 2025 22:18:34 +1300
Message-ID: <20250930091841.1693131-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120067

From: Yi Zhao <yi.zhao@windriver.com>

Set UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the fix:
$ devtool latest-version nmap
INFO: Current version: 7.95
INFO: Latest version: 7.95-1

After the fix:
$ devtool latest-version nmap
INFO: Current version: 7.95
INFO: Latest version: 7.95

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 12e69dd55590bc5c44fcc30e3c68369723e56506)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.95.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index f3775f24b0..c410751595 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -14,6 +14,9 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
+
+UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit autotools-brokensep pkgconfig python3native
 
 PACKAGECONFIG ?= "pcre ncat nping pcap"

