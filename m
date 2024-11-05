Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F773D36113
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.27772.1730831943768077350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nb4iiLZ0;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso5346096276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831943; x=1731436743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uFiyvBs8S6u92lDdHZWcYjHOh4K8yjvFjstuA0j+cM=;
        b=Nb4iiLZ04+Fz5cO5xU/ZnjlPn2+Ku8K15sD2txMqVgH2XVxesrHzAEGNAYBLLItiL8
         fW2hAk5TPFmorlF0HbYTHrxeybPfg1+W/1/QXLUWaBnuoJxINL1xzFNjYmmE63GkeKz4
         KUwkyibspHDzMyBmD9/EHbDEJbWr8ISc6OLLW/1QkSFsmxxHMgtfksAac8zjEYGQp1Ow
         4Rl5EYJUazDF2Aj6vQ/6mEbGIvHiJ7EopfiISFmTXB6tJqsXJdSoAQTj53g3vXHTppQA
         7eGuC0LzJOyIbpDazA4PEHR1DCYpZBzLIdkeJLkUtBfFkx9CQEsZgZ13Kv7Hlt8Qqaxs
         Q+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831943; x=1731436743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uFiyvBs8S6u92lDdHZWcYjHOh4K8yjvFjstuA0j+cM=;
        b=MRKbn0htt+Tna8dWSoNF/eKqsXQmPAUvrZIdsL4ClOA/ujoxmrhDc/9sUCxOjmO7kd
         tfyQQx0SE3rViiDHb/p4Mvr8pTV/h/F1000n+U+G378yMgAgwgYk2azvQjCNs+TzKetQ
         vnFrO9cGYFoKbEr0yC3EeOOe+m3HWlpU4ovopePlwkJX1Fvuiui5vP+7TdoPyjj3DQP0
         RAaeO2GKQNwqsypa2htFuiI3q35PE/FpzQtxI278OkzK7AMT4M15nfE3BNo1v3bZSJUy
         ewUgBeirkDkfYtTaKgJOIhwv655cDMi42TlIsFsJ/y902OB0t4NHFGx7tOZA9e6kB5EB
         SEGA==
X-Gm-Message-State: AOJu0YwbHrbH8YI5btU3lpoHy0WapDM+GThS6rzwPBADBu2VX2PHXvx/
	VR8VBkDAqlmDZwZ5v52wBobAMmfWFIbvmQ3U7lJtZJAZrEfeglBQVZPqRDDn
X-Google-Smtp-Source: AGHT+IH7r7tekwnIPYmpUZ+UbD1hygzsmw5Kkid4Gd4ndU3rk1S5ghHQUN+VEszVff34aRRjks4hZw==
X-Received: by 2002:a05:690c:64c6:b0:6e2:1a56:bff8 with SMTP id 00721157ae682-6ea52525bb1mr178625607b3.36.1730831942428;
        Tue, 05 Nov 2024 10:39:02 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:02 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 078/161] stalonetray: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:54 -0500
Message-ID: <20241105183658.34982-80-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113593

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
index f2ffee64f..b70859dc1 100644
--- a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
+++ b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
@@ -8,7 +8,6 @@ DEPENDS = "virtual/libx11"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "ae95dbbacc2620e032acea8abab8c9ef"
 SRC_URI[sha256sum] = "36548a588b2d466913423245dda6ffb6313132cd0cec635a117d37b3dab5fd4c"
 
 UPSTREAM_CHECK_REGEX = "files/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


