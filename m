Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9BEC433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 01:47:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.16722.1651974419834361105
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 18:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xc5jHyhr;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id n18so10886932plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 18:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMSHseJj7b75od2fn9zBtb7hRUn27zU/K95IP1pYPK0=;
        b=Xc5jHyhrc7VnXXxOZU2XJdcD9zV6NkyFFX6udEirURt6Qe6YkytqGYJfFw++u5tvzj
         OzVsTxpoHZ+Vhu2S3vkAaHICPGXuNG3mXunGSZNJtD04mdi8cqy46AhlUiPI6sraONki
         LeStUMLXIfs1NgKyTpuzC8M0CnzafLPxt8g7Muz/jpGbUxm09Y4HD7xJmrLCo2a0Ter9
         yn2HrkAAQI/8LrtddNrTUuPy9+x++8o8X4wNYRu83Of61OamQT98ckFgDYG3jqgoMI7m
         tjJ932+t7YJjmEYqhQreH1NL9UOmRaVvic1QbZgzhql+wXOEOfjaS2qmagDqMF2B6HpG
         TFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMSHseJj7b75od2fn9zBtb7hRUn27zU/K95IP1pYPK0=;
        b=sJgijKwloeCsOvv9WsKntX/BiFzSVcxogPCb0//uR4rHKSROwaQFZiatEKgUBjUEdZ
         75Zbkc74gazJrwXF2fRtcU8SpU8TDb1SyZBmLSj7VGxFmdxskGrdoQnkpD0emelo31vo
         SR5WSbCg0gGy1Sl1CU+IyNfOG6c+yx+mNEDTQ72qfmZWawZ+Y1D+3b81l4wgQ779a6QY
         /Fss6qDtH1oMyXo4fYmAOfGBg0RcnIHohXcJ/caucDDyNP+LSuKUrPOSZK5W36mIH1mL
         SANx5gee+qPHXGTaBEwPuJY0u2l8g/t0CgADUceZ3igeppaF7IRQfN5EUODnX77mRROC
         hl1w==
X-Gm-Message-State: AOAM530RyYbpH2BX4fD4z4MmoHGpwKrA1oT27It93myS6QvJ7qQEfb6g
	NvtPqfqObwjvgcwqkZ/FziPYo521GCD7fw==
X-Google-Smtp-Source: 
 ABdhPJzE6F78KHDQl3uR2URdzHAlo++qfWeH7MyNkVP8TR3KxGbp17cZy5NPBKjby1jD4b1BXSwVWg==
X-Received: by 2002:a17:90b:4d8b:b0:1dc:a9c0:3d53 with SMTP id
 oj11-20020a17090b4d8b00b001dca9c03d53mr19245656pjb.29.1651974419149;
        Sat, 07 May 2022 18:46:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 x71-20020a63864a000000b003c15f7f2914sm5646429pgd.24.2022.05.07.18.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 18:46:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] zfs: Make systemd and sysvinit into
 packageconfigs
Date: Sat,  7 May 2022 18:46:56 -0700
Message-Id: <20220508014656.1381130-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220508014656.1381130-1-raj.khem@gmail.com>
References: <20220508014656.1381130-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 May 2022 01:47:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96982

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
index fb19796abe..dd676c945c 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -1,4 +1,3 @@
-
 SUMMARY = "OpenZFS on Linux and FreeBSD"
 DESCRIPTION = "OpenZFS on Linux and FreeBSD"
 LICENSE = "CDDL-1.0"
@@ -17,15 +16,17 @@ inherit module-base pkgconfig autotools
 
 DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl curl"
 
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd sysvinit', d)}"
+
 PACKAGECONFIG[pam] = "--enable-pam --with-pamconfigsdir=${datadir}/pam-configs --with-pammoduledir=${libdir}/security, --disable-pam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,"
+PACKAGECONFIG[sysvinit] = "--enable-sysvinit,--disable-sysvinit,"
 
 EXTRA_OECONF:append = " \
     --disable-pyzfs \
     --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
     --with-mounthelperdir=${base_sbin} \
     --with-udevdir=${base_libdir}/udev \
-    --enable-systemd \
-    --disable-sysvinit \
     --without-dracutdir \
     "
 
-- 
2.36.1


