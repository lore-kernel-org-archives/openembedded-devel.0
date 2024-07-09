Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4377C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.1265.1720539289259130658
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 08:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ta15NnVB;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso6320126a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720539287; x=1721144087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYcGFBoUkeFV/Y5cUJ3ns3sVlkZ0MckHZycDjz8OXDQ=;
        b=Ta15NnVBCnBrjgD+dPUnaUUFSCwh2/Bq9sWLvkqMUOzCR9yg7WI1YZgP+7n2FtWzgE
         ySer5/PmYVpfW9ELBhQjI632ZPAPTKH2xwJhAAsMN/9wwpjOA8AfbsRDZbSchUB0ruUi
         /to0/uyz1PZ1NYTo4pVOWDvTAa06BiXFybpTcaTIPWqb4uUFDWlul1bPpfGTs9yWzdJT
         V8TXercGDrpCU/Hkk9sDERyvW2GEvsTRISy/VgP21Y1aQH5znl5x8kPtn/LRFK6Ux5oj
         rOPo5nAn7aj9QAfzw/OURqmiEAZuTCpK2Oc0Q33C7FXPvU/IkZBUivTKOT6PMP7PCIGs
         FMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539287; x=1721144087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYcGFBoUkeFV/Y5cUJ3ns3sVlkZ0MckHZycDjz8OXDQ=;
        b=IX4js60J/lXX+0x60J6qd6lRk6EOKJsZtS/w3cBk88egCtSPggrAbXl2GSZ6q363Ks
         bDYsIuhHbD/qt8S/KvPXnNB0Oyz+bn+ENdlaVPnKiAPPc/jC1C98K/qGlV5ZPWo2U1/5
         8DJn4hevDOWjWmY87UI7X6tCgQOx4hGLBDBA1uDbZRV+XIhkX/N82Fi/gy6lEMYH6N+D
         tRFP4OdRcL9BuyFvCmzmW7B9a3khtz7Psaen4E4P3c1QkF69BZrd1Iwoo5mRza3OUFOJ
         l7nbpksgCPlipWA6CuzuFJdIb8CbGDPN+w5zZ+E3h41CPLlYuFpQbTjtoFUnxf5aZ5WH
         f/6Q==
X-Gm-Message-State: AOJu0YyA5mx8PX1DROaPIwkpS6Ud2s4LW6exZVT6/w02ci5peZUmTXHs
	iP0aBOyLWGrq9bwokVHI1b/l8/2ihsRolfSoXGQBB8AVTSwcAmo50s6D9A==
X-Google-Smtp-Source: AGHT+IFvkFou1S6kvbfWnajkwfEiqlQvbSso61DXYLief52oXVHSjSRdhwMj9Uhe3Kx0fq8sX2snEQ==
X-Received: by 2002:a17:906:4957:b0:a6f:bf0f:4209 with SMTP id a640c23a62f3a-a780b7052b9mr196104166b.42.1720539286934;
        Tue, 09 Jul 2024 08:34:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc721sm85141966b.53.2024.07.09.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:34:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] bolt: package systemd_system_unitdir correctly
Date: Tue,  9 Jul 2024 17:34:46 +0200
Message-ID: <20240709153446.4111765-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 15:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111286

* ${libdir}/systemd doesn't work on multilib builds, where libdir might be something
  else than ${nonarch_base_libdir}

  fixes:
  ERROR: QA Issue: lib32-bolt: Files/directories were installed but not shipped in any package:
    /usr/lib/systemd
    /usr/lib/systemd/system
    /usr/lib/systemd/system/bolt.service

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
index 4688ae860b..c278a0982a 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -18,5 +18,5 @@ inherit cmake pkgconfig meson features_check
 
 FILES:${PN} += "${datadir}/dbus-1/* \
                 ${datadir}/polkit-1/* \
-                ${libdir}/systemd/* \
-               "
+                ${systemd_system_unitdir} \
+"
-- 
2.45.2


