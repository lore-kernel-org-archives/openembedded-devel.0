Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84CEC433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:59 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.11257.1651502032094548007
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=asI+e8m4;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id i62so11833198pgd.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mDOIz8vRt9q+oxjwNpuF/SCHo0Aq4Q4luV51jBewMw4=;
        b=asI+e8m4uS/uJIciXDitzNn4ApQzVYV5NQUsEE2Uz+kpGIMGq/z9b+CEVnaRfrmfKi
         JsJb2lX5uLAL08qb+vk11CsHA0QGD/OwHpGCkcDd4JjhJP2+lBB1bktv1v/jluBfwbgy
         KHFrcJ4XqZvazd2O7+ellQzZT/tSR2LIgQVTzWCv9FuFQ4fEXbervQcitCjZ1CkceRg+
         TYDpifTFJ9/Zw0uCd+5J6PTS4gBWWZjb/QIOmdouqvyKYNNicIzRo4av1iv878ylQQhV
         L9GcxtSyv0RXvZXvweGPYc9gBh5DSxNFyXex682ctHJ9PO7aRCjvNjJ5lRUSGBEmGNIK
         f19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDOIz8vRt9q+oxjwNpuF/SCHo0Aq4Q4luV51jBewMw4=;
        b=CgKZdmwZpVqUDGJG4QrtFJyp2VJ778QGoVGHiUnAps1eB2lufsW8q7q5bTBwAuKoJ5
         /D96okrW5R/fSVp2Euj7aKRwP599Pqae4FmGXksweawImyAyDmDkCbWoB8dIb7wqnahp
         pcOjkUZFA2qJWyhLfe0MO53XwKueYrisaLR7h550aPihLKhcgm4ditEvSs0ojuUSEiTX
         G7dmkybEeCQB3vGYssGYaMEmvTK7Pa25CZ0KcG0i+XtHVc0k2AH7rmjI+JNGqKfxyirS
         R0q4LlwW46lZtestsPGLEdLeTYGqBNwIwhP4/YCAp/WIJD6iGCUQuCWw26TIGKCWox4i
         LemA==
X-Gm-Message-State: AOAM532VLFoMi96x63bnY0Xs31y0jtWRX4TVHVyklGhR2vuDCh2w/wdC
	Z7hVV/dc+MW9XekTkIaJIr7XeNz71RUeow==
X-Google-Smtp-Source: 
 ABdhPJy2PsStAhu+MR1HPotyIjKJgks74r1n58UIYeX5EFOiR1gbYDcJ1Y07HHKCK1PIL1qWkAzoLQ==
X-Received: by 2002:a65:684c:0:b0:3ab:7c9c:f648 with SMTP id
 q12-20020a65684c000000b003ab7c9cf648mr10063553pgt.562.1651502031256;
        Mon, 02 May 2022 07:33:51 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 03/10] netplan: move from meta-networking to
 meta-oe
Date: Mon,  2 May 2022 07:33:38 -0700
Message-Id: <20220502143345.1500852-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96932

add to the dynamic meta-pthon lot

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netplan/netplan/0001-Makefile-do-not-use-Werror.patch         | 0
 .../netplan/0001-Makefile-fix-parallel-build-failure.patch        | 0
 .../netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch    | 0
 .../meta-python}/recipes-connectivity/netplan/netplan_0.104.bb    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan_0.104.bb (100%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
-- 
2.25.1


