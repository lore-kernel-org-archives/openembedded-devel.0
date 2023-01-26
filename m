Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E98C61DA3
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.68539.1674717465897209435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NMamLuiB;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id c6so1141850pls.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7iFho5JxUDCxrY9ZxQXdleOM2dqazYI2YUkJmOYwek=;
        b=NMamLuiByLXteYxYpEGfy+S41H0GAWVNVSQAqrA8u3cpBJxaMfeMZsEqPvfcNdy//u
         r708HVlZg1iaGADK3dNylEE6lFDHOw7tj/D/9qCj6tKCSlXDrOymjmYU5/C/6p8pYDlV
         j2+OSn6e4nDl5dEziLSG70z3ioKgppkuXEhVqolY2mN1Rl7CPjttZRlUQVQV3xV9tImw
         ENRmMvXvvr/jTbgp/b/R2wEAjvgMKrXiW/44wgkBUEx6z8MS2/MqLLDL74bsfSptSXgt
         rG8v4dmTpQUkMoxl97iwVXqHnsAYv6UiwR0R7AvU/ZhjuQBYNFJd4UnqGjQT/RNvunP4
         NRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7iFho5JxUDCxrY9ZxQXdleOM2dqazYI2YUkJmOYwek=;
        b=ZfWzXkEV2+tU53PgduZBS3YMmLYbNipyQqKdilUC2/X31X/bI9s+X6zVc9gEVKqgH1
         wBmJiDuMhEdkHCWptnqe2ZcKVL2TFvt92kFj4SGdg2DnEds66kd1HxuZO+1wtfIbtJs7
         KYDI5Wk5gwPHiTTkWuRkluGnJeaPfj5G4MzEHtGA8b5UQaUPZeOaFdAspg0mHq2TGAOM
         qS7jEV4H6fweSsTACyhHnEz8a1MYHJnEPMl/tPUEn/q0wkpBcFvwzwHWsQm/sogSOKmh
         4+bK6SWgByQs/j9jaBJ8gK7/FS2GBmUgglP41GUF9uh+hz3iZMhnJX1uzR/ERs01Zxih
         6oJQ==
X-Gm-Message-State: AO0yUKVLDfQvFcCo2q6PyWZ05f+0f1IR6CQJYVw3Ur9/KW6e1I1C5cpv
	FC9dXjIbCNIUBlvTXygv6u7bkkKckjQSVw==
X-Google-Smtp-Source: AK7set8JJUmjEYbKuLpPLrZ3dMHck1KcliRKl2wL9pwj/Qs6YS8iXxWUrypR6xkgt0eyPE9hZVi+RA==
X-Received: by 2002:a17:902:ce92:b0:194:84ef:5f9c with SMTP id f18-20020a170902ce9200b0019484ef5f9cmr1059982plg.29.1674717465025;
        Wed, 25 Jan 2023 23:17:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/13] libiodbc: Fix SRC_URI to not use gitlab archives
Date: Wed, 25 Jan 2023 23:17:30 -0800
Message-Id: <20230126071735.2444745-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100790

Fixes
ERROR: libiodbc: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
index 57227375ec..797a9e806a 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
                     file://LICENSE.BSD;md5=ff3a66a194e500df485da930da7f2c62 \
                     "
 
-SRC_URI = "https://github.com/openlink/iODBC/archive/refs/tags/v3.52.15.tar.gz \
-           "
+SRC_URI = "https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.gz"
 S = "${WORKDIR}/iODBC-${PV}"
 SRC_URI[sha256sum] = "f6b376b6dffb4807343d6d612ed527089f99869ed91bab0bbbb47fdea5ed6ace"
 
-- 
2.39.1


