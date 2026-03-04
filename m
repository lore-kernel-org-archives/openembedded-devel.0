Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6313FEB362F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:55:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13061.1772609228652086827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 23:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hB/A+vSe;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gitbeam@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483bd7354efso86935725e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609227; x=1773214027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6UK4erm52N3KD3s0YvYwPjw+EH8rDbf8OekFC6G0YNU=;
        b=hB/A+vSesePOJoM69C+VUpQq/qTHcjChTcjrWy1kMagbMfeaypPv8EGsdVxQ/eUIEx
         9zI/smAxnEgJe3/WM7hYWcV0/T5a/+jhmezif5JpwrcUKZW5o60Mqi+tfI4pX+B01OVS
         OgwLWFgJJNawPAF5Sp6Y0oVKRl66U62oQGD2OVcdKRnX4cLLM5khwOw5GHf5ArnanCbR
         VuDO8xmbgaeLxkbiReDcA7RME9FG4zCkFdHBO52e1cJYa9iNFbejWxQMtHbEByYjZ8BD
         kpRibqvbUxPj1DnUqlW6eKEZhQPV/O3wm+bIOg51oBuIYWsgULDt+oEkbovE24Zbee0G
         sAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609227; x=1773214027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UK4erm52N3KD3s0YvYwPjw+EH8rDbf8OekFC6G0YNU=;
        b=ZUa3tSrg53zjlB6O+p2syoEZ3xMCJu1QHa5sJaTVbHNzYTgVm3YmJjc62xvO9Kwrrg
         p1fWs9sTCoasar8taMU72r6r8P4vGNtEBQgFmjeqwfpTNRUUsviDFvL0MxDnEF+4mwCz
         ly/IJ4wQ4NI6hpBmVl/pfRl3xuM2ikB7Lc7/ZRfIWBLr0WfG0OyWnCXlHJjjn5mL2O8n
         KNp2MWW4bjHFp2uZbYOt7ygsnam/DVGH3FwTx9nwPDodelWk++3p07pFTPdDpoCEYEJa
         ve4kOM7fyEgyukARw4swQr1rgxrs+ms/OmOxuDjxD5FLkxawulm4u05C0S1iKQO2/cv2
         0ndQ==
X-Gm-Message-State: AOJu0Yyi7JzTyo6YBlhRGfau4mEEK1fNUEs7aV5Dn+l97E2qK4HFJXJ6
	kqv6LkFr9xETtpeoivsE77QNTmPso/6pNU0pLNungMYefRfuLi5h5hMNRG6wM1cbCbW5/D/+
X-Gm-Gg: ATEYQzzkU1qt7MzNq4Bo2uWkWW1ZIVwJN4RI+1MbPLybvrU6MYj/aOMEWG/mTsM7y+P
	gd45zf7z269gXnQG8vRE/+aCgfhs0TasS3slvwroqOGVYdO0XK1ofvKb4pR7tKgibMpIxCdmYZq
	tdt6a9/q84P0uEfV7TcAK9yeLRSMi5Poe6u0138BrhJgPXmrRR/Qb69fNgfQzDkqobJEyty46++
	O+gOmNKRI6z7Kz8O3oL92KwllR0tZuwSEN7M6Uv+OMzx0jxoG85CuaDpkCnqb5qkA0tOt2SYfGb
	2lSf8WhPr74F7J2/3rCO+GCzZKH0sgRMr8UY++rhejGAmo97cFzK6I8n5Zg/sSuQbbIefohEHMR
	qmbObm3FvlLQ4IujV2Lr8FO2aEq/f9C7eWTnfAABcNC1CkT9jTRmhpj5ga2ateaWLFI7wTBvLjX
	hzp6wFYmYT3hlVmhJbc7YpPk8qYxw1jqHG9lRah4WgSzwcA2NWf+Lb1WgSdffiP2UJtdYMORucK
	ns0WLP7PTRJzm20XCxOERTr9Um6sA3U4vHs1oRYrgvE7ErYBPdYg4BjrnpyJIv5pO05mSo5d5EQ
	SQ8iALo=
X-Received: by 2002:a05:600c:c84:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-4851985df94mr16756325e9.15.1772609226692;
        Tue, 03 Mar 2026 23:27:06 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-095-119-200-146.95.119.pool.telefonica.de. [95.119.200.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851abf97eesm4533745e9.0.2026.03.03.23.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:27:06 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [meta-oe][scarthgap][PATCH v3] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Wed,  4 Mar 2026 08:26:56 +0100
Message-ID: <20260304072657.4926-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 07:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124841

Upgrade to latest upstream release 1.2.4.

Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (88%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 88%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9ad97e7689..c9a752cdda 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"
 
 LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSES/BSD-2;md5=653830da7b770a32f6f50f6107e0b186 \
-                    file://LICENSES/BSD-3;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
-                    file://LICENSES/CC-BY-4.0;md5=2ab724713fdaf49e4523c4503bfd068d \
-                    file://LICENSES/MIT;md5=5a9dfc801af3eb49df2055c9b07918b2 \
-                    file://LICENSES/NTP;md5=cb56b7747f86157c78ca81f224806694"
-
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6107e0b186 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
+                    file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
+                    file://LICENSES/MIT.txt;md5=5a9dfc801af3eb49df2055c9b07918b2 \
+                    file://LICENSES/NTP.txt;md5=cb56b7747f86157c78ca81f224806694"
+                    
 DEPENDS += "bison-native \
             openssl \
             python3"
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.47.3


