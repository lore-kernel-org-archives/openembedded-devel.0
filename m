Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.50272.1590498965802468166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 06:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZH+TiRwb;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id e2so23709778eje.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhSH5St5k5QSobMiIvrjivNyzxcHRzgloon5qqbm9mY=;
        b=ZH+TiRwbOOBdB1aiy/H/PlOS1YiUaRAVSs/PVWKew3E1YTjIt6X2w/zpTLHgKcurgu
         5bs0KU3KdqZ7BFzhqV6pzMVk+rAb8kk20GuwPrUbIe85/e25+PBCdl4lqaPi4L7+Nkqs
         fsEqfoQv+erCukgxftkBkKnX4VLB/MV1ZbcFgwXb6RGu6OvNus8PatEWCpCTLAQs0z/G
         VoYhyRf91JU2UTsyGOhGNsYSner8SWQscPqDl5t//DirGc7DKyh2GTA9uXxIQaLkkCIU
         G+dOMbTLxYvZVBPVEq/O9eCXWFaoEFJwCz5MDNiClgVJKI6G7ybsS5Tps3IJM+nGBmBo
         d6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhSH5St5k5QSobMiIvrjivNyzxcHRzgloon5qqbm9mY=;
        b=FbQsE7hbvKCK1aVQjXA0H4WDoHjmqWkBGZmtEjy667//dVjLqUBWY+ujYfrtxSvXoI
         G9RKJLvzTO7e3ryxOsUyBq8TDmegIZpUpSOH/IulX8/MKZ2+oxw8GmI3Dmah/rmz11QE
         /u9TE6Eao25ObkVkrOp8DCISzs9uSR984A8++vJmUBS5XWJzXuxKKoYWJsgDWec30g3m
         QkPuzsdIxCAgtDkcqNrN+o+FgGpmdBDev63gpXdCeoh/oU45L3RTHBDr7qG43fMDQ4I7
         izlkLYRk8admtM53s8+XXO4diK1c4WFqwt8zs56oI+n0Q9t5nRCBuGzzl91qJjyP8+JQ
         u9PQ==
X-Gm-Message-State: AOAM5323B5haR1NjiFC1cz87fGzQaGxISlNbPXiczfJXvcdSzcRM2nQx
	rj5yeguvWOSJBkJzmboyvWjmOjIL
X-Google-Smtp-Source: ABdhPJyNBJdFmF91oaDwVYDvuCQSWOyf7zpq8swhFYSepwKkWNSweIOvsdkkv3Fc2ZaMDp5ZAEkljg==
X-Received: by 2002:a17:906:7c82:: with SMTP id w2mr1021595ejo.296.1590498964095;
        Tue, 26 May 2020 06:16:04 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int ([2a00:801:42a:e319:603a:b692:6de3:bf7])
        by smtp.gmail.com with ESMTPSA id wr20sm4330761ejb.27.2020.05.26.06.16.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 May 2020 06:16:03 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2 0/2] Introduce UBOOT_INITIAL_ENV/coding style fixes
Date: Tue, 26 May 2020 15:16:47 +0200
Message-Id: <20200526131649.6318-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Changes in V2:

1 Introduce UBOOT_INITIAL_ENV as suggested by Denys Dmytriyenko.
2 Add fix for some inconsistent coding style.

Ming Liu (2):
  u-boot.inc: fix some inconsistent coding style
  u-boot: introduce UBOOT_INITIAL_ENV

 meta/recipes-bsp/u-boot/u-boot.inc | 76 +++++++++++++++---------------
 1 file changed, 39 insertions(+), 37 deletions(-)

-- 
2.26.2

