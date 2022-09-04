Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D61ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 16:36:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.15200.1662309385232043252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 09:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImM0ypgw;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id w5so8428580wrn.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=iwQ6y1W7uXmBY+QXFGZffBwMq8LkaZon5MSezIi3bR4=;
        b=ImM0ypgwVo3adQHBvzdfGers7ZcN5tUzYj3BszHaZP2wxYSJwms8RNAqi7zmOZM28u
         NsmXOuGbkghnneh2YaOpqonpdr8hVLd5+ggEh5pgAWp5CZ2DFo/pmglSKNmmXXoKIWt4
         wBgq5hml0M6n+TKtPy8XVzczWpGMIAozr2RaSmE/aRDMm44ZmLYP0Oc1eXqynIg2iIas
         6EKNSzpZ+Ff9VAicw8ZY1iLjhD8yuCFRPR8VCTIjMl8cwFkC8wtV7p3Ol4cAmS4hf5NV
         XpyYxXKqQJPC2XK/M+sDlN+cQ448nwsBDoqxCBKJ5ordzkYB2KgLus8hRsOLjlLm6pgk
         2xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=iwQ6y1W7uXmBY+QXFGZffBwMq8LkaZon5MSezIi3bR4=;
        b=Vcu/ybpdL5vWEFVas7FlqShtivDTtlm64YnhYIrN2XBbevP0thappBmHQU1ubE1smZ
         9NTg5odqSPPaukFIXUU7L6UoYyx8OXyzys5zoPD+8LxYsMlbs2RU3SKnAgvSpQTPvltQ
         X3Qyx8c1ctE+wz/CTanQ6xZE/BJXDprbtjLCGgeHcukiQc45tDsoSVr8VdB4oVpsSt00
         hRCt1C0xVHMVoek8PFBDlvjaLRGkuiE6Hjjq1iV7pBiu5PyfZaG2sdC4Ug7dsAvLGvKH
         7qjqgOI7tHKkaxNGQZnTt82BCEPdq6G1P7Cm7qAu0Ml31FDLUNLc57leJziTrG9oQega
         p8IQ==
X-Gm-Message-State: ACgBeo2SPPuisr6atFvPCdRdxj6HTlDY1a3jzv8k/1lPNm3IGnjgk8e0
	hOqHV6vjpkMBmxNFh0GY/jei5Rab8pk=
X-Google-Smtp-Source: 
 AA6agR5K67FCrzr82eaG4CfQxCVgPqjukXosj91q+Rs8H2ywQPk5g25+npslzO4g/rdG2bmIpT6mJw==
X-Received: by 2002:a5d:6c6f:0:b0:226:f30d:95ba with SMTP id
 r15-20020a5d6c6f000000b00226f30d95bamr10619997wrz.170.1662309383237;
        Sun, 04 Sep 2022 09:36:23 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-109-113-187-149.net.vodafone.it.
 [109.113.187.149])
        by smtp.gmail.com with ESMTPSA id
 by8-20020a056000098800b0021d6dad334bsm6370659wrb.4.2022.09.04.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 09:36:22 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.36 -> 6.1.38
Date: Sun,  4 Sep 2022 18:36:02 +0200
Message-Id: <20220904163602.3663384-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 16:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98658

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

refresh patch for new upstream release

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_6.1.36.bb => vboxguestdrivers_6.1.38.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.36.bb => vboxguestdrivers_6.1.38.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb
index 7eb497ab1..235bc3061 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "e47942e42892c13c621869865e2b7b320340154f0fa74ecbdaf18fdaf70ef047"
+SRC_URI[sha256sum] = "56d997b58154df3974ce040a64970fa774add41e84b23dfb84b279b24545d7e4"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


