Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293FCC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 18:37:15 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.745.1707244626718648167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 10:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LB3VQZm6;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: geoffhp@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so4658099a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 10:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707244626; x=1707849426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aERLLVtwM+YpEl+B/Xl6HEwwD8ozGlOKU2qQ8HXCUeU=;
        b=LB3VQZm6ZadCdKAbij5ImRqHjVxVvfGCvkDe9/ofpYqVUPqIIcHtAdM0T3I0eZx1T8
         1Ac+TBn3pIgHmYHH4+Llg2bTbij2o2CwTW7iYTfOF5ZxFjZ94C4DVJoopIS5AD4N1KeZ
         JJntimG5Js+2qyPO6mGynD0lRhXChEm5NB1Qr45dh/wWqMhggyb614FOuFdbllAAAOH9
         fFDs+uHCt8baouObtQW4BcPCm49WdhJYEXTHOBRhJTj2E4eJy5dyjzp/TzdwZ73ISP3p
         7mZNSqD4oBKF8FmjQIDwvPX2Drebav8VJbC+1vLoRnuNd8ze7/wmWnKfviIIf6bjoteM
         SBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707244626; x=1707849426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aERLLVtwM+YpEl+B/Xl6HEwwD8ozGlOKU2qQ8HXCUeU=;
        b=a3P1SWj94KY2uKvJo2PnVQrIvDTp8bsoNMW5tF79/p0qIuh7tw8hdqSPKt/uTwemjg
         /BJ/50Poh4BEOHNkjaERlskppJBzYgcLfhxjMpm+41909XuVdqljRZdU55LbJn96nmNi
         1pomMAQGRkg3LNKiQ0Yn2PgqJe+4hTlYJZMG4ZeuxlMF+GlMYzOWA7VOm7lSWdLtXaW5
         1MnBuBz0J5lZscrLiOPBDyvDpKAi+SpYDYV469zO8tvD3IxD2//5tohRFw2EEDcKt7BM
         PTHAuRfUP6iCE7NbYtRyi77QkTipBCAJROW50235/sOuhXG0Un++ZVOMK3r8tEXv+Rpi
         QQoA==
X-Gm-Message-State: AOJu0YxGmhqQWVAqwVb1UC2NrH0+e626lYgcMnbgzNRibZtOWXjhWmJY
	tZtw/ajU8ycOYuoGRc+CpjNrIcbDNL3zGahwAaOyhbsx/CjJEz7Agci1tm5TUXc=
X-Google-Smtp-Source: AGHT+IHL4AoKZJMvPNkCvgqSgjKfIDf5yX8u3uVjP955ipQpGsgScxyRlDAe7DfjkcmcAzBseBAHRA==
X-Received: by 2002:a17:90a:c706:b0:295:bbbd:bf0d with SMTP id o6-20020a17090ac70600b00295bbbdbf0dmr402316pjt.22.1707244625850;
        Tue, 06 Feb 2024 10:37:05 -0800 (PST)
Received: from spock.lan (107-185-048-203.res.spectrum.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id b18-20020a170903229200b001d7405022ecsm2190122plh.159.2024.02.06.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:37:05 -0800 (PST)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-aiodns python3-pycares: Add native & nativesdk support
Date: Tue,  6 Feb 2024 10:30:23 -0800
Message-Id: <20240206183023.3336030-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 18:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108638

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
index 5c685d7e40..02a0b4ea2c 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
@@ -14,3 +14,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-asyncio \
     ${PYTHON_PN}-pycares \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
index 5e5f0c92f5..978fc0d4a6 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


