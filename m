Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B42C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 15:16:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.100466.1723648559428636454
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 08:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fM0c1U8j;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fec34f94abso59265725ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723648558; x=1724253358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPSUCGyWucvfCcfmNKcpwtOz1Lv61WDAj1ChNRAT+Z0=;
        b=fM0c1U8j5jC07d31ammUazKa7DiXGGitRQBBrGAGMjyfiBUMp89C3CmrJ48p5P7SKH
         z57ef1G8iJ0sMMPqA4zKmyc0XPcP8ouPX9ygAgewN+ygd3WYn0d3NPJw7N0Q9c0ciAxX
         8KFvQVQlTS2FDOz5L/ISNsGH+GC9CHAjMBlaDLKBQg+vbTR3FZA1PX4KlI2vLqLcv/+J
         Q5k7evKcYGMN7v9iiLxFse3ig3Efhq0yMyj2lQNkInk1vQ5RQdJ9KJHoDPSqIwcGXBxo
         FzSZoN2j79vrmnT31KeiQfV4V5DokSKRFNhAlc2VUceZU3WgZdBruIJB4o8FmvNtMG/K
         4PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723648558; x=1724253358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPSUCGyWucvfCcfmNKcpwtOz1Lv61WDAj1ChNRAT+Z0=;
        b=YbBLDwyuiFUE0MQAUOHlbzExZOoqV88NPV4b/ddAH4xNE/2qDM0w+hbfWhFWj5JiNT
         RHSwoVEsDoAFVQCTOKaiSz2/1nmx11/dQ5PvTFtg/obhRv78AerohIhL//Pz0KCPm/2H
         MnIc+pJAjvh8gqKh7l8T1Jv5sjKFQYuwhBMavyzHEhS/tQvZb5T3EjDLslz8cn2SNubu
         69w/Lz+wCf779zkW83t6JKl/WrrgKA7eCSUqY5wAo+PWUNbCuy1+4S7bLQR7YFInzS2k
         CgLkOMpf+iUCWc2ahZRWAub2DU3Z+qWMHQeSlk4T+44Ak7HAeClXTdrEHYVwedjjSw+B
         +5Cg==
X-Gm-Message-State: AOJu0YyQ+yxONTS3fPADHDeJFBamIzGBWrlCQoiFz7aL7j+q4Yd5ZKWE
	AYoiViN96VhJ4LJR5giUVTaKvY+D17YVyxalXEIPJJ0lkcjJ1h0/Hv5vkw==
X-Google-Smtp-Source: AGHT+IEa66IjLf5PSUFLUBl07CvPiEn8hFjkedcCuxnFVOs/3tHzRCNXmkjSO5gKijv65AmH9wnhqg==
X-Received: by 2002:a17:902:c40f:b0:1fb:35c7:8eb2 with SMTP id d9443c01a7336-201d6517933mr37381355ad.55.1723648558414;
        Wed, 14 Aug 2024 08:15:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1cea90sm30523985ad.281.2024.08.14.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:15:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] e2tools: Fix buildpaths QA warning in config.status in ptest
Date: Wed, 14 Aug 2024 08:15:55 -0700
Message-ID: <20240814151555.1958204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 15:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111806

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
index 1fa5e01874..a0d194cae0 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -67,7 +67,7 @@ do_install_ptest() {
     cp -r "${S}" "${D}${PTEST_PATH}"
     rm -rf ${D}${PTEST_PATH}/build/config.log ${D}${PTEST_PATH}/build/autom4te.cache \
         ${D}${PTEST_PATH}/git/.git ${D}${PTEST_PATH}/git/autom4te.cache
-    sed -i -e 's;${RECIPE_SYSROOT};;g' ${D}${PTEST_PATH}/build/config.status
+    sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"

