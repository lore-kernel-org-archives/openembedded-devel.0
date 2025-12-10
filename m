Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF2D3E761
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2052.1765388957397415006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmjph4Q7;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so59719b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388957; x=1765993757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGbtXduQzsqGtsHsUfy9NXGvEJFcLS/sAKFEEDKa5T0=;
        b=mmjph4Q70t601ZiLimDXFIuMAu2jNVtRBl7XIdQW+0wE9yyaKfQOgeIR5E7WXDHX+G
         8JXiEgAXQz8RVVvr/oRGAThCT5z7iHku9Ze65oS538/nJPIu/g1NeSc559ibC7xEslLs
         qysaqKK42+V3R4/VSgYCbUOtbANw8IC8mf8ThMTlyafdYTsRsIf0Z/BmKGSdlh5V0F62
         mSyr2Cef40uI5rVfJmlLonSg1S9RvapnaamhlTeBo0VnLE6yng0ka7Y4mwgk6/rJ8MPm
         J5eQjJfnYCveF4P3xSjYGFQKbwLvu3n0orewG5jcnoOn3f/1zj74W6kqyqflw2+RdOKD
         em3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388957; x=1765993757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EGbtXduQzsqGtsHsUfy9NXGvEJFcLS/sAKFEEDKa5T0=;
        b=pAiMsUy5YO4WCdBa5e4A+QitkALkZ68/cnbPjHacepb/ycSmQsLp6v/1t33Rn18qJI
         p6UZuWJrJGkmYozndJg2KClHvtJKhu1ORoBQ4EtrkNoVnEv/+GXQH8PA8OSMGCeK6JKb
         B9oxdzduRkszPC/taedioXGpr0cuO3/BwkK9bGNQ9NOKcV+G8ehx6b/g8oQUnHmQdjYs
         HW6fAqAO5G24R4r8h3OCiDpai+ShCwT8xLxU1jUCkRkQ3UNBCCLvVCuny9goWzW2CSM8
         oW+V8rUc6z88P2W/iCFfMa4oQWjP0aDKaHSz36dgP3OVrVff9k0bsIfG6tqyX4jkG+BZ
         t3ig==
X-Gm-Message-State: AOJu0YwTGBrgSWHqoxqGiBUQJSNQJobZX/RaojQa3dBKxF6ig2AVbP3N
	JuVrg2w8xXIErTRBkbjTknq6jnXsm0AEiX11YN2jEWZpmdPYUT2L7CxIqqPLDPsr
X-Gm-Gg: ASbGncu1t3L8IiBg4A5FWlqWI5iN2ZlcAOV4I5SN946ky4x/m3h5xN6vxJhGKNtr5hX
	iXMVc3D8vMxKc53nMSXGvqf6qIb1rFHiqtXdt9KNr1pP4sWNfiJtX3Fve80aT0UoVDpx7rpkTo6
	rkbrFGA1o8kvhycojSp3AdxctyGR2IinpwAMLOUVvwLBDifcr3wfX7qbhKoLJyAecMei1iolOc0
	iQW+hh7ObckC49TU/obbxNeM2d/54Wwqde2/vPIodEcmkwEqeaeB8mtlQCxsCgdwRcDIm1NWxGC
	smh9kahiUA2rNqBesyG2b6pxftyFXsEwfsw3ZEJrQ2vEjktVJfevp0Qev8dy11kNTXxotPNBBnJ
	OuyLGaEPvNNLaTdBDuB1sPgOH+IVbBoqriOsk7tntXlbNqhEub7/1RFFDv5xh2PprybNkjTxkIE
	cFuZ6x9iFix6SU8T1OgFfcezw=
X-Google-Smtp-Source: AGHT+IGxDnvle+RZTW/fYrmMHTLQmQRQ2WFPdYn/7sMzeEC8Hh120ySnLXZhDfPSMe58fZ5ISoU5MA==
X-Received: by 2002:a05:6a20:7351:b0:366:14ac:8c73 with SMTP id adf61e73a8af0-366e288995cmr3174377637.73.1765388956570;
        Wed, 10 Dec 2025 09:49:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 07/10] libcoap: upgrade 4.3.5 -> 4.3.5a
Date: Wed, 10 Dec 2025 23:18:44 +0530
Message-ID: <20251210174847.2828731-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122573

From: Peter Marko <peter.marko@siemens.com>

Changelog [1]:
  * Fixes the following CVEs
    CVE-2025-59391
    CVE-2025-65494
    CVE-2025-65495
    CVE-2025-65496
    CVE-2025-65497
    CVE-2025-65498
    CVE-2025-65499
    CVE-2025-65500
    CVE-2025-65501
  * CVE-2025-50518 not fixed as user application error.
  * Support for Mbed TLS 3.6.3.
  * Support for RIOT update changes.
  * Fixes for later CI environment builds.
  * Critical reported bugs fixed.

Add tag to SRC_URI for hash verification.

License-Update: copyright years refreshed [2]

[1] https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog
[2] https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe7246699

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a9cc44a92a1fb817d68de3190219626dcf96d2d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcoap/{libcoap_4.3.5.bb => libcoap_4.3.5a.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb => libcoap_4.3.5a.bb} (90%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
similarity index 90%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index a4e5f5ca46..55c5ed8775 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE = "https://libcoap.net/"
 
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9aa68c0f6785376aa8ec7f4f1aa6ae3c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"
 
-SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "7cf7465b784baded4de183290c547d582becfd28"
+SRCREV = "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
 
 
 inherit autotools manpages pkgconfig ptest

