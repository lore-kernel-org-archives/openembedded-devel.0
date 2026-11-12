Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8139.1794465768917754305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rT39A74B;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9f760337so295870a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465768; x=1795070568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zh3c5rJVIDiGSskxpAHoq1n1Oho5b8/Xf9nIua+QsuY=;
        b=rT39A74BlSTUVrqY7VuMweWaweWH51lZ69cDLwJOTsT1deERblhxYT8jq0i7Si9tMg
         Q6fsFQWlUp1gGbox2SRrW/WhrSRlhYaEH822imeTdlIVcEzY49fabYCe3HPh47pWZUQ1
         aqmXijvfPba0gogXRgRQYUYjir3tWkLxo1clE7jd6Jxp+Wiu6HVKCkbpnpxRzlmq5OFT
         QI5hsbmECPOvuxosPRJoA95EaQKjyFrOIxsKXU7OgmDe6OWwVi16AjrLhfntb7qvu3Tn
         wzR2VgtSpn6JZSmV9HYwHOs80K+UNU0zUnG+j0N6xDZXBFoZOTF0rFP4g3X6PklSHGYZ
         imKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465768; x=1795070568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zh3c5rJVIDiGSskxpAHoq1n1Oho5b8/Xf9nIua+QsuY=;
        b=AUYds/hpSgTtp661kNAKGiUZYOil+3VUKN68sDJIyOKdHVNvziFEegtv092MBR7CCR
         6KGnDyNt4iexfp6NVVdRzLyq9bljTD2XRvq7jiTpokd3Q3T8RcNLSd4Fgfeai7KBRJv9
         4OmVF0F9c8loL1U14tKATgJt9qF4gFryyomakf26aEm3f5YY4ehkKOLHRsCJMGKdI6aI
         OPtYCd7RRNJLwnP8cia1KyNcQ6ANw+mfuRCZwMLau9/ZI0HktirnBZe2VQLqoUCllqtZ
         uOKTr7xlzM4HFqbIMSsH+U2LmpS8WYw+llkBrG3KjhbZMZvNa4FzWoeMgjxlX5JsAT6a
         VVJA==
X-Gm-Message-State: APuU4Z/bFptCdKoQ8EvjzZLXYdAYozd8GRg1lJHrl8xbUzb+o31oV4ze
	gyeNzQW8ZNpa+tMPGuCMFCpAmUDQb7Hp4u91rGaCLNm/5MPwhr/mTq4nCjOnt0e2Fy4=
X-Gm-Gg: AYBFou2RckB+Vc5CYuHErP+huVh2Wn1LYZgtCCz0RZplPWrac/cBpSjgPDi1B28L2NM
	tIAEElWgSs2YxR6Uhu/tUXvQU8/cWkqlj/uT5I2JC4R5q6035UY7IOEIUIMWns281GW5wTV2M2i
	bVFUKx1e2QBRj4P/n0CggXMtixCYjAXgI9UVzpCjhExWhlL9xeEC0wKeEniBuaws5wsqSjlUpNO
	4g6J3WJjdOp/kKbOov4qRVRUwpw+tNHt0vvsCq7bo11MYTvG0/bGiUGqeiAZNKS+2GKJYUHaEve
	X4yAynorNqZC9EJAofB538wqfo+y4fztHuGNGxDmP0j0iBHWG6xtxnou/cM3TLCDZsHv/193Lxa
	ygAcI9DxZPLK/eMVntiTNBxD6tz0wvFPqgErocAVvIPkYidwRmEdv9qedRA2gpbKc90am/gdBFq
	xsmwbSBftca8CDCNyqLzvkWJRUGAWtRRoJVQOmNjsyjTNmgSJweB6WvmciYoS30kOqJg+Ezj+pp
	JqVKmJTT8uY7kUgOcof52e+rz4LH/uj11SRBr6ivBcLzfgxgn/9EvrY/+nHW92mw2DRe6XtHN5i
	h+Ue/x6U/uY4UqiScdqQ0y8qBGebFEQS1XWg6ulaEcVuYpttCdcsZR0VLbZXVTZpw8BCmx47DDf
	GKvWV0t0On3senR2qMJsbAmLy7ISIfqxts8Bej2ve0/lUJ9zZ/EoklBekFE6zQa2T+C1ndshEAR
	ejl3cDEL998x7FctO/FblwAHo6bTu5aMWbKRkd/VH0wlpq3EC56n+pH79zWasrsA/K/25ZoIJFR
	Ft+qOpTqK9e2U55gRwCHXj80qu8Bu9FXKDpuYN/sMS3fMUbFB7hhda9eDgJoo8rJKjjOxN7r0As
	OaUC
X-Received: by 2002:a17:90b:3d45:b0:3ae:6e7d:7fa4 with SMTP id 98e67ed59e1d1-3b197d995e5mr1109110a91.50.1794465768216;
        Wed, 11 Nov 2026 22:42:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 16/24] kronosnet: upgrade 1.33 -> 1.36
Date: Wed, 11 Nov 2026 22:42:16 -0800
Message-ID: <20261112064225.2410019-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132185
Content-Type: text/plain; charset="utf-8"

The wireshark dissector is now built by default and needs
wireshark >= 4.6.0; add a wireshark PACKAGECONFIG, off by default.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kronosnet/{kronosnet_1.33.bb => kronosnet_1.36.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.33.bb => kronosnet_1.36.bb} (90%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
similarity index 90%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
index b9a797d500..6b7be4b951 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "176bc1064a8e85f95eda2cb1e53b1ce5d471d857"
+SRCREV = "9f327a94a3f6cff6e3eb56a17bbd1a6b53d6434a"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1;tag=v${PV}"
 
 BB_GIT_SHALLOW_EXTRA_REFS = "refs/tags/v${PV}"
@@ -27,5 +27,6 @@ inherit autotools pkgconfig
 CFLAGS:append:toolchain-clang = " -Wno-sign-compare"
 
 PACKAGECONFIG[man] = "enable_man="yes", --disable-man, "
+PACKAGECONFIG[wireshark] = "--enable-wireshark-dissector,--disable-wireshark-dissector,wireshark"
 
 PACKAGECONFIG:remove = "man"
