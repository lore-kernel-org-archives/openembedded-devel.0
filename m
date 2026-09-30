Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB90CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:06 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138.1790811060097801663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X9Q7/25w;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25400so2447326b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811059; x=1791415859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bhHJM3kykQlA3fl+x2c+tUaQu9lQgsOKReLuIQy35s=;
        b=X9Q7/25wc0amq20pxRjJ7GDDwbu5fkfbC7887RtzNIk6awSEbn/+wVzgpvagkZzMwm
         yNI91pPJD5B0/Yg/r5HylHGN8RUZViZI1h/aSlJ3cBzM1z6gDnSy7X8o3NWcFKAUStwf
         1tcV3M1mQzEd9zzcN3yCSbaNt9vPMdLp7EykC7NhmR3sW9ZDJAlMb5WB5DuXAyv8VAxx
         E3S0eUXUXZpugko4sFtZv6XdqPQ2u3FSvmA2V21yKYEZtscROfR5LNQV789XiVdugodD
         ZT3EydxdJSLAJWvQl/wGXgB97r4fmrNCWnSg4IXVBVZg5Pb20am4/rGts9sk4SXlQCyf
         UMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811059; x=1791415859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bhHJM3kykQlA3fl+x2c+tUaQu9lQgsOKReLuIQy35s=;
        b=w6492+B00Un1MX4lfwIfzeQ1Cuff24JKXCDx8f1EdXZw0RpUT/WIkjjEPbZIZe1k9e
         FMk4ozalzwfKpIcvBJxvYqNrYeAeINEA0azG9fgG8Mf5wc0kqKkr+wfMaywN8qkqvMds
         dAzyJd4uOP5r6/+Zi1wbnJOkMz0Q4zmQKJ1bUOvMVe5ezzlqMVptgabjfC6QiOnwzBm1
         KWM/gd+3TboZv8hQE0Fbh7cR7PBHsokkBnKjdt3aArJmAhQ49ffnR10oQnwlCLfFyXrk
         MVs/oUrx6XmitWdLbUZ7omMNTJ092DMXT5f1FO9928+xZk4hc98kw8OhX9brUv9Mm90K
         4Ozw==
X-Gm-Message-State: AFuF++mgmLnfix0tPIPW8X+Jw+PXqcdi1GbN2mX3pID7QUZiO1b38VxC
	dc91VbTFql4SChVaQcg6Pq71IB4pAtJTAjR+kEqyszL/756ssGYm6PcQxzzLIA==
X-Gm-Gg: AYBFou26ZTR+07R7c2VWAhQBrsuf0KaK5NiowTw7obx3xufaAQ3kOuG4/ZTS1soKlVg
	bbEcao4NXXY/L1BndKbBE690QHt3LqivHcAKVH2iK7oeC7HNWemi/u8c+9CR6jtMITRkMl/C+2D
	ftqpFXJmEujt8b1wLGQOzIbrPfa9fFmCdnuQqLMQltfi3E4aF2H6MyButA29eDGUY/qeiWPAcBr
	y+8CQhZPmOU147RVM1SRGNV0vJJSRBmwNJGMdL3n3sczWFKL7QjtZwGb92Q63kgoU6Bgrei8BRk
	97WrY1XLjCYrUoQDnGH9qiO9zwsUdeqQJItwxIjLcrt3GZ56nlyNk37svdaeEJ08iIarTN0d1kI
	DrzHQaVe7brntEuALGjVxHLchlkEfvXKm+LLptNkj2pc58gPzvQuRYD3ISAKboH4Ivsq30WPpLl
	7nCeIX/s+G8IKTYJzkYrZ9n6+JwfurTIKwVVxGlPMq3BO1wuB/hqI85NEwyptjxpSsdCNvTPKwD
	CMx+5ZoyYrv9Nrzu1sUlE8=
X-Received: by 2002:a05:6a00:1ca9:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8874b5468d3mr2016675b3a.26.1790811058855;
        Wed, 30 Sep 2026 16:30:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 8/14] exfatprogs: upgrade 1.4.2 -> 1.4.3
Date: Thu,  1 Oct 2026 12:30:28 +1300
Message-ID: <20260930233034.659237-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130541

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/exfatprogs/exfatprogs/releases/tag/1.4.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exfatprogs/{exfatprogs_1.4.2.bb => exfatprogs_1.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.4.2.bb => exfatprogs_1.4.3.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb
index 2b7a95ed25..65e93b2e00 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "47c7c8ddeccbf50d39b903353f2cb3df79134367a4fd764fe2ce3755ff5877bf"
+SRC_URI[sha256sum] = "57226a8ec1bfbce06d68a42cde8cd980414a9457882e691fbce4a4f86c8d5f08"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

