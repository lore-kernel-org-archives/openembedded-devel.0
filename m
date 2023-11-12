Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88600C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 14:53:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.16301.1699800786573847064
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 06:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBGmuRD4;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so5546247a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699800785; x=1700405585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne7vVatU+ciQnyTrYIcJoMjnNdgMlj6tuL2i4VH17V4=;
        b=OBGmuRD4bmDPiKwv33fmrYoWOrVUuK2MdKP2RNCvdkYlGG+YllP3ht8Ih48emljDh9
         YUWSONQ8G0WXQ/pxGWw28GDFjiLjsD4eesV2qKZOEX2ojNnMh76Ky4Eti05ZwBa//v7t
         IXkusWCCBveZgVzGi6m3XeeyU+Naas9Bs1jNEJAtjkn8LEp0YhW31rzlfWqPKzY3exR2
         /x+2pXrAJOCLHKUo0lF2JBNX/yyrhZR2kUeyN3V2nyxmnv1/k/ANFoQ1uk1AjkMO0vvK
         1NkiILYPZlFExcm7FRjMbECZEBvuNOLqo8keH1Ab+3NUOayX2JQwLV5fuzWaG8vZpdnS
         RPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699800785; x=1700405585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne7vVatU+ciQnyTrYIcJoMjnNdgMlj6tuL2i4VH17V4=;
        b=WeK7aESkyEbikNTGNM13RaekMCWwMCusXWJcYJbMaZ2LaNvlTTWD8cdeEvHdvGBflE
         QecLZ5l0zb4/TKGacs7Jl4sfQYGWbLNi2/KArv/fllbY8/B6BdBVbgDhi7KC09PkWntZ
         nd+pmOThdAggaE0wO5gIKEQ2MDFqER+5TkNFDgy1eyq1Saha/PgbpE/wTnHBCuBWMOO/
         ZNMS4oee8i9dv9lx0vli1T1RpnMDaVLL+T46xd0t5LGDo5GSfB/Hi5HmyatnzSt2TI4J
         mbj/cInu8/ZME6BSLsROtceh+ljwHiXt+65iXU+jjm2a4iQsMHMCFcZEMIGhjcIsRM7D
         QCxw==
X-Gm-Message-State: AOJu0Yz9jmucxqEmufulvicHD2+4v7MzRgJfzXgxFlj53eyv5U44dBmZ
	pXCBhcp+JwHTM81xqDtX2XAv/7RBKb8KKg==
X-Google-Smtp-Source: AGHT+IFXiNlI+XtyOz0SK9ITzekCzWNU4EvjzDGlr2Ts0FeT+aRuefmNJ10aakQD9SqDrvfPkS436w==
X-Received: by 2002:aa7:d805:0:b0:543:5852:2f1d with SMTP id v5-20020aa7d805000000b0054358522f1dmr3206039edq.37.1699800784467;
        Sun, 12 Nov 2023 06:53:04 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id r25-20020a50c019000000b0053dec545c8fsm2427042edb.3.2023.11.12.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 06:53:03 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libde265: upgrade 1.0.5 -> 1.0.12
Date: Sun, 12 Nov 2023 17:52:54 +0300
Message-Id: <20231112145254.314910-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 14:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106589

Changelog:

- security fixes
- fixed generation of pkgconfig file with autotools
- fixed crashes recently detected by fuzzing
- read HDR parameters from VUI header
- fix reading matrix_coeffs from VUI header
- build fixes for vcpkg
- add API to read VUI color information from bitstream
- fix race in static mutex initialization
- fix missing headers to install in CMakeLists.txt

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libde265/{libde265_1.0.5.bb => libde265_1.0.12.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.5.bb => libde265_1.0.12.bb} (74%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
similarity index 74%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
index d0ecd04f1..3c9f89949 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
@@ -8,8 +8,10 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e3f277d8903408615a5cc34718b391b83c97c646faea4f41da93bac5ee08a87f"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
+SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
+
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"
 
-- 
2.25.1


