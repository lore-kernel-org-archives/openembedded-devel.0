Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BEC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 07:14:33 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.13328.1646550872845641410
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XrrJltUD;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so4639554pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A1yOsrvV+nQM+h33IymSMsgRX8cJXl0obR9QZdyWkd8=;
        b=XrrJltUDuWcnRMNiAWKC+JQZr7z6FQ2LL90gEpurEaU7Zm4GByhkcKS+2iLeisysIV
         2ufXu8Q46xIWuTDAANLKesOx6OGO1qhxS87BB4Snbxen5RGbdfKyD7rxZYXs9fe82zPr
         upN3/UcNEXAM3B3fgyF0vwylB7W/R1Ex5s69fEOA+OGCtA3Lnf6jBQRymp2tQeI3lB+m
         tEUdsiViWlCRGg8hcouzhBdJTGeqFgWK7bd9z+CcrpmB27K2oy5Y0kSbYjXz+ZIEkiEz
         JWwNbajycAO5FSGugk9y6bpnZ9mAjNnB3MpjV0zT4jVhGkKWSLbZHbgb3aa1lJxuwm/O
         tkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A1yOsrvV+nQM+h33IymSMsgRX8cJXl0obR9QZdyWkd8=;
        b=P/qXR3+Dl957F8wwweFkGxwiF2hoTXgR0oQLdnGh/RikI6ChE/Y9ZJOPDXF779/cJv
         Ufvkk1UpSCgc9iL3PPLeSmWX+DVX+g2lqmvzSE1MSwNxXSWDd/q1xgKjVKUW4A31q35c
         ZvuRzOgdt4JWlvGB9YR/tK6GgtYxIS8U1x9g4iFazxb+HKxGijWO9xWxXIYuoegWdazj
         gS4399jP/OsVbnk9jdXxumhd3ve0yf0RriVXw0XyT7cVJ/n59Dgcb/B0hCDncoqGVzqu
         Wl9QkPsTSKpr8SCrifQTSHYKpIYG1rES/l3zlCCk5YuGDcsYeDk5SiAUZMCxvpMeyctl
         aRDw==
X-Gm-Message-State: AOAM531esLo4ST1tYpZbJ9+TSTmm+K0gE1l8s0tWjtzD89dkNE3fucQ7
	XGRDh/ftKhukrsggDGJLubVt9hJc0bs/2w==
X-Google-Smtp-Source: 
 ABdhPJy1MrlKFgAOLzTUi3czKJcUbJZgG0WzyaWOpnQflVBRUhMxAT7N26Sx/mI/peLY4PNDA03nig==
X-Received: by 2002:a17:902:bd88:b0:14f:8ddf:e373 with SMTP id
 q8-20020a170902bd8800b0014f8ddfe373mr6426479pls.89.1646550872154;
        Sat, 05 Mar 2022 23:14:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm684728pjj.39.2022.03.05.23.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 23:14:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libbpf: Enable builds for riscv64
Date: Sat,  5 Mar 2022 23:14:29 -0800
Message-Id: <20220306071429.1698789-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 07:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95812

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
index d1360f66da..71eebdebea 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
 SRCREV = "5579664205e42194e1921d69d0839f660c801a4d"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64).*-linux"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.35.1


