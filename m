Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3571C25B0D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1947.1660365492215891968
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g96uGAGu;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso9988312pjo.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RMwz8i+jrnhCKC6wtLYaE8cqyPuBlrbl1J5Ko9IOzKU=;
        b=g96uGAGuoEg6/Z1Yp21iDNHQHgH2lh9mLr14UH8h7St6TIOLVRDFEK/ljZpGPDYRSm
         2UdrN7MZMl8nvQNBo2YiOrOv5HGRgeekARAsuZDFOYYu8X+wwp2jez7CgqO5vM1OCQK0
         261qhYeBPUH9DhB/Ri+JC6t301Q6z9ghiSR1cxFjJd2etcRJdXnA87lRC8BZgGDUkSp+
         MsmjqmUXfogna9j+JzfQGGB9EzOJM7mn7yFGeSPmbK7vt3oP+Sq16Qy5/H6xFhfLQzI0
         vcLSl2JyUhZrw7QdHOGkknHtM6e9m3bIJW5HyWly+ItOWoD/7N+ZIBJCpbRs90ga2j46
         c3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RMwz8i+jrnhCKC6wtLYaE8cqyPuBlrbl1J5Ko9IOzKU=;
        b=qYPBo+jb5qVneCZeapC0gshWDjmfhzOgNM337f8J6VnRCRpnvw7zlikY2trMS3c1B2
         r81+1Hbl/zJDI2o3rhuSKzJZJucHSrCnaT1oDUkV1L36LFTR4vOAqh4GjwV6ZigOXKYW
         gv8PW2/ohjm24PuKzwQBWGhIlx+02mb7oO+wmJYRi0fgsG9HlaigDOkqaPDLjiC60B+a
         x+ktG3yQEKRwzRdtv/P5xsfwdw8O+gYvFAdu3V8cKTy/bSxmmzBmpq7r1EyJs7Fys547
         qMpFWCehE6W+VLJUtUckFr5wYthtx+v8Gtd8Adz54eSeL7FAVyms4jbsZt9a2QonP06w
         okAA==
X-Gm-Message-State: ACgBeo13LVdeaw+q9/VL8pCYroBC4wcOLuTEe1kXY76nuDiTrbKk5/ul
	js8X4BHi5r9MxAN5hqPBGSeE6ObqlUA=
X-Google-Smtp-Source: 
 AA6agR6+RkHb4kMhj6VQrXG8kYDMjZPEJJI1rpQZu1sJB50c6TatxOXfyXgZ2HPZ7PDl5g5i876r6g==
X-Received: by 2002:a17:903:287:b0:16d:bb5b:dac4 with SMTP id
 j7-20020a170903028700b0016dbb5bdac4mr7024403plr.137.1660365491212;
        Fri, 12 Aug 2022 21:38:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] sysbench: Always enable largefile support
Date: Fri, 12 Aug 2022 21:38:02 -0700
Message-Id: <20220813043803.3548501-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813043803.3548501-1-raj.khem@gmail.com>
References: <20220813043803.3548501-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 04:38:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98223

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 22c634af05..4ac78fb8fd 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -15,8 +15,8 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.ori
 SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+EXTRA_OECONF += "--enable-largefile"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
 PACKAGECONFIG[mysql] = "--with-mysql \
                         --with-mysql-includes=${STAGING_INCDIR}/mysql \
-- 
2.37.1


