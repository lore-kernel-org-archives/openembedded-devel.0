Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A41C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:09:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7245.1786687766703575368
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MkH9+Gca;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so554727a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 23:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786687766; x=1787292566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbX3MwxCJVKfholyQ+yvDHAMYuiZxljLQORgBIC8wPA=;
        b=MkH9+GcakRDOv0+g5WoIazBLLg5pvVArJZTJPiTQFtfy9y94C5LBMo0MLKIR2i5khh
         VljGuI7hiB/u0VtGNhRG+ULulxMg0MIbhrd/zQt+kL8nz8ego6ffsduG/tlTtM76Kkob
         glnFj4MfTZ3SSjOImYuDKMS76wThF6vJl7n93YqRNmnCGoEJFW/ztwG5CVBvD2CZroGX
         8DNeV4N+txLbT1cEaCuYX98N0z0SH/Eaz6gnDZ3E93Cws7i6ekLXlxGGgOtUX4nRGg5l
         whsrJbTSrQD+FujibyqP2e2R2qXbjdci1E1wqN+K6xNLwWYNQOwojf7tW89ppYcdg09X
         EXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687766; x=1787292566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbX3MwxCJVKfholyQ+yvDHAMYuiZxljLQORgBIC8wPA=;
        b=Ix78XTHeBU+ZLsLmWGh23UkiBHtdPj81PeHVGkuLc46rPyr+ZK8bZ4HbrG9YAwPK4/
         8v4VaAPK885uHlN+NXYm9cEWnVT7Myo7rAG36CsMO9te19enBvcnJ9HR2sO8JXgyQCKp
         XywgYShtNIfezFXb34JWN6BQfqGzkb6F5d+ALBcJXmPiLkPhDsXdctw1wsPHNCnYaEF7
         CxEjB642LMOIHQz4SqxnJfUI/OWFAFI+1dBZN1ilIz2ojWZOeVBDOt8llG5e1YN8kG5B
         4KAKW2oPDK9pQOoKEkJoJag9EgJzxHQ+q1n7m0B5mOFRPN0EHFHSrMfvXCnEmegWQvvq
         1UTQ==
X-Gm-Message-State: AOJu0YxDlAYHw/bkSvaHdDHLe/P5vU3buO8jlByEfMIBt49v7xjxsbSH
	L79WqvLksRJ+9X7e4yq80Ynpk+pktY3BTkzgpuWjRCUu0tWb2fiDS/siN9uy9s9S
X-Gm-Gg: AR+sD13NCeaTS5A2kDEoS4oD7dJioWGTzm//8AlbS4ukl2Er8L2P+WDjxGZxYfFEwW4
	GOLX6OyH/1qhIudXPjs+/+c9cj/ivgqp+nRjFFHoCBN4K2c6FplO7sf8yInXEz3xlCPZIxUnVV2
	drsWcnUeIRfNGvaXkdHbb42oE+73QHhfklFSM6D8LqWImRGC1pLBt4jPWkhvv23nfSfDx4hqCmA
	2qg5EmRn67QbFaQzPFZo00pRXBC+kGc85Pw+chb0jS233lyU8j83ESdwxt/8BENl/I11vA0mmLK
	u5ToNTuSNyQh4MdEkm3obWrw3grAydlcguO8CK2cLhDH30Xt7MT1oTF9U7fyTjsQwU1TFDWGcaH
	pX9/w0lLOqo2Saza+qbY1GXa3GZY0TxMLLz/GgBa2YRApHu7gJWP5uk/ZSw+pub/wJTzaUe+Qse
	L1IoZXxy5ckb9v36S70h0NfQI83B4EHxhq1IxAd+KNdkxGwnusOwyxwqaQXMnMBpoynKHPutxZS
	4MXQXHB5crA2DjSHxi2//QJCPSBMS9a3IMGkefQtDm433BHzh1p4J+9oiIEQ4C0wOmk/HHYjeOW
	ybYfuAg7GMfpy8bpsj3Xu/tQS45OdgKao3PWwJY/ANbfhICCxIBj4YRIjZGRnI1VWRqqwwvz4n6
	OyVsLIH6ejPLlmWM0G/w4/kJ72yu0XUoRfTF+rewB4BDs3A==
X-Received: by 2002:a05:6a21:3282:b0:3cb:96dd:2477 with SMTP id adf61e73a8af0-3cc719c7361mr3692982637.8.1786687765923;
        Thu, 13 Aug 2026 23:09:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm5403326c88.0.2026.08.13.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:09:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pandas: Add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 23:09:21 -0700
Message-ID: <20260814060922.2788021-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129037

Fixes
| * Getting build dependencies for wheel...
|
| ERROR Unmet dependencies (checked against <sysroot-native>/usr/bin/nativepython3):
| 	wheel
| 		wanted: any
| 		found: not installed

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
index 407503277e..a9bae34f72 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
@@ -17,6 +17,7 @@ inherit pkgconfig pypi python_mesonpy cython
 DEPENDS += " \
     python3-numpy \
     python3-versioneer-native \
+    python3-wheel-native \
 "

 CFLAGS:append:toolchain-clang = " -Wno-error=deprecated-declarations"

