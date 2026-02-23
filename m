Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185D6EC1139
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2755.1771874335186444258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jTOe/GQT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4376acce52eso2940403f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874333; x=1772479133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcpNwamY0aYUD774U7ILtCJap41jYlb9ONMHQrpFu8w=;
        b=jTOe/GQTMReh8Mp0MsgsH6MFHtXA9o8wPRvxdbdJ+g5hqFdjS1NhZEq88IUkPhwJ7w
         mhUqFnyWIejdNLNGouivnAelpbar24cxBRRwCuOkMp3zWXw9LmBSE5TFZquDOAJLDQ6j
         TfaDJZ0Za3FkFJZWF5zfrD11WkQnpv3CrSj1r5K1wckrZoRCxjARc8S+FCoYtsLzpQJD
         in8jSTgzSB7hu5W/bdMhy0W5bDcYbG50M3GVyVHKe2tF34XxHkRj0ktJLPRyZRbou/L5
         UuBwPCtxIp4u8v3M9+R0LWNAmUg8rX/wBeHRV/eVI22COIaowENSnHYXR0ROl3OJwNyS
         9dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874333; x=1772479133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BcpNwamY0aYUD774U7ILtCJap41jYlb9ONMHQrpFu8w=;
        b=wuJfovVOoY+0/zz7x1mMirmYFc1hXjaHMSbBiRR1fqE9nPGe1BnwowoU6iy+jMYbA3
         Pidip/k51d1b6CMtTgREDMNBc3sQX4dc2NEmLVdTy/tizGpnE2qsyGHSOSbmP8n/IRew
         ri0n9QJve9RdUqJrDFmUZruNzi8E8EvRdjrXdySsLM8H3fx/gZrrwMtPocmVALg5coOc
         VZ+f+fmRMrXKdtCiBJAWw0BonCjBZRjH4yak8sADS7Strd1u9kWofqfigYQ2Lg3K5FEh
         nAOHB/iSlpPxYHjU6Nbjd1g6Xux7XphWZtVdrjxDaNKyB1CKrXrEzQSWeLRaP05qhchN
         UyxA==
X-Gm-Message-State: AOJu0YzbQslEPIfO8Ph33DtO60aUdxut48SkiUIAkwVKvKn3C4Uy6Sb1
	6Oj5wyBcHikPNkF+WKgKAc/qTRB0RRSDESKJsXBtsggFR0OyO8rkmRHUfV0SBg==
X-Gm-Gg: ATEYQzwdl8eWINqRCjRBtzgxPuggAzzoXSoqSvJQ3uy/ATzMGem7jZLlOw2I8ydVnVX
	fonc7pFc9P+GnwFd6KgO98J570GBE400Qw2arU414bI+rxqGYxdOtsaf2oDwIFDdKYWpL2tjJEj
	wjIglInJOsArD9DtRCmxZUs1VRzg9Ci/X/6Cmh/+Yay7gobEH/rJt8r2ZrT3Ds5kNfY/9fi+TIC
	Gk5Oqraq8JP7EQAtatTHk6uqsOD2gzE3rzRyYVWiHa9V9PxUtb6rygIuSIEqLgY5lP4ITGCYTa9
	a0758HSVltBAXjyUtUgBzgHKu5dJF97s8bMPjzBUznse7F8EeMdojfJ2XQZPmFgL3ZQ2+nRVIVR
	IE+M1FUVgJeyAWXXUz9EBvNIGVzk6cHBxoLFu69jtZev/LF1p60yeSDsbC0sI+VxIs14Xe2Zrbs
	2KvoMToKhYEkczOLrAsBfq
X-Received: by 2002:a05:6000:2913:b0:42f:b707:56e6 with SMTP id ffacd0b85a97d-4396f17a93emr19043583f8f.34.1771874333430;
        Mon, 23 Feb 2026 11:18:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/13] gimp: ignore already fixed CVEs
Date: Mon, 23 Feb 2026 20:18:40 +0100
Message-ID: <20260223191850.1049304-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124557

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
https://nvd.nist.gov/vuln/detail/CVE-2026-2044
https://nvd.nist.gov/vuln/detail/CVE-2026-2045
https://nvd.nist.gov/vuln/detail/CVE-2026-2047
https://nvd.nist.gov/vuln/detail/CVE-2026-2048

All these CVEs are already fixed in the recipe version, however
NVD tracks them currently without CPE info. Ignore them.

Relevant upstream commits:
CVE-2026-0797: https://gitlab.gnome.org/GNOME/gimp/-/commit/ca449c745d58daa3f4b1ed4c2030d35d401a009d
Note that the commit referenced by NVD is incorrect. This commit
was identified from the relevant upstream Gitlab issue:
https://gitlab.gnome.org/GNOME/gimp/-/issues/15555

CVE-2026-2044: https://gitlab.gnome.org/GNOME/gimp/-/commit/3b5f9ec2b4c03cf4a51a5414f2793844c26747e5
CVE-2026-2045: https://gitlab.gnome.org/GNOME/gimp/-/commit/bb896f67942557658b3fbfc67a1c073775c002c7
CVE-2026-2047: https://gitlab.gnome.org/GNOME/gimp/-/commit/5873e16f80cf4152d25a4c86b08553008a331e90
CVE-2026-2048: https://gitlab.gnome.org/GNOME/gimp/-/commit/fa69ac5ec5692f675de5c50a6df758f7d3e45117
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index 860fb5d26b..5cbb94055a 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -135,4 +135,7 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
-CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_ALREADY"
+CVE_STATUS_FIXED_ALREADY[status] = "fixed-version: The issue is fixed since v3.0.8"
+CVE_STATUS_FIXED_ALREADY = "CVE-2025-15059 CVE-2026-0797 CVE-2026-2044 CVE-2026-2045 CVE-2026-2047 CVE-2026-2048"

