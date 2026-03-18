Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD887FED9E9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 00:37:53 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4007.1773794270681732632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 17:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ju1vOV1B;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c739d32b72cso4385782a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773794270; x=1774399070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xCBfcCElxwPuP2FvVP8xXoRTYHrL/+tfCXJ5eg+Ud4=;
        b=ju1vOV1B6+jtOWiQGmrYJduVHN/N49ep+3stWEmc6yhbxpTaN2g+AEJwvIw0r11knQ
         pk8bHg8t4hX/f2RCHVh6pZim5fuGrliRTZDgjcCxOnZXVjwPJxB9/37SGinpszzk736H
         vZ0KcxxUKEVVv4LnWbzY3hdzcJO206ucR3QmQyywun9uVwU+sOh7AYTo5ORBqGxanjaR
         YVC0BZzf/eoy09OaJNeP6Qy79BvUBlclOYXiqzGU43KYTX/wMWJmxpV5qQdRER7cv65N
         Yib4vHoFXgyLCp9zGLIYLppiT5uB2DpITYaY33RZzMtrjtJt4x7jL8+2zHffoCZGEgqp
         PnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794270; x=1774399070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xCBfcCElxwPuP2FvVP8xXoRTYHrL/+tfCXJ5eg+Ud4=;
        b=s83Au6Qj29q3kh7Kh7M10XbR8jQsmpcZ16IQwuC4XGEoMbKeaCEOo2ToajXsG7oO1g
         fEao4FpBjnloqTKHqfQTG5aX//YE2lyBA7ViIaxYPt42/oLSRXq3q0LyXW1RB+mIKig6
         Fux5dUfYtp2aFHjwDFE92cB2xapnelBWHyKR7OAfVN0dbcVIwqG+DFqkIRa2qtd9io3h
         sPbGAIE1vvJr/Vual4qP183v7etG/+36L1p9s/zvJEjqQbTr9Xsg35VmWa5xsnye7KCp
         3TBNBYg84INi7UxtOFgrMjC3nllWhuUIidGp1REada5+itGQxBW3J7r0w+4qP1CU1IAH
         euyQ==
X-Gm-Message-State: AOJu0Yze1GdjdA5q6+5zLz+1y5591McRsXGxo3eNnZ5LSObLjMTS4i6D
	7EU/OOR0SnF58wj/cDJReFP89eYFsDDqf/4AxJlnNxvi1RvpLcRNkHyV+3Bvog==
X-Gm-Gg: ATEYQzybskkhtM489cBICRXo36QUAbM/QGbpb8teX6Fjzbd4Ugjhkp/GFXdHXxXNWIt
	ju1FvgevEFJr6U9Ywg0L4N981HVP8RhW18fdm991VyN4BBaO5P1HxlFOPz1M3D9eyokPhg/+ZjX
	CBVDWtLRpC1swH2x0p/Zq0AeN2u9ADtFomHYwIoy40tyxCPVtLUMdawcilw2cVwvcnJns7ZtXKK
	iC6KuxsoEUd/fklu/gOPn6/vHuxiLJ/qqXKkoBdcVN98MEcKavI5XofaTYPjke4/OBr29dOO6l5
	wS7IQcjfpP+Yq5i+Fa6jlabRYASeIq3gIKe5XCoUfjw5AEXyZsrQVEPHoGUFyxkGWhTeZkoXR80
	cNGQyBwaBYJDwUEGTJaUHYYCTCzbJh6vEfV4E3Cw9PKY8VojUGduAqqp2DE+v2Y4qRHSMz24Xnq
	gpnYKm7vHIJyaSHMktYt6+1c+d0hTiruV0vb0=
X-Received: by 2002:a05:6a20:d489:b0:39b:83cf:ebb0 with SMTP id adf61e73a8af0-39b9a08bcdemr1117694637.66.1773794269808;
        Tue, 17 Mar 2026 17:37:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56df09sm660405b3a.21.2026.03.17.17.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:37:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH] libde265: upgrade 1.0.16 -> 1.0.17
Date: Wed, 18 Mar 2026 13:37:38 +1300
Message-ID: <20260318003738.1661103-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 00:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125336

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also fix packaging QA errors about staticlibs and dev-so

Release Notes:
https://github.com/strukturag/libde265/releases/tag/v1.0.17

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.16.bb => libde265_1.0.17.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.16.bb => libde265_1.0.17.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb
index 40910633e8..cbf883910b 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.17.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
+SRCREV = "f3d916c8e63e510bda1f9cf5e8710259c22afece"
 
 
 inherit cmake pkgconfig
@@ -21,3 +21,5 @@ PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,virtual/libsdl2"
 
 FILES:${PN} += "${libdir}/libde265.so"
 FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
+INSANE_SKIP:${PN} = "dev-so"
+

