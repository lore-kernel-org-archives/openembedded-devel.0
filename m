Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477BCC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 12:30:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.67434.1701693003077959797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 04:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fMAKI8m3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso8396871fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701693001; x=1702297801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y+rDOFprKrgq9V8bxRgRKprGYulHNDgS5TjvQ7E33Y=;
        b=fMAKI8m30bYAPuNTfclWJ9tgFM+dQngY8KVDv0pO8P9f6j+owvj03IA0v7B87HWQt9
         7QTjRO+QEm+vmavExpOIgPHoCYg9DPtGA6S9KcRpv46deoz7CxtcTy1mgwHJ3WpyeRT2
         TobLx4aA2xEODn41IWuBxrOeQCJrQb0/NHtVBWLJmNk0ZP882dr5HOXXJoqmxBm/Na4S
         STC5E0IN9pH1ZyysSZUqYh54zLxBadyOKMZwnws9Ms/96Wt4/DGOPow2LDFuuwE92wEc
         nrsA4Lait+ngmBgp6PLzuwco42auKJ81vrx75JWOwMr9fEP1ycK6ULkhid/S/raKg9ZV
         k9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693001; x=1702297801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Y+rDOFprKrgq9V8bxRgRKprGYulHNDgS5TjvQ7E33Y=;
        b=JHDi4QEvDH1YpIfIeSSMJh+e5Gn+DllNNUMwTcNYT/Z+joGVy7nb6sTgQkiqrCZ06i
         +0/X2OwELnZz4GR2WBNOqwaZ4/noTiQRZf7Yo6MDqbA2xHYMUs2ubm86PsPDUN7wjVDg
         Pwx/aqjsoT26HdafXoO05ICeGyZPjrlzjjPFArYaoSMqtsOfaPGS78Ra8pWnvXLtrCAA
         VGKAIMQ1TNVpVUekuD97OCB2c5H+horcZzQHywTuSJLC9QvVrnsdeXcidZlji1VFsypY
         K7IW4dLwAFbEv9S6mEtxxsHdvFwPlSD7vlN4gEU07wqwoezxLrWCr3MXTQBwoLidT3b+
         7W8A==
X-Gm-Message-State: AOJu0YzvzDdO8Kpljr9bqZ6N9gKJnTcJ1YpKOqAPFC2ap8Qymb4qI/CM
	Xplm/w1f6veH3pjE5+bY2Nvrw71LuW1WqA==
X-Google-Smtp-Source: AGHT+IEy3i/EGWRByRfWlQXY5Y4uZ3sFUTahrpc0ExIiw47dq0BmqgkrtkQ9i1le4wmipzLmPhGZ4A==
X-Received: by 2002:a2e:8502:0:b0:2c9:b226:65d with SMTP id j2-20020a2e8502000000b002c9b226065dmr2550273lji.22.1701693000430;
        Mon, 04 Dec 2023 04:30:00 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id se26-20020a170906ce5a00b009fea232316bsm5204659ejb.193.2023.12.04.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:29:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libspiro: upgrade 20200505 -> 20221101
Date: Mon,  4 Dec 2023 15:29:44 +0300
Message-Id: <20231204122944.306466-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 12:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107201

Changelog:

* bugfix - forgot to remove (1-liner) test code. This will not affect users drawing fonts (fonts are mainly in the +x,+y quadrant).
  This is likely going to affect users using drawing programs since these are equally likely using +/-x and +/-y quadrants.
  Test code introduced during 2017-10-22 and forgotten to get removed before release 20190731.
  This 'bug' affects releases 20190731, 20200505 and 20220722 and is recommended to upgrade to libspiro 20221101 for drawing programs.
* Added ability to start spiros with type '[' or 'a', as long as there is a 'v', 'c', or 'o' in the list of points.
* Thanks to orbea, bugfixes LIBADD for linker flags instead of LDFLAGS, and removed .libs from linker paths (these fixes help other linkers which need more rigid requirements).
* Removed 'make test' and added some Maintenance info for 'make check'. Closes issue #30
* Implemented in https://gcc.gnu.org/wiki/Visibility to help reduce symbol table and exports.
* More info added to spiroentrypoints.h to help developers.
* New method added to libspiro. example code shown in tests/call-test21.c which uses ncq definition SPIRO_INTERNAL_BEZCTX and two associated functions.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../fontforge/{libspiro_20200505.bb => libspiro_20221101.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{libspiro_20200505.bb => libspiro_20221101.bb} (78%)

diff --git a/meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb b/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
similarity index 78%
rename from meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb
rename to meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
index c885a00c5..0adac8464 100644
--- a/meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb
+++ b/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/fontforge/libspiro"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/fontforge/libspiro/releases/download/20200505/libspiro-dist-20200505.tar.gz"
-SRC_URI[sha256sum] = "06c69a1e8dcbcabcf009fd96fd90b1a244d0257246e376c2c4d57c4ea4af0e49"
+SRC_URI = "https://github.com/fontforge/libspiro/releases/download/${PV}/libspiro-dist-${PV}.tar.gz"
+SRC_URI[sha256sum] = "5984fb5af3e4e1f927f3a74850b705a711fb86284802a5e6170b09786440e8be"
 
 inherit autotools
 
-- 
2.25.1


