Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B4BC25B77
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:31:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.5960.1715247099914084970
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 02:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hFeFZNI4;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so610022e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247097; x=1715851897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxR87aFfpFN5I9tXdYnMxO2TDLXEI8AorK2wcSJ8/Aw=;
        b=hFeFZNI4+Q4PUD3OCSu7odJwLD6JkHNvKKnBKcFMoZTd4AUC5AkDzfQRzXYJ5wG2UJ
         qDGxjBZaq1xSxsYqpGGictI7Kvb8OTI4d6s9gMASRVghI16Xee6sSGh9jxmVZPSnfRnB
         9LoynrimzmCGPUmKoNHCPHj0Y6KWP1S3cyEbSvXytf/O/kIjIElLN3eG+5NgtJ++Gwef
         fqpzUvjWg0D/1yuSc/yc1otXL15LQu+hw5aAUlPJagM2InSl77kKJd4Nb1A/c8qtM+hE
         GU4AGQDXWKty7qi0VmVWlevSByhwwQ3+nHzHExOrba8BPYA73RL2NPB8gVZEqfQJN+tX
         hxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247097; x=1715851897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxR87aFfpFN5I9tXdYnMxO2TDLXEI8AorK2wcSJ8/Aw=;
        b=qVuNK799g1ywh78bUGhLZIDMXHzm5aFTZwfqu2RNtlkT5T2Ubage5cIic8/4MPMriP
         OUtLnV5lmeeU2ijCRjPKuoBogikDpsbooeLdStRz5IEZzoOxKQEmTz2deTwUS0GlpN9R
         CS59hD2cVpegn1PoAN8reUWsOAuG6bsMbJg8IOnp23HyFinYewqaLACZM81PwSkTrDPV
         TWpdVcWvd3veMFnR26bLz60wo2flwc9K5CVR1T+FixM3V3NrTo022w3oNPTzuPVSBeE8
         EbH4oDl63qBDx2ezZRDdBRaUEHZr53sdf7BEqTL3hLhVIx3qKukGiq3qSNCbW23WrFU5
         vZVg==
X-Gm-Message-State: AOJu0YyydYGpysRHQM5TAz8Z9c9xfxxAITXN7dBK9MOgaansWRhbmA0h
	upqUakjAsqxMby4IXZshO6t5QdOc1jPPVhefGJsZCLHIg3gk8duP5mYmsQ==
X-Google-Smtp-Source: AGHT+IGm/Efh1xVNmTaaZayVCkvweaDSl6xxrsH0FgfljnH1ACpWi84eC8uuJR6v8B04dWmtc8flfg==
X-Received: by 2002:a05:6512:3e1e:b0:521:cc8a:46db with SMTP id 2adb3069b0e04-521cc8a4841mr2525884e87.37.1715247097051;
        Thu, 09 May 2024 02:31:37 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm62391655e9.0.2024.05.09.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:31:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][PATCH 2/5] composefs: move from meta-filesystems to meta-oe layer
Date: Thu,  9 May 2024 10:31:23 +0100
Message-ID: <20240509093126.503764-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509093126.503764-1-jose.quaresma@foundries.io>
References: <20240509093126.503764-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 09:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110288

We can make this more widely available as we don't
depend anymore on fuse3.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-support/composefs/composefs_1.0.3.bb                  | 0
 ...001-musl-basename-use-portable-implementation-for-basena.patch | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-filesystems => meta-oe}/recipes-support/composefs/composefs_1.0.3.bb (100%)
 rename {meta-filesystems => meta-oe}/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch (100%)

diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
similarity index 100%
rename from meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
rename to meta-oe/recipes-support/composefs/composefs_1.0.3.bb
diff --git a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch b/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
similarity index 100%
rename from meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
rename to meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-implementation-for-basena.patch
-- 
2.45.0


