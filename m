Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C3DC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:28:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.512.1634750902230528953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=czQviUOU;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e3so48149711wrc.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuAeiaWs494YNRFO2+fgF8hwUyNu1kBKqIorh+g+X/A=;
        b=czQviUOUfAjrEwC/KOu0sJSuUUxfjfr8c8bbQP6XfRK60zFQcAf0P/a1OHvmHnMyUr
         +n9w21ip51V5B0MERxyrnncIfHv5Ooj2Yk5YoHGSSnvtpSnfzQETtYDjqxmPYfztQf+T
         YQ9CiUJJb99S0JYwx/OU43fJbr0uqAAw2E7VIkRvOh6JthwlBDDcUrPEQcZAvvelR+QA
         2nIA6RHKnSU1oOrgQuYRCsyIKCXTcTuXHXhbb286OgmwqfaZAThcAvwqG3QC1L4tq0uH
         NFxIcwQqHP1mdd/CFHGYPF7xhcjjWmoyYxbHUO7nqHBqXKwz/WGBtp89xNMqQQ3GJme4
         +dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuAeiaWs494YNRFO2+fgF8hwUyNu1kBKqIorh+g+X/A=;
        b=RFi9wXIIVCbTEnWWAzI1pvhqlTqe3JGTejaOKkOenSO+ZSJ8LqQ3eXFiLdmLdMHWom
         isEaDNpSDP/jdOu0+xT1SR1pSuB4vIhyp/ilrasD9idi5ulb9rpDLyCPHH5oul27l65w
         0tWKX+iLziw417Xjo359h7kSYH/JlMW69fLaIe6BmkY3nRlZIuNnsGGmkBsL4AkWi9F3
         cQmrrb2ca3GYI3d07Nn/B9KvMD3aS8yIOb7un2nAL4aEY0q2IqBuje+xsVzLp4ylVm00
         Bb65a2cJhVw+pzJipf2ZGxNE5GWpjQyy+tLpbnLsLHtklengwyRoWX7+ZyGYcrJEiT2U
         u4cw==
X-Gm-Message-State: AOAM53249nVJ1jsaZtOgNO+ojylW3ZbDdB+kjWuUu080ff2EByKQS2ae
	jFD26IVdoxXamnw75KnEI9vidy5XXfU=
X-Google-Smtp-Source: 
 ABdhPJxDwZfi2lWZiGuEv1u4lYJ96LKG/cBx/tzYDSlaWjaVM8uXTYJzUsCgnMs4PkFi05SXNbspgA==
X-Received: by 2002:adf:a40f:: with SMTP id d15mr668474wra.41.1634750900525;
        Wed, 20 Oct 2021 10:28:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 j1sm3429536wrb.56.2021.10.20.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] luaposix: depend on target libxcrypt instead of
 native
Date: Wed, 20 Oct 2021 19:28:17 +0200
Message-Id: <20211020172817.576780-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:28:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93496

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
index 444b63ed77..0e5cd09e0f 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_35.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 HOMEPAGE = "https://github.com/luaposix/luaposix"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f81069e00c0cad249f20efe958276db1"
 
-DEPENDS += "lua-native lua libxcrypt-native"
+DEPENDS += "lua-native lua libxcrypt"
 
 SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v${PV} \
 "
@@ -16,7 +16,7 @@ B = "${S}"
 inherit pkgconfig
 
 do_compile() {
-  ${S}/build-aux/luke
+    ${S}/build-aux/luke
 }
 
 do_install() {
-- 
2.32.0


