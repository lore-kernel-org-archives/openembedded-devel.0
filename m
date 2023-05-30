Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FDCC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:36:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.709.1685457380490010294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 07:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=al/PCNK5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso31686105e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685457379; x=1688049379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=divHk8OEAEcDuAKyJ1SQz58tTzUQYmJqFRwwGhUir3o=;
        b=al/PCNK5MIXv1WZpjcBum54Uc5YVCk886Uoh1L0luKR2S4rQ9r0gtEuUoqCauHICVD
         ivE8Pg/btO9urlOpIWZHpaMvaMatlYqV7s+yBRumrX5TPXIcGo2PSY/V2VNH7ERZ0x63
         fa5FMuB00IQrrqh6SQE5QGm8CPQIJmnGZmNlrPGbIt0nrxQEbMlk3DVGCbxC+6WHnJsm
         e405TMg5YKrOOs4EMea9vLAfVs+Sz2ppdYBnG29l+WgXsP/VXa+z9J7Fu65m5ojr36Bt
         K1AGdbfshvLWIfNO/gt66y0vhbuLl9cwxdE5j3oBzLVhD/dnBCYXVG7krGkqpC5QadiH
         GtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457379; x=1688049379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=divHk8OEAEcDuAKyJ1SQz58tTzUQYmJqFRwwGhUir3o=;
        b=QUIkNrVAVZ/NQE8AtFW3M76a8lMXuzBYa9iqRnvuc0S5m/jlv9CrrrKltNjMuG4sOx
         XEU9B3Paoif/2YAQfVNR0Wy08/vGKdwibxxGhGMXTbqQufp9U8EYRGeOQpBO7S9M5N0y
         KTu66Ep+ithgs8AjSzIYnIPsiFhSyWklCUGTo1iCCS2n5UMqzFsFUZ/qEPCcMSfcoBEq
         IMZi3L5CABxQbhXAfJUQawnBv3rxhMa2uCjfoOvXCkl9p23FriOUSFbGuPNu9qLW021d
         0/IOCDo3/0PoqgJpxRYQQ6asNlTT+xaOCpT/k1RTlJ2F0WgCvHRLTVC0K9rNFktNVpoD
         LzAQ==
X-Gm-Message-State: AC+VfDwK4HlOSXaD085DGy++bGDu/26G0MznOzHL3xfrLLzdD9jiFOAf
	zqG2GKr55k+sN7b9kcg5PwO+CGK/Mhc=
X-Google-Smtp-Source: ACHHUZ67nsZGAkYdtp6057mCHkB4fWJNj6qPk3pl5ZCUqZrSnAcu5AAu0SRiAeHOPo8uOzBKSaebdQ==
X-Received: by 2002:a05:600c:2196:b0:3f6:13f5:d1ea with SMTP id e22-20020a05600c219600b003f613f5d1eamr1600876wme.11.1685457378555;
        Tue, 30 May 2023 07:36:18 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003f6041f5a6csm17667090wmj.12.2023.05.30.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:36:18 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Add soup3 PACKAGECONFIG, rename soup to soup2
Date: Tue, 30 May 2023 15:36:11 +0100
Message-Id: <20230530143612.740-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 14:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102898

libsoup3 is now supported by ostree, add `soup2` to select the
deprecated libsoup2 library and `soup3` for libsoup3.

Drop `--disable-glibtest` from PACKAGECONFIG as it does nothing (nor
does it appear to have ever done anything).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2023.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
index 3129dc114029..dc771ce28a20 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
@@ -42,7 +42,7 @@ BUILD_OPTIMIZATION:append = " -O2"
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems and swap
 # soup for curl to avoid bringing in deprecated libsoup2 (though
-# to run ptest requires that you have soup).
+# to run ptest requires that you have soup2 or soup3).
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
@@ -85,7 +85,8 @@ PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
 PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse3"
 PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux, bubblewrap"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
-PACKAGECONFIG[soup] = "--with-soup, --without-soup --disable-glibtest, libsoup-2.4"
+PACKAGECONFIG[soup2] = "--with-soup, --without-soup, libsoup-2.4, , , soup3"
+PACKAGECONFIG[soup3] = "--with-soup3, --without-soup3, libsoup, , , soup2"
 PACKAGECONFIG[static] = ""
 PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-libsystemd, systemd"
 PACKAGECONFIG[trivial-httpd-cmdline] = "--enable-trivial-httpd-cmdline, --disable-trivial-httpd-cmdline"
@@ -188,7 +189,7 @@ RDEPENDS:${PN}:class-target = " \
 #
 # Something like this in your local.conf:
 #
-# PACKAGECONFIG:append:pn-ostree = " static soup"
+# PACKAGECONFIG:append:pn-ostree = " static soup3"
 # KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
 # TARGET_CFLAGS:append:pn-busybox = " -static"
 #
-- 
2.39.0


