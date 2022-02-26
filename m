Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E36AC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 04:22:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.3099.1645849354699038323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cs8qbKNg;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id bx5so6466676pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0PSI4NAVgRQX4sFywhR9nAGb9o15PNy1fyaMPocz0IQ=;
        b=cs8qbKNgEWXB4ZiBweb1GcTSdYwEsceD+qSFybhiY3DFO4vwGnIb57UxOZkXXvtvFn
         /08tQksvm6pg9zB+H6aZLZGJ4nqPB6FJKHNuv7uHCa6hW7YdOcYXFN5w9Rzin8G3jI3e
         kCZBJ3fGudgNCS9btkbcbU1BWRFhTj8N4mkx1PIIyof/C+2ZtPnnu8SpHgbB8xMYbCsV
         daHXN/snQ6/EttGFt4SLUNx2WB1S/I9eCSTtUHeDlC2bot+dSQayQLoElr0ynxN6chJT
         PmoiDeQRgapI6sbFiAe2wlbj5d5HboaOOUlSLadcUv7D3Pj+wKKmAfXh1WiMuGzCxfaf
         rS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0PSI4NAVgRQX4sFywhR9nAGb9o15PNy1fyaMPocz0IQ=;
        b=k8y7XvUGyrOs6DxZlYzvBcqblw4PkE7QvUwqJMUyGg9QL9cm0xSJ4Ys8VIoN9vNQGT
         G9qDw4gZUBrVs99JqeJyHLcKjdZgto0ShUGL8XLQrfYVH867VKPIZ9EeEqanEsRfKS1n
         IwNmbb8DQLhRn7YknRUz27lHXoFgjb95Ql02WEK5XtCGwArrjGuCE2WLxV0J50XvowPv
         oEqg5U7nfeSZYHKW0sAQQTlNhq8/xB+oH+YsiQQzMxKGwXo3SKGtxoZTK54CDqhC5hzD
         U+ZUpIXIrHeB6Z6uyMhLVBumLWB1U1rS5hEo55s7TIuETr+TiJSVJvIPpqgs2XqVRaa0
         Nikw==
X-Gm-Message-State: AOAM532BNTLMr0Sllz2nqp3awUS5GOl0nH0GFqL7jCdZ7RSD92KvRu+H
	xfCRQ7G3dny0Ckcj3v/MTJOaB0Mi3gc=
X-Google-Smtp-Source: 
 ABdhPJzZH3kcU65q1EpMjv0Con8mOM8HddRmFQMmu5gmelqI+uRH4ZtvBGx6znYRiAfw0ZfodBv3vA==
X-Received: by 2002:a17:902:e809:b0:14f:fe0b:553d with SMTP id
 u9-20020a170902e80900b0014ffe0b553dmr10579790plg.102.1645849353838;
        Fri, 25 Feb 2022 20:22:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 k17-20020aa788d1000000b004f359a0a896sm4862882pff.169.2022.02.25.20.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:22:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-geomet: fix wheel build
Date: Fri, 25 Feb 2022 20:22:30 -0800
Message-Id: <20220226042230.1403497-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 04:22:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95539

Recipe does not inherit pypi nor would PN be a good guess at the name of
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
index 4337d8558e..8e907462ae 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=release-${PV
 SRCREV = "73ec5ec96cca32f2e2461d3964fc3d4ab80248f9"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "geomet"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-click \
-- 
2.30.2


