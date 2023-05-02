Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51159C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.122286.1683008398783106038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F5df+pJ1;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso3902132b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008398; x=1685600398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91DyW+jG0XB7e6HSAq4IjNh1STJ8VGQt9UQiIYhMhs4=;
        b=F5df+pJ1udZis2rVog/gEcJTybQsyU0fB+MzpDHNJVSc6nHD3iseVpn0jYfekAqpby
         kn0JgBre3wMqUz5JUoOXWKxy9IDoYxMabmjyavAHl86ct5k2cLdUb/aP7HOsW0vGHfQd
         Z9qclihwB2a3TABOF/eut0+CRfHgk1KPNZIgg5o2vlzY/KM1ZOZf5Z3aCIn+K3pEzlxa
         ZjuqoYH9QDBm4nDHA6RHXFys+lI+nw91+uMvpUxGWd0A5IDHWASzkzXQnQZVpbAdS0tI
         7pZ+xzJfZN8wOMtPWD8k/1XqtAQvHyeBE1kzF91soOP0WXPOJ1//Y9AX/FkJLPZbol9H
         z1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008398; x=1685600398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91DyW+jG0XB7e6HSAq4IjNh1STJ8VGQt9UQiIYhMhs4=;
        b=iG6/6ibeB6MP3+R8n/7a5PMchvCIw5t9I2Sa2yfqeKsztiy4Fd+Yj54lSDkyytYhQq
         gZ5ZwOgX/uQ0Px4nikbKiHxBMA8idTZrF4Ht1TfS2+OVl+1KdGwl8ghTBJt21TIcaikp
         9P2BN/xcsAmn4bnlBM3Ygt1wI/fQNgcXdQ8pfoKn/wF/Zi/ADD+J+WPf2z8d8RDlt1pV
         k3FeNfOqby+2wlJPMySoMQcTeLFjChAbEgTETlNQH/ojbAorVJxjukIQk0Z2M86n6Spg
         kBccVycY/dRzZDDMA1MdbWKl1T2ZLSqGLZd27IrfWSq5qZ+2bs4JackIWiyVzU71HW5M
         sSoQ==
X-Gm-Message-State: AC+VfDxrPiSENq2FryV4nI1RBtUIhIIeFSyDgGYtSKCNLjpg1zcuzo4Y
	U5XfbLxfWm4P9AV9/37uOQggJpb7AnmE9w==
X-Google-Smtp-Source: ACHHUZ4CpPu1EeB7oSJVbHaS6Y8DUVk/4u5soYiZgChX3QPvlplmf9olGxlVVk1zbyOD0w87UHzGaQ==
X-Received: by 2002:a05:6a00:1a50:b0:634:7ba3:d140 with SMTP id h16-20020a056a001a5000b006347ba3d140mr22843386pfv.15.1683008397880;
        Mon, 01 May 2023 23:19:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 03/11] httpfs2: Do not use S during compile/install tasks
Date: Mon,  1 May 2023 23:19:46 -0700
Message-Id: <20230502061954.3782607-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102249

Point to SOURCEFORGE_MIRROR instead of hardcoding one

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb    | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
index 0086551f62..5dc3ea6632 100644
--- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -8,18 +8,15 @@ inherit pkgconfig
 DEPENDS += "fuse"
 RDEPENDS:${PN} += "fuse"
 
-SRC_URI += "https://astuteinternet.dl.sourceforge.net/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
+SRC_URI += "${SOURCEFORGE_MIRROR}/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
 SRC_URI[sha256sum] = "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1"
 
 S = "${WORKDIR}/httpfs2-${PV}"
 
 do_compile() {
-    cd ${S}
-    oe_runmake httpfs2
+    oe_runmake -C ${S} httpfs2
 }
 
 do_install() {
-    cd ${S}
-    install -d ${D}${bindir}
-    install -m 0755 httpfs2 ${D}${bindir}
+    install -Dm 0755 ${S}/httpfs2 ${D}${bindir}/httpfs2
 }
-- 
2.40.1


