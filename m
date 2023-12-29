Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39C2C4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.156003.1703876554521819812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0Y7B9Aa;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5f07f9d57b9so3946547b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876553; x=1704481353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uama7hgiyzx95iSsqER50rjYz41jCO0pj3vj7G5Q5Y4=;
        b=k0Y7B9AazOa2sj8ZSGRgXvj/FXeyMYa0ee9TS+mdjEQRPuy8uOsPozAOBZbr7jXjN8
         cM0LgV92muY8ZX8NTtjLW/nFw5/D6/HvtTO9u337Og9Z1m3dxbcQ+2+ZN/ue7zj2O0bd
         mX7Ay3aby6aWxFy//f7GLw1/hHNwWEJHJlCGFoggPx7dIpej2a/PBRZHxRplcPcQCQ4V
         +hhWZxYlmaEZv1yTHSNQlPsRDKGb6pMOSXdKSYD5Ic0/HxZlNKxonm8WToUpvS4HSbF/
         HTpBKqRjKvMXJuqwV8zIAQbzlovDjH/VLnBGKHFhkWzunOtKbH8XfxN3d/rHaJhsp7C3
         8RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876553; x=1704481353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uama7hgiyzx95iSsqER50rjYz41jCO0pj3vj7G5Q5Y4=;
        b=T1zRWku3BGlxbvX3nI9liVqHrZdj/n1wxmaYFcw78d3H3hcmgubGrZNRHr/f5HInAy
         ASt0NqLEdKcMDxwVQ298lr77h8WY2+g2V9GL9fVTdaftc9WL78DabB0SCSrIp+Cz8YDq
         /Bp1TM7A7i8jCAeOngllttUFBvmD7weAKPKuPGzMocexoUz2ZrfEM3RvFfSXzG3XkM6Z
         opbg0trUdPOGqhLad9me+/TaOL2hO1wyBcqnHl+9aZr1fCgS/iK/WleEjNWwUdpGnt3D
         9Mx7VOsurStQde4I0cn6CwzpmhC1ckexScGVUStfhh6cOJ/NQTCXH9juXypD4bP91ysI
         zfdg==
X-Gm-Message-State: AOJu0YxH7C6tqpvC6Xf2fSCATqr62rM17TZznh1eBfarcgMqqu9MSedq
	bK6PduvIvEMYJZ8Zz4mskdNdiEck+AxMZA==
X-Google-Smtp-Source: AGHT+IED2wAbyjQl+g8WWbwG6bfOCR72WZic/TAFSxxXBv9x22c2MLCa780ujzuNKREEKHOQzcLFBg==
X-Received: by 2002:a81:5456:0:b0:5e4:6c2f:bdef with SMTP id i83-20020a815456000000b005e46c2fbdefmr9788446ywb.41.1703876553377;
        Fri, 29 Dec 2023 11:02:33 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 01/17] openocd: Use https for github
Date: Fri, 29 Dec 2023 14:02:14 -0500
Message-Id: <20231229190230.135480-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107883

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4f69d8c19880dc5e8d078c68206eebbc8781e49b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index d30d9c3466..19ef987387 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "libusb1"
 SRC_URI = " \
     git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
-    git://github.com/msteveb/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl;branch=master \
+    git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
 "
 
-- 
2.34.1


