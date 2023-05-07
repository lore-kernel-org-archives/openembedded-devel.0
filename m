Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C86C7EE2F
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.94796.1683499448716744540
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Mgsyogt9;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so7427477a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499447; x=1686091447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECsR9cAQuk6pxEokrdSw6lYNylI+3bj7mTK7GlwO6Y=;
        b=Mgsyogt9sWbsIh/gWnnOK8Ew8DpgVPx1iyaAD+WnTy6H952O78IPLRzH0n2d6lZFOu
         kQ3SAmpUkWdmS5PJfBwnU4Ec2BGpFumbtL3gXna2THyeqiAVjY4dszv5VZgvJfpvZ2Uj
         EzFp1GFjEbQwvyKny6QMQZMkxROLZ6LuqLo1w4vdGkAf4pPeYb0h+S1QZfw9Tpb/6GYd
         4Y3vQEQak8DPLTFUEiT1xfbuBzV0sxieZBtRfTKSCoFURvQXk2kYZAOMY9yAXGQvDQj1
         mmhDebk/dnWbdOaw8HhLCucmmZhbvHDxwnLcU36mVwsVFTypu8iU8b3+cemeJjs4PoZ6
         GoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499447; x=1686091447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IECsR9cAQuk6pxEokrdSw6lYNylI+3bj7mTK7GlwO6Y=;
        b=ORH5nOHoPG1WyY3cAx5hGyICp9pIi1Ow58AKAI1UBOuGOPjrpCIXxX9bmLLwykqlqu
         g8xFSYt9C3SWsoSOd96+Vy1IjeN/VbBmckeqQRgXkFup+7cm8VxuvvbKhOO1ZwWqrAG3
         e8gcITHsal6oLGCclVY1vlHMtE6qY5MXJZSndSug0mqDXMojbfr6AdGt7fBlLIha/Jqf
         MFP+zHE7jIxI4CwtxOC56iRORJxTS5WBJzg+2N/+8KyxkE5jxV+2kO4T/XXGQmdLOZyu
         0bVY61Uj4coTprsrubx5pws1UhAOieiNqj9Mv2Sx/mVZ/R3RyIOiZFCfSB8zapB6utun
         lwNw==
X-Gm-Message-State: AC+VfDypM6FAVPetNxINeRmXPa8F2mBQEfdp4yh2F39y1Ea3BZ/+Vk85
	HObi5OMmlaIlkeqboZbhAmltU67TrGI=
X-Google-Smtp-Source: ACHHUZ4NTVTvUpBuBg5TbwDsLtTdVqb7YgYZzL7BW99mcZ3HyKyBlC2ELziTK0LyJuzPcHgfx6ll/A==
X-Received: by 2002:a17:907:1b08:b0:94e:d951:d4e7 with SMTP id mp8-20020a1709071b0800b0094ed951d4e7mr7089441ejc.59.1683499447035;
        Sun, 07 May 2023 15:44:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cb24-20020a170906a45800b0095fde299e83sm4124488ejb.214.2023.05.07.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/16] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Mon,  8 May 2023 00:43:40 +0200
Message-Id: <20230507224354.1149327-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102364

* the libdir is arch specific, but the subdirectory is always BPN
* fixes:
  lib32-dleyna-server-0.6.0+gitAUTOINC+eb895ae827: non -dev/-dbg/nativesdk- package lib32-dleyna-server contains symlink .so '/usr/lib/dleyna-server/libdleyna-server-1.0.so' [dev-so]
  lib32-dleyna-renderer-0.6.0: non -dev/-dbg/nativesdk- package lib32-dleyna-renderer contains symlink .so '/usr/lib/dleyna-renderer/libdleyna-renderer-1.0.so' [dev-so]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index 3e43c0d2a7..e7f918333a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -22,4 +22,4 @@ inherit autotools pkgconfig
 CFLAGS += " -I${S}"
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index b25e446c41..071379758c 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-- 
2.40.1


