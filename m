Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E668C77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:57:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.52929.1681153046590464222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=UCcI+5wp;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-94a34d3812cso141181866b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153045; x=1683745045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=UCcI+5wpd4RKBWWOGsQHbQ7pmLzAOHOoguJP2zhvxLsWe3jIOmCG9XfXF2s0UmFdkv
         /Pe8CZ64Y3FHCbk90eAbJK+OWJCdOL5xJDTaxWyRLwKpxlYi0yjysr00JkyWJWjQa55t
         ZBgx66/u3ARtzL6DZ6TM62oYd/c0hbQ0eexVR7NTMmxCI5UTYqilT1xRzlMzsbhWp3a6
         ci8bgOug3MQlLqWCHYdxL4zuwZSadS/xWfBzUWI5q56AutdVNIAkuYF2qlcOyJ+6cqv5
         5Dw3/toUdBh+TC2MgayC9VRglia80vw+6KX57bnb29G05kon52piU+ykeqBUIaX5mykU
         We3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153045; x=1683745045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=Ef4sBTyYpVc+01JXF1O6yeUjG4whvT/avWNsczJaJ0mNx2BEvcCNLrg2kYUc8MlmTh
         j62D4b24v2sKjlf9M6/QHQ3QL6aBi1myFkhxj/5vxkSY8jXNEA3yy3UCUQdGSoAcPh3R
         fmkoIsSdM8Gkcaw6k7QFFlmJsHDe+xgd++gqmzYGDkUkLiH7gARzOvXiZ8U0X/tFZwHd
         qhEfUZZ75ZHXEqYfQwGNDxC09tIS1m6wKom60oCH2sRH457EG1mQEgh59EznYazqsT1p
         ahLF4PG2A96MzxmHsVlSYC2CVmDbEwjVKeKkfRwbiOyoe6U96SzNO1zLGk97FZhtE0MP
         OwUA==
X-Gm-Message-State: AAQBX9f4W8Ur5rALEqmkN3Wv7EUMrjXmuKRzh/NaUKTb5xiNxzV3i7Wh
	ht8lhvM2Ge3YkXzWcK7XfFuFjObtQ60=
X-Google-Smtp-Source: AKy350bCDS3qzXSkEcJVB04PDIvbl2GwMa1uabtq2rubsyNWIWYesRloBKlXjVL/QecWTIWXeQTdTw==
X-Received: by 2002:a05:6402:1adc:b0:504:98f1:bdbf with SMTP id ba28-20020a0564021adc00b0050498f1bdbfmr6430708edb.34.1681153044636;
        Mon, 10 Apr 2023 11:57:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j14-20020a508a8e000000b005029c47f814sm5098780edj.49.2023.04.10.11.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:57:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Mon, 10 Apr 2023 20:57:07 +0200
Message-Id: <20230410185708.2416472-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102034

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
2.40.0


