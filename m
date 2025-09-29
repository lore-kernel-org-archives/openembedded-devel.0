Return-Path: <kekiefer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3011ACAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 19:02:04 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.6524.1759172514519993243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 12:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5QMGWP6;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: kekiefer@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d60504bf8so54503547b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759172513; x=1759777313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxgq2RmlBQG+CYHOpy1fTECVQznSLyuSNHfc7GEfbR0=;
        b=G5QMGWP6dxdmcusr6nKMzozGYE7+woeX5lB7N5Ge+XNDVwhYv1XQvUFnK43aFi3yis
         hvJvgBkmfyIbRpUj7NGivD0Vh989M41SYHa3vvxMtUrcHYRrZIAOLM0S6IxgZhQFAA2X
         P83nsTssp1Ny5ar4Th1KFnm2sKQ6P34GSBxxKnvb3sOzyBo4q/WCjvPaqde9EygQzbiZ
         i2LMLzkbvfF7O1Nhg08nuEq3bXSmswEhQbJkeRxBL5CgFUsmSRrxbW3c6BJTaNa6pEWx
         KW9sI2bCivgYYK2DJNSi2GZEHoMO9UzFOREolh7j/2L74wPnRxyfDs69Ocr0g2SFNeEI
         bPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172513; x=1759777313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxgq2RmlBQG+CYHOpy1fTECVQznSLyuSNHfc7GEfbR0=;
        b=meLzJrnwxZVWMMnRD5wcdMXHnHMAAOZ6pzUk9vkCkbxUKeknqIbAdoxWnYXCW7+hOl
         k21Jdwcfsqw7gbBqv7wS6nfDCW9eSLKN0NCWvFm9OP46CMDAhqRMXzauxKCtsVlCJALc
         PPmhPrzjjT9Uobxiixve9m81LbEKCmjKRI0iJNscvgxmk6wEa8KrlY/+luMXKIGVnQHQ
         iFZ2qPtCCEHQiZIry/YD3SWFX9kRm5oW6eGBKhIVIl83HLtKQC/q9W3fW2NP68bRpLG9
         Po1G6jOucgAi/TPKy9rVya65U2U0J06t/epMkbqFQcZgQ+eZe2FxLGN0BTisem4yMsdI
         MJXA==
X-Gm-Message-State: AOJu0YxTQJcHiiB2Xt9nR7S5+9z6jZNPvzQO7odTveFQ7Ewm2zovYjDp
	BeDfSK4EG9JRuN835KC1Mbq3AXKqoH5bPcDAocR8ZjbmWux3cQ01tDWNbgPenRgh
X-Gm-Gg: ASbGncu/dZlZB/dHm+BTAIAE4bj1q4k7/hNmeRdIKDHD0SNeE80ELBzwGAWAvqJsw3m
	RGYOkTkqQRNAne0JEj6uPPu7Nk+LV7fbxdXyFEOD3aczc0KSwPe8nBJbyXJcnY50eZaNcr/6WHL
	xqq3V8TcBWbXEROCtZQee5obeEsamCx2nWncq2ZI/3eSSiHWxnkxf0kXkD9uECDXG4MPSadI7zd
	lda4kqdLR+L/e9oYWDTr3eaiWdgAQq8rgswzewqBnKM6UT12sCwRwpjtTBxtf30gICCSEEn8ZaV
	gajOy76JZpv7ZsQ1/RKdS/i3kP8x0JJuNnvsBd2rJ1BZGLFbrcdisvmema8ItPOi0a6wxAS2bAx
	x6Yq16+JSVzOc67y8rza1bNZ34ah3+PB06NXmAlRHhfmN5ah62xpWu3E=
X-Google-Smtp-Source: AGHT+IE020anzSzvwbK2pW5VIHrBQra/sKuAW2S9ykgfYU5C7vw3HCDVRKCzKTgEhpS4aarvUpfSSQ==
X-Received: by 2002:a05:690c:4a07:b0:775:c1ef:cffc with SMTP id 00721157ae682-775c1efd160mr95433417b3.28.1759172513000;
        Mon, 29 Sep 2025 12:01:53 -0700 (PDT)
Received: from localhost.localdomain ([47.176.190.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765c7da8385sm30675057b3.60.2025.09.29.12.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 12:01:52 -0700 (PDT)
From: kekiefer@gmail.com
To: openembedded-devel@lists.openembedded.org,
	steve@sakoman.com
Cc: Grygorii Tertychnyi <grembeter@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Kurt Kiefer <kekiefer@gmail.com>
Subject: [meta-oe,scarthgap][PATCH] libusbgx: fix gadget-stop install
Date: Mon, 29 Sep 2025 12:01:46 -0700
Message-Id: <20250929190146.1706318-1-kekiefer@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 19:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120045

From: Grygorii Tertychnyi <grembeter@gmail.com>

It was by mistake installed gadget-start instead.

Signed-off-by: Grygorii Tertychnyi <grembeter@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8e970395ef84b16e955f6bcd0ff4c866ecef447)
Signed-off-by: Kurt Kiefer <kekiefer@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index a20ff4eeab..7e88be00a4 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -40,7 +40,7 @@ INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '
 do_install:append() {
     install -Dm 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-start
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
-    install -m 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-stop
+    install -m 0755 ${WORKDIR}/gadget-stop ${D}${bindir}/gadget-stop
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-stop
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.34.1


