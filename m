Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4221C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:30:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.31177.1701869416703466739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJYogmrO;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1da1017a09so83798066b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701869414; x=1702474214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pomoZzCzkhUuUsj+/U4flGdvgDPbpeb2vqjkt0UUfoQ=;
        b=SJYogmrO/j3pYxV1jTchV5yTE6aPfg5lEKLc622YlKUSOTBglE0pEg7t1AtqJvVm/O
         kkf5gXFrj8MbGy47KZ1IKtYAfhftMeLTaz90gHuHbcQvgQj5rSCewmQiS1W29W9Y8UcE
         ePYmI4IjcvUXDkfcli3svMeLPicVaELQeXTmLwIP7ps3VMBBx0t9puJD+jhYMLPNICJ/
         B6D7t+Wi+5hauVE1i/e3EDw38KxpdJaYejQbYOzwjSm1BgWRGi/QJev4Jd8LdGDKMmhH
         5nUINPT9ssyGT13B8+ZLRdQdbIDx1Sth1gJz8RTIXt59+GW441S/lbOhxC2LJ+pUIi4A
         vJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701869414; x=1702474214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pomoZzCzkhUuUsj+/U4flGdvgDPbpeb2vqjkt0UUfoQ=;
        b=iY8O+KDjuhZEZLAyOEEQlPPeCIOvbV2mp5nHyeyLL8q25yeLWrlbYo7qrSPZwSWmoo
         DnEKds5qsagLS+dLcqVtr3tUJZnwN1J0P6u4wouuzcJIoTQqX8mDbhnmLSMS2Np+AIm9
         jw6yr0/RaqlFvdZ7QybZ/qkrxH4p7NZmnU6EvkPyZ+m3W2iudFNVkR/2p/SQnilMLc89
         oqBKUR6eo9oIH67D+/a39/SB/g0RHzpBUTTp+dxElCPMY3JABTokoKVA+d2JiuHHmfhz
         Na8ZvliXU4lIeYAXnd1xnS1qPcTMqLT+m9h1uaI7XTlJchBs97s7eqvuDmggRlsKT9GF
         0mJg==
X-Gm-Message-State: AOJu0YweuAP2O6I/fPQF28row1TMgpByEtwmL1mpa36B57LMsJsgKGbw
	C63g77323pBcW+BencBq3Pdg/DmAxEunWA==
X-Google-Smtp-Source: AGHT+IF5Gl8IsvwuWDkazss7v5rgq+Ur96vdV0rIp1/1qwZDCJke+j0kbrzg4pOk2UsEdlq6mhmfzw==
X-Received: by 2002:a17:906:13d6:b0:9e5:cef:6ff with SMTP id g22-20020a17090613d600b009e50cef06ffmr657830ejc.33.1701869414345;
        Wed, 06 Dec 2023 05:30:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00a1d232b39b9sm1608869eje.184.2023.12.06.05.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:30:13 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xlsatoms: upgrade 1.1.3 -> 1.1.4
Date: Wed,  6 Dec 2023 16:30:08 +0300
Message-Id: <20231206133008.316427-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107251

Changelog:

* usage: add cold & noreturn attributes to function
* Resolve clang -Wshorten-64-to-32 warnings
* Variable scope reductions as suggested by cppcheck
* gitlab CI: stop requiring Signed-off-by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xlsatoms_1.1.3.bb => xlsatoms_1.1.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsatoms_1.1.3.bb => xlsatoms_1.1.4.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb
index 288bcfc8f..ad06612d5 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.4.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "61671fee12535347db24ec3a715032a7"
-SRC_URI[sha256sum] = "57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "f4bfa15f56c066d326a5d5b292646708f25b9247506840b9047cd2687dcc71b7"
-- 
2.25.1


