Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B01C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 21:28:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6555.1720646923502151204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 14:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k8zVumeo;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso1305775e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720646921; x=1721251721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3S9VS5bCUbUhMrCaPh9w5PjI9XnGbVKWZfdWlSQ6t3s=;
        b=k8zVumeoo7aDoIWB1mXywJMlv4QJ5OiJ3wmVRX8QZFkmgWVtpevHvK8q8NBED+jzny
         X95h81XL1JJ66yRjsLykp6xTvVMDwj7Jaq9X3KVFDv0774C0wwdSnhJpbi2pAOQ2Tdgo
         5ovLUmwNlxI248XIO5Z4ywdXgtg1JSyJrgDIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720646921; x=1721251721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S9VS5bCUbUhMrCaPh9w5PjI9XnGbVKWZfdWlSQ6t3s=;
        b=fYfwypkPHUrbXvxPI3nR5pl9dqDbpJH12NV6PkGu3eFB0eifaBXTbCsKcmUDVIurmC
         Bg28MIbIgrMbzKvBggTzrsjHHtrgaq48+ey2+4s/X+Bfst5tcsH18ULm7ditfJJoz9aj
         NQDqNgpKiiQXrw6bezT2miOE29ziNQQJC8lih9QjR1Isq6XSZmBpn8QibORJlO4HhfW3
         D0pUcf/oiH9jcIRCoY6NiipAH2/3krhM5TehH5c7F/VApNh2/lsjD0il+N5zF2DCx51u
         hLLerrfJ7Wm87BriLj6oThFH/zKFvFfPaspB38qXct9Ck5NuOEnYMP/tzEC7LaeDpPmM
         E+eg==
X-Gm-Message-State: AOJu0YwBWSyzRcXa4iNsOaBRVb7v5tFFe9MIGPWOApSfkYj17KfO7tzE
	ncgMbJoWwYQKnG7Uvk/nLETUJMs6q60cchdp5B/yyG2t5d+qGhno5GL+2Ucl517pRUcTpUnb6eO
	M
X-Google-Smtp-Source: AGHT+IGqK5k0dcvJQqnLwfIPKtwIzZcgg8d0bku7yf/U6j+xq3fc0nLoVrafGvqNn31twj+V07CCUA==
X-Received: by 2002:a05:600c:4c15:b0:425:7796:8e2c with SMTP id 5b1f17b1804b1-426707d8b58mr47049365e9.12.1720646921364;
        Wed, 10 Jul 2024 14:28:41 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741624sm91636015e9.41.2024.07.10.14.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 14:28:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][master-next][PATCH 1/2] pidgin: Update Upstream-Status for gcc-14 compatibility patch
Date: Wed, 10 Jul 2024 23:28:22 +0200
Message-Id: <20240710212823.2289094-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 21:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111307

From: Yoann Congal <yoann.congal@smile.fr>

Patch was merged here:
https://keep.imfreedom.org/pidgin/pidgin/rev/210f318db492

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...le_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch b/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
index b8e3d479fe..4e088ffc11 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/fix_incompatible_pointer_types_for_gtkitemfactorycallbacks_on_gcc-14.patch
@@ -32,7 +32,7 @@ Built with gcc-14, started and clicked on some affected menus
 
 [0]: https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types
 
-Upstream-Status: Submitted [https://reviews.imfreedom.org/r/3282/]
+Upstream-Status: Backport [https://keep.imfreedom.org/pidgin/pidgin/rev/210f318db492]
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
 
 diff --git a/pidgin/gtkblist.c b/pidgin/gtkblist.c

