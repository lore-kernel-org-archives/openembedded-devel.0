Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E8FC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11413.1784590753690011621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oQRWe7pG;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca957432c7fso7253016a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590753; x=1785195553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tlfQN/VdRH4uJ2h/WcmWX1+Tz+jRYhf+v5kX7k0408=;
        b=oQRWe7pGxxEMyO7FWc6fCJoT0uIOVd0Qf6qKCbk/xBJ1WpS7KJA5GNxDB7ogb5KQ0O
         CW4czovLkYOW3zvXWpK2OWVoTwhf1yTlzcYmTVdj4xahAdDId9CIZglGCnmRGzIrhVsK
         EIJQsfs2yAYSJFvSU8hvZ+E3Pnm8hoz1j6du+udasXDPhYEv8DNJgxxc5ykG/8GiiANo
         YRqROdq61bHhwqsx/m+s3txEaElBw1tcldMF9ArJ0Bc80GTrhfJveqbj6dSjelj7Pzvs
         zTCqN7u0v5iTInFdip+rzlqCVPP3MyFJHtonfWv6F7mcc1O44rkfr3aVld5F004IyaER
         XGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590753; x=1785195553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tlfQN/VdRH4uJ2h/WcmWX1+Tz+jRYhf+v5kX7k0408=;
        b=KfoTXgXoExucEKbTe1Eu43wXPpIkwWcfObtC0XHQ+nkBbKHz87uTjg69WeKqIXCTxK
         XcF4AAo4mEQhIUVg4SI83NhTCTkkLsklv6PL/SiHaSokHJ5kdxADlhkQCRomog0vGJtZ
         MztQ9ci/ypWIBnT9NDaAQ46UpTKHvZxOc1KiAtRa2Nnmv8HOACKRZzP5Af2bpr2pS8DG
         QetE8P2mmB6Yc1k089qMRYhuF6DilbGnbcnoENF/ZBI8iRG/doc9FH/6VTWRU0IyQvRi
         KitFreaGz4ZPk0dK+O6ox++MvlxgZ4eQ8JyQELmWUTL4lOFFnPn6Ju04k1wKVymG3NcE
         AGdQ==
X-Gm-Message-State: AOJu0YxsOQwNJ4zoHR5VGHwvkhkGpHbjatByGTLQ1YuA3Ds/GNRV2XMN
	Bv2bZnQQqzSSIwIP4WjoNBYfqnnMFctCY28svLLMIwePwMXOshuxLltg45JXoA==
X-Gm-Gg: AfdE7cnuyx/uvJpnJ6ydSQvnklW/dGws1yY4M4wTKQ7Vas8vycsiAotTqEUQewRn6yJ
	QtUkQ4j0ZeaFLwlx0SWcay2hkGPU7EGZGc26X6JUp8scDLYwK1P/WxCB9WVi6My3luBwsD/KdXY
	jheeLezeyrGdQxoWE1dlYD+YrWlTZaUPb/ORup3wlNAZMTaVG8ee5gM0qeV6pRW1mfy7/1oJLWB
	K5T7d3AppHtA1aXB4aIVrarhSwPX7duSqLg9IeUyJ7c88baZ3Ec2AVlAxq0XQLluhYIZg6M0yOK
	WjhGGLSMCV7yDQ3G2jZUpSWUZVXiXi6IVcTNi4VdX2ZbxrHZBoW9DjOi5n76/sX+CHsI53+QT2W
	B981FCEJSAcMcBwWV0O+0xVBSSV9U6hZQ+PjB7L3ahcTTpBzL6RmqfOSaeaxCtw3Z3QGFMSY8nB
	m96VQ8NsUxkBQDKzn0HF7q6TkWGg==
X-Received: by 2002:a05:6a20:3d82:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c3ad67711emr16874915637.26.1784590752999;
        Mon, 20 Jul 2026 16:39:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 19/30] monocypher: upgrade 4.0.2 -> 4.0.3
Date: Tue, 21 Jul 2026 11:38:00 +1200
Message-ID: <20260720233811.2324493-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128320

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed timing leak vulnerability in EdDSA/Ed25519 signatures.
- Various minor documentation fixes.
- Various minor build system fixes.
- Various minor compiler warning fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 25cfd0324c734a6d7550629fd0e8ab751d0d3adb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb} (85%)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
similarity index 85%
rename from meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
rename to meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
index 178f273ae6..0c8f090cf5 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause | CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"
 
 SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
-SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714"
+SRC_URI[sha512sum] = "40904ada5c7ee4f7741733e38b69a30a4b0561cbffba5ffe7c2dce16136d540251ec0d9056ff606510d3b5b708fb8a40db7e0870d4a0b2dc17ba2bfb880f8965"
 
 MIRRORS =+ "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz"
 

