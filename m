Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B461BCA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:57 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3382.1790823830687972757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iNiMFzv3;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso2563227b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823830; x=1791428630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPXrEiEOLKYlUd/LYWZH87t6XkdHBCR6KX25IIL9yYg=;
        b=iNiMFzv3BZYLw+I3i8zgTXGfp9JhAnng3QW/MWS1dlfAw3275xapbck1jr5tlYGUaJ
         elBd0+fZ5ueVr8qw2uAoPFysEdccjYyX8ZTrNpIEczQlg6U7FDcMUokO5ynIa7giNho+
         A9CpeTwTSz20euyHW0ZGAmo+Mf7PV53mjUqMdoZuXyZus0h/Y7f/PQD3VR6LtPEe5C2r
         naSCAzjQplpIY+QNM5t0/hdojY5J6FPuzlk0M52+N3VP0TiCiD9fFmeqMgeXo1DCv9SS
         ZTHMO0nGmLmTiZvKyU+COmaAJfAuVkotvV2G/4WpUVJrjEECAb1yKI1sRDkA8m7s1rqN
         Rn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823830; x=1791428630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPXrEiEOLKYlUd/LYWZH87t6XkdHBCR6KX25IIL9yYg=;
        b=AqskYW0tS1ifa+RErhcvVb7mR+bVPGXRYemdnHQejyWDHAWi9VX/z5RVGURYkIxEGt
         INYvbpY7LeYu5zQMblDs72FY3J20f68+KPEhezZ1j+qm0xScdoLybMVWvlXOy6z+TZXt
         jrQy/ZrTeVJ58d+NET1WBtv0+veWlNSGj4+Fe6uYb6W0qGiyIiBALH0//O3jaVr/RucU
         GFhXzqK8u7tnx7uqurn2oKA9+h3KGkMqpmwy/AuKq/20zAzNL/LO6S6wJBswTkB2R7cY
         WG1FD1fJPGgTumWOD7EGMNNQ29t6zRv2aRuyvbkUdTon+RfoUqx3diRpzzo0dzla0Ni4
         7fTw==
X-Gm-Message-State: AFuF++n0rXi7nY2XC3WE4krb8KyyB5Qf9Q0b0AZ054a3AB0Rp2T1g+So
	S3mAa/+gkgt3rBZfa8YSdLveKp9F3Tuo7ZvePYAEdp4TE9GwaSbY2vR+AWTnvw==
X-Gm-Gg: AYBFou2Hk/MjPgiOwm3iKIfkm8a+8P/Eu7OaHfIHchLvQwTvSjWK69QIF574+wk4U+A
	ZGdkH5sR3qZVkTI7nI1qKGJI2i9qyxA5S0cshreilekKwWUv2Q3xrNSCwZ7kQMTh32Y/Hz/csVZ
	SO7sLT4gxGMX6iOa3aR3qA5FgPraIaTQKCIr2jPy04KB/+wIGSfX2RtVnAPS8cZf5AoWVe4I6Nf
	aI0FWy3Q9hDTYl+ofaBwP0eGPZGxeg4ptz8i3jzQXUddKx1i5JdvH7Bzo6/a0/v5T9/qaLquf4Q
	nj0FLsoME0NwAfza8U6EJqs+8AKzZV6nvoRXrvzJH3PZT1+5TlFBx9VndIRaMzwwyhHGNd3YOHV
	Omd4IEbBq4kPSJw05jteo1azVFmKpSfLpPgMVinjZkjZQ5lYN9S2ykQlTrNXbF7VsotILpf36MV
	IpQNutgF4LTAR3QnQs3z6gUcbn8pzJcj0wdAumh9SSPSorP7O+4RWvVR6GgQj07ezzsGkuZQj+q
	RGRCxDwoNbeUVbNKRIf4LM=
X-Received: by 2002:a05:6a00:4c14:b0:881:6fb7:bf14 with SMTP id d2e1a72fcca58-8874bd0d6d7mr2423844b3a.38.1790823830010;
        Wed, 30 Sep 2026 20:03:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 7/17] spandsp: upgrade 3.0.0 -> 3.1.1
Date: Thu,  1 Oct 2026 16:03:19 +1300
Message-ID: <20261001030331.1581021-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130556

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spandsp/{spandsp_git.bb => spandsp_3.1.1.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/spandsp/{spandsp_git.bb => spandsp_3.1.1.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/meta-multimedia/recipes-multimedia/spandsp/spandsp_3.1.1.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
rename to meta-multimedia/recipes-multimedia/spandsp/spandsp_3.1.1.bb
index f90b252d40..425ba9fac6 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_3.1.1.bb
@@ -16,14 +16,12 @@ DEPENDS = "\
     tiff-native \
 "
 
-PV = "3.0.0+git"
-
 SRC_URI = "\
-    git://github.com/freeswitch/spandsp.git;protocol=https;branch=master \
+    git://github.com/freeswitch/spandsp.git;protocol=https;branch=master;tag=v${PV} \
     file://0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch \
     file://0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch \
 "
-SRCREV = "797760168945c96e91af55bde9d4edaea2e654f9"
+SRCREV = "8f1e1646bdec99eac5fd2cd92c35563f736b9b89"
 
 inherit autotools
 

