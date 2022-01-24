Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA422C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 11:02:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.2186.1643022122337211793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 03:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OAedWVdU;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id e8so11023794wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 03:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JX4PmT9d+zKj982S7CmWBKd+XFKr15ubT5JyA83h1oM=;
        b=OAedWVdUjisLgKqpXA08DvDlMBZwzfOahYeYXfZZ8Pu845TliHyi61iaJ3g8xDbFJT
         +JenSEfb4iLETHoTYYSH+6Q0uynWGZGnFhjCttqF5P1L3GwZ7lhozv1YvHyt1ixMYYMS
         uuXLA6Apfm+L0ip7YF/Z4XLG9aX6y9ArTbFvYC3uQJ7oBDsjvMeLsgvDyAcKYFAMWypu
         fHuF9PbFK/0mGH8/Kyllir7X17ng+vmYJskrGYARdGHGYrvs1rzKy/hjV92jKedU6A8z
         dDUnSo6wBSutyteITb3NnDdOn8tSNMd+Skg2lPcZwWhWN5emLD0CB+rXyBynzFkYe0U6
         0Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JX4PmT9d+zKj982S7CmWBKd+XFKr15ubT5JyA83h1oM=;
        b=CCeh4gdBfGcwLk8thzXMEfJOYxfulp7z/WTFUSw+CDnKss0PjZd9xN9IimPLxynUw5
         LuQbmcZVjIMDCXblZoFwQK88A2YuiNwgNGdEPhaaBv3Zrr3K1rJ+GfL0ePEffzPZYVmA
         mxdal1dTGRhDpYCiZbko0WZXkPEn+d5J1FqYv0fcZv+jshP/zseJeFOSPC7VB9yvcCHr
         yiT4gA16dVmPwb8Ch4TlPm4c3/qm/ZSW8t1pn0Nh67uWXAfA8ZkE7Rip7Xp6weYL8JVi
         OZBZLirjTludH/RHC8sijeh4W9SCXe54Om2j6BLF/CsAkQR/85//XkOqljVdLvdQEz0T
         ElGg==
X-Gm-Message-State: AOAM533jDWhdd/PqrbejrrK7lRvQWlbbr3nnvh9G1s71lM+i8u2b2Lyi
	1w/CRDE3b4frW1imgSYVxvmSqhdejoROPA==
X-Google-Smtp-Source: 
 ABdhPJw3OXYND57tS543rxEKiF3aaEDIMpMPE1KiLlJjbrRwbfsFm0lZVEozpac2KA4/gz86fy6ykA==
X-Received: by 2002:a5d:6a4f:: with SMTP id
 t15mr14177371wrw.392.1643022120445;
        Mon, 24 Jan 2022 03:02:00 -0800 (PST)
Received: from Unimatrix08-Focal.lan ([95.74.101.17])
        by smtp.gmail.com with ESMTPSA id
 j21sm20269679wms.14.2022.01.24.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 03:02:00 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.30 -> 6.1.32
Date: Mon, 24 Jan 2022 12:01:50 +0100
Message-Id: <20220124110150.1373014-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 11:02:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95031

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_6.1.30.bb => vboxguestdrivers_6.1.32.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.30.bb => vboxguestdrivers_6.1.32.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
index 099d82ae4..4fc4a2c77 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[sha256sum] = "3c60a29375549ffc148aaebe859be91b27c19d6fa2deefde1373c4f6da8f18ef"
+SRC_URI[sha256sum] = "5d11384200b4e943ad0056d2cf75980ae4bee852c89650e2914e1b34eedc2d2c"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


