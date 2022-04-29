Return-Path: <boubaker.bassem.1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6590AC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:18:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11546.1651245491597581284
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q8QIpen0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: boubaker.bassem.1991@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so4937433wmb.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEQycQnaDUoFpHHF7FXt1JivJU1BbY8Me0KpONF32wU=;
        b=Q8QIpen0R8lB6IgWCuBx/VoNE4567lOxm3S2+HOaPLdQihtNQC8u67znTYXBmBhU1R
         1VQJXUXtvv8/48qFu24motkFE6vryPuO+DGuifkkJYiQG+HbGs/+I19/tMJp8zyVYd3z
         9mkGAyQvWzAEhXoiPp0++xZgrQHF14EYOSpGgOUBeV144pXfl9jcYTO85Nj9g2pnX1uT
         o6x9RaX+rRJVaX/LLa1bk0zEEhMQ+RHrRxPHnM5LrFBmexPML6ZTJbVi/DPwxyqHTfum
         jHySemIE4tSyf3KRAqb7vEzrgDempY0C29q6CBTIFETq+MQr40nsG5YY+XFdKTzSnATZ
         Ht6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEQycQnaDUoFpHHF7FXt1JivJU1BbY8Me0KpONF32wU=;
        b=LTatQAuUtXHExnrebS0Qb3stxRWp5bCffXW/Zl2L9Lf2AKRZjrB1hnRbQdDw3R/wTK
         cmUd8LQLwbcyaJDi9dR79jL8v5CUxtJ+NqpAWgePiUOT4FnqMUFKcwvQxJ3hnUwv9YLo
         BHQsc/4tIatpwUO52rz/UoTn45EgNihj2fcP5pXg14Nxa7pDCnSm6HLnMwiDautUCrQo
         h2btiL6Px7nOCGYAA8Osq7zsezDFLI6sfYGGE2uqqa4SXPMr6o0Ce+gn0HxVPQBpEQ7N
         FdzkTOjj0wHmSPtGRGnGCO8b8KUR7UoWEj96QeiP8993Te9wDndiyJ73ASh/zHi81693
         xvNg==
X-Gm-Message-State: AOAM530GpSBVQpl4/7bdtlG1FOF4Vdv1lyTZc8hqy78e2QDSsnZNMTD+
	B8RTaNXOfQD6ho3ZJ2yRjwL32mG8ThZr+w==
X-Google-Smtp-Source: 
 ABdhPJyw0A7HbCCRxgx2WMRPADZ+xkpfHdK3LZAi6stQUhi162ShSswPNCnIrAdYVjcJlqfB2RnTJw==
X-Received: by 2002:a05:600c:4f50:b0:393:f258:46ed with SMTP id
 m16-20020a05600c4f5000b00393f25846edmr3715290wmq.35.1651245489834;
        Fri, 29 Apr 2022 08:18:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:282:c80:b19b:acc9:f49f:1142])
        by smtp.gmail.com with ESMTPSA id
 y8-20020adfc7c8000000b0020c4d02e541sm1085861wrg.75.2022.04.29.08.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:18:09 -0700 (PDT)
From: Bassem Boubaker <boubaker.bassem.1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bassem Boubaker <boubaker.bassem.1991l@gmail.com>
Subject: [PATCH] conntrack-tools: Fix missing capability
Date: Fri, 29 Apr 2022 17:17:56 +0200
Message-Id: <20220429151756.641345-1-boubaker.bassem.1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 15:18:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96858

From: Bassem Boubaker <boubaker.bassem.1991l@gmail.com>

The commit fix this error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index de6a72e78..e76238fe0 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -32,3 +32,8 @@ do_install:append() {
     sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
     sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
 }
+
+# fix error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)
+pkg_postinst:${PN} () {
+    setcap cap_net_admin+ep $D/${sbindir}/conntrack"
+}
\ No newline at end of file
-- 
2.25.1


