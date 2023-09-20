Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC86ACE79BE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.34508.1695205762177615863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTGkWzTT;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c1c66876aso850657266b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205760; x=1695810560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtPZPv9O97/fzRBSHfzP6NMemd3qwIzwHMCcoCmq9u4=;
        b=TTGkWzTT8RR2pDwr0LKd+h4LjrJUrQ062PTFtlVeSfxyhfmxlNgGTMASc5XQpG6eWm
         65iJ26n7wwRrNtIr6GA+OPX/qE4jsjyQiHbplZwzqFnuUHHb2rUUauVzby7UEUfius8W
         rku6fOxSarU0gwg4djKBb1Ycr6pmDmTgc5o0kix18PcQG9XPZ6tWY0Qb/dlf4q8fbDOD
         DMq8UwqFzDMfxiJBVNVZ0VtYB7x20uB1XJttCSKkgY1XCRlbAxthAzfIDzk9OWs1rCSJ
         r1lOKUOvfriEGGPvVw07MgbZkhP/VMlxOQ0qMeEyZ3zvT6PRk3RWCRj32KVYWOPSF5dk
         vFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205760; x=1695810560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtPZPv9O97/fzRBSHfzP6NMemd3qwIzwHMCcoCmq9u4=;
        b=VHb5sOJYdwRGqZe2iG1fy54WYFwgnbxLRsW0TjWERJIjYPtNNx/ehjVvW4MgiEwe7/
         PlRep64fKNmsVlR6lBoG9vWCAlLRAevKGGRgj6mdlvCrENhSSHJB7Ps0YKQNjeA14GY3
         DN4Xy818ZqUyaG4Js/JKezK6uIbxDOBd5cNBDt2/YV7OkiSlHdYw2eCvwJToTTEf1SW+
         OsUTiZLx4I1KvGX64EcieVXQ6WXxV3T8X0PY7ENlGbNRb13QdeV4hETa2mUVjOCKujem
         UelyAHPcmMlTcpEPayHT6T57X0acJGEYbEvf+ZtDlMEnBLoMyACTOeGiP9hu74NFoD0R
         WLZw==
X-Gm-Message-State: AOJu0Yzj/xzNkISmjIx3fEAYHwaoMO/oKFM3/8RNzDW7WlK3pEZaPrZ+
	z7PNFejb+WjanNQpIX7POHbtLkikVU4=
X-Google-Smtp-Source: AGHT+IHoginCLqMZ6FV8VnRfWBlAZ+00sP2EOzwUXgZmSyHKbRtC0RrFMLtOW3pcYIg7ahST3aQnqA==
X-Received: by 2002:a17:907:6c14:b0:9a5:ed5b:2418 with SMTP id rl20-20020a1709076c1400b009a5ed5b2418mr1489288ejc.55.1695205760413;
        Wed, 20 Sep 2023 03:29:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x8-20020a170906298800b0099bcb44493fsm9296742eje.147.2023.09.20.03.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] btrfsmaintenance: drop allarch
Date: Wed, 20 Sep 2023 12:29:11 +0200
Message-ID: <20230920102915.1269280-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920102915.1269280-1-martin.jansa@gmail.com>
References: <20230920102915.1269280-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105009

* it rdepends on TUNE_PKGARCH btfts-tools so it cannot be allarch
  (or btrfsmaintenance->btfts-tools needs to be added to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS)

  bitbake-diffsigs \
    sstate-after/mako/all-webos-linux/btrfsmaintenance/0.5.do_prepare_recipe_sysroot.sigdata.852f9b3ed967c39f8a8606903819428e7eb933abf3cb62d87fbc627336223953 \
    sstate-after/qemux86-64/all-webos-linux/btrfsmaintenance/0.5.do_prepare_recipe_sysroot.sigdata.246481267cc27f87dc410d4a67bae0f0f3df63ddfe34ca2ae55e64883f816ffe
  Hash for task dependency btrfs-tools:do_populate_sysroot changed from c4ac5c9abe44456745d82947c64dacdd6167aabdceea62220d6b73ee5300ed58 to ff8936d3161a58c905a3bc4c59e8261fdfb70c668a495daab312a95273c6f4f0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb      | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
index 2f4eb9e58e..b4e5da6e20 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
@@ -22,8 +22,6 @@ RDEPENDS:${PN} = "bash btrfs-tools"
 
 S = "${WORKDIR}/git"
 
-inherit allarch
-
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
-- 
2.42.0


