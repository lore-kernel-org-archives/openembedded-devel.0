Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4989CC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 11:52:19 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.35029.1699876332985402532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 03:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5zgJStN;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c603e235d1so658982866b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699876331; x=1700481131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+JOXimje2eP0//L0Zn6c/pi8Qa41mrp1ibzFIhdw2pA=;
        b=C5zgJStNOmYbw3WkREnLASq+4Ycf7z7to6CvWkSQoruWS/ekuh03dbjQUE5odM4ahC
         JzBF7a1R98JKLLTCAfzdXnQC0Z512VdgT1X7j0SRyee2La3y4WfCEGR68pcMgwXjjU4E
         5PQrzcvei1c1Q3Uv7i57LGSvJGKRTbreKJrGxh0wkPzUyrBwB29Rd2tJDiQJZ7kUIl+a
         2zaS8pj2i+6dhdEbFWBn9jaheWIxLswEA4tRVMnaXCLVvx/W0fIIwKDA1LyPrFdWtbWq
         LvDicf6uCHnfGMuuJ3nVAXUXKzFudXnr+WYKRwlDHVwz1tShy3wVYs3DJlJ4qXiM8mCf
         A8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699876331; x=1700481131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JOXimje2eP0//L0Zn6c/pi8Qa41mrp1ibzFIhdw2pA=;
        b=h/fKbxB4LCzdlOogjV1oJbc6oy6rTT/4XaxNh7dIAfBjvZ81ajqxxRQ0CYpPN0eaGQ
         /OyHEkK3g/7TlBUazZua9ovEVd9wiYF/Y3cslur11wMyEaFapfv/EhexY4ufWghO0MHp
         00vosTwY2C4OGUJIuy95XN/C4+EyP1/OfCH/gjaDf4/AOI9I1XMNhUf+vTAfTfNkcylM
         qgdnT/+ztupKGwRB/pJiRHOgxgLkrklfkit6nKEP4qNDkQ/N9QVfi7kRDEnYbAMWHqrJ
         S9xnvbnb5SKfOEayl6J/kQE7OrX0WkDLd2PFD59QbWpc5Cs8aCbbaYa54wpFtbS1yZEu
         Lt0g==
X-Gm-Message-State: AOJu0YxiO60wpoX2vow1dPnNYwJES3kpqA+QqVrHXDDRGDc6Bmhkayop
	wmf5RBPF7InlR/mtenyQg2RNTpecnayBZA==
X-Google-Smtp-Source: AGHT+IFmfjVTXNLHg1T1FtH4K0TEFUyeMMg7l5c9FpJY41Gv1JG5xIgkLHbjnHbCyPr+MJ7fgwfBag==
X-Received: by 2002:a17:906:5ad4:b0:9df:254d:3e45 with SMTP id x20-20020a1709065ad400b009df254d3e45mr4229529ejs.24.1699876330872;
        Mon, 13 Nov 2023 03:52:10 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id n6-20020a170906118600b009e689685196sm3969349eja.142.2023.11.13.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:52:10 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCHv2] fuse-exfat: upgrade 1.3.0 -> 1.4.0
Date: Mon, 13 Nov 2023 14:51:59 +0300
Message-Id: <20231113115159.73164-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 11:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106639

Changelog:

* Added exfatattrib utility which prints or changes file attributes [Will
Thompson].
* Added FUSE 3 support. FUSE 2 continues to be supported.
* Added support for timezone offsets [Nathan Hunsperger].
* Fixed device opening error being reported as FS error.
* Fixed possible data leakage when uninitialized clusters were allocated using
NtSetInformationFile() call under Windows and FS was not unmounted correctly.
* Improved compatibility with autoconf 2.70.
* Fixed disk size reading on NetBSD [Dave Vasilevsky].
* Fixed "automounted" option handling on FreeBSD [Iouri V. Ivliev].
* Allowed to specify the "nonempty" mount option.
* Fixed file data contiguity handling bug which could cause performance
degradation [noctis].
* Fixed possible crashes on invalid UTF-8 sequences.
* Fixed a situation when FS could be erroneously marked as dirty (not cleanly
unmounted).

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Dropped md5sum, no need anymore.

 .../fuse-exfat/{fuse-exfat_1.3.0.bb => fuse-exfat_1.4.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.3.0.bb => fuse-exfat_1.4.0.bb} (83%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
similarity index 83%
rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
index ac18fe90f..48e3d7af5 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
@@ -16,7 +16,6 @@ RRECOMMENDS:${PN} = "util-linux-mount"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "846b8c36bfa4684719f9e08e9d3a6bff"
-SRC_URI[sha256sum] = "07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3"
+SRC_URI[sha256sum] = "a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20b2c8bbe6edb3001e"
 
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.25.1


