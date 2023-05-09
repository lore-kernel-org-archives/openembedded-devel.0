Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DFAC7EE24
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 11:36:22 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.29559.1683632175145052338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 04:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=axTLdeM4;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso6527184e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632173; x=1686224173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WsxB1/0gmyK9ItPnBFggbUEnsmuaq7tgXiKSPE/xZE=;
        b=axTLdeM4o3pLvyWCXXmcbmVF39NV9DhLiRuKAdhJrM08L/Hu7kli5rik/5JinK7CC0
         /gB2niwG6d4VR70OmguXrmEJfm5qPj8nHtJ7YEnNBx4/2QU+oCUQOP8XTMNqZXSEV2/7
         ensuNjgorn7/J4Q44iNOWYneeO7iFL3Kq6IoIc72V7DZ3L86lNl/3oriJ7w6QV51EBqZ
         VyFXqkXWlU22Pfde1uN657vkkErPAf0ikrzpfD3ejj8kAyleFddXkvfhY4Hk9Q6zV5zN
         ouE9Lx7ISMBM+qBAwSgVFisEDtCWZvNuaAV1ICbf1Ayv+1mx6MJUfjlWcacl8UAWBCWN
         5dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632173; x=1686224173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WsxB1/0gmyK9ItPnBFggbUEnsmuaq7tgXiKSPE/xZE=;
        b=bsW/bbPQ4Q4u0RNRpmqQlnXXX1OYN5ffCIEwEjEyP+bKJzpxvArCAPaDov9/nMsg7e
         GC/H1PQEDVTuKQTR4X97onHKm96ZspksP0UOT7m2D9VkZiew8ajRPVv+3hbj59Wl7WAC
         zAGClXJYo/MJpKDq/RM/zrB+oqyBbfCyDGliT2+f5g3DpxGavSXfDO/ov5+Wr3igQh2d
         sWhDVD0zLuRZQUTbIWA1sDtpqqeWjKe4NUNaf7HBC2uwm2wj3jxfheVhhQeWpBowblb3
         xPY/g7ALGFUh0lDVxYGkNhG+72YasjrlpLyi3SDG46xvZAuB7aTRQgWWEWaDFsjDSHrz
         1rzA==
X-Gm-Message-State: AC+VfDxDS6f6g5VkeNv39Jx8PrYv9oMzuMOg3IrZTUd3QlLiJfl32+eu
	yWHvJeE70yU/2IyzFo+fhmLCl+p1Gdc=
X-Google-Smtp-Source: ACHHUZ4pHjnyfbsWep/hIuHYS+BqSWN5msXrxRNAMiT/5JRDdIRiREo9Ynzj9kotNebUIAE4uihm6A==
X-Received: by 2002:ac2:5fec:0:b0:4f1:4ed6:4a6e with SMTP id s12-20020ac25fec000000b004f14ed64a6emr663279lfg.28.1683632172625;
        Tue, 09 May 2023 04:36:12 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004efe7b2e35asm314209lfp.248.2023.05.09.04.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:36:12 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH V3 0/3] libusbgx: uprev to the latest/fix hotplug/fix systemd service
Date: Tue,  9 May 2023 13:36:17 +0200
Message-Id: <20230509113620.786170-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 11:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102501

From: Ming Liu <liu.ming50@gmail.com>

I found more issues on libusbgx, have to make this V3, the new changes
include:

1 Add some dependency checking in usbgx.service.
2 Turn it to be a simple type.

Marcel Ziswiler (1):
  libusbgx: fix device hot-plug use case

Ming Liu (2):
  libusbgx: uprev to the latest commit
  libusbgx: fix some systemd service conditions

 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 796 ++++++++++++++++++
 ...erface-name-for-NCM-Feature-Descript.patch |  52 ++
 .../libusbgx/libusbgx/usbgx.service           |   6 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |   4 +-
 4 files changed, 855 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
 create mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch

-- 
2.25.1


