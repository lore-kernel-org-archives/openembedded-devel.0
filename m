Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195D4CD6E50
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 09:04:30 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.12355.1697015061729948527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 02:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIfqG3NJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: akash.hadke27@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35291dbf7efso6740265ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 02:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697015060; x=1697619860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egLc9M99NfkyNRYN6uMKu6qg+mvPNsQzcxoowmJojWQ=;
        b=iIfqG3NJSQLTP1gonGmG6mDg5FibraW7R1RrCyE0wc6yWsfwABq7mYq5VvhUPW2M2l
         yEfdQ4vRTj72Wl1fOwrXg1/OuinrHsYgOyhD7mXtqJWozIdPqmzKJZ9z3SEM2q0qCSoE
         n8LbZJRIcAYdP6A0YMfeIFkOUNX2YTSaQMD4/08lUFM1t6Cs/OOVtU3xM7dUUjwgv/2+
         71rO1DoJWDnw87Qvslih2uDfe3+JMME6DGYgHXCUclyqTQFxdhKpsHm/Nv9+P9IZPraa
         jEP8VBIZkf1BS2iqlD7RM/ezJFDOOw4GVGCYkXrVjHFwh1LtTZh3cVH+P+JEqaPZTQ/v
         iHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015060; x=1697619860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egLc9M99NfkyNRYN6uMKu6qg+mvPNsQzcxoowmJojWQ=;
        b=wkQdpBaspPNk4JtFIgXrA90DqHlU5FG2GCO1IvbS6HL4mYz9kFNKvpygVSx5ZlVKSt
         8RrRGjlsK+LRP9tGZ5SPtXwI5sxMpfKIAY8lyHeFuXHrpT3MkY9edTg2lgWTcj14/Fn3
         K4es3zHEUvk7AlL1CIch8hc5gQJbr8ZljxR3vGAJkFhvKJle/gi0l2NClQLcXQ5b85vP
         A5qeKIOoo+CcGyZ5FPV/86AXNjGWsChVqfaNdpENjt+iWwEbFiu49H35ry3uWzB/urfd
         5W7AIKxakS8hgu4IBsV8WUXujOk+oIStIdOEoDKZ7CL+4CCczx3EAI2Zb+t4fyS2H4sq
         XTzQ==
X-Gm-Message-State: AOJu0YyiZEodQTc/VyhOE+XQmPXmr6mAn/ViJTEICCvBeXBAAS3XHBdA
	u2OuhqzZkENzvmpvaO3SlJc/OMOIIaD+eZDv
X-Google-Smtp-Source: AGHT+IH6FIJo3OaB/1NSRbnZmAn3NKN+gidzavvL3I3p+1CdKIfkiP3Lsjd9nHpfOPxHXq+vLFM2PQ==
X-Received: by 2002:a05:6602:2e03:b0:792:6068:dcc8 with SMTP id o3-20020a0566022e0300b007926068dcc8mr26925389iow.2.1697015060671;
        Wed, 11 Oct 2023 02:04:20 -0700 (PDT)
Received: from L-18010.kpit.com ([49.15.232.214])
        by smtp.gmail.com with ESMTPSA id l9-20020a62be09000000b00694f14a784bsm9528685pff.52.2023.10.11.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 02:04:20 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	akash hadke <akash.hadke@kpit.com>
Subject: [oe][meta-oe][master][PATCH] libeigen: Set LICENSE for libeigen-dev
Date: Wed, 11 Oct 2023 14:33:51 +0530
Message-Id: <20231011090351.195260-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 09:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105421

Set 'LICENSE' for 'libeigen-dev' package as
'MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-only'

'libeigen-dev' package does not contain any 'GPL-3.0-only'
and 'MINPACK' license files hence update the license.

Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 28305c985..ffb4429a4 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2.1-only & MINPACK"
+LICENSE:${PN}-dev = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.BSD;md5=2dd0510ee95e59ca28834b875bc96596 \
                     file://COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.25.1


