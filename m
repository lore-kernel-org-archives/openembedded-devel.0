Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C61DCD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:00:42 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3011.1779512438324259397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tz6DOefK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83945063f70so4293733b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512438; x=1780117238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Ec0cn6tBSZVhIU7TgeJlsiPsnjtjh160n6UzFTLrc=;
        b=Tz6DOefKSOwrxXdoM9RzH4LcjEtBvyinDHPlek8SLgfk0KFrTmd1a508bk6GXaId0Z
         VE0yUPi5Y2CDdQV/FYZMDOOLOz+9j0V63I2mrSY5gM6sAUS64NLPWT1OwD8VXRAg/B7e
         aj6A2OyZ6siAntUow6KMkwkpG6a1RItDtWJ8z1rSjePOTZDvSKehxH72rjy86UNTsaPk
         9YIwx9DKntinYKvEFVAK1JwIqzLMzYDzK0MqyqSNO5V1kPIh6pGumXh+45gHMMWCeYZU
         GmJ6I9t+G6nwalFEj7eXLrnlXt+K+emZUS77Zx4udLn9bfflyZvxSov3pQSYHnAU2Te6
         QgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512438; x=1780117238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9Ec0cn6tBSZVhIU7TgeJlsiPsnjtjh160n6UzFTLrc=;
        b=J7SjB0aL8N8/G7cJ49/0AdUGmgLUYXkCOb+ie8eVtLMZRUZ3ViF3oUSM4994J4h30S
         P9JF+z4s/KiKgnvTqBMwsXm6Pl5JTQ0/226xGAoB23lvuh8bO+Ydn0RtsCaXz0kFFXy0
         PYvJL1THcJxe1TIGj2DKYGRRfpQxV87m57vhc20wRgeCxANtMVbnnmT1KEFZTL+8QvUt
         Ld5Dizihu6JvDYjBPKzbWJxm4zq5JDBeB+5MU+SeTzCi8brkuOgv98r1aUzXETdNIOe8
         VGmijThzTVrvv++odPcSNn+r54ni3AUyHJkSrXFpF+J6H0ztBSfQ6fdAj9suT5D1GInJ
         8C+A==
X-Gm-Message-State: AOJu0Yw1oyEY9zGp9j6Hd0UJPTBBwy87E3/KZt2Sc/59AsHt9ssmVDy4
	LU3frDxSWOQ9sYDQ06htVpC+PoOC2+6TyU+/29z2lf/+TBmy9FgVexI8gQsSIcv1
X-Gm-Gg: Acq92OESzdISkQd28S/FoyTmPXjLuATVh0GoOsyWyDKpaG5m0++9ge73QlqH8VsTp64
	W/PbP+HmkaFfvUy8l0fSMc9Jbv/bbnznOL1hkrIp3uG/dfNpcu5TcDx19ZeF+ubvUMq5ODtSZ3a
	FgD4ekFbbxSBXufaJxqG8M0M1iz+ZKStza3JyU4qrofzqFG/OTQb7MpEajjoF3/E81t1jeMsgXN
	q+B/DFNOTzcb8mbU7tVOSr4aDMxJTfLDRdkYZ0v+C7xm68MgVtcglRn7e02xneB0RjUIZbwHn0/
	9twVrG3fvpikrBNdP+GzhCWAIfwvUAZZXMYPRju0eytGtPp1DEU7xdurQkhjeLnIi4KigV7h2FZ
	pXfDNouSTZcq5NnyE0X9MqfbxDJFzGkiko6tHdj946ybSY4dpKebZoZuwLseH8GqmEd3vOUDx5C
	WZ7LMxQ2nrzOQDWSpQdy52+ylqXqU+6jP06zsO
X-Received: by 2002:a05:6a00:2d20:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-8416116fed6mr4690602b3a.18.1779512437555;
        Fri, 22 May 2026 22:00:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][wrynose][PATCH 1/25] localsearch: upgrade 3.11.0 -> 3.11.1
Date: Sat, 23 May 2026 17:00:03 +1200
Message-ID: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127151

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix possible failures when extracting metadata from EPUB, ODF and OOXML documents

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5a08d78f858b8530143a39a1e819c541afd3681e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tracker/{localsearch_3.11.0.bb => localsearch_3.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.11.0.bb => localsearch_3.11.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
index d49482cfec..48d5e6b39f 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "c6774761a8b9f4a06f6812f1c8078bee2e937d65e376c3d2338b78993e5f4666"
+SRC_URI[archive.sha256sum] = "7b39a6c28a8acf2b172f15b2fb5ee7c7a3764c447c2f4a14caa239b7ebe61942"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

