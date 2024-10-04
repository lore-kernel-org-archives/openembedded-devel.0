Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F58CFA76E
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.14008.1728009628591458269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bepjpeo0;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e235a61bcbso18193447b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009627; x=1728614427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grReZjjSr3el6Pvhn8oRl4VG+X+/CKGuro0dzMoSo6s=;
        b=bepjpeo0e/cpyhRdUvGzOq2hw7ARIzkLg7ub6lOVmVZN+bvBdAVmf46H6gw2lc2rOZ
         S4zb7HMiWA4uQHl6mksbRM4Tf8XBOun+MJvPZRJKwrOixE32ZglNnnE92d8UpImnPJjE
         HFF2X6xNMIoxiVryAo/vnvuoOksU4G1SXpjQ/rD7mQrASy8f1bq5QNK5oH4Vek9Zu0cv
         ywKISeUjPOinV7T+nT0zz3VjrJMsKEVuhCXq5F0zK+3d1WXCeGAlSwZK3m96Ajx8tQW3
         X9XS/NnkH7mZ14U6NO/0Cb+caSQ1JJuhmVEGhbTtTvipaxYQ19zL+8604RBn9y/aCTzw
         qMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009627; x=1728614427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grReZjjSr3el6Pvhn8oRl4VG+X+/CKGuro0dzMoSo6s=;
        b=RLUZYlWPLNu2vkUcDLZ3FycC1iZgjJHNxYgcevq6kXYUuUvofDtA1l2i5hT0rTUnMA
         KCpR6uFTmIThl62wJxD2RjSqqXCOx3c2RqKmD4uBhsPPVu8g51tDQkufLebpfL8VB883
         20KE5tcTUkBS4iT/CBV40RZRoPmZwlSHSo1tu5gkxqzjXzcI77j2YEmo6iidgfDpZ1q5
         G9ezLX33zkIa+UZFOp1OlcdPweEkh/m3SLu9ZvVZccoCDPrBLcYaelnjYfa/TCJUUkX6
         NSTWXi6nGjhREy0RPP+ptuZz4JKcffsbDZfvPYzjaPLJURufyDccWpS2Uz/E8ueUhrz6
         cekQ==
X-Gm-Message-State: AOJu0Yw6x5Ri+zj/b5jShcLZG1SMYILQtuhJPCB3shBMLci9n0lFHkGj
	b+PsqSrJGpoczo5yzDYyd+q3I89t6rhTo5jEt2uMFfGP6bgFHCnAU6Bfjg==
X-Google-Smtp-Source: AGHT+IHN6sGhj6kNu9ejLVtEtG4e9KJBJDpOrFtzaMGypAgWl5aH5rs/k/Gt/ms4s0go333HIglCJw==
X-Received: by 2002:a05:690c:4a0e:b0:6dd:b8ff:c29c with SMTP id 00721157ae682-6e2b53e7162mr39493237b3.17.1728009627086;
        Thu, 03 Oct 2024 19:40:27 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:40:26 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/5] xfce4-vala: Drop unnecessary SRC_URI[md5sum]
Date: Thu,  3 Oct 2024 22:33:08 -0400
Message-ID: <20241004023842.14172-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004023842.14172-2-schonm@gmail.com>
References: <20241004023842.14172-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112663

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 0a65bd94a..6ee5391d2 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
     http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
     file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch \
 "
-SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
 FILES:${PN} += "${datadir}/vala-*/vapi"
-- 
2.43.0


