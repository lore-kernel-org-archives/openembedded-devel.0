Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409ACCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46634.1790553838591020756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XC+b2Vxb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caced6038eso15379045ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553838; x=1791158638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQ0CKVOcadBOwGCOIGOqmALiV5Iz4TzSw0I2//M/l0s=;
        b=XC+b2VxbPj6HOxEvis96Mc3mL1EVvCRVXZjZtjOGdhugn4Xn81qVS2f+PkaibkCZM2
         GjXZ5GhNhvef2Wawu/iJAp7H7tY9J4IL4VSEEXcmOTUyP+gggghCaufGfiZ3+ydXkuad
         lx5RWFxXddY5HVcM9gHVLtuHwKRM6uXPwZ5EmRfD276+dSm5lprdMuHy5c7si+D5WfYE
         nnId151/cQl3Bt2MD9+v5auLGbVryeCgTx/+VVZG4jRk3eoAvfaFCgNePpdrOZCsOqt3
         gJ+DCavpP2uVBOSmzgDBo2mgOV/rmdkdC6PzhiD456B3rlthCYbMtDozZ1e0eLlhVDmX
         9ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553838; x=1791158638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQ0CKVOcadBOwGCOIGOqmALiV5Iz4TzSw0I2//M/l0s=;
        b=cpgrIBMOrnIT9sAfAjApsblN682sF/Y13c4zv5gUv9w2P4FlFzdzpujdztBSvtyt9S
         nnQUPxk1yoMgOW5r6fvkEu0Uz3Yq8J8/U7XVABhmXazHSo95a/SNWp48jnft8+YyYww3
         moM91VSLHDF4QD2KBqgw/vbkGs5zvZ5irtssWVYz64PG/OvU4nM2mGaYl5I3kI0S1hCo
         CnyjJVv0FL8zvzU7K9+8nFeX50xyC9EEDlJPENWzqpYkVWzJ8QKXCX6wrKHXdoWnnEfP
         G/8Hcw7ihhdVFnE8LWoACcORfCvaFZ7wAAvHRQy+tY+xLOe4b2DEMN7HnrpdyrrsKZHU
         FHsQ==
X-Gm-Message-State: AFq9FYLgOnDSgGAgBQgi7Ohf/G7Jj+WzE4EVcY7On5Pqx3bSPmmlaK0t
	ISFE+dpUDCed7b8SWmGcYXnf2JT9BE9Ijn6WAYZocPTjjcIlLs8821F2/W9GBQ==
X-Gm-Gg: AYBFou1EW5qCAsqgh5I3sp7TfgZ8B8T09ocQ3s32lilGdAvytr1uPx4BVQKrohOHmxz
	bopYMUjrLpwxUYqonOpZJw2IpdP8rD/m+U2R9hZZDGgGHvtUfr0RWmEtZGMYkYw7kZE1hnOa7H+
	hh00rtBEuu1LW52SrqwlnTS38FL3Q9QPOpj5AY39+mRB/r8mflQM3JtvWDRNRosXfXZA4WseJk5
	n2quoZMUVtofyPAhZDX2h2GqyRSm7ZozznUkyswwot9BcH+YvySocLPe2h7KSg7PwvNR+KuYsm1
	xla9i3TykMO0bx9CbHH4uj/gCn/HO75rLFuNK7XqvGOYkyD3o9O1exQ2PO7ZMVqeEDxIImh8jum
	/5Uwtzd27MlpmYYL7z6ECQmUJkh07pBBV2lyRwc1LjTJSQiwri0LGM4/ohG0vsxRLYAwHqzzNYy
	/QsEhJbP1u4dTl9ashJTDx2mbDP/gnE66He8JHdu/CmQwI4zacTt9BP9If0jKqCnbeCVpnY7lpb
	EQZkNA/4UBquu3vVydHO04=
X-Received: by 2002:a17:903:19cd:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2df7dea6233mr69541055ad.4.1790553837924;
        Sun, 27 Sep 2026 17:03:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 23/30] python3-pandas: upgrade 3.0.5 -> 3.0.6
Date: Mon, 28 Sep 2026 13:02:55 +1300
Message-ID: <20260928000302.2528437-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130410

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://pandas.pydata.org/docs/whatsnew/v3.0.6.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pandas_3.0.5.bb => python3-pandas_3.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.5.bb => python3-pandas_3.0.6.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
index c159113a21..37b02ffa0d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "dca3734d6ab7c906e6730f0788b0a1dbb9f2467731f9711f77995c8e9d62d712"
+SRC_URI[sha256sum] = "66b07ef7315a31bfe1089cd3d71a7de781c9dca986762d0b4fe7c0ef17465d10"
 
 CVE_PRODUCT = "pandas"
 

