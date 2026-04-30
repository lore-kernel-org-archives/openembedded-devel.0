Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FB5CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18379.1777549653982192246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TeRB/aUm;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so514211a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549653; x=1778154453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsnh34/O8iXsO7jx+gu6xmuQ/i6KN095JvJSmE1b7no=;
        b=TeRB/aUmJ0E13eZsq9qFluE92FKYDuBzf0djEDyBzJ8E3olaCJKjEEEKBCoZEV1TMa
         exG/d26DDn4TJEoGqzSlrbzqjdT0mIpEujl9oBfoVkBU5LMGgEJ3hBLr7rgUK0PCC1K6
         nvo+w+cJHokIPnyTNjLs+LRzkyrandkOwra3GTRFSKQJ586FL6HSfpyMH+HofN1udWws
         y2xM8o10fmJF1Yay8kHCARndEMuSoXFgjOfUPvfKNQgxRFw2/UoFAJYJuCD+xfWE+ty2
         nf1aIYLYtQBCe7LXbwBXq8vbEh3yh58rcWcborpM1i6IVU5eyLDFivmqDgBUWY4Vgrab
         48Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549653; x=1778154453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nsnh34/O8iXsO7jx+gu6xmuQ/i6KN095JvJSmE1b7no=;
        b=qPA9MpqmYHc8DiZToPO5dopaA3noe1XHbrl0KHXCvSSGQzm4Uv3zC1xlvrQcksIWgd
         N/uVrQoUv+AvRqqZQXCnOPNBT0bBVZEmkyRvdDlL62ZSHNiHEQEc628gpQLCuLJUg47D
         Mos8XspqKQ+JwXq5Gt72NH+7S8UrF+XzqE4HnolxeVqQlPy+NhlFLfBD30/KTKIyjIec
         1wJkNqMtH/veYCArHDHWmScl5P5GgQRDL8rOVMiD1qsZVlx3wSesAlzJqJQb9O8lVnPQ
         5Yi7mT6l+Hp8H5oT0z9eTVbSuIFKubR3Uv5fplUJmeJ6gGU1AorgbKMiQhFAOWmqk7ay
         sdyw==
X-Gm-Message-State: AOJu0YwEuIXXXwraccWiCjmk1a2RPPseK0JZm7uqlWB2cWrocrBjWCjT
	SRCT39hGifLyi0YB+F0gRI37/JIczXcWBDwgflsp+OWr9nybYAjchSbWkulstU9/
X-Gm-Gg: AeBDiev12qaXUtoZRggX5fooUBohoH2sEyxCPK99hnA4v+/kHUKEmU/yZi5izR1mSVj
	OtIvF2FdtGivQ+22+Gq78kwpoiXdEsczdNq3herBnh+tFR37BmJRYCyjJ6Lx8/K2g+qZbMJlQiJ
	K0Fnfq8JJOHc1JxNme7t1faUv38Gi7saZCYf61wROacCb3VHKklxqJ+P9rg16cIxdxopbXkBZm6
	4Ql7/B4CyRBZXNcDY5gMGfV/csmWTU8Gb5n/tZdAaiTyN1eNsx/RuVX48CrxjlyU2giUNQhZt2r
	/p1FBg3KRf5xXOMIox+ulw00a3r9PinkLXmfOQM3E0k6Fq+KKlvM3ifeapftKAs1Awu/PiZtlax
	Bv8+Zfv+1oR0KquUPDPHEM8SW9lrybJZ75CC3P5W/bta0PQBgc3IVEmkKl7sogH2Z5z3YsfNjSM
	DQpmvnjgXSdjtSEDnvtEBmWAGIYvM0IDQrhMvOICvMjLr/DAQ=
X-Received: by 2002:a17:90a:e7d0:b0:35e:30bc:804d with SMTP id 98e67ed59e1d1-364c30f0a98mr2637490a91.15.1777549653237;
        Thu, 30 Apr 2026 04:47:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 12/24] python3-tzdata: upgrade 2025.3 -> 2026.1
Date: Thu, 30 Apr 2026 23:46:35 +1200
Message-ID: <20260430114649.4184890-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126746

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 36111dde1a7cd9f9df139d8dded91ea771336a69)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2025.3.bb => python3-tzdata_2026.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.3.bb => python3-tzdata_2026.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
index 1c313ea223..9a66460e76 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "de39c2ca5dc7b0344f2eba86f49d614019d29f060fc4ebc8a417896a620b56a7"
+SRC_URI[sha256sum] = "67658a1903c75917309e753fdc349ac0efd8c27db7a0cb406a25be4840f87f98"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

