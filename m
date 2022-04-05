Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8F8C43217
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.4393.1649155289011012926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jXTchh+z;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id d10so9583562edj.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbPtRBihDPXxWiolIvOARBbg/ZGGi2kl3ouCu5Z6Gx8=;
        b=jXTchh+z0N3BDh40BoXIL9OM6aVqokZfOMWZX6m/70jpf6ouMK8fXa/g1Z5ZM6tL9j
         DW7BdTS5oBUixCiGK4mGDjQqlk+8HjTV+4gqombWNa6b2SkhF9r3h96tM0kXTmemxWoI
         mlIqQdeik/2No5pr6aTcSltj576hGph2FtCQVIpK9VRDedWeiDgXr02/6nDwsmU/aK+h
         BTadvkfjruo/XU3/7+3lAZ4u6Ak1uia3mD9T9iCBefi/9u2/GSvq8TPsRpaiGYzKmYAb
         D3CO0lBD0s7Okbr+Nj5IvGSM4U97MfznyJ9uHTSpd6b4J0VcWYjnskbj2S8RugQDpHi2
         bkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbPtRBihDPXxWiolIvOARBbg/ZGGi2kl3ouCu5Z6Gx8=;
        b=gO5tOF2bAinIbrkuUAnNIyRx3bb8ZwIpw9dcQS8kPnS42bUpSXCIm4uU9PKFPVVXt9
         2oex5Ix14pVgpAGMRKuX2mfAfgbeqBJBx96e4GG9Qvaiqj+IijYDMCaRq55NveM8wL5r
         flVc5bohFz5PubHsuTlYScWS7uyl3yUbGp2KXygNqr8z/OVnIrlIKWjmwuhacnLjTwnV
         8cYkh33kbObKM8HrHoU5epVvZaZYvtLuVh1xv9WIB9r2VfF3BE6T/H3FQ9hEvYiMTYCf
         psmNyV9yuqJU2AXLFWmGe5NhZem8zpgcLOmitFz1DpOD5p7v3+h+qpyvZDu1eRy46rho
         /MKA==
X-Gm-Message-State: AOAM5332umXGeUA43LzYbtIrd6SE3gvimC2qoxaxMXUNbbYY9Rj3dqUJ
	3XfFnRodOVGbKW++3cdjfbmF9tunW6yHPQ==
X-Google-Smtp-Source: 
 ABdhPJzgfnbj2WjSbedKIcRzFop4IlBmnQyfP8khPNzeKfdy1D1a74gDUiqPRUx/ks+IUfv6DxK3tg==
X-Received: by 2002:a05:6402:1255:b0:419:3808:3d98 with SMTP id
 l21-20020a056402125500b0041938083d98mr2850794edw.134.1649155287414;
        Tue, 05 Apr 2022 03:41:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 wn20-20020a170907069400b006e7f3d0c90esm2030647ejb.137.2022.04.05.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][PATCH 1/3] packagegroup-meta-multimedia: include
 x265 only with commercial in LICENSE_FLAGS_WHITELIST
Date: Tue,  5 Apr 2022 12:41:21 +0200
Message-Id: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96425

* fixes:
  ERROR: Nothing RPROVIDES 'x265' (but meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
  x265 was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST

* also include i686 so that it's included e.g. with default DEFAULTTUNE of qemux86 as recipe allows that with:
  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
  i586 isn't used by qemux86 since:

  commit f3b1e577ec94c849d0354f5679257f02ef4e4fe9
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Thu May 16 17:04:04 2019 +0200

    qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 73b852a4a9..ee8b862681 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -72,7 +72,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     tinyalsa \
     tremor \
     webrtc-audio-processing \
-    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "x265", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 i686 x86-64", "x265", "", d), "", d)} \
 "
 RDEPENDS_packagegroup-meta-multimedia_remove_libc-musl = "projucer"
 RDEPENDS_packagegroup-meta-multimedia_remove_powerpc64le = "openh264"
-- 
2.35.1


