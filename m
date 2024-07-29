Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E96C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.61071.1722272976170826591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VH1o0Yct;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42803bbf842so24303855e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272974; x=1722877774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyxegsyADBPawhbWYfpSqqYhj36D4r8f9WK78mclqKY=;
        b=VH1o0Yct9Y/Jw7bC97B8a0eKDZbE30viujfZY0SnUR6VClEh0geZPIvrfTAdsUDGXM
         Vy1pmNvGeu6BzucN8F3zt3dzt+IupcMcboqabjKuGCJ1KaXZONvNNPAHW+f/pmZQnT6I
         1jUx/INZqu6eMHKnvBWul+BbIM5EOdyMVkvfAo5RrpGLk+qMh+beHwuziJcMghLgK9Gi
         Fbdh8ALCHGCKMIio6yJZHP1I2wypWq6teu4jCfyB+u3fcHiN72A3xxIjirA9UkmCbjc9
         ffBHtAFxTo0hjxPfyJ9yrQPuUgTg75cpEP/kLADEDyGIMEOCjky46idyENGIkRbKNEFp
         33hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272974; x=1722877774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyxegsyADBPawhbWYfpSqqYhj36D4r8f9WK78mclqKY=;
        b=Iq8JgwxKqOtXMfjTnqKgHiPK//pLg+iuyCwZHFKXfZmFGjjTgmG814oMaiaTKEKq7h
         LlwR3U42d1hgdBsNsV9nvuX8muNJ3uQbZk5w7WJ0eXfP6y21FEqWUimmms8dg1xdqBwN
         hCgwdaVFiK3jxgfx1WHrxrXKuXorvm5Bwqc5JFmAX1I586ZnGnkiw/cH9VMlUZtCz4CE
         ayqIIghpLzAXxh8mEnfrARcg0skom2xlQjgdroVKi/mWyJb48EfgVYWkD7Rbgj2n2YDO
         XYSk5Cgy3q8zpGtJyOguFcImDFxQf+TQ4j06Q+eJDY0gMpLMjfX5n9ms1UcGMj/YNpMT
         itcA==
X-Gm-Message-State: AOJu0Yzzpb9JQnnyrvsozfP0onv1ltxMvtoYVB11Y1VWm4pgYJSkAEjK
	vvFtIVjbyedW4/v46UGjXhGPkdehFdb5gt7bjDUS0p19UcYv4bL9XVO+eA==
X-Google-Smtp-Source: AGHT+IGyNCGbsV3GEOhC8GHFJeWpqru0L2l/KHk7sKnfYCf/BjoN4PYKEsqSgqX/hSZgtpBOMAkzDg==
X-Received: by 2002:a05:600c:6c8a:b0:426:63f1:9a1b with SMTP id 5b1f17b1804b1-42811e0b6femr72240315e9.33.1722272974345;
        Mon, 29 Jul 2024 10:09:34 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:34 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][scarthgap][PATCH 6/7] composefs: upgrade 1.0.3 -> 1.0.4
Date: Mon, 29 Jul 2024 18:09:09 +0100
Message-ID: <20240729170910.2670446-6-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729170910.2670446-1-jose.quaresma@foundries.io>
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111470

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added LCFS_MOUNT_FLAGS_TRY_VERITY/tryverity mount option to do best-effort fs-verity
- Use the new loewerdir+ and datadir+ overlayfs mount options from linux 6.6
- mkcomposefs is now multi-threaded when computing digests and copying files
- mkcomposefs now uses copy_file_range when copying files
- Added some initial rust crates to handle composefs dump files
- Added fuzz tests
- Documentation updates
- Fix some crashes and leaks
- Improve error reporting
- Fix build on various libc types and versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6e5565ebdbcbbd1d0f64d7517636ace056d0757)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../composefs/{composefs_1.0.3.bb => composefs_1.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/composefs/{composefs_1.0.3.bb => composefs_1.0.4.bb} (95%)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
similarity index 95%
rename from meta-oe/recipes-support/composefs/composefs_1.0.3.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.4.bb
index 38fc8d267..aaf33b40e 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 PV .= "+git${SRCPV}"
-SRCREV = "ecef20c18c81943bd17b489ad1484f361b99c792"
+SRCREV = "7623e4dc89f62ada5724d4e41d0a16d2671312f5"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.45.2


