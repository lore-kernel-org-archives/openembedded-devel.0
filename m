Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC301EB64DA
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:05 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.9419.1687022102904759734
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lD5xgkDV;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57083a06b71so11732717b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022102; x=1689614102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2g5SfF8gKnQWyOJUSIZ930xl6PZV1fsP/gt1oUARkjg=;
        b=lD5xgkDVyVZ3La3334h9Ob+N3oq7ODVGkZDEFgC/Y8Np3wFEyxK2YhK3WUuqSXWPG3
         C/HzQjGh8ofkeA+bzt9wq5acNf7AasYdtSSifZXOxJ1efKHBXQWb4cAcSpk9hx/ELFnl
         keXu9f9b0m4RizoXKOw9lar7TNb4WsvZSCIlxg8BoRi1leGbZAbvHF2dgjqsKnkpj561
         mejuCy+THukyfPPEpBGp/CQ3/Lxy22TwljpH55kLsRM98WMO3mhVMlOx7KyuwHzs8y4o
         vic8G22rg+Zs7VPSa/armOHvp6jKhdFu9KaZCeyiCiIvysmmyLsBxo6mgilU4R8BWfBt
         pcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022102; x=1689614102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g5SfF8gKnQWyOJUSIZ930xl6PZV1fsP/gt1oUARkjg=;
        b=A+X9nSuDsmTVUdv+XOWb5e7nncrXgtrln80VyrIqJPxr0HjmNFSGr3ZY54cxj/dvBL
         1ZfzyFKY0ACj5tNv3YXAMe+cVcY29xvUIbQThA6zJTM97xeDNRpEF4/Fa7bu/Z+PJZh+
         gLk+Ig8E44wvE46mMZ6PPvoSBhiJN04xnhumdZNAdNPFOg/ppfeBegLuXJwJJk5t81j6
         WsbaN4+ukXg4t8+FbCrgWQHivPWRSwGRkCTnm71InteiXO0A8Q4HN95R2hGuiE3npPfA
         7mjNEg00pvCZSfah2e148XPZEB9rbwh8xrV2h1ooFZDBsEp9OAEJvb06b6NqHvLaGZup
         DYzg==
X-Gm-Message-State: AC+VfDxx7F68Wi1gSiMfkb2/LFmuMJqh2vvNoaA1uU/X0sG2t/ns1eaX
	skdBNBCWyou8wkS5bAvHe3ZQ4Pce2Ps=
X-Google-Smtp-Source: ACHHUZ6SxKzewjsoVEZAG2XqNYyLxt6Zpedo4iYAvidRk8gJVtntZ65iKN9nqDF6kHMSJNXPvvyZlQ==
X-Received: by 2002:a0d:dfcb:0:b0:570:89bf:6f10 with SMTP id i194-20020a0ddfcb000000b0057089bf6f10mr2066941ywe.25.1687022101636;
        Sat, 17 Jun 2023 10:15:01 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 1/6] glade: add autoconf-archive-native DEPENDS
Date: Sat, 17 Jun 2023 13:14:55 -0400
Message-Id: <20230617171500.70558-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103346

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dbbafeceb4f84625d6eab59c50500b6b8347c613)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 6c1112038c..28b1279390 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native \
            gnome-common-native \
+           autoconf-archive-native \
 "
 
 inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg
-- 
2.34.1


