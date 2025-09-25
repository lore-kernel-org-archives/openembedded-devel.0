Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D831ACAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 23:12:16 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.4719.1758841934361007189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 16:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6B9K8Ej;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8f3dafc7217so166785439f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 16:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758841933; x=1759446733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sDvpKTWhwA4xhyUgV1fpLo2i6258Ecr6je1zeqDcUNM=;
        b=e6B9K8Ej5aTPIxKL4WxVgNs4a9Ghe8br+UHWN8SltOBwOQflAUbCGBAE0Y5uErPkXn
         qU2vgOCMAsp4pBpraMNtkL/Wc1zIyUoNyWFlVB/EQitE6ePftmFQZwPY1AvQgrOIJzM6
         2TLHP7KMrPI/0DCQxod8mBb0cjpiJFcN6Fum8ek85mFNQ4cNkxrbW6WPuO9ZsBRt/NPW
         mp58Y45A90FLm9F6EGKuSX3/ZKTGpP7E0RwnRAzez/VMYlWOB1Mz/RUdcfZR1aqnQShn
         W7uWToQnD9DskDkgrHotn3Y23/PvCtpNg4BUJ8d3vGoYxkoyUg2PFiiJO3fYtYU+foQJ
         WSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758841933; x=1759446733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDvpKTWhwA4xhyUgV1fpLo2i6258Ecr6je1zeqDcUNM=;
        b=tMk1CY3Lmm6XwaVNv7amCzuMGQIn2xXWMplK/Li59yDEiqKOAvCuIRrqPOlqRfFXgN
         Ox6I8XU5wkXAmjGvVM9Powv1wJHHbP+XA4Z/yGmqNl2x7jvBA0tCZHXrhxQ9bgpGdjFi
         psfbjB+ZmM6uZrLZEOnC4GfktOYo0cAR2pMnk32+kv+c6iOs8rolMK7Kkv4MYJnZK9qa
         +QkXyN55+4weA3QOOONbwzZLnOlUDG984a61GbtSJOdR2v1IOfxZbls45nbBV8BkGVhl
         egO1v6RDDAhUqvN9ktsp+nvZbpoQvBszS0zCQkGaMPLaodBZAvXRZUDEpJzHomlfQmgq
         h7gQ==
X-Gm-Message-State: AOJu0Yx8drBMPFkfIoNwRP2IHLSg4j9o1Pag302liYWkGXigX4HNJy9G
	KDQkt7K79xQ7UdyoTBfGOB5t356uygYZEQMsIsNauMR1dlncKfJtGWLR+NbMWQ==
X-Gm-Gg: ASbGnctPVBQ9fJOEPkIaTLmywg1nfVCm/AXrMdP0pWthHSvlHPYNfLUImaPdE11q7XQ
	yUSbBOIqrEWKYq94BllkLAYH8nOzfiK+exfrqkW5OsvNKrrX9K5j4ORRy/7wT3gPSbbG6uaKBia
	7Rl6vyuX3WIjeiKGPD6GLnDxKSYXzCPwApjsBBREQwQeT4Qd5js43cs0iD7MF1rbffNvtXRBGCX
	lVVS/56Gj5sK58k7VpClfFxD5xImGNkP7JrVe8hRxDVcLq34ziOTdsJMLchABdBRwRtGbhRU4QD
	c2iMsAq7u8GxtkeD9A2AN0rPhwD5/nlXNRY7eF/UYTYJJMKOmgSZ011O9go5iNZUWFSgkNxbzSQ
	rFNCNgHaT7XcB+UCGuMjPZPKV6Mw7j+8i24N2wtGq4t0E+yHE6qToerWEKc89Ax4=
X-Google-Smtp-Source: AGHT+IESRCA1imxcS1KcH3D8mfpPKoD4shGwzcSVETYnYwawqTB2ybn9mZIa9m7l+WtUCk2VVNgEWg==
X-Received: by 2002:a05:6602:6c04:b0:887:2a8c:9226 with SMTP id ca18e2360f4ac-90166d9ee89mr95729339f.16.1758841933345;
        Thu, 25 Sep 2025 16:12:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a69c07e00sm1277819173.47.2025.09.25.16.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 16:12:13 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master][PATCH] lsscsi: fix versioning
Date: Fri, 26 Sep 2025 11:12:06 +1200
Message-ID: <20250925231206.813116-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 23:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119887

PE bump is needed because previous PV "030" > current PV "0.32"

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 9df6ee9efc..40c01ce2a7 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
 SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
+PE = "1"
+
 inherit autotools
 
 S = "${UNPACKDIR}/lsscsi-${PV}"

