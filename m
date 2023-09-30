Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C736FE7737E
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 17:30:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45325.1696095015714748437
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 10:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8G3CL4K;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-406589e5765so20607415e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696095013; x=1696699813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNYXFzFiWaltBLBI7n34Zx0gasBNLpMgNWZrY5WAUWw=;
        b=e8G3CL4Kxs8JL/mleriMKxWAODMMMeifYtk5ZsDZXrjBQVPV1j3+8NqzsybF6fhAIH
         FRFRAt/G18nIQp5ZuzbCA4GA+I7bm7NIgvctCYTO7qCKvbQvLzQ+NUYseUW4jcym+JSl
         HUfBCrUYMzHW5vWlGuNp5EjngtO7753AdrjqpVYlcu9IQ9GHECP+nrGT4IzRzS9nb/gf
         ou7sHyIkdsTcUloJNk0sdQDYGJPdTP5welCXsFJ318Pspalc6trT8hV0GW/DjXB3X8sc
         kVqV4L9uwsMjlzOgZsmH6WesegQSTF69EQj7BYX+t5HeH8p17HZ6y1dRl9cQ6gycgMTB
         bTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696095013; x=1696699813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNYXFzFiWaltBLBI7n34Zx0gasBNLpMgNWZrY5WAUWw=;
        b=vX+ZJaM7qrNXWnI5M8gjmNPRygygM9b4Zq4SNwTbTNIrj3iJLydQnLqRk96Rjje2Pb
         WdVXXyZ7ruxuBY/TJVYGY/c9DofdAyWCi3SsQjP+tR2tPxtKCvabvw7lLuMbr3WxlQqv
         a9bQkyiksBHbod7Q8hoA8RuRZ+AwFrDRCiFDuOtl92092VlzFvgeB7MSq9lDVoLL/HWF
         +bXcvNeYxtnqGs5iZlqIQpIs3h2YfTBJDcp29hgNZOhO8Bnmimf9YABm0ct3tmpfW+U1
         oMXGtVno0eJKnRUC6HfQTCAOkrClNrpUINluAG0Exgi2L5MxmuUzztGrKpn1JD/n7AgB
         gcww==
X-Gm-Message-State: AOJu0YwTnhyw1bg0KZNnb4zPi/SddGIYOoGjQ4qBg7wMDNrLBokMLUnw
	UVs9LwU0jUcheDOJbYUy4xZoi0611NA=
X-Google-Smtp-Source: AGHT+IGm9iHSHefKjNv7dr7mbrGawgMm2Cnko5xZIESMJqHFseRjQtiYL74JTpqa45PqVlzD0cDLMA==
X-Received: by 2002:a05:600c:3786:b0:405:3ee3:c69c with SMTP id o6-20020a05600c378600b004053ee3c69cmr6148835wmr.15.1696095013108;
        Sat, 30 Sep 2023 10:30:13 -0700 (PDT)
Received: from clements-mbp.home (2a01cb000c0d3d001997765805cd3923.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:1997:7658:5cd:3923])
        by smtp.gmail.com with ESMTPSA id k2-20020a05600c1c8200b004065d72ab19sm3737277wms.0.2023.09.30.10.30.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 30 Sep 2023 10:30:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Samuli Piippo <samuli.piippo@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Date: Sat, 30 Sep 2023 19:30:03 +0200
Message-Id: <20230930173003.3210-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 17:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105284

This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.

As said by Ross[Ø]:
"Putting the _target_ protoc into the sysroot for executation at _build_
time isn't useful because even if it has the right architecture, the
tune might be incompatible.  Recipes which want protoc should just depend
on protobuf-native."

This has been reverted recently by Samuli[1]:
"If protoc is enabled for the build, recipes using protobuf will
fail when protoc is not available in the recipe sysroot"

Be the revert is incorret as This is an issue coming from qtgrpc
other recipes that use protobuf or gRPC compiler, proplery looks for
the binary in the correct sysroot folder.

Qtgrpc recipe should fix this issue at the recipe level, for example this
is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need this
patch to properly compile.

So keeping this hack doesn't seems to be a correct fix.

Note that qtgrpc recipe isn't available on meta-oe nor any other public
layers.

0: https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
1: https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/
2: https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e

CC: Samuli Piippo <samuli.piippo@gmail.com>
CC: Ross Burton <ross.burton@arm.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
index 06d73d648..1edc21cdf 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
@@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
-# CMake requires binaries to exist in sysroot, even if they have wrong architecture.
-SYSROOT_DIRS += "${bindir}"
-
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.39.3 (Apple Git-145)


