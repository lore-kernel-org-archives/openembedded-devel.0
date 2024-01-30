Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFECFC47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:19:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.3720.1706638736925500725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fg+QYO1T;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d05df82b28so11679001fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706638735; x=1707243535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sEALMn9QobUqqEpJV8Rte94K3qPHxaGzCc4B/VfM8g=;
        b=Fg+QYO1TDrYZyNRd09OJqlWhgvEDDV6gMikHyORxpLNQGLFlbes95hx11NZzhpIwhl
         vpyVNoI3u+39hegxD+9K81T6ixNU0fEoUHNaMGnnRE5czwEES/nd+XBnsYmeTFi6fFp7
         UsJXX3ESQF6zzN63BmM9V3KKKdU/0ueCCCmp/bf27XQ2Gxe0GGLvIFR9lVLfY0bTSHtk
         BuF9bjjVfcUCG2VX2+JXmTwP7zY8A9W1p1Qv5E6BDLdda9gfuiif6U3RjZJCnukCvAGI
         +dmNa2A0jBNif1K0DuLCem60nqS+2Bz84js6KyflfW2b1Udw2XyFIi5Lnqiz3dQvhk8s
         LzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706638735; x=1707243535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sEALMn9QobUqqEpJV8Rte94K3qPHxaGzCc4B/VfM8g=;
        b=NzYppSZgOAk1qlgxKkgRbVffhsJ4V/crZQa5u4Q7QYSZTNRrCUXZy1eWJfQcWYMCVh
         POcRR+XDvXFJx5NPnnCudHYPKgC8rp4LIofQ95Xe6TmahL12JMbSwHpx+sq94XH0gOy8
         K6voD1Homj4s+RYtA9YVs9ETdPrYwg47QcbgHrEpyCiPabmMGHJz3K/17aVV/5nwePpO
         FOJxmTc38q08CwOyV+RnQNWORig6XBii44BhzE3oVPIW+P5+wlSBUz3CRvoZnHeYepjM
         yJvIXN2kpqtVd0WXs8jvzDcv3n55wP/uUNh5HyhJbvZR9wLxd3I2IVJuvhR3WN2lZLam
         Uu/g==
X-Gm-Message-State: AOJu0YydVdgqSrX5oPRhHrFwrU++X8qQp94nRPb+3e3dnUw+ilFD2UVx
	K5oozHbPWnVAYzT8dAJQYL0NmAf79eo/+PRBDdFbbYMc0a/yX5VZiA95TZfG
X-Google-Smtp-Source: AGHT+IEk43GXSnfKjq7+O4CaUTsOEBFuP9CmVnGD2IGT1A5Ug2675OWc7FIsuYJOk6kb0+u6oNMo9A==
X-Received: by 2002:a2e:b0d3:0:b0:2cd:2444:d24 with SMTP id g19-20020a2eb0d3000000b002cd24440d24mr6763145ljl.47.1706638735062;
        Tue, 30 Jan 2024 10:18:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWp/lzgPovTKkY53k7k1QJ8WQ/Ym7Nhz9tfSa6u/v/RK34SQcYzeQQ9O6iiF6aI7Wr8QYkoX5qqYRKrAyhCXj3J8PpUMe70
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v2-20020a1709060b4200b00a35ed4fd4cesm1764869ejg.115.2024.01.30.10.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:18:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 2/2] libvpx: restore Upstream-Status
Date: Tue, 30 Jan 2024 19:18:47 +0100
Message-ID: <20240130181847.3553866-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130181847.3553866-1-martin.jansa@gmail.com>
References: <20240130181847.3553866-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 18:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108498

* accidentally dropped in:
  https://git.openembedded.org/meta-openembedded/commit/?id=acfdff6e41f860b31faefb4e449239a6d04d7502

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../webm/libvpx/libvpx-configure-support-blank-prefix.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 3a1d6832c5..463651aa4a 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] Upstream: not yet
 
 Fix configure to accept "--prefix=" (a blank prefix).
 
+Upstream-Status: Pending
 ---
  build/make/configure.sh | 20 ++++++++++++++++----
  1 file changed, 16 insertions(+), 4 deletions(-)
-- 
2.43.0


