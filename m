Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD49C677F1
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:24:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.17427.1676910274821995874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oQiDZ5LV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h16so6975710edz.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Zy3BztJ5FHLpPr5NXvdY5kLc2IFJCXD+FUJM84yMY=;
        b=oQiDZ5LVnjq/QlrFfVQ75fG+hTux0/cI7iTNzli9NGnQiYXtRnw9XeQdvDdQ0RUXhL
         USysOBFNqdw9rD81kx58ixY83vd3t/JHiQ5CoTchMAp4w0vc1DXC7HOKcngNg7EXrDdt
         4jpS/PKHPVoLZoj6PdRV6ekjJUh4DFDdMLLTTn/Jxd2b+7F/6pykQ9Cr5m8gQcuQSTvL
         hP2I/YeR0oRlzw+O3BaLJoavETbH2TRrDJjModqz8OXJjfSaIikPKRIPM65DZCs+IyNc
         QyhwGLWVP1detj3MKj1iRVArgZKhAjKUDlBWAMjH2K62tHqx3NnOScKestEtbQrVTFQk
         hVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3Zy3BztJ5FHLpPr5NXvdY5kLc2IFJCXD+FUJM84yMY=;
        b=z35amsDN/2JEANYyH52bylw243UcUmVLHWw9TcLpCcGTdhP6hbxsyL+AUhFWD9v47a
         AyIXRsf3+cjct6Hmrq2DR+r3wSMlHg3D9GkQGIbkMChNc5bhTqmiX3+BcwCbzEI4kfrt
         vnxyWNJrJ3tk173IMyqtgJYIwsmYGsPVKK/bgLFu3Oheh8xyfQ2NznDac1ntsfoyP00Y
         PoPut2+E67kRsUQt+Glbfs6HyvjgJPxQMvysb8SqoApQ5Fkvv1iewjhpvBMLBXI3FJe8
         yMHdWVjhjOecU59N9y9/ID6QVlZHIOFAWHQ6Hrffsp3G3MRF5anBivqX0Bal4sFHAYkV
         qyMw==
X-Gm-Message-State: AO0yUKVRnf/uGAppp4q+vnV7b35FNCWak8hNybbN02At5UhuI+lkDJsu
	08msl8YVW8DUL3RqcoHi3DC8X/xNzNU=
X-Google-Smtp-Source: AK7set99OZKE/3hNyELnvx8PJ3NNL5/lLRfvNZQkE7ks5FjpB+X7Um6Typ22qNqOh6+hs9PzcWVJ/Q==
X-Received: by 2002:a17:906:f755:b0:87a:ee05:f7b with SMTP id jp21-20020a170906f75500b0087aee050f7bmr7883675ejb.24.1676910273166;
        Mon, 20 Feb 2023 08:24:33 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k12-20020a170906578c00b008b9b4ab6ad1sm3849669ejq.102.2023.02.20.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:24:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone 2/3] exiv2: fix SRC_URI
Date: Mon, 20 Feb 2023 17:24:29 +0100
Message-Id: <20230220162430.30368-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220162430.30368-1-Martin.Jansa@gmail.com>
References: <20230220162430.30368-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 16:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101178

* https://exiv2.org/releases returns 404 now, use github releases
* it's already fixed in master with upgrade to 0.27.6 in:
  https://git.openembedded.org/meta-openembedded/commit/?id=00a7d4b284c1afccfa26021111384d2184b82e5b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 31afe78e45..b210fa6340 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat"
 
-SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
+SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-- 
2.39.2


