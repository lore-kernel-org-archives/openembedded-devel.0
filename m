Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DB9C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 19:26:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.2610.1648409203032804065
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Mar 2022 12:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJvlUPtT;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y6so10521098plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Mar 2022 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbclfqYclc8RP0ZFhvLhsQDz7MHuvll12drhuPUtAhE=;
        b=YJvlUPtTqavqaoJA5gVdvVKFX+aySOjf5b/ElEIQaCBsaSRQ0RSKdPpQRnPZmpQx+D
         u0+bYj2H2SAMLNtL8sdadTelVyDW5PCUFMwDBd8vA1tS5PJwBKKIB/BbD5XB0CBSUgBe
         vRRgCkflkqgnqD2pdHeSx6I74tnEZDT73psNA2K0dLyXfpGaotzlOdw/qGy77GP4ade2
         Pv4hEetY6dCGUGFspbYANtodNceJzHysIhKg6kN0f9PygqkSWQllRQrIBgLm1bGEFVWa
         ajAorcVl65qlX6DL5Q2c/ND40y72ug+w66M9S6/MNUeedDJ+YcErw9XlfInIh7SBfNep
         BXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbclfqYclc8RP0ZFhvLhsQDz7MHuvll12drhuPUtAhE=;
        b=wt7j2eoKC49XiTG1BqqGmZCNHrUAdkAtVFSNyHmOU+rSBISYE4OUF4BU6LHU7eOVhC
         l2V7ZyO+Y9mczpC0FUDq7yGg5N7iRuftCAtMQaJYX6cy0jK0iSefd5kqSlv0ZEWMIVzj
         DftiF1HC3ZhS9TtWrFucvGvWVkJSsob3+nwHI8bpyn/mb4qKC2sxG5lbuksqqxRC4diP
         FOQD6HqG2aYUSRUFVJq8ie83xoPG00uajUdMhq4mm/X5xlGTmZLFDAnIybraXlU17n6R
         gppnbKzNn5sgTA7um2rWrUrMH0ymWqQZgiZjzLSxPrfwVthrq4wAPJh5iyLFEXnBdM0g
         ANGw==
X-Gm-Message-State: AOAM532lVgBd+8rFwxkdBSgyjQ4boCrJfdThei6ZuIe6ghm66J/9TPWL
	c1f3Mx58mUi38QSwpqLndq0i7iDQ1AI=
X-Google-Smtp-Source: 
 ABdhPJyR4XXUIbzIBVlZtynRpabkVFQhVzvzAF1+NFeinJb6SoY3OC7BqV1U+wKxJQHCF+cAo/O5NA==
X-Received: by 2002:a17:902:bf4c:b0:154:9f0f:fa42 with SMTP id
 u12-20020a170902bf4c00b001549f0ffa42mr22654400pls.120.1648409202315;
        Sun, 27 Mar 2022 12:26:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u62-20020a638541000000b00382791c89efsm10819838pgd.13.2022.03.27.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 12:26:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] duktape: Use baselib to construct LIBDIR
Date: Sun, 27 Mar 2022 12:26:39 -0700
Message-Id: <20220327192639.332019-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 19:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96224

duktape's definition of LIBDIR does not correspond on to one on OE's
therefore synthesize it from baselib instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/duktape/duktape_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
index be233764c9..7674785437 100644
--- a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
+++ b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b7825df97b52f926fc71300f7880408"
 SRC_URI = "https://duktape.org/duktape-${PV}.tar.xz"
 SRC_URI[sha256sum] = "90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890"
 
-EXTRA_OEMAKE = "INSTALL_PREFIX='${prefix}' DESTDIR='${D}' LIBDIR=${base_libdir}"
+EXTRA_OEMAKE = "INSTALL_PREFIX='${prefix}' DESTDIR='${D}' LIBDIR='/${baselib}'"
 
 do_compile () {
     oe_runmake -f Makefile.sharedlibrary INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
-- 
2.35.1


