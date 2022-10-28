Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F0BC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:32:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.5634.1666960317540515019
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 05:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=etXwIACT;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bk15so6368661wrb.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhOeA0NRAwzB9kiwcu1HO4leHSsnTIgO3i+7vZPDD7k=;
        b=etXwIACTPxDshVKb9lS887fsyB8pIxlFA995Hg99HiavuCLDsFU/MKvaDC8OW+Xux5
         03RgbKx3k6vLytQdCfHihpVGLhg1ayvfRjG7t5sZcchMm1INPNyEJy8l269Wj+qlqRQD
         GDVDx4/tR3gMKtyTrhQogc5TzeL6fOxVb5xi1DKeq1CE66HK1Qdc5KUvF5C/3JHDIpl0
         HiKYZUC14EX0g8XgqXPvnM1zMotKgtUz5UznaHJCWV4KM4Uqy16OmHYW8WwzCa/N111B
         776zIdp2xEHWsLvHeRR91+XGbrRRl+x+Nyg0Z6+CY3ZnNYwt2h+5PX3eVGnyokLHxaQY
         Josw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhOeA0NRAwzB9kiwcu1HO4leHSsnTIgO3i+7vZPDD7k=;
        b=edzfUSElDwuu5PXDNiOP+/QZcxE1Becnr/4ac3gxSQOUDCz/E3tdlIWLuRRCIDZwkW
         uxPiKIItjOU6g1UC4oxO5acyx1nyxBm7EAIsynmJ/ZySgW/3WBd0CiLlt9lZ1RBAi4FJ
         Styy/Dq6cvcjqG0HopRpCcinbNzggXesQY2RW2XjU0hbewFDj9tBhbNemigWo/A38gdO
         pEmkW9YBgAYw4ur6ncJmwbcNLFwQuKAMlTNg77N4UjeYj7K2nQCU7HP68T0mhucUFYME
         bCGJg43YzvIO4IBOapDNSbkfPIk3FQsYafJm0VQbsh+tL7nqZdMf013MILF8ZnKYLqgw
         iYPw==
X-Gm-Message-State: ACrzQf0SKz1Gg7e2EpLR7mPHSmwMaMLRtmYsZsHCHaL+BfZaSVEL37Qk
	354MCqM5/NODAmGfRIsdRBbOtAPNrTU=
X-Google-Smtp-Source: AMsMyM5XxHaoSYRsyan6hyFvq6ps6he8CqYMDKpRaXYzVKeZ+E91De2IqnusE9ZFteVd+heBzJUSbw==
X-Received: by 2002:a5d:6550:0:b0:236:960f:15cf with SMTP id z16-20020a5d6550000000b00236960f15cfmr5438788wrv.177.1666960315310;
        Fri, 28 Oct 2022 05:31:55 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-31-159-21-5.net.vodafone.it. [31.159.21.5])
        by smtp.gmail.com with ESMTPSA id w7-20020adfd4c7000000b002362f6fcaf5sm3488044wrk.48.2022.10.28.05.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:31:54 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.0 -> 7.0.2
Date: Fri, 28 Oct 2022 14:31:52 +0200
Message-Id: <20221028123152.3407172-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 12:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99333

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.0.bb => vboxguestdrivers_7.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.0.bb => vboxguestdrivers_7.0.2.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb
index 46484475e..49c2a3f2a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "1e5b321bf20eec03154e2b3e16331f827a472d6e8e5b1e04c27041978975a97a"
+SRC_URI[sha256sum] = "612fd6fc417e0067653091a613e1d4fa084d3f42407dff5f991a0eb1e2ab26c8"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


