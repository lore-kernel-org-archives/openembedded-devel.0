Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913E3E7C4E7
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 17:30:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.25490.1696440604968551296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 10:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQdPRIiU;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so359845e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696440603; x=1697045403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LbkydAg8I+qlF46XMe04TQGTyR62x1kwVg2dYnE3s30=;
        b=SQdPRIiUvLiosyJQydo2i4nx+QvPkrIgBIzuPfkrvZtkiPNvkBYBwvp/+BadEHffWN
         bIxBj3xxieGV91UhVux+VqLsIf/h7GJlaQStjG+AtXiV8fwaFET0b8+NNXIjEwpmu/x6
         cw6Z0A7A2cF5JXXSznXx74hUBg58bXDI0RNFbRO1JyR0bYJGvl5m5qKlUVx9a+uKAfjX
         NGR4RN51nssLO8EQNwEgMaxs+c8L7UxFRhyzVcLOrp10BzJJU0bEZ24zHgdcH9AX/5z7
         nu43jyrBA8sictfp6cUD3jRnrzI6CpVHPdq+fgVao/ftxUT7n+jkREozRIIFN509r1Qd
         3T+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696440603; x=1697045403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbkydAg8I+qlF46XMe04TQGTyR62x1kwVg2dYnE3s30=;
        b=WsOlQVFa9nAezIVUCOYshQ6YKC/VkDV8hz2cVzckewWQXbUeS2prBP0jtMDUhXciK4
         OYxFVNd1iC/Qx23o1NEyZjnroTQ109t5orYW3CTnKSEgGBrUVy+5r6NA9Rrocu4o7kLH
         ZkIHWjQy8Kkh2Qmm51UQ8/J2nZWQKfSxNvFk9juI/T4gJv13v5mN/Vn7kYl0dkuIadnY
         BLgDtM5XqX2F0XF0dOuB+iIVCfvo+q9h2y6dl6utLw0FMxHD+qWf9T6YfXph3wecPlaQ
         g4ZWJDNyPSkg3j76/RCcOKyHgepH19GQP9HvaceDjdGYGDr5slP8F/Ha217ch01o7Qhs
         CfbQ==
X-Gm-Message-State: AOJu0YzMICOnRC3vdLkZyfYqd/doAAECca89wF0HvpElydzVEEpICXBu
	WaYVM5Xa9J4HKpnXa6EZ96Rwz0qviPcUeQ==
X-Google-Smtp-Source: AGHT+IGMEw7f5g3QrKL1lMUyAhpfGl9VxUw7DREdqbhf2xu9eeFh/rXM0yuOiD4D+LkOzPIsi9CZmA==
X-Received: by 2002:a7b:cc07:0:b0:405:3ae6:2401 with SMTP id f7-20020a7bcc07000000b004053ae62401mr2903785wmh.14.1696440603226;
        Wed, 04 Oct 2023 10:30:03 -0700 (PDT)
Received: from arn-bsandu-l4.corp.ad.wrs.com (87-168-141.netrunf.cytanet.com.cy. [87.228.168.141])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c205500b003fefaf299b6sm2022911wmg.38.2023.10.04.10.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 10:30:02 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libnet: upgrade version v1.2 -> v1.3
Date: Wed,  4 Oct 2023 20:29:56 +0300
Message-Id: <20231004172956.103060-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 17:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105340

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...64_t-instead-of-__int64_t-for-mingw-.patch | 33 -------------------
 .../libnet/{libnet_1.2.bb => libnet_1.3.bb}   |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
 rename meta-oe/recipes-connectivity/libnet/{libnet_1.2.bb => libnet_1.3.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
deleted file mode 100644
index a32414bdf..000000000
--- a/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a1659e261888bdbed51803132d52d9a6c6803c8a Mon Sep 17 00:00:00 2001
-From: Joachim Nilsson <troglobit@gmail.com>
-Date: Sat, 19 Oct 2019 12:26:26 +0200
-Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
- build
-
-Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
----
-Upstream-Status: Pending
-
- include/libnet/libnet-structures.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/libnet/libnet-structures.h b/include/libnet/libnet-structures.h
-index 6084caa..34fffc6 100644
---- a/include/libnet/libnet-structures.h
-+++ b/include/libnet/libnet-structures.h
-@@ -49,9 +49,9 @@ struct libnet_port_list_chain
- /* libnet statistics structure */
- struct libnet_stats
- {
--    __int64_t packets_sent;               /* packets sent */
--    __int64_t packet_errors;              /* packets errors */
--    __int64_t bytes_written;              /* bytes written */
-+    int64_t packets_sent;               /* packets sent */
-+    int64_t packet_errors;              /* packets errors */
-+    int64_t bytes_written;              /* bytes written */
- };
- 
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
rename to meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
index eaa0a0445..b4648832f 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07f291bf6e78efa05cec668cf6a09acc"
 
 DEPENDS = "libpcap"
 
-SRC_URI = "git://github.com/libnet/libnet.git;protocol=https;branch=master \
-	file://0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch"
+SRC_URI = "git://github.com/libnet/libnet.git;protocol=https;branch=master"
 
 SRC_URI[sha256sum] = "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e7779fbb53339050d2e"
-SRCREV = "deeeeaeb84f8bc5d2299913d4ccf53d0d4c26966"
+SRCREV = "deaebdfe2743e8a6f04d3c307d9272afeeecfade"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


