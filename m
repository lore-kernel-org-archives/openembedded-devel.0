Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3354CCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:35:50 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.9523.1760510150279922882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CclwR97v;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5350713a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760510149; x=1761114949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGZExR3pV4LJsU04VpQiSg0Rc7c9Suqx8TVXsD0X+jE=;
        b=CclwR97v7q5znQ3rOwchmJmGG8v+ObqTegdR34/Kzx7Lr/Oij/5nTiMwBOmQDh8szY
         N0kZo+1EXYwiRXvXtg5nSm+pVZjUrCyEfTnwsiLV2NqEoWd0yzeNS4qId/5Irc/FlVoU
         5kahk5NViKHe5G3Izyw5bfjqciQRObVJPLFh/s1dBcDXOMEd2UBlK6rAqi2YzaFMNpni
         j7poikxXi+sAKYvASiqfwe1DTJxf4YjXeboeKfoyJcf4csCCTC1eLTH8uUEUKsWoIPjI
         BcJI4Y49zEM8DffSHrTeJB4jjgNrNv5k5s6I6xHp/jScP2+95JNQdW7d+kv3EaqsS2wr
         Mibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760510149; x=1761114949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGZExR3pV4LJsU04VpQiSg0Rc7c9Suqx8TVXsD0X+jE=;
        b=i8KEPANxTGslSJiiB7VDXIGxkHUiSBNLbzavdpMm5JGs7mAwezjmW5KOvrw1+9VJBx
         nxJ5ZGrmOm0Il6/7G1ToWAQEGuckyp1NDvyYILJA/DkDvWw9wScQwR/wEzY8+R6FH3kB
         0FT44I8DHwIYblaPm0ii/H61xPfZOjcnIB0lhRMo9jeHWaDFbN25PWR26spaq4hQmy2b
         w1+rD/vPolNo/Qp1YzfI7/9LeNYrp2o/oL8Ct8ucYX/V+qDNdNXvl+evb0IztXrT2n4K
         Tp6hgF7UTW6sRmDWKuJ+n3kwfIIvgqnydcpEklY/2y2sUPfIYuH6tThTxIER21OvHfzm
         3H7Q==
X-Gm-Message-State: AOJu0YyXjXBhh7fzfEP7FTc/2y2diwx2IXKhfuXGgO4riBrFXULgcCiy
	aM7a57T+tP2rNl7jWTUjUl9zcnC/GYKtadsbvFy6ix+S7eHp5cBwF1Yorx0zig==
X-Gm-Gg: ASbGncsBe3Ra4hE89BBmp8ESsNxmaFUlxhMsixT60CyDjNFlbQ+tttQVvUi35oWGpMo
	EA2HR09bIE790BjIzJvlvbkM+8v2ngsNWwk4bFG2naDvOo1pKkJBchyq81buNqdvJS/JxsbnIe4
	QpL7dan0XIMW4pAN914So06eDWiT+SMP7j/u34Thf+Ma1udwRX+lMu2sqz1jz7KEqhgWViFr3Fk
	zonkDjtr+H62vNO5twfJzvyEzcXcRXHD+ZAt3YIFxlX4m1bF3PfvPyxFLV4VJ52JTsyxlOOxlIW
	y2WRxQ0X0tHLeSpsJgVtswTIVTskvFHlg7JB4NugGEL3wvThLzcUHU4108nakyyi3gHEI2pNnnX
	EJljdMvAwfwgyuF6QvFAsFkahDLqfBJcvV8kCtHz1v2cI487Ycf6IgRo=
X-Google-Smtp-Source: AGHT+IF49IG3DJJJa/7kllzk53romDT5c4RL1di/msPNN3hW1Zx7hmPqSw2gkgtHsW9y+HTvh/0vSw==
X-Received: by 2002:a17:903:2ac3:b0:281:613:844b with SMTP id d9443c01a7336-29027418ecdmr344714305ad.52.1760510149482;
        Tue, 14 Oct 2025 23:35:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6fd3sm186191205ad.25.2025.10.14.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:35:49 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/4] opencv: ignore CVE-2025-53644
Date: Wed, 15 Oct 2025 19:35:31 +1300
Message-ID: <20251015063531.1573191-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120693

Details https://nvd.nist.gov/vuln/detail/CVE-2025-53644

CVE was fixed by [1] but the change [2] which introduced CVE was not present this version (4.9.0).

$ git tag --no-contains 40faced6 | grep 4.9.0
4.9.0

[1] https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6dbb715f466
[2] https://github.com/opencv/opencv/commit/40faced6c18baa6fbc7c1fbd409d59d6ddecc74f#diff-ae9fbe252ce7879e83e7ae22e594d50b5a8d2ea8dfb4cc8e02e896902a1a8f10R2872

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
index cf836d3ecf..e4910553bf 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
@@ -208,3 +208,5 @@ do_install:append() {
         rm -rf ${D}${bindir}/setup_vars_opencv4.sh
     fi
 }
+
+CVE_STATUS[CVE-2025-53644] = "cpe-incorrect: This version (4.9.0) doesn't contain the change which introduced CVE."

