Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CBCCA6019
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31581.1768811336639986818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gShogANF;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0833b5aeeso41666465ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811336; x=1769416136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOOnwjsyHG/dgE6dcuc9dsmQwkfHgSIJTr3/6uBvc8g=;
        b=gShogANFeLCvsj9f0QeQMtGdKZSpnfwKtx94BcB0L+Mo/G/uqCZVU2vSRpif6Mm4On
         ASupyFkC1SKZQjPPt4NdyswD57MyUQrhU+KZ3C4QGw+x7EKsicdl2/P3m+7wp8lmfWn9
         D8Kdm7ubNwEXoo7Tm3sL+7puU8ECXVPJqwoX3PHyfSmYUizQ75zBsDfWqzIeZd2bJtYS
         /yz4oKS4kLMpmkzDynjsLAA/wSnafpL0qjhIiKe7U9P4eqWOO2qsnKqN+LsVpqqmbrLW
         jVtbowbu3kHIXFMAVMjBXO1quuUHV9eVis9rdK0VXV5cnSZ/ntFdNzDZhv0lG46IHrfq
         ufKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811336; x=1769416136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOOnwjsyHG/dgE6dcuc9dsmQwkfHgSIJTr3/6uBvc8g=;
        b=fF3gJSvg6Yu3ZohHzcXwHrWjO9aD5XC4A4JExHAEyAZ1r+T04Hz4+2nWIs1M77vGKc
         zSfnAxfkgYILrByDFMf2Kh98CzhTnNY3V1H9WGtgKoUHcGa3L5HNEdKjjXGozcZzsGTn
         yycefpuV894zsiDH42hhXtf09TKuBLpJWT/3bi7w9VAm50OYSNoqpK9JM/fFxMa3DncZ
         A9BduDnOPHAEFXVaOucjm1jJRlaZcgD1+PiLUQnRDcw3/sWiBlhYblsGDjQ91KeOkmxM
         vMWJJfoKtCr4h6rf3BtjOi75cTKFMwsVK2R1cMJVb0WoHN7t2WZKSkGmCWU4bpz6hiM+
         Z1Bw==
X-Gm-Message-State: AOJu0Yz/W8xEnay2vQW+miuzGBIvIS0dwZbBDqYRPg73KWETFepCuPRX
	L6LG7OKfkeRlfBmp3eINMa0dbUYSuFmpn+cRbqLcl8PJQZlPKNa72d+EGc4ibQ==
X-Gm-Gg: AZuq6aIQaE6SlAQIEvUIDTBbPVCir8SueUyqLfTF0NHOQILe9W8mTdQCH0dA38/IKdN
	V8kCjU2tcZEtbv0/fT9mDoxoWFxwr0g3eg7GVcvz/VoqvqKaTIuTtVfP1R4qLSRLbeuJbZWz0II
	bz0qoOmDOzDPbnlTC8MMolaTLHbCXOTfcsPRnMNUYQB1vjdjBM78/jeAY2NNWolXUYuAUlkpUyo
	ArF8fYNZYGX3Nb/7IG/kzT0gESv+Gaa9kWmWC2FHrVCioJ4lNmPQHjUcOtwApqQTJ7+NcxwpALi
	f/Opj0A8me7OPloJ47iXqPQZRL7KmeqNex5My+MaHe655bYc/js+3Vjw/R6vegFtLm8aafrYzOd
	6IwoTTNV160p/vARQpTqix4gyQiwd0TISSYYHLKjTiWhh7RnEy+CNjEcg+c2GwTysdX5q74y59N
	tqViIVk2868E40rS0weK3K6Go=
X-Received: by 2002:a17:903:41c8:b0:2a0:8358:88f8 with SMTP id d9443c01a7336-2a718878781mr95368935ad.22.1768811335833;
        Mon, 19 Jan 2026 00:28:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 21/28] libcereal: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:43 +1300
Message-ID: <20260119082752.4120991-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123615

From: Gyorgy Sarvari <skandigraun@gmail.com>

The relevant CVEs are associated with usc:cereal CPE.

See CVE db query:

sqlite> select * from PRODUCTS  where PRODUCT like '%cereal%';
CVE-2020-11104|usc|cereal|||1.3.0|<=
CVE-2020-11105|usc|cereal|||1.3.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6e936626cbccf6c17fc8b2d61fd2c7d4bcb022b5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 7d4a352a31..914058b5d0 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "\
     file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
 "
 
+CVE_PRODUCT = "cereal"
+
 DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} "
 
 PROVIDES += "${PN}-dev"

