Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E79C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 08:37:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.15477.1669192661473239576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 00:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aORapDzP;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id s5so11086681wru.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfoiBeBqAmoS4u+Fb0jVjf/qwf7xCidpOYVsDMPoJ1w=;
        b=aORapDzPGZ98j4wqzSJ/vhaEBc178gJ4jEZam5Bp8SwgKWo7M2Cx/dc1ZvWGraO+mr
         Tfhi2s5wBvI1cHfgQeeyW8Dw1wYx5UNQIo9qXzR053CIc/VdDMOP+08UGdXer+uOmE8a
         L4M20bBHaencbjO24feiH42BW85YmSgmrCyEtSTrf2kspJ42PKXCOrJVpbW7lBc11J+C
         FEEoxcCbH5jkqnGlpaPiELIItmTHAsqzRJ3qGdbzgfY7s8KHb4FDxutVndmESZRoorxr
         lPZDMbdiSrnTmhzWFqtUtEagzjdfXcRO1x3IElQJrqIZkJpuKTjMlS5ZZlVZG0WyKQIv
         wZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfoiBeBqAmoS4u+Fb0jVjf/qwf7xCidpOYVsDMPoJ1w=;
        b=TUTjW9sPw0t5VFl76LDwfO3upO5zWRHnNBF3q4L8xEO8JX1z/DRXaSWfhPvqw9GKcD
         SEM96Enqk9xN49eIdvs/UYBW/uc4as+cLVmAm3YPsQLYJNBS3I5GlsKO+IhDf0j+0+ys
         XOlcliLibUzWIuKCPkbBHgJ1i/aavWeTVYGUpvGR2maPoycn8K6z4JxQvsUkf+wumTy6
         5eST/9hmvZRoK8yhXWHyJj6WzLhVCjNOWX4lVpZ1Tf0Gh1eEE+evdFA9Kww/cRl5BKRN
         erOrWQ+47lzOVEkSa6kWkhBIcTaT8Yc/1al6WbJzO6gTxp+G7BNLOVm46TKo2X4oGZBX
         1Gvg==
X-Gm-Message-State: ANoB5pku07ZJpCUSaKCjp2pZonBXmKc6Y4/zaCz2nn97BDw6ZH1Prull
	rucXJUKOntjA2ACj2XJ29U1dzCKeHLM=
X-Google-Smtp-Source: AA0mqf4OWroJQBl7hjti6uouxnv0tzXl1cisExmHCuhEZ4VN/348lwabKC1SP53fO6ZBzNVb19mleg==
X-Received: by 2002:adf:e7cd:0:b0:236:960f:161d with SMTP id e13-20020adfe7cd000000b00236960f161dmr8749303wrn.376.1669192657346;
        Wed, 23 Nov 2022 00:37:37 -0800 (PST)
Received: from Unimatrix08-Jammy.. (mob-31-157-117-185.net.vodafone.it. [31.157.117.185])
        by smtp.gmail.com with ESMTPSA id t11-20020adff60b000000b0022e035a4e93sm16156667wrp.87.2022.11.23.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:37:36 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.2 -> 7.0.4
Date: Wed, 23 Nov 2022 09:37:32 +0100
Message-Id: <20221123083732.23539-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 08:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99699

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.2.bb => vboxguestdrivers_7.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.2.bb => vboxguestdrivers_7.0.4.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb
index 49c2a3f2a..91f5ae0e0 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "612fd6fc417e0067653091a613e1d4fa084d3f42407dff5f991a0eb1e2ab26c8"
+SRC_URI[sha256sum] = "58951f7d1bcda836c5e50ca0a6b13f0e61a07a904f476526a831df3d9bfe5b17"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


