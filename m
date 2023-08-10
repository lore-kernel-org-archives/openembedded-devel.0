Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6290EC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:03:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.16513.1691672629843585427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MZiXyiqI;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso5067395ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691672629; x=1692277429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCsJHtUj47gAW3cV+CmBd8RfpQVKULhy3OWToz4ACFI=;
        b=MZiXyiqII+QhxpbsQ9LAs2jxKk34mVqfmUPx1wC5XGim6vW0UtuoMF1pe1C+n+OULt
         DXvtxy1D7P6EAMLXKZ6ocv4B5LAZGb2QN1hQ96lg9F7I5ta9zdnIY7RHXnS6djOG7K64
         61Jr+gRJxdwxK4NArMF15r96L+Nln8eiQTMONgAQMvDtqDX61zSn+k65neHD9NklOgEK
         9nuq3RxmelTlz6rBWClNMaviP3JrdYC91ekcV2rvutZtkX+w+7bK6wTPSV2Qi9mZN3/2
         YV6nOQQQnm4bSzMGpMpb/RjA0dbxAe89IeBX7V1zZf965Ic8AzcGEk4uuO+Xnet+YVwr
         92dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691672629; x=1692277429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCsJHtUj47gAW3cV+CmBd8RfpQVKULhy3OWToz4ACFI=;
        b=Trphm67zcquhpufZmBc5FsJEj9sEuROkkbJgALhG6LK7edxlbzhi04Oqbv7LHPUjeH
         p/2CixIzkyDJlNP55lFQlP/NmzbkNFmjiHo8Nr4l6VFDzrhkCU7px+yB0HZwztFzMoN/
         7bO9vL+1BnNwdqXQLuFFmFQyRQfIjzM1sseFjkqbLYU3UWqa8lsxZZCBImagyy75aZVO
         rNFRQT0MgG8oRH4rhQ85zbeNSKeUXTqcyqC7mXINqH5P9itqtK+rHD0oWAVbIdHEylyD
         wxJCEiJQyRwGHTO7ynAQQ3LIsBQ31pmNcvPl3r0xMzhRxvfeJZjhfVQF9MnBT9DFOys6
         KzUA==
X-Gm-Message-State: AOJu0YzGuRL4X9lmwLg8q9eb5Mle5wG6vVT16WaI5K6uEIKse3OBkTgf
	IeWs2CblOj5Y6HRr2Wc1x/DSwuQX+yx/uw==
X-Google-Smtp-Source: AGHT+IEtV6HuPnGC0V4gwKzjq3Iz6z5lRsdgpBQMn5vtqJg0uoZFVlsYTK7FRb6qkMF8DQgMhyQayw==
X-Received: by 2002:a17:902:ec87:b0:1b8:28f6:20e6 with SMTP id x7-20020a170902ec8700b001b828f620e6mr2392691plg.34.1691672628722;
        Thu, 10 Aug 2023 06:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:4060:10c:37c5:9724:a5b9:2030:1da4])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001bbd1562e75sm1679429plr.55.2023.08.10.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 06:03:48 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] recipes-extended: Add initial recipe for qad package
Date: Thu, 10 Aug 2023 14:03:40 +0100
Message-Id: <20230810130340.14130-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104315

QAD is a daemon used for automated remote testing on hardware which can
take screenshots and can inject mouse or touch and keyboard events.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta-oe/recipes-extended/qad/qad_git.bb | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qad/qad_git.bb

diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
new file mode 100644
index 000000000..e2a59139d
--- /dev/null
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Simple, REST-API compliant daemon for automated testing"
+DESCRIPTION = " This is a simple, REST-API compliant daemon which makes \
+automated testing on hardware possible by removing the need for physical \
+intervention as Q.A.D allows inputs to be injected via http/https requests. \
+This both eliminates the need to physically interact with the rig and allows \
+for tasks to be carried out entirely automatically."
+
+LICENSE = "MIT & GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=402cce7fbcb6ea9ab5a0378dd7f40806 \
+                    file://openqa/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                   "
+SRC_URI = "git://gitlab.com/CodethinkLabs/qad/qad;branch=main;protocol=https"
+
+SRCREV = "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
+
+S = "${WORKDIR}/git"
+PV = "0.0+git${SRCPV}"
+
+DEPENDS = "cjson libmicrohttpd libdrm libpng"
+
+FILES:${PN} += "qad"
+inherit meson pkgconfig
+
+do_install () {
+    install -d ${D}${bindir}
+    install -p -m 755 qad ${D}${bindir}/
+}
-- 
2.39.2


