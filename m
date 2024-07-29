Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C2CC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:09:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.61519.1722272972255604826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SznpMQoO;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so24233955e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272970; x=1722877770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFo9jUvVnvekD3jb0Vypp/LU0d02S+/obeq7oNU1NNE=;
        b=SznpMQoOS6wGFC8QTGr/Kxp53GDSwpZGTtaNVvT70dGkJJGftBkHZt+lbTfvZXRao4
         Viuqxqf0gmwadVLiV8srpafqp7a2+tC/qjF5v2ki7ZF8+m4LuWBROpLv4Hv1C07OlC1e
         GNr7cAXMi8WWZoTrOMEBbehhuQwxF1tspb7Ewh5Pni74RbQzqoYKheIWtNNTYvbQho/4
         xz03a9GpNfPhNtntpQGdi1ZvQDik7pqU3f/NOs0lpyHkt9w4l4eiUwVnj1XYdCLEOV9K
         ocJ6aumHOyn5sS/FsokQLZKBoT77J0x9nLA7JE90uf9x3ET4Ru1AabLQ9gxbYndrXcwq
         Ow1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272970; x=1722877770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFo9jUvVnvekD3jb0Vypp/LU0d02S+/obeq7oNU1NNE=;
        b=LKoyqQfSIDX9yf2QWSRTTA10nKobHQP32Z4vY1vH7K/zXIl1fv90KbAkgN7Rmfi/4p
         1d32rhHrKyE816GR8RrIK+bORtNuE+SQN93vj4vgBlY5felSr0dpilxZ036RNL5xnEA8
         Lj/uCHRnorzW15snLnZUgGU6K6GfuK3cwL6k+5u25AWktDG9Xijyn5DrUzRkHTGaqd0u
         lb/euEAkEm8XQ2kgBho7LrGgwrTAcWrC/9PzOoU9viZoRShgy6Mn5ApEhY9zIEh1fd6r
         xhryotdBragI1vMrVjNxBSgSLlzvkVCbryGLbM7xsZvxBye7as0syo34PqOa2XwaeHT+
         aZVA==
X-Gm-Message-State: AOJu0Yxm15nBnjwH/6eiduPcOMihTag8JdT9YmKsnCNfuidG6EUTOn0q
	mUNP7VK+03dqtAYXe6/ziN8kVV77rDMcqHaj0nlI5kYq5pkfbSgSFXhI8A==
X-Google-Smtp-Source: AGHT+IFjEwaFEJeH0gidVhXMoqOSj+qr2+4TtTrUlWIAkeHM4X+nQda9XFceiSKq8NpxELqF3k1k/A==
X-Received: by 2002:a05:600c:470b:b0:427:f196:c549 with SMTP id 5b1f17b1804b1-42811dd43b1mr67646195e9.23.1722272970142;
        Mon, 29 Jul 2024 10:09:30 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280fa9a30csm115340725e9.30.2024.07.29.10.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:09:29 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/7] composefs: remove fuse3 dependencie
Date: Mon, 29 Jul 2024 18:09:04 +0100
Message-ID: <20240729170910.2670446-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111465

From: Jose Quaresma <quaresma.jose@gmail.com>

The fuse3 is only used for development purposes and the composefs uses
the kernel overlayfs and erofs on the target.

The composefs-fuse [1] tool is not even installed by default
So  all the files installed on the target are the same
with and without the fuse, this can be checked with buildhistory.

[1] https://github.com/containers/composefs/commit/f5fed9ff093ac57967a4c5253bae3ae294dd8cd9

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8b54f1b64d274d07eb202a0a8056241973c6f112)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
index 7607b0a12..98eb3e1b3 100644
--- a/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-filesystems/recipes-support/composefs/composefs_1.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
-DEPENDS = "fuse3 openssl"
+DEPENDS = "openssl"
 SRCREV = "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
 PV = "1.0.3"
 
-- 
2.45.2


