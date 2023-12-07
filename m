Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C9CC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:56:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.83277.1701953790997231145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+STRalK;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c19467a63so10397475e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 04:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701953789; x=1702558589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPsqcrIkK+gooKKTmamTLjvnbres3JsXxUqLzeVtcAk=;
        b=m+STRalKZ5uGoiO1sjbr5Lj73p6oXkNtK2OU3xtb7bz79YVWCooNv29rKThkD432Ry
         25hUx55atqNElKk0qSIxqWr1fKxF1DTrY+78E1B68R8ypNkHGl5Ruqdx7KlmoSMdfcB/
         2cKbzrHnf92+0iYQDK65mRA0AGpw8BNWZYwGJn1V+JSiLaoPyBwfcdnhec8wbe1oDoda
         hxrJ6kskPGTr1rOjZpW00ddzWifoxbaent/iYtMn/MNmCUpBGiRSAIrbat9m4YHliu64
         WtRBYyKTy97k+YGWcrCLukIA2W2nex4IkVOm1Tuzf/iPXw3hyrjAS46Uzv8i4qHK2XAK
         PmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953789; x=1702558589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPsqcrIkK+gooKKTmamTLjvnbres3JsXxUqLzeVtcAk=;
        b=Rq6P478RIwdUPQQTaIZUn8LhmBUyhz1wbWFc8Uvx+50aTmucFjHTr5C9TdHp7jBWkC
         kIsm6sQyOfCUyedBz/95paC2JmBm7bCM/77Fgt7jzd665/U6BAG73OiLNi/8R7G+Puzn
         6RPeCn8LOKk+bueHY6wjuqqN8nJ16BivwR0GNXY1AK3s983tLnWQ/FXDOGzHIaG/NC6I
         I7FmI0zGRh2rRYfusx5LZ7KNPapV4wlXy3BPKlUTGN4BpMtBlsyX26i71Tb9dR0tMUwt
         wPBwuzVGpzRniyacbzrwrA7iByIfuJxu5h5ejUW3aB956zuxxHfDGmHP6m553yjCk535
         rIow==
X-Gm-Message-State: AOJu0Yxj+uDYmIpOZuTT1/hrRMKy/WkqLSJa89Ey1FoApKZmLo53+yvZ
	H+RpTm7//MnykRDAKDomyekwEDQXAbU8bQ==
X-Google-Smtp-Source: AGHT+IEB1dH+t0hieJiASoiMzsE/v3BnJygi0Xxri2fo0m7aJokFFR4aKKMq6XKnbqq4/qk0FfVWyg==
X-Received: by 2002:a05:600c:19c6:b0:40b:4cce:a799 with SMTP id u6-20020a05600c19c600b0040b4ccea799mr1531296wmq.29.1701953788381;
        Thu, 07 Dec 2023 04:56:28 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id he15-20020a05600c540f00b0040b5517ae31sm1930596wmb.6.2023.12.07.04.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:56:27 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libxaw: upgrade 1.0.14 -> 1.0.15
Date: Thu,  7 Dec 2023 15:56:14 +0300
Message-Id: <20231207125614.1390970-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 12:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107280

XORG_EXT tar.bz2 removed because not supported in the new version. The default value defined in xorg-lib-common.inc will be used, i.e. tar.xz

Changelog:

* configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
* Replace calls to index() with strchr()
* Add .git-blame-ignore-revs to hide whitespace commits from git blame
* Remove "All rights reserved" from Oracle copyright notices
* fix typo in XawMax parameter in GetBlockBoundaries
* Stop memory leak in error paths in XawTextSinkConvertPropertyList()
* Stop memory leak in GetResourcePixmapPath()
* Fix ctype(3) users.
* Fix spelling/wording issues
* gitlab CI: add a basic build test
* Build xz tarballs instead of bzip2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-lib/{libxaw_1.0.14.bb => libxaw_1.0.15.bb}           | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.14.bb => libxaw_1.0.15.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb
index 4a909848a..253bb6ff0 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 PE = "1"
 
 XORG_PN = "libXaw"
-XORG_EXT = "tar.bz2"
 
-SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
-SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
+SRC_URI[sha256sum] = "ab35f70fde9fb02cc71b342f654846a74328b74cb3a0703c02d20eddb212754a"
 
 do_install:append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.25.1


