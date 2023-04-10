Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A95C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:51 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.52990.1681153123331810073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=KGiM3+uO;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50489c0dcb9so1409990a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153122; x=1683745122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=KGiM3+uO5VX0U4UIXXR16yasaHNjirlfQiwb800FAPW6bN+8qIbd50unodhAQLdIoI
         CmENuky7N4tKhLvDoXZVIdA/Kvo63h0FiFs/8y06LykKb0kH3hiTeO2pdbxMRx6lDipF
         PHCEM2VqOvf8YhI/Xc9yrL6symXGFAVDYHovStUeIoCkKZJWPNvg8o4twvnEsa/j96dp
         VN3Xilxo3gfmxjlEzqQBLzjXR3NC6hPZ0u/eNbKNwhU0iaPRz5fOWRJ/YmGTcOAc7JBo
         2f2VEh0TlL7N3cFG+FdgIrMbFTlGYu8RTX38LOBOYl8nOWAh6hX7b9hRgfxVrE2RXODv
         e8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153122; x=1683745122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=zLbj9ZFbHTJ8pU37McpdFNAF3eb3/Aba3IU5cR6poUyePLrVD0f4I26ZiuSZRqTl2t
         L3RyvpU4GmV0i5pG6FyebnJCxw7JsOHF/hqN/ZtgsXJq9VHHhkVs5bNVEv9mkLOwlCsP
         seCGn18Sj/QEjsVt8Zy3VI0+GbBJ7NFW3ZEikthiL7n3BRimEhzOO1f2a9QKgIJbYJT9
         jw/yqcTO7DxcLekj5h456MZ/dYpCKWr6oyyek2tFkxPpuQQ/xEX+0WQLDlW2g3MEkfjZ
         O5sZtva/c7b+XrbVEJ2xR4IKzMMCE63SmaEZaICLerLddxb7lIlOaRo4NsBbYp6wZRZa
         6wpw==
X-Gm-Message-State: AAQBX9dMomMNmctVPQioQXf67mXpVWdqfJ4y7NYnPaOqNcXKmAwhgOp3
	I9iHQclOCO6AawYooWjXuJwodRYl2WE=
X-Google-Smtp-Source: AKy350a/ed69JuabkZzwfpmWXqdBBrEPIlIFivk1l0xzI+rI4OaE/pZF5+dWbH6FXrlODSqbcK1Wrg==
X-Received: by 2002:aa7:c0c7:0:b0:4fb:395a:6aa4 with SMTP id j7-20020aa7c0c7000000b004fb395a6aa4mr10067562edp.31.1681153121744;
        Mon, 10 Apr 2023 11:58:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i13-20020a50c3cd000000b004fa012332ecsm3707139edf.1.2023.04.10.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 9/9] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Mon, 10 Apr 2023 20:58:19 +0200
Message-Id: <20230410185819.2416704-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102051

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


