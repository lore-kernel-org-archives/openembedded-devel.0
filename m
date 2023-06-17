Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102E9EB64DD
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:06 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.9421.1687022104353051296
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J42PR00+;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-56ff9cc91b4so23266387b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022103; x=1689614103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ISW5BKppZVquZPrk7UQ6WzSosFZd73o5orGIC4jrN4=;
        b=J42PR00+K2frB1QxIKcYcd+Qa8eZTAEgvQMZliFnRfcvJn1eXaP748LsqyFzwKSxZQ
         X7tLRZ5zDH7dJzfLay7/zlZCVYUj5DwG5vofeTsTDA7RPop/LwdQOyAx5Ay8vPHByJ8D
         gmVs/UcqV4rEbSRH8xD9T6j1AMaErl625sBzudVjG6CDQ4JuuDwWhncKk/p86V2mQ6fK
         OmU8xND9haO0Txt6okvt+/E/2W2RRHeU2CdacT5IlOzdXtpopaMO9TckC3szY+VoIMV1
         c+LOxiFLgisCqTfYqsd5hEhxBTVTkQsBmcta+acBzFctlir6fr/2Qh41SFjz53uVTA5v
         ND1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022103; x=1689614103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ISW5BKppZVquZPrk7UQ6WzSosFZd73o5orGIC4jrN4=;
        b=Pmm0yUyI+YcZjPOCv+me2AjIsCGMEih3igvxBAFxSHG8/4mu8tB65796VgErYfSsi0
         cqmZGVbttNlUABhOZA7NGB1vaWPaKzxNzJPa8rO/DEneoklJsrwspLjyQPxM3B9JfnH3
         P8d27bsHkfyG+8ggclKYgLuj2lZzS/NJrjctAKRHavp9eBAgTwW/2Ar+36321Sa8whMQ
         4IcVQsPVzyLPU9b/SP/A+MCA82sqdm5QcexTk7aFMhG7FjYHQKZTNDHlORj7lEX3LpRd
         TJnGBRta+xfFCD12PxUn2TA1N05+7rs0uvGIXBPuFT4f/9OF/SWTcW84DK8wSVBJ0ZwW
         DQHA==
X-Gm-Message-State: AC+VfDzww7LzXDZqSgZwvEEPXsIQm5D7umTfOTZR85Paiwjt/gsX9FPU
	Nx0V/jXfBRfU+vT9Y+lfjcvlmeT4QOk=
X-Google-Smtp-Source: ACHHUZ7En6rK3uelbL73Z/ipjA6SANgKDtJD8Ag4d7zYL1FYt1ygksS9BR1laz8klghBSGJZ+dPkew==
X-Received: by 2002:a81:7d09:0:b0:565:6acc:995c with SMTP id y9-20020a817d09000000b005656acc995cmr5226940ywc.15.1687022103143;
        Sat, 17 Jun 2023 10:15:03 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 3/6] libblockdev: clean up DEPENDS
Date: Sat, 17 Jun 2023 13:14:57 -0400
Message-Id: <20230617171500.70558-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171500.70558-1-akuster808@gmail.com>
References: <20230617171500.70558-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103348

From: Ross Burton <ross.burton@arm.com>

If you try to build libblockdev with an empty PACKAGECONFIG then the
configure fails.

Add autoconf-archive, glib-2.0, and udev; these were implicitly pulled
in via other dependencies.  Move kmod to DEPENDS as it's a hard
requirement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f14663746bd519650c8654bbf91971a0a96c109e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
index 44b4e7daf9..22ccbf144e 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection pkgconfig
 
+DEPENDS = "autoconf-archive-native glib-2.0 kmod udev"
+
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
 "
 SRCREV = "1412dc51c8f76bf8d9a6008228737db4a9a26d69"
@@ -24,12 +26,12 @@ PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
 PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools, lvm2"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm, multipath-tools, lvm2"
 PACKAGECONFIG[dmraid] = "--with-dmraid, --without-dmraid"
-PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
+PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd,libbytesize"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm, ndctl util-linux"
-PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo"
+PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo,libbytesize"
 PACKAGECONFIG[escrow] = "--with-escrow, --without-escrow, nss volume-key"
 PACKAGECONFIG[btrfs] = "--with-btrfs,--without-btrfs,libbytesize btrfs-tools"
 PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup nss volume-key"
-- 
2.34.1


