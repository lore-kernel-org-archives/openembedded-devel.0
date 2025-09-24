Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3103CCAC5B8
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.11203.1758716939783043595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuGuZKBE;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so10011391a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716938; x=1759321738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTvJ7+7alBh/pUd5dtUYhzx4QVw8NyuvyAejGmNxRuA=;
        b=UuGuZKBEabLI/m+qey3KanyXFlsPNHMqbHRcCNVzxPevQUpLIZcTvx4P2EIoRQlQfA
         0wuKr0oBArzzGJf75jEY5v7u10fXVCPO8uuChcwlh7rxRq+ESA3zQbxafEFEAdW9nERj
         Ob55i8K0XXUhPXyWOsr96SdgXdBLZhBxkrX2Lku1Vsqak43ybHvKwWUzpYTJuEiOncLW
         tKFJLJ7mbBZuqw012raC3wFQpr/VWZbPDahjlSXqYxRBrCA/CeIjasvy1bYrM6nmRTMR
         k6SJPcTHAXjJ5tOzJYPXD8QK6qmap3duSd45IWT7bBzWfL6q4AxNXAQloo3b0ITEPLHh
         qXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716938; x=1759321738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTvJ7+7alBh/pUd5dtUYhzx4QVw8NyuvyAejGmNxRuA=;
        b=eq8GW7wIyGM4qURtv8CG5N8AYpN+ESn6blOyOqYIE6UmJbULI/YILXNb+BNR1neXVF
         cyIyLOr0xAbGbBABi72tZpWxELoArj67nd2NMoUEi/pU/POeVPC30BP/x1RKKKfr8Sfo
         1WimlJ7VkMrVYL9NwA2nI+prY+8YQv/4GX0q3Bv4Se6oq8kvI+1mRtJpo2fV4R8Kl8qX
         uL+04edsdbUp4VY036ZIwkYvonYV8wjf0lLsC9E+q+Ek3HomelNKGcdB98Yyxj5u4i9G
         iijPwlP01tSbZiJVj3mt6BWATDF939tE9MEmIKBr3nUJfJVJ0McUdN02AufxzqbW8vBR
         hVYg==
X-Gm-Message-State: AOJu0YxexwtId7IXGpkLKpKQdLhb7Sg32HQFjD0nVbesvJQOdp0ozYsj
	H68cHeZ63XS4khoO8kE7ziZ8qJ6QwJ1irU82+RERGPExvhuMnxVbNexJa2zHOw==
X-Gm-Gg: ASbGncvzBqaRWKvyeCQehf2wOMg1oiUpUsfWXrTtW3veqwk9Ywk/UT1dErhvVCEudHA
	POSznJb+fFS7RwGmam+V67BE8u89B+bU6ZDj812AIsUbR8d1mVLJLrv7e1swiug5LA8PIuNPgp4
	DrM1MaEnh59jOYy2wqbA+NhK6wpx9YgK2lWTXXOXTdSZFmBBvfi+GQEy/0lUiFdsQQNbB0zSHNS
	WmY8nJU05nE/w/xvZBfF2EHevVvitYpgQjo2r4LA6bOzLkA8wPdmidAaGT5Y2zNRZs3UGjCP41u
	tGrr1/3O1QqMiLpdRrb8MUCJJhbBkIAJSATsCVjGqQ/QV5LdhZXIBDizciXNSQtq4O8qhD5jGDL
	BgSAcAgXmPMRfs5ic+9p1
X-Google-Smtp-Source: AGHT+IFnG9DndDZB5itX7wa0sRiAZE9I9JM2gO/+Q4/E77asLtjQ8acJ3DiaBq+akQO50MzJRxO1nQ==
X-Received: by 2002:a05:6402:46d2:b0:633:d65a:af0e with SMTP id 4fb4d7f45d1cf-63467821b26mr5957363a12.28.1758716938034;
        Wed, 24 Sep 2025 05:28:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 13/20] gvfs: fix dependencies
Date: Wed, 24 Sep 2025 14:28:31 +0200
Message-ID: <20250924122839.4184719-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119816

From: Markus Volk <f_l_k@t-online.de>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 216b7002ccc6e861de0d267468b4e1ba22cde86a)

Adapted for Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 9d1303e2e4..686e0ab4e0 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -12,6 +12,7 @@ DEPENDS += "\
     gsettings-desktop-schemas \
     libgudev \
     libsecret \
+    libxml2 \
     shadow-native \
 "
 
@@ -63,7 +64,7 @@ PACKAGECONFIG[afc] = "-Dafc=true, -Dafc=false, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "-Darchive=true, -Darchive=false, libarchive"
 PACKAGECONFIG[dnssd] = "-Ddnssd=true, -Ddnssd=false, avahi"
 PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
-PACKAGECONFIG[http] = "-Dhttp=true, -Dhttp=false, libsoup-2.4"
+PACKAGECONFIG[http] = "-Dhttp=true, -Dhttp=false, libsoup-3.0"
 PACKAGECONFIG[libmtp] = "-Dmtp=true, -Dmtp=false, libmtp"
 PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
 PACKAGECONFIG[libgphoto2] = "-Dgphoto2=true, -Dgphoto2=false, libgphoto2"

