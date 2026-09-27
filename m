Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D22C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:22 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35329.1790506222368048092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dM0GxN5W;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso733227b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506222; x=1791111022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoVL6raZBLAZvVoBAm8jbS4F/WRAIhWBEhQQSgvdRWY=;
        b=dM0GxN5WLAEA47SbD4k4543lvg+RUI5GY00J5f8AGuXPcJOtZwSyPm8ZE+9WZII2Yn
         HFsW+iSMk4qQnXZCFW5C3SRnu3ArB1l30dWnwFYh/SpiymDf5sjcoDky7fv5hGdMhRsf
         CMzsjfTME0VQ5uJLjYIVAAw5waIgV2GgAmTDFStjWUbnNdVcLBcO/xL5frysYTmXQYXD
         rV2Dla8xPXNfUljjJpli7UK6N+zmYq6Tpw0S2g/PVV0LC11IFih0/lCVGBYgjxwqPIE9
         QpfSMmKMdAXj+aE9d9oPqIt0Zwil631TxE0T0t058AXWz9gyaBYi/c2zmk2u2UXtLTjc
         qq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506222; x=1791111022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AoVL6raZBLAZvVoBAm8jbS4F/WRAIhWBEhQQSgvdRWY=;
        b=pkvmTuYdt4KrS+jK3dEf+yYrumT4lKe/DcHBPNsxKlKRaROnXxuNajW2AQ5wU/3G1W
         gSSMEQl/rIHDX6kebVFiKykiPeWTZ1z2qm3Eme5NjyStvtYkEUBhlnWJDZaCrcE4IREd
         LO8RGad6V+GI9h4oF3/KlIf2R6jkgtsfB+l2jBa1dd4z75NzTjflyiFOUqTwlawzcTwC
         tOB7OT/rxLaNdDI2lgwCWRlXUIwoSm91uLDFYPSGOcapATpLf7ONodx9WxT6F9nKF2mK
         yWKoyQu+NpyckOxfhBeX5uOPH0GRlwsyq5KDxb0yZqCYvY0TDU3B5/5MSTZVB5LhnIn0
         icew==
X-Gm-Message-State: AFuF++kbXuQ+Et7wU69k+rcrDdM0WaHE4pNHQkdEpbSMo4HUlWdLp9Uv
	8LHmpsrVDkjPSIgeHt58gebQ/V551yqH4S0449Ceg7fzku3e1o+piPKQfUfRhQ==
X-Gm-Gg: AYBFou10SxOMEmbbaqdiQaIv5lXdFebxhT+uIOJgGsdlDV1h4Yku7/e6NR0mamLTDAy
	0/vVDdFbre8H00pge26/Wdn2nafy/PIbzjx+d51Z8RyoIS7mh0IAqXPHlCD/DJURgsO8U09Lm/M
	JKbgzsuV9fecsdD7J3lrWmgvi/D6aM6SacTGMucDP6DCMbfKMmxvhpYR2G9QmeOXSyYdemdBo/8
	aQ8CBJMN2nL5mxIQ8T/lHmmAwnIsBAF3pcn0uQMcIXv1FDU60bZD8xIIAmcWgvNbQzN8cV1Dm5e
	ieoWKafQxSgrdF8SApFcJmKk70R+Hi/K/TE8phLw3E6NYiTET+4Nj7BLUyPMJZolXjGeyQzU5YY
	UAnTtbINJB4XoWkuEZjAZcz7NFPBkz08eBcMERBip6/E1rB3LUYeNQj+Dh4bYkmfGsel1nXBfYe
	3TqPhv1J2WbIXlFJA4yw95X6N7soYRj6yc/AbUKhJRGfepFg7zFv0xkG+eLvOcL1akS6wUWqLXc
	0Q0mFUNrMGe2pQowy5FJAs=
X-Received: by 2002:a05:6a00:368c:b0:882:94ab:20ec with SMTP id d2e1a72fcca58-88294ab313fmr1164924b3a.25.1790506221695;
        Sun, 27 Sep 2026 03:50:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 5/35] firewalld: 2.5.1 -> 2.5.2
Date: Sun, 27 Sep 2026 23:49:32 +1300
Message-ID: <20260927105002.1832451-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130339

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/firewalld/firewalld/releases/tag/v2.5.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../firewalld/{firewalld_2.5.1.bb => firewalld_2.5.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_2.5.1.bb => firewalld_2.5.2.bb} (99%)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
similarity index 99%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
index 7ccbe7d739..f6ce810139 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.1.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.5.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     file://firewalld.init \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "50fd01cf0b696a1cb7ca722e972d6173b0c5aa6ab13892b00842ae52172b081e"
+SRC_URI[sha256sum] = "99d7468c22f6cafd8c72aa53173a632f2ca29cb19aec913e8ed45b6102af322d"
 
 UPSTREAM_CHECK_URI = "https://github.com/firewalld/firewalld/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

