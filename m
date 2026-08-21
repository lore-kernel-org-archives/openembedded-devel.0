Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674FAC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.662.1787286950105592782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mKRJ15kz;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf50c6f235so7576915ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286949; x=1787891749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGnX59Bwxc2ONFM3GH7u6q6k13D1Mjw40gsgxana6mg=;
        b=mKRJ15kzYfTB5Rqf5H51qiPSC1szc6AS4Anaom1P+3mnQhIN5XNcSGC3nd2R18GAkT
         gNZcWoyWhro9KB9JPTysUdjt3xtnotFW2xV3RsTVyXOYRGLTPMpPKIxwQo5N8KiyXJNf
         YPP56UnbnKEPY7a+u7BpI5rC0aJ/5uAHUKqRsSszMvsH6dPD0TET0TVbHJUX8lXcBllA
         hL2kAGE2uxYxiJeradsFAjvdIWxk6IJJ63RnvaX1qalfNNQeuCAx0nxDPx7ceGu0SDxL
         90qdTrIaQWxrABwP7F8MrAdqZwWEKJOmpTFZ+zJQe4aYpBaPZnXB0do2t3Rr5MgzvURW
         dptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286949; x=1787891749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGnX59Bwxc2ONFM3GH7u6q6k13D1Mjw40gsgxana6mg=;
        b=bYGjnchmUpji99z0K8sGaV3gDMwlkfhjJls7pizBFqoWS3FGYKWRC1Dy5fWemLCKil
         3264S8sf//m/bO84DdLY9iY/DseiF1PnASZ1tir6A5prx80Ze8sQWgQTOAU80wpqi8st
         d/GpQrta2HhpBKWOlgNOmPqAhFtKl14esApQETe4BNBHlIwIoudY4yG43D5C5qsO2a22
         go3AIcoJHBuAafIrfXnfJ9ulwiHfBt9HhN/xKOKI8cywDAPp7br5LOkMY3UGXQbuCPCq
         KA3QDpxY8TmrYriZyO/jyM7lv0DkqN12nGzBa3U9IpA59hBTCYHDwTQMOaQSgpZADLsk
         GU9w==
X-Gm-Message-State: AFuF++lx4oKm2qUKKTp+KdTAOUTvMNhcPhmWr30wGFXDfTmK9Q+tKBNR
	HS51oEh7SiRCLdCXzZt2e/0Y5IjTeOJquWJYSi3dLYPe6Vv6U2NtIj3ORlwkAg==
X-Gm-Gg: AR+sD10YkMYUyKaCH60ug3tKtdU5ogYvQrqm7IARb/ISqeWl12q5F73CR2IsgTdpJw/
	SsyhTxwb0n9niZ+83Yc709P5ACvKRvQkdG0+0omzi850aN4a/mrMijsLm2Mcw42sNpCdoCnOYDo
	HDPo6BMA8uDCLGlzCsUqifV9JpyEB+mTo0goUVpep0IUC/dFb2tyUg0hjl/8l0zL642EZArqKmo
	FGLS2/mqnLcN2YWZCTKC8LCi2rcYVz07js7UUb1S8wjtnwLG3d2cvQvgTyLgLXd6K02KYUwY3wS
	jS9jZXhoKHeGWXqMdrYWbX5Ka/cNU7lhDT8NE9fs6p4YE1h0YaOOI9oT0BTqZx0ltErwnTFg2Ad
	fXI1wB0xZnZBNDSoODyC96IoCjzdnI7H8rLAGKLS4zUdJhDYcKEGNHpImMl4fcndSPfFTxGdvyE
	w6pWzmcWICePNW0Cg+xzXCQWyLZp2FbvpQTSXa1wCW/nU/1ta0pvZowp8e6qhLz0LidkiVvkbnI
	6bjCdcsNQ==
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr74709525ad.14.1787286949194;
        Thu, 20 Aug 2026 21:35:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/15] libp11: upgrade 0.4.19 -> 0.4.20
Date: Fri, 21 Aug 2026 16:35:16 +1200
Message-ID: <20260821043525.448011-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129402

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch that is part of the upstream version

Changelog:
https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-p11_ver.h-file-to-installed-headers.patch | 32 -------------------
 .../{libp11_0.4.19.bb => libp11_0.4.20.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch
 rename meta-oe/recipes-support/libp11/{libp11_0.4.19.bb => libp11_0.4.20.bb} (86%)

diff --git a/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch b/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch
deleted file mode 100644
index a8276179a1..0000000000
--- a/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 007043d355a9f7f1cd3cb6e80d16cad609fdf2a1 Mon Sep 17 00:00:00 2001
-From: botantony <antonsm21@gmail.com>
-Date: Wed, 22 Jul 2026 02:50:28 +0200
-Subject: [PATCH] Add missing `p11_ver.h` file to installed headers
-
-Running `make install` does not install `p11_ver.h` header which is used
-by `p11_err.h`. This PR fixes it
-
-Found in https://github.com/Homebrew/homebrew-core/pull/294427
-
-Signed-off-by: botantony <antonsm21@gmail.com>
-
-Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/007043d355a9f7f1cd3cb6e80d16cad609fdf2a1]
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 92d3fdb..549ac67 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -9,7 +9,7 @@ EXTRA_DIST = Makefile.mak libp11.rc.in pkcs11.rc.in
-
- # Headers
- noinst_HEADERS= libp11-int.h pkcs11.h p11_pthread.h provider_helpers.h util.h
--include_HEADERS= libp11.h p11_err.h
-+include_HEADERS= libp11.h p11_err.h p11_ver.h
-
- lib_LTLIBRARIES = libp11.la
- enginesexec_LTLIBRARIES =
---
-2.43.0
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.19.bb b/meta-oe/recipes-support/libp11/libp11_0.4.20.bb
similarity index 86%
rename from meta-oe/recipes-support/libp11/libp11_0.4.19.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.20.bb
index ea40e6d4b4..259ecb04b8 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.20.bb
@@ -9,11 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV} \
-           file://0001-Add-missing-p11_ver.h-file-to-installed-headers.patch \
-           "
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "ae5756ccf5cb7929bb8edc986a9e6a65584406bd"
+SRCREV = "61dc3acf95b859c88844e000001a99948c0abb48"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 

