Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A1FCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 17:45:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3753.1760982313873990402
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 10:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tftr4POS;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso41615055e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982312; x=1761587112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkyec1wvTP+ZkTtWfGaT2oLk0voKn1l3S6veqOCf9PM=;
        b=Tftr4POSDcztUFdw3mvfIif8SXpyXh0o3NhZvxManOINPaFCQ2gbVT5WreBbRMqPdm
         bvd+3vBS1FktOxlkVcAeDrEHjTJc3QlW4IEmkOGXLL/P4yjST3xwbbywXv1g5oR4nwOY
         cvWNrSsp0uZt6sK+woKO3Vlml7xk4iiu2I/Wegg1FIgqJwAdbOJTlfm09EWSr0hneJZf
         hcZufMSeUANoDBIDVl+L3ifx/95b0M+pnCB3BraNiH8CEFEgOmlDmtngJQ7dHzGuvbCp
         pyE1JNJEd7PfPBT1cnBngpSwbxBSpa1p5NkhkbTdkgTY5Lf/FKmt2h6TtAIyyXNPJxQY
         gdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982312; x=1761587112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkyec1wvTP+ZkTtWfGaT2oLk0voKn1l3S6veqOCf9PM=;
        b=LoKm22X3VCLZnsMce9ysFNZkgNUHSb2CcnVrKuKDC1tnbHWuQ8QtPA2tXR1nGI2qb4
         48uFq0HB4wrKMgglU9dD2RMPqcxfu/JN/sVcz9KCi5wq6VUH/pYNoJtp9I5wV0SM+4V6
         IpUlUd0JYHXtRh20yJsT5WXJX4evOP0QQmHM2D6JO7lONs1gZle+3rDxjw2Gqo8qBHVe
         rgVg4k7Qy5hm632EtrfEBOz1wc1vAVFKn+2ZA/Ij7pBLqG0Wgjn7wGdiKM/9apFJUROd
         zHo1D34EdmPZBTARqCskXOU2Rf63GZDyQ6orFVj+LwGk8bp/TEcYQJdwFpypBbLBd1BE
         Ep6A==
X-Gm-Message-State: AOJu0YzI5aqFodZET2VhoF9/qDC97LwkUIP0eRq39mnoLZj1hPtECoCx
	2gQtD4MuIWapMBqC6vyn5+4LmF47N3uhE7W3ZQbEOcwk0Vu6zifNUacwJoZFGg==
X-Gm-Gg: ASbGncth88+YbXKKhaXrX84WUBY9WpwhaFIsw6XKevv4xWo8Pz2o3G28tST8eTFizYe
	zvpRQ29gFthHM7lwenhH8l2EcKvk4shCa2GgHwoRvmSuLPD/lTDns8MTceVEpEj8Xl1wq12n+Em
	y4gtNPZy+do3yDA+kpUNYg3Dv8ll1S0EEvCC0vRb6UPz0GUzbBMjdbMXEuqApXsYQqwTUV3qdfY
	OYbsyjkc+7egGoVY7yVxDgpTaVXBLxDx9RopI1fp9oYQTapoBfV7VmhB2JUyBjpNm5ghVMBDPB0
	UlIFgJgjQkJBPLQj4g8Cz+07n0hCjUjjjZk4qbw6b3ODT48Y2/zp5dT1iu6C1ko1ENVd7ELv2s9
	QhhfF0Q8Gs617pm/Y0e42UrQV9X0rSyGwnAAzORpVzEWHkOFElRKz0CHeUYF/Cu5o5u16I8Dgow
	==
X-Google-Smtp-Source: AGHT+IEMl+C86wNmrNa3nXAllWXvHNoq6Td/Ib3aeBmM+lJ9+uIATOp1lDDU5Jb/5lKp3DqygP4qEA==
X-Received: by 2002:a05:600c:1914:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-47117907a52mr97686295e9.21.1760982312163;
        Mon, 20 Oct 2025 10:45:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ac30b4sm829585e9.2.2025.10.20.10.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:45:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][kirkstone][PATCH] cryptsetup: extend licenses with Apache and CC0
Date: Mon, 20 Oct 2025 19:45:10 +0200
Message-ID: <20251020174510.3396789-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 17:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120817

The vendored argon library comes with Apache-2.0 or CC0
license, which hasn't been indicated in the license variable.

This change fixes this.

Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index e93c800241..37a932eb30 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -6,8 +6,10 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & (Apache-2.0 | CC0-1.0)"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
+                    file://COPYING.LGPL;md5=1960515788100ce5f9c98ea78a65dc52 \
+                    file://lib/crypto_backend/argon2/argon2.c;endline=16;md5=c11955376e1f924066ca8d0dec33133e"
 
 DEPENDS = " \
     json-c \

