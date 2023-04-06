Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FAEC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 06:54:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.152548.1680764066354458757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 23:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dJJkumFm;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id r7-20020a17090b050700b002404be7920aso37960483pjz.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680764065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMCxUFNXeHrl7jTMClGvyLRL10KBBxQPNGDR5r8Pi5Y=;
        b=dJJkumFmLq6T8uMiZPKdVX9WDugfkpPjqu2Ft2SUDTZ1prsOflmb+pl6k6lgcY3EQ9
         0JnlTHb/e1M+mx6gDd6R/Hokdd+bzpethh3HYm2wbhJxjdbW+t1iqYXUYAYlsyeHu/mG
         7UTOKFGs4GVxQmlvFM/t6ZXQWPMjfz7FiYu1rAiebjKB4G72vFHyYEqVLaWU2I9l02Fe
         iAfhqLKYXCLF8pP3yHjgDS80Vbg4po2TaUkw3FskDUBvz2RuornhGqrf4I4LT7TVtwwt
         b9DpD2LtqDl6LeNOPX37dqZG/v2uJCLGspTj7wOv2AkUkTB3CwYgLdXNvBg66yt73N/k
         lJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMCxUFNXeHrl7jTMClGvyLRL10KBBxQPNGDR5r8Pi5Y=;
        b=S+yS6MAjJROW6MRs9K84EvjFunVI/AGVjCqRZOe7/QIA0ss/JH+9CVh4nwsiuA1Ovn
         LVJlmL3vFKD+gzcdmhE6BDwA/ta0WUIq1CAw9tkRa49L3zon+N0QCnfhIL+9hm6mVpaK
         4AM1gehE/rUU+mlkv5g3AuxcepOYYCFWa7rR5n+7EFfs2nSTsiwx28SeL1cmL6d3zR6d
         ACxMdKbX5S/IEmLWXm7gQrdi9hAPEtV39EnyTgG988RCIxwQWuW5abfAi7oRTwJLd5OA
         adljxU9vN7ouSVs/bVGdVhxtRKsIKTka/ARBA37uYlf4jElce351LtqOeakiU7qLS6XH
         vlDg==
X-Gm-Message-State: AAQBX9fIZK83zJ0evuUHo7DU2/WxB9z8n1WkQbUa2G8UQ6S7Ya5fQja2
	633SJmsryytWumCsTetv3zEayrAuneKPNg==
X-Google-Smtp-Source: AKy350ZrTXMu5pMVGmtEiL5iS4rqQSsIYMP2SdxvNfU5hcp3AuLqpMACeH8m5zXZ6vjuX/H8xZkqtw==
X-Received: by 2002:a17:903:1246:b0:1a2:9ce6:6483 with SMTP id u6-20020a170903124600b001a29ce66483mr10350568plh.64.1680764065191;
        Wed, 05 Apr 2023 23:54:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm648703pll.86.2023.04.05.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:54:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/5] babl: Drop clang10 workaround for mips/rv64
Date: Wed,  5 Apr 2023 23:54:17 -0700
Message-Id: <20230406065421.767010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 06:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101966

The issue reported in [1] works fine with clang 15+

This effectively reverts b12e87f84c4af258e8ea8cc78ed075989cbf9dcb
and ff19c7c5694f79271ae26543562e5563d4250559

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/babl/babl_0.1.102.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
index b12dc162f6..9954ac9c94 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
@@ -10,10 +10,6 @@ inherit setuptools3 gnomebase gobject-introspection vala
 
 DEPENDS += "lcms"
 
-# https://bugs.llvm.org/show_bug.cgi?id=45555
-CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
-CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
-
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
 SRC_URI[sha256sum] = "a88bb28506575f95158c8c89df6e23686e50c8b9fea412bf49fe8b80002d84f0"
 
-- 
2.40.0


