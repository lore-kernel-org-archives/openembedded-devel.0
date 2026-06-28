Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7375FC44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75153.1782663762247461832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n4dwdeir;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3314127eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663762; x=1783268562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxSkhQ0Ta9D7jcBkWSk90GbYIxqwgF/fW1//uRneKNk=;
        b=n4dwdeirN+IDdhRwWe9sFOEj9S3PK8KPR/TWgEyTI640OUlyBMKNw3qx0goB4ZVH5w
         kImj77GvWm2y4IK4X2ex7QK4B1laoc1OEMIh2EN0BvPEfflZ39esTxGc8fFO/p/FFq60
         XwOGgkn1Ar4DupL+rwHhg7xK1JeyzcR3zznGQsjV+PHBB91MbIlmRlKqvN44wqFmUI8F
         5ktzY4s6DjgEOhuKvPn63nLUO96VQAtjkjY8LCiUWndAOa2OY58XDmiQRvuOkuw9Enyc
         7RBptx0nmueIdRc7eowMrjRubASRF6LzamgGlE6II3usdgKnxkCastpOVQC0ieiaddKA
         XpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663762; x=1783268562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxSkhQ0Ta9D7jcBkWSk90GbYIxqwgF/fW1//uRneKNk=;
        b=DWsfbUAXekS/9Kzh7yR5MZRXg2uZhCIeUQ/e67WXw0Z4TAZw4EB2NPneimfBl1bsZ+
         0BJAq/laD2vvmG5F9FAxRBI3fVD/jNGG1Olrcb8mF69HewHDByNSwtxx9hVha04jtVJR
         b3djfzylTLync0qhcjsgu+rhkfXjpDiwHE61J2p9tzex7rfSBzxPfm2nwPJ2pNqdTQJG
         yZrUdu8cJdByxvnsUd69cSzULV77MVH/LSu4u6Iic9oyJyA94pE1PMR9IRjRsAwj9LT1
         HyKwsMn5YwMmC3vCvfna4Dc8IaoLPbxu4xflG/nO2HSyWdcqFiZcsrk0UNmke1grVR+c
         gIyg==
X-Gm-Message-State: AOJu0YwBSPI+r9xFQGipYnmb2lyPSthPSAcUuws39vdCFBJDcYZr/X21
	46WaM0AkbrWyn4Kkc3agsGdDY9ZiG3eLF8EVFV4Oeuxj5Xt1s4o5qlX1fNCrdvaolC7HhQ==
X-Gm-Gg: AfdE7clMTAsJ2udBMmVCwkrJFQNZsfgsLCNwt+hKmTjkHWCZyPUxqRw/4gU4ufrKMae
	ulOeLFCICWYpFshFLcmVoTRhPGc6R2MSldSJYDy1vQs7YL/Q3G7qc95n+l/Tlg+PICfiWz4oSCR
	SyGUOD4HNsbOFSXgPkQGA1RCBPzruJ61etJKbKphubtQa8OOCP2659Q89poEQmWMxNtaxSN+GvD
	6r+WRWAQRVmQjE/xr2xZBZaaRwNy0UX8N5p7DY4XCPz0ods+FyBwUALaZj5Li1+VJeaS6uoOvhq
	TJUZll+t7eID+f8MhQvcj4N6cCJGzwln01xNfXrHm6aTQhIB/GrinKWR5AzEtd+GXFeWUh7G4Bu
	aQxLItvnf4N/sbwXV79/67YWhO1/zH3jIjvXu87Nl8A6hspT2zEv5AyV05Pyws4TbD98fiQSX8N
	1h8ZmEff+RJh0E8wwPeGxgrs+M/J1ucJ+llpFSPjig7qQF5lRgJgrew5u1ICtkuclAQpBS7BouE
	mEcX61xuy6cm2YXGCrDpJFH017QiFQ6MlNwDRx5oLxeVBarRyfVvfFii/458dOxOvGri5kyrOK7
	gvjoPgLcyUlsMH30f/VKEDGxhZElf3IqQi/c0TG6
X-Received: by 2002:a05:7300:8b24:b0:30a:e531:3153 with SMTP id 5a478bee46e88-30c84da4d0bmr13086691eec.14.1782663761536;
        Sun, 28 Jun 2026 09:22:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 116/128] libmng: skip pre-configure make clean via CLEANBROKEN
Date: Sun, 28 Jun 2026 09:22:10 -0700
Message-ID: <20260628162222.4081517-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127926

The release tarball ships a pre-generated Makefile with
the maintainer's absolute build paths baked in (${SHELL} /sources/LIB/MNG/.../missing)
so the make clean run by autotools_preconfigure fails before autoreconf
regenerates the build system.

Set CLEANBROKEN to skip that pre-configure clean.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index fe76520d15..76b8078bb2 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -18,6 +18,12 @@ UPSTREAM_CHECK_REGEX = "libmng-devel/(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
+# The release tarball ships a pre-generated Makefile with the maintainer's
+# absolute build paths baked in (e.g. ${SHELL} /sources/LIB/MNG/.../missing),
+# so the "make clean" run by autotools_preconfigure fails before autoreconf
+# regenerates the build system. Skip that pre-configure clean.
+CLEANBROKEN = "1"
+
 PACKAGECONFIG ??= "jpeg"
 
 PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"

