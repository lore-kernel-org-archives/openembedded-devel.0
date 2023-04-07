Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA9CC77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 22:07:53 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2600.1680905272131067680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 15:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=CWNDrffp;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-93df929479cso246923766b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680905270; x=1683497270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgRt2voe9GttGdha6oo2QNB8VfaQqNTJwieBshoWhKI=;
        b=CWNDrffpNCvNMXHBMauMiEefr70PpWN2/qqL15GD74TAV3vywcg4roKphov3gqF1L9
         ifgIduM0ffiC7VjKmOm7TCUKexwq6TdMRMByVjIIopKwLQ8sfWZF+L6CSDid9ldRuAUt
         Ba8veuYtS/2KLcMv+w55c9CL82yZalXSwWMXLqDPnzlH95rxhgDTc5wzeEGH81UbQYO+
         d1nfQsAS7VXkbxpQeDmrYZlWbygepVzC+JmVuSdb81umNFBgsbFaqTFGWYoJT0G0JZ0Q
         Tf5v7TqSJJwJSXTxNDijFbgclNYU2RF+lTQiCYLTj97JA8pfqjsDIuwRoviZ5SBOZcCJ
         bsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680905270; x=1683497270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgRt2voe9GttGdha6oo2QNB8VfaQqNTJwieBshoWhKI=;
        b=T2fw9myu3hIsRFF8Qg5ZBgpvuuY/cTbmEXuijk7fcpei4PfFaqjwStpcVAGh3ZeyJD
         nGpHn/ZaBJAswrFoT2VKsZbRFDRokdj7suy1tuakEDGp5MJ+yzwILgtuHBSmllCgUnJh
         KqJ+K/3pYwjWzY4L3gW6O2ahRwRSsPXb449t+u+sH1Qni9DVz0S0t8KqVwrGIDwQ8Tf2
         cMQ0K6A/eZ3xDJZuTA3vHX8SvxZFHlEEhhBuX34ngA1GJSN0jMUSVHJ1tw/0v3NsUWis
         O7Y1wOcFKhE83tW+nNpLfQuSGwV2DE62JkQTXl8/ZetBTS9EuvCnLCVBzdd35QU19rm+
         6gFg==
X-Gm-Message-State: AAQBX9fY9fkYCR1WBGNE4fkKvLOxgTqHM7ure0xNgxA92FEInshkrpBz
	Qy/hWYsv/U8Ed8R9yw1RlIXL8LYLgmc=
X-Google-Smtp-Source: AKy350ZK62JPDs87TzWzNSzfga64r1npPGSiHCpS/K+zVH4SZ0JL4Ny3AdVQgjraLfK2GeTBX/JF/w==
X-Received: by 2002:aa7:c0d1:0:b0:4ac:b69a:2f06 with SMTP id j17-20020aa7c0d1000000b004acb69a2f06mr3078982edp.0.1680905270208;
        Fri, 07 Apr 2023 15:07:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o20-20020a509b14000000b004acbda55f6bsm2289857edi.27.2023.04.07.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 15:07:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] pahole: respect libdir
Date: Sat,  8 Apr 2023 00:07:36 +0200
Message-Id: <20230407220737.889502-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 22:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101990

* use the same expression as cmake.bbclass is using:
  CMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')}
  but ${baselib} should work here as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
index b7f1f8bb28..2bb73c3eb7 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
@@ -20,7 +20,7 @@ inherit cmake pkgconfig
 
 PACKAGECONFIG[python3] = ",,python3-core,python3-core"
 
-EXTRA_OECMAKE = "-D__LIB=lib -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
+EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
 
 FILES:${PN} =  "${bindir}/pahole \
 		${libdir}/libdwarves.so* \
-- 
2.40.0


