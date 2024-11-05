Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428AED2C12D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.19562.1730817437054611097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ka3qLGEZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso5280539276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817436; x=1731422236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asZ1IzECC6SNI6ibZi/MsvRfhlLM9ncrkAlPLoJu9Ko=;
        b=ka3qLGEZ1rRtbwbgBxyxx+7vk1qUv8bqZPrOGeKsGUjsBiWBol1DZVpLrohAv7t6JI
         7Sm3tgiyp8zI+blXseBdF7uQj1bwCF+ctVfIVXJtN17Zsrg27oi8PbtWfbj/NsrM4DGu
         JXgDrB4APmoCL+HNP4dV5yWj65HS2kkyJQL7GO7D2WFGXM0FXFvWeJoAqVSLsIyImqRS
         WhQ7rp/w5tpXFlNrrKaLrZNrIb0ZyXNdvdXoQgwrgNgxN02AddgxoLVM56KWlDcNp+ZT
         YnwNba6u8OY87uYOe0rrs7wGxH99NMbCc9hSU30vXdkcx0QsmpSCBpvpbjZ9aqF7HDSf
         6qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817436; x=1731422236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asZ1IzECC6SNI6ibZi/MsvRfhlLM9ncrkAlPLoJu9Ko=;
        b=d3CMeTbBHgPDNila4HUACt+GCa9z1NNLCLNcjlxazKC1QW7ElTQX3bMvVj9uifTb3q
         JLWzyhu0Hfzg6JBZvo41Bx6GV8gUGNOd+Ff1eaF/XH/1+qUFkJyYwiTQU+VG/oTqZppw
         p77OLnaMqVJVo4Z3NGa7wpbx8Sy6g5/mvtfuI8edKuNei2jlf7tsC0UkI3o4oJEE1Nng
         j3uKn2eunicjbK09Ocq8dZEEbsrJxoPmzOrUvpc4KMPxtvX2edRnsKL5IH08Uh4WcilP
         HN4uvKlb0qwicDdy36Gvu7g3yaI9P93hi9LQlha+jAiuMJ3dYWUcHHmFRd12kH6GI7iI
         aF0A==
X-Gm-Message-State: AOJu0YyC+2w5xiaPYcs65qUHR/LBNi+zW7RQuVMpAmrHmRidDbvwuaXC
	cuvGivgcTyYezDsO1Um/KSAcwL8NQTqb51+hJECNIoJNsZGzuftCWmLn4Q==
X-Google-Smtp-Source: AGHT+IEHvTXrVzdPK7ZwRxWeYoGyWmooogzJne5eROiv1sBu/h4aA0KaqQ6bBXJwATgxWi1Y7a9WjQ==
X-Received: by 2002:a05:690c:480c:b0:6e3:2e50:8bd0 with SMTP id 00721157ae682-6ea64af0517mr161450657b3.13.1730817436117;
        Tue, 05 Nov 2024 06:37:16 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 79/90] cryptsetup: fix udev PACKAGECONFIG
Date: Tue,  5 Nov 2024 09:35:44 -0500
Message-ID: <20241105143638.2301245-80-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113497

From: Markus Volk <f_l_k@t-online.de>

This commit removed the lvm2-udevrules package.
[https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=c37c867e1adddd6fa39cf3f3d4c6688ea6dc825a]

Align accordingly to avoid error at do_rootfs

Error:
 Problem 1: package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev >= 3.2.0, but none of the providers can be installed
  - package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks2, but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12()(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptsetup >= 2.7.5, but none of the providers can be installed
  - conflicting requests
  - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_64 from oe-repo
 Problem 2: package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks2, but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev >= 3.2.0, but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfscommon.so()(64bit), but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfsdaemon.so()(64bit), but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires gvfs >= 1.56.0, but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12()(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcryptsetup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptsetup >= 2.7.5, but none of the providers can be installed
  - conflicting requests
  - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_64 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1ca8df16af411871e10f268064570146cdef54cb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
index 54b47ea3fd..60bf501eb9 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[luks2-reencryption] = "--enable-luks2-reencryption,--disable-luks2-reencryption"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2-udevrules"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.
-- 
2.43.0


