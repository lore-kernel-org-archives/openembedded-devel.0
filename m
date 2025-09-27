Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB1CCAC5BF
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:56 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.6902.1758954773994703900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbhZkGvq;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-42480cb4127so33428085ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954773; x=1759559573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX3J3Iczp4valTiH84n6KvV+mVU2u8+c+KMSGMZVWGI=;
        b=ZbhZkGvqb6veojAC+STidW/HfNlSD8IhV4/ELukpFJ+TqNY3dSRScyZCG1dBDngyKw
         EzIseH7cpJGZ2grq+9GN5vXP3YNvpLBXcglxhASVOnXbIcinsvsKmKAFNst5Th0W+YEl
         rIWAIOelwBpMfYRIGWXUUMIih3qyFjxpHV5gW/Wi9kpTgyMcokHi87BVs23+9Zj2/G/w
         2jsLcLbOEgmU4iJLreWQXUKdZnYPSmPlunXRPBfeNSVbQoqC1KNXLaFtQAtdkZvWm5LA
         wASO4tmfY7xBaf3dGFDm+zg0L5cnwBqUK6XMXocURpiw6LSmHJGvaha9dPNdbnuC5wc/
         ir9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954773; x=1759559573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QX3J3Iczp4valTiH84n6KvV+mVU2u8+c+KMSGMZVWGI=;
        b=tfV8LGPD9nw0xTeVD4hTk+1pr+6fA/TZMrYZl22k+JLvsK+i+QOYLAQfeeL7n5o0ai
         hep2pwuX2uVx2dKqDUuxsf84RvCKMypzKkEOhCoB62aihq188TIq8vJM17ZAkSEcYRLa
         ym2JkuHFsG38V1X4x9BuYqpow+hvlLATAAFm2n938jw+DamFVHrizciREqNOP+9kGDX9
         J5qz51pdBfy/pw/z8/VA1MBkmAgKApDje6XmiUn7NDkoWXHxJbhDc7F1GEA5PC7Xvm66
         r8THeofgIGK/xfEpXGQY3UCAebPBKbD4LafUpLMRu07EqXL8/U5IyEmt9npYUemnaDuS
         lsAQ==
X-Gm-Message-State: AOJu0Yx9c6VPCvXs9emViFni/Q9CTMbDYnV8ZBGNd4wUvHsWl7KrxOgr
	QAKs5qbOh2+NMXF7KK6wIMV/thrw+QXyiEhOsUhSDR1OkQQxphutnUxXpbMqZw==
X-Gm-Gg: ASbGncsBvEmqyP3OG36nyPHpwj5v5RdN/Xg6U41ndH+L2EnZ9z4A0AlGkcv1VnSUgIK
	FdZ/tUlDvJC6jNqjvOAJaibCRfUY5r8NP57EIvieToqErWIqFhsjIk8oxQYto78sLmBdTaNwqmm
	UA8pDGPdvM8MkqPyMGHzA9Fs/OdGFrYIpjUBLdnCGQCYElUQ2ylDWHYpOe6QH7QrKD8eODtjugw
	jqghxvGl5ue3NUkAroJ9E0QsfDCBmon3wG7bwkQ7770A39/kinxCvUQNgPUVnar4l1GS3psueHW
	ObfcCb2mIutLvUUNCUX2mY3rX+rgQYKnEDBdJ+5U7D241370E3r17HFxWB/2P4QWiQdPhXuUHz/
	1XTSFB7sCfCc/zJw8cefeAUhXolS16hmhv2fhSIAcBuZiPTZfXIQ=
X-Google-Smtp-Source: AGHT+IHKfMcBSJ1LyT3jFEaPrYzfoZ4LsbBCKc851XP5cjYqlvFmUYrpj6C2bB0Ryj4tFOa54Sr7oA==
X-Received: by 2002:a05:6e02:278a:b0:427:a3ef:5701 with SMTP id e9e14a558f8ab-427a3ef581emr65301525ab.14.1758954773036;
        Fri, 26 Sep 2025 23:32:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:52 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 11/21] tk: upgrade 9.0.1 -> 9.0.2
Date: Sat, 27 Sep 2025 18:32:06 +1200
Message-ID: <20250927063216.1865627-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119965

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b3adc834d1f16a445281c55f4db6361ea8239834)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
index 8701686b11..9649e8d8e6 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.2.bb
@@ -20,7 +20,7 @@ DEPENDS = "tcl virtual/libx11 libxt zip-native"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
 "
-SRC_URI[sha256sum] = "d6f01a4d598bfc6398be9584e1bab828c907b0758db4bbb351a1429106aec527"
+SRC_URI[sha256sum] = "76fb852b2f167592fe8b41aa6549ce4e486dbf3b259a269646600e3894517c76"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"

