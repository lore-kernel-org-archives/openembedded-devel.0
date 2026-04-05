Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA30F3D5E0
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:50:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34422.1775393399774818213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bYDLsmo0;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad4d639db3so13317385ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393399; x=1775998199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUKPmSAVoyyl8MeOa9IYBd5Xa2TLSGZOJZXUmXFCuD4=;
        b=bYDLsmo0UTVYy8WLv5YaPI/VxgMUY+czw9z9iCe0wtJ9K8lJJI3Xtp/uE89hKQzjt1
         zyt9jqSVUyBOOqOf4fn9IQIlUthohq6w7Yro0/yCE3GX8WM+BSMiWUm0Qky0KpYimE0+
         1dFMhmJLVjkzaSB4FYqSuJYM8g12+d4y966YaIFjWQu7TURRnSjUQa2Ivf8/gH+XM2YB
         KkgQzy0J69tEkw0GgZS5vUP2aej3Y5jp7LGgSrfEltCK1JwqQTqczq30zJczTwxiHBb+
         U4M8tn1wvhZNLThzl2M1LwO6GlZ1TQHuTkY8suOxlpG9vYl/N042s2PpBMWu/EonaN7Q
         6NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393399; x=1775998199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUKPmSAVoyyl8MeOa9IYBd5Xa2TLSGZOJZXUmXFCuD4=;
        b=cdibCEWCu67+2im+C1sx3dbcZLllvsy/X0C95H88gNMpL38Y/jQh7xgj1vq2S4s2LL
         gFedHpqmUAe9TktQqq9QHuXz4x0ax0KkzS635/NoJ1JkMtaSAEc+e8y59vZEtNREeo+Q
         hbiqAB3CFETxWIvpqx18Ca+wOBxkPkYOi9/1/HK0o204swPKPn5HQl7l3s3T4Kz5UUwW
         QHJPB1487BdDKBlsrmfH6i2eXP/oYGuX73AoBr7T+ESUQ6x60qh1c2ZU1fLOppSWyeha
         stV42otskYgh/sLnGOEnhgSqdfMJMHiwHZWASY9/wT1eF93T5V+q2KhpcAOSxk/NIbdx
         0X9g==
X-Gm-Message-State: AOJu0Yz22vHuL+X0AfUoiKzQg9nQaoi9mzO+e1JXjEc2QYBRM7P9bGAI
	LFVMKz75Ea9mEtIqAmVa6g8ChZqPP6R/kWt1jY0wUa07lEokpo9DA17d2CMHSwFG1rM=
X-Gm-Gg: AeBDieseReQU26tTbs9CKtgrjFtavX1kVT4zUjcd7/s2+HIebLgzkhJOUzm3heKAge1
	K4X8MEQlVz4ygBYZpLE38y+TNMJlSY/ZxNWSRhg4HfL9ow6pXA1qGMHpAUJtMjJJDAs7vsratSB
	HiKVSMJG26krAc0NNGy1a+iIvKPnFQqwh8fR9meITtBD5oXxoAoYZZhduBc9OEowbgeHCi9rAW+
	ynLUlRjs8Kg3kAifH20YRgcxQITDVSajA/HZQsZFo3WTS1PxQk9Mr3amnN+ueLyiOzI73ZsoJwU
	O2gcY/gf3L7C1P0atKcYWb7OGzoOIIzxYIMLAknOm1HfW54LmW1Gb3kB1B6WMvtIi/ekRcnSyKg
	RcHbzN6E61PiSEGZ8NZcD7qNi4cSHFnuvFdw8Pad13ELsFXy0LMthbj/Qp2TVX58Oq94ZvKNCHj
	Y0BlBfw0o4DGPme6ER4agY8xVWxvHLeLd6TM8=
X-Received: by 2002:a17:903:3846:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b2817cec78mr103619045ad.5.1775393398996;
        Sun, 05 Apr 2026 05:49:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 12/14] freeipmi: upgrade 1.6.16 -> 1.6.17
Date: Mon,  6 Apr 2026 00:49:14 +1200
Message-ID: <20260405124916.2881008-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126011

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changes:
o Fix exploitable buffer overflows in the following ipmi-oem commands:
  - ipmi-oem dell get-last-post-code
  - ipmi-oem supermicro extra-firmware-info
  - ipmi-oem wistron read-proprietary-string
o Support --proxy in ipmiconsole.
o Fix mem-leak within libfreeipmi locate api.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4b4c770ce56d58a0a6eb635f03761499bf7603d3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/{freeipmi_1.6.16.bb => freeipmi_1.6.17.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.16.bb => freeipmi_1.6.17.bb} (93%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
similarity index 93%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index f5be870b1d..50a1877c0e 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d"
+SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"

