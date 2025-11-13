Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E583ACCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17733.1763014871035661111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeBvFzYU;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b4933bc4bbso414097b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014870; x=1763619670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7yMDSV8DEwR+1Mg4MgFnOZgAYO+TaPLrkMxiRVcyFQ=;
        b=jeBvFzYU8/QPiGoaAisrA1QxEczwqzNm79rqyMNENzV4y93MDat+HDBJXfrlNfMo2R
         h1P0F0d7wQ9k7ZTwYsKCdww6JU13Fg2Ms155zZTnC86oBskP4Cnq4n1PMZzfggfE0105
         3nnMxNOLlIivUxerCkjpowgd7ix2L790IONea2JPoB/JLW5dlGkrzcfTFtosdSraKZEb
         9ejc6zIMBMFhv/9lkEVNYSy8F4VARPQbX+g39rmfykXk1fyRSiJaVXesAR+WNW8o7SyO
         aOLw5gH0vY8InvcyeNP8LgQ2YQD/9nwemnCabrke6Wbv9qt5Z1JXe4yyMTFuZ/dENoFB
         waHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014870; x=1763619670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7yMDSV8DEwR+1Mg4MgFnOZgAYO+TaPLrkMxiRVcyFQ=;
        b=DuyjkLO1hdbEGZEF1wJAA8UCq8kH8Y4cYAzz6kRtntZrtg8Ju88iuyj84oUQZCxcSh
         8+T+1qfd+/NjvbjEyAXeoVOiXhQ79rrSNjujn8Ul+h6omf5NVYBd090IkeR2BuwFocQY
         UpzspB8f8KoGNfdHgTPcav8BmSqbb0VctpI0VLHfKPYzfvIcANB7nVl3hMEV6JEgwhgL
         46Sux5bbWap/HqZyz8SEMzyaAx0Rvht0ke0G7oLQLP8sUElBi1ioFNQPK+NdOY9D+ZNg
         P9EYeL2lnGlXaLylb6nxda8oEjAky13m6G3EWVljDtms6wy2bMRkTU866e1b4808Mk0W
         /QWg==
X-Gm-Message-State: AOJu0YzTIDOFpslgfhStqO5cZeQgj7St3UXVdLqVTdHYirw1dEUZo02D
	dy7Ega0PJ9zxPjjB9T4mCtw/1GStGea0bRzadiZbRl+GgJuQNkjFQ1yjvTD7qA==
X-Gm-Gg: ASbGncs1OYNGuV+W/Zskzv5XlJDmsoMUhiA6xtfSMbc+uHbRRZWPcMc3XjblsKrFtpt
	TLd29xQu5OdYqOUxXFRuwRxMU4BKGmCp3BWEwYZ1zLkeCkL1QJZuV9AlckPqTEf6nnXD/ZjVlfi
	9RSwSyndk2+rXfcjbxj3oU3gy+eSUTAMqlMfllc+FYQEc78iRKELIsxSTm2CHRqaQUnYr2I4wpy
	aUOnW5ZXeOCGFpgyeITGX8P76/iZDSijCV3EuOzUcES7iP5HMZdPLPaA2sdKTGBf9PxTSjNgDaQ
	Dk3N9aDFcNkqzzezm6/MfUsjxdtdl0PSP8ohWLeCdRb+AlXfgUdTtzh7p6KGgCBA0BKHisPE89t
	NywZH+Z9X/AUF3gwBY/C5B2z/luj2DPnrIdnch87Uv1pNzs04QVw0M1DJeVn1Uwvx7LprW/5YgK
	5quXfwDHs2i70kDA==
X-Google-Smtp-Source: AGHT+IHdUU+7E7Ee+q+6JO7GsGK8GVVyMroDALmp7l55Ue+mImymGa+oy+dtz52bxT80SJCjoN73gw==
X-Received: by 2002:a05:6a00:2f96:b0:7a1:6124:c470 with SMTP id d2e1a72fcca58-7b8e05d7577mr2031537b3a.8.1763014870324;
        Wed, 12 Nov 2025 22:21:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 35/38] cryptsetup: upgrade 2.7.2 -> 2.7.3
Date: Thu, 13 Nov 2025 19:19:10 +1300
Message-ID: <20251113061914.3756301-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121633

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Do not allow formatting LUKS2 with Opal SED (hardware encryption)
* Fixes to wiping LUKS2 headers after Opal locking area erase.
* Mention the need for possible PSID revert before Opal format for some
  drives (man page).
* Fix Bitlocker-compatible code to ignore newly seen metadata entries.
* Fix interactive query retry if LUKS2 unbound keyslot is present.
* Detect unsupported zoned devices for LUKS header devices.
* Allow "capi" cipher format for benchmark command and fix parsing
  of plain IV in "capi" format.
* Add support for HCTR2 encryption mode.
* Source code now uses SPDX license identifiers instead of full
  license preambles.
* Fix missing includes for cryptographic backend that could cause
  compilation errors for some systems.
* Fix tests to work correctly in FIPS mode with recent OpenSSL 3.2.
* Fix various (mostly false positive) issues detected by Coverity.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7916a5c55a2dee58f062197c45d7e50a8960e471)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.7.2.bb => cryptsetup_2.7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.2.bb => cryptsetup_2.7.3.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
index 504c718b96..7c83fec439 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "219ebf74e8eddf96624a0376477e5a6f8f350a67aaf36e7dadb114d94b3afef4"
+SRC_URI[sha256sum] = "b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456"
 
 inherit autotools gettext pkgconfig
 

