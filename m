Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C998D2FED5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 18:21:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18785.1769537793621051668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 10:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=g41lCJoK;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88888d80590so100889716d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769537792; x=1770142592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cQY5nsy961UOQ/kXNkgNvvXhC6ZrSkQ1G1XzYk1N/G4=;
        b=g41lCJoKQwRpjvsTz0mHfY3Qde4vaSXKtqnpgELKVZ0bBN00oz8HH6uFB7kuiu6VNc
         0IRX4dTRROsvtfxTA3APQ3fmEEetmmmARRky+W+rKSGY4pL3E2fF5mvkDmVwWmPl1R/T
         RPV8WVzCdrraF0IDtLuZumPTKvn168rHuBbGDI7kpeWZP/cAmklbxvASR0q4H+XS6Vx+
         Wj5yURDJj/z+PZ8a9GWsokfFaUZHQQqsLNxD6Ql6fudjGwsUez3N1PKlsYY5W4SXM9xr
         Nq2fQKol2wP0QPfgGCc7cZCBm4P8wMd/P9XrPbI29SN8rhP52OVsyd/BrM+SlvNqokTP
         0ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537792; x=1770142592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQY5nsy961UOQ/kXNkgNvvXhC6ZrSkQ1G1XzYk1N/G4=;
        b=Q+i/Pbjsb3z2UF6HsPkxFEzcep/iQAmps2YCXmVGS12StansnMykrSR7wVed/LjMsi
         +fClDOq+Qmo9qqZPlR5wmR92sQAb4SxUBoUr3RByBlACCEEUxqfgk2Wj9FHFqVMZUHdm
         WzUIivO/Lv05/eGJTdCPrnrUl8dWOoBxQENFNtctXk957zZsyNkHE+bULdZOnjzrddIF
         b1ShcbNcWbGut7DrsjFVqfZohJP2WEpsS1jXfESqCghu63xABLbo4DvWvSVAZX20fxRe
         B1MQB92CIu1GK7Oor67p/njR6pjE88jDcwvrTGQhd/KLNf0AcW29YCEaXhm7v0w8/zRO
         dh7Q==
X-Gm-Message-State: AOJu0YxgBiyNJSeZXeFkSrJXUC4a2WsSnZf5RW9cvOVAj6QYp7UhVP//
	7TG+4obLYcM8obyV9i5fsHsClrldKi66s2IfRxhv4ZMLopVZ1GdpO6FhQtJMSdCBFHShyyqh2JE
	xhtMQ
X-Gm-Gg: AZuq6aIUKKtwrdM80DYDucmn6Gz9d43enJ+m+l9g3wH8L1E8Ng+diSZehkYT90iJKPA
	CqE0+tdHl44tXVAr41hN2WK3xpsPA0evHMzqaVe8/9DS+C46s5GkbBc25muWLBVa13qFLV0FmCf
	VJxNQLE8fkVGejdZ1EzmpOknW3yzWgC3bkfDwvAFQ5qXNMHEjmgiY4nIx/575NeYdGySxBLu9Cd
	lk0md/dyiBczBb454JQPYzb0rKDeuEgNTvVPPDVcyLxTClr+EYo3PHrqPB/HLNpvcduB7A1SI7l
	I/puCiq5o049pVUSjL1nj3q2finW8WMZcUogJt8DAjEzJz55CvwfbtweBXZWH8fLZ8rrgjSDriK
	Vd04f81WKZbknUd7C5URcjL7h7hG+ApE90XZXMt6CBF6j77+d7u7f61czKTWgSnkYvOUWzMOnU3
	hUw5uoztGRgGPFMKQ=
X-Received: by 2002:a05:6214:1c8d:b0:890:7eed:a7dc with SMTP id 6a1803df08f44-894cc954d4fmr38531096d6.49.1769537791732;
        Tue, 27 Jan 2026 10:16:31 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5ca2sm2021006d6.7.2026.01.27.10.16.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:16:31 -0800 (PST)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hdf5: fix shasum, downloadfilename
Date: Tue, 27 Jan 2026 13:16:29 -0500
Message-ID: <20260127181629.702469-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 18:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123959

Fixes: #1023

Upstream seems to have regenerated the archive, as the checksum no
longer matches the one specified in the recipe:

|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum failure encountered with download of https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz - will attempt other sources if available
|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum mismatch for local file /buildcache/downloads/hdf5-2.0.0.tar.gz
|Cleaning and trying again.
|WARNING: hdf5-2.0.0-r0 do_fetch: Renaming /buildcache/downloads/hdf5-2.0.0.tar.gz to /buildcache/downloads/hdf5-2.0.0.tar.gz_bad-checksum_a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973
|ERROR: hdf5-2.0.0-r0 do_fetch: Checksum failure fetching https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz
|ERROR: hdf5-2.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/buildcache/downloads/hdf5-2.0.0.tar.gz\' has sha256 checksum \'a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973\' when \'6e45a4213cb11bb5860)
|ERROR: Logfile of failure stored in: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/hdf5/2.0.0/temp/log.do_fetch.2054297

However, the tarballs look identical. Update the hash and be explicit
about downloadfilename to avoid any mirroring issues. A note has been
left that this measure can be removed with a future upgrade.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 93fe352b99..350be8dc0e 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -11,11 +11,13 @@ inherit cmake pkgconfig siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
-SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz \
+# set downloadfilename to workaround mirroring test issues. When hdf5 is
+# upgraded beyond 2.0.0 this can likely be removed
+SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
            "
-SRC_URI[sha256sum] = "6e45a4213cb11bb5860e1b0a7645688ab55562cc2d55c6ff9bcb0984ed12b22b"
+SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
-- 
2.52.0


