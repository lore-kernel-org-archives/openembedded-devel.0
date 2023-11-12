Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFA5C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 09:55:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.12882.1699782917367404967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 01:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJglULUo;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9e623356e59so305043666b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699782915; x=1700387715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdVkoDaykABmnyStCzZ3UvCTeVVNk8jcfoROituD/A0=;
        b=lJglULUoTqWvfATJO47Hf5nv7wbaQZONBYB9q8mlzdHyy4G29qevbMLZWvHMKVfhsL
         ng6LnVN1a1TqrABCOsHdAqgh8WtFs58KtKT0YBE/mNk/SI40e7yR2VXx9qa8WdU+WC6+
         SkiLMNfSOkTZavWIadqpvKnl9xMiG5Iz+QTTc4y0si8h9eomjZRHPof+/E1NUoz3XUGw
         OG7F1qbqTjtTRl15ScHjbIUCPCx6rBoVZAVaKWNuQjD0pRmv8stvIgWWLfvelxKb6/ZR
         bqOXsyiZLkzuUJn+IBLHuuZmiho7g9MQy7FxB7GTb9QgDTr9K3jIudnfnLTYgZLwZA+O
         U7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699782915; x=1700387715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdVkoDaykABmnyStCzZ3UvCTeVVNk8jcfoROituD/A0=;
        b=pPTEE2MSx/5uBUC0pvs3JompJapWeIwv+IXrQwqvOJpMFZufFmtQHsbqGhdjVX0imH
         tgtDc3HbAbrml2zI/EYYsAwF2ZkZyjPBBb8BzWhNxByrwQzIu9Kd/1cAlpHLnfSn7/yp
         t1Gr3LI6GbNzncFqwu0UIGuX5GVd/Fwjf3zAm7MVd0P1a84OQAvAPlapxIQswyIcMFYX
         Y4om0/wBgC01nXwaD0pqoyhDbOk/0W6S/BidzPKUwAzya4XLHKYlruUGLdcP/ycwJjNS
         VcwgtJlKih4QLAPPaAdAgQn1xroLcsKCdEH4Ne2p+tplSlj4+TCQkmMxSQ8XHqYCIuY7
         cleA==
X-Gm-Message-State: AOJu0YyniTvLB7fYqogsoxwt5E5aGgUHqkeDGB7bYwEeoABVq+le2feA
	SWBLljUPbMq8Oe998loh2gsJaTcysohwaw==
X-Google-Smtp-Source: AGHT+IHk/zC2ocT9eoYAS+6hSs2YOKkzVboU8bAim66tsmuAKaCRdJFaTHQtqrmcxeZCS7C4HbinoA==
X-Received: by 2002:a17:906:1d0b:b0:9be:aebc:d480 with SMTP id n11-20020a1709061d0b00b009beaebcd480mr3110847ejh.24.1699782914982;
        Sun, 12 Nov 2023 01:55:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id le5-20020a170907170500b00988f168811bsm2308318ejc.135.2023.11.12.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 01:55:14 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] fuse-exfat: upgrade 1.3.0 -> 1.4.0
Date: Sun, 12 Nov 2023 12:54:52 +0300
Message-Id: <20231112095452.118629-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 09:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106582

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
 .../fuse-exfat/{fuse-exfat_1.3.0.bb => fuse-exfat_1.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.3.0.bb => fuse-exfat_1.4.0.bb} (83%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
similarity index 83%
rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
index ac18fe90f..2f5b1a333 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
@@ -16,7 +16,7 @@ RRECOMMENDS:${PN} = "util-linux-mount"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "846b8c36bfa4684719f9e08e9d3a6bff"
-SRC_URI[sha256sum] = "07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3"
+SRC_URI[md5sum] = "765bf2484d48e5c253d0d8cb8de4f8c0"
+SRC_URI[sha256sum] = "a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20b2c8bbe6edb3001e"
 
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.25.1


