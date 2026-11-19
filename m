Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1853.1795113370255800460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WcMs/laE;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so61686b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113370; x=1795718170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4lUJ0PDIqtwAE9/Yd5DZccBJhGanY/drkSzrwa/k2U=;
        b=WcMs/laEZRFt936BCO7AQHFmCdiHQ8H8rriwnQs+ToM90sX740JO1galulqUV6iwvw
         fBNTDyvp7EilJz/5OnJp7mmw/bPJIKPsZULR7pXI45coAVPR3BUgFatPd0EubMHxR8Rt
         VeEXhc7RxutuxBiIPAxynBovptv3KOBr/Sh3SX8R3UEoUfQRNFOpd1doo/YOW+CW+uW8
         G+g12j3IINiTwZ+cyYoNvVa2Qt5BknxevkDNetBsGugoKag7uaylPu1YVbAscrBoW8Ax
         VFh+omftUchy/HAMmTjx+hCQ8tLRJsvH8e2POPvZxKEiQIWT9mBhii/RdMwsTMIGg5xq
         pdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113370; x=1795718170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4lUJ0PDIqtwAE9/Yd5DZccBJhGanY/drkSzrwa/k2U=;
        b=yElYRG3/wR9L23/QoEVifLXJlgdKTd8u7FhsJjpzmUrBYEjj4EqE6MsS22B3vkq+ot
         ajDFY70HlMIrttBbMPAhvRGYjm99b1tmX6xJt3s+dh1BDrB8nMxDy+pAYTJgk76lnbzl
         t9+mNH0hhJiXTtP7/0NpaxE2b2lwyGFtxEqxGBPd6CoXkJhWoO723DLMz8tCDROX68W2
         NbX2aYPcgUB6QNOfSsi/ecLyNf26sbr7gqlE0ubssQUX+e+DlnKwsECgqUr1RlY+V7fN
         Vzl72+GfeWPk05/JJisWNfFwKRTVhIEMJHQaEeOtdDiHu6FWq2TN+pQFYuwr2khsGOQW
         3tWg==
X-Gm-Message-State: APuU4Z9PL/AQJda2xyVJOP5/uZxsmTf0a0DBFs8sQqYGMeyuImbvMD4I
	TSneNr6vYBWsKqRQvEKAtcnxZ3pMU+ZeUXof+Ed2SyD2wwHt24UXvoGfqztyyw==
X-Gm-Gg: AYBFou0tBQXKMIsTeacuVDXp1emsfq/boAHhhn3kcKW1kORrmDZQlkJpMxt3/tHQcpk
	w/Jm6+iF/LQ+y2ETj0+ZZLpIn0Fba43MthxsC0VrRYyexeIoeBylNICM2iEZDBxJId2nqIyidFQ
	iTJm6xfDAJ6unzrmqMfdoEtea0MLaSZWHQtNObrY/W0cAkZnyxB4qauQDP6RPZ9DZKzWzm63bbY
	iVy46QKIlvgoutlbFXwXtGJDYEzyA4K7IL6Nj7p0KehhCs+Hq5LvyxvpxJcgC9N2YP3avbQHM9v
	JfiFS1BcI3a5mnT3BpnHuvxCiK5dQwfrd4H5ftD0V+acEbUgZluU9HppTPkrGmkLpSDlYmIctCR
	2jd2USyinH6TC0G+PS4XtOt3tdqyod+6a5y7CKjil72NmlZ6GvvHPe3OuAkBvRImEosetY7ZDY3
	Y9OlVmoG8b41m3AdQKT6ZtwlyF9hBAODrUoZnUduRR3846uwO5RzHbPEZxcUAOu+Iaxs/ZWtuxX
	ryIkw9gAlfrrmePGaeDxTPr+rw+gt12kh3KxTT26IdrPVbTYyaJrQB3gDPPw1gN3xVNFEcOx/Fn
	/+FXWiGnrof1gE/GESOe5INUJM4lwqOFHfSw/EZ0Tzn8q71YsUYxS3nVPUDPoCMI10iEKqce2mZ
	4RfE1KzE=
X-Received: by 2002:a05:6a00:2d8e:b0:881:e626:74a0 with SMTP id d2e1a72fcca58-8c87d221e1bmr496487b3a.47.1795113369513;
        Thu, 19 Nov 2026 10:36:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 06/64] json-schema-validator: upgrade 2.4.0 -> 2.4.1
Date: Fri, 20 Nov 2026 07:32:34 +1300
Message-ID: <f293f36d45b1269bbc44ad11ba19466161f0f2c5.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132696
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pboettch/json-schema-validator/releases/tag/2.4.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cf46cc3b9203baa9f1700f92d33e8da81c3539ae)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...schema-validator_2.4.0.bb => json-schema-validator_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/json-schema-validator/{json-schema-validator_2.4.0.bb => json-schema-validator_2.4.1.bb} (89%)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
similarity index 89%
rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
index 857fdb779d..3332468a05 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
 SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https;tag=${PV}"
-SRCREV = "c780404a84dd9ba978ba26bc58d17cb43fa7bc80"
+SRCREV = "9abddfa905bb4889cc4ae55f87adcaa71dd3bc23"
 
 DEPENDS += "nlohmann-json"
 
