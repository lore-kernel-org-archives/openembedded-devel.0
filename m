Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D5DC5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:15:57 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.4560.1700133351090737731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bp5nqc5u;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so98709266b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 03:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700133349; x=1700738149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2jmCyiOKQ3BiPGK9/UFtZUvYiN/lZCnFhQn6ussCE8=;
        b=Bp5nqc5uJivNQsZUz/KuoWB+q1o2pcgmDXi3c++u0qBQUj/S6SOyBYPkpnkqbTGeKO
         +DVr66r2flKZvFvBstwohwEpjobmUFC4C1gaZGcMiTGjj94lb2O+wbkiXRMLMDeFbVBz
         bR2Wm3x+ueGvP6aYR9mYNikfeBrT4JxSdjUF8alG0Sit6lKuNLdd4+jMSbWx/0PXoWum
         XqjJbXJo6Xeu5hCVt3hLMDguo4slKk0FQr6DY16Th8zjuDMpfiez++fPttNsPcakV92T
         3Zyxs3ayrkf7vVGAMc8oy/rJmZoLPfWIJsTXXXMSpw5bNCxQ2D1lMQb9jyU2DxV5AmWK
         Ui0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700133349; x=1700738149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2jmCyiOKQ3BiPGK9/UFtZUvYiN/lZCnFhQn6ussCE8=;
        b=q856Al2x0uo78b5YnUeNTJap7HZCXgr+IXRdJIIY0xtDt9UKaxCUHO7kRZIuedjDlp
         Ao3xIBfjmbFaz2KNshE1/vpHeFubv9WHjKW7OBP8pJWSRcE/Qg7yKOiWOSbJwqGqZT+F
         X2HkFyIFZMDHg6J7O1+0meyf/pc/gwfWIjuM7tK3E6mgFU3Nl8pIEj1GhZsr4BvDsgDh
         3aSoJOyadH+DcnzHmr+9sDMPWuw/qJqiPTn64AXmovrkHaY4vI8rsbIngF0WxKdWtocl
         zR1Sg+3O9wfUJS6CoK6HTZuuGYf/FJOqzp7uYg0Ql9ysB5TnSlH5+6QNHi3/3iHQpoDl
         ImZA==
X-Gm-Message-State: AOJu0YwuPUPkhv0FqMKLDNBpyLCA0KOQfOuwcyVIisL8LZgG34K8geSA
	OICzXqetSPGkU2vvJZj6Ndn978WG7JrtLQ==
X-Google-Smtp-Source: AGHT+IEK9rFR69jvBW4bVFeC5M2Av6A53LZbTeCLd9+nmjX2ugQoAE9WqOgzGTcl40kN7VzJ93+8pQ==
X-Received: by 2002:a17:907:7886:b0:9e6:9e8b:7148 with SMTP id ku6-20020a170907788600b009e69e8b7148mr11992140ejc.9.1700133348885;
        Thu, 16 Nov 2023 03:15:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906b20700b009ad89697c86sm8347606ejz.144.2023.11.16.03.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 03:15:48 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libsigc++-3: upgrade 3.2.0 -> 3.6.0
Date: Thu, 16 Nov 2023 14:15:40 +0300
Message-Id: <20231116111540.919671-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 11:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106812

Changelog:

https://ftp.fau.de/gnome/sources/libsigc++/3.4/libsigc++-3.4.0.changes
https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/3.6/libsigc++-3.6.0.changes

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{libsigc++-3_3.2.0.bb => libsigc++-3_3.6.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.2.0.bb => libsigc++-3_3.6.0.bb} (74%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
similarity index 74%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
index 9318a3054..0753457c9 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.2/libsigc++-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.6/libsigc++-${PV}.tar.xz"
+SRC_URI[sha256sum] = "c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.25.1


