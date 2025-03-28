Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE3DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 04:47:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4553.1743137265138616157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 21:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxbXpok2;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223a7065ff8so52924645ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743137264; x=1743742064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qko/aZKTllkXhbD0885rs0iLCV6b+scqlgB/vv/KJ8w=;
        b=bxbXpok2sxH6sUS3tbmE5IwixgBhDzDaMNTom8iR/VZogol6bAS8cmLac41M3xyxA5
         bjLHO/RWlioml2O9xNxtusDYuAr3zHKU+Z3zA17YbPZHQojk6kDZFzgxxHuwYp6D7yjw
         USQ0asYl3IAbfNrN2RNFlVN3lPozWMe0sOVrgNFuBWPDTkmlk3AZ0poigpKFnQ4aGJC4
         aJ8yyrf7w1QHnJh+gu23wEp6OMJPoC2SOd6NnLaynDjx6u0Yhqz+gcK94dlKYpR6uWQw
         HCVQX240Pve+yD41knWabT2GLEzFlUKkvGTwU36X5r1mITZs/Ise67tN41vXvz1UTqd6
         wBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743137264; x=1743742064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qko/aZKTllkXhbD0885rs0iLCV6b+scqlgB/vv/KJ8w=;
        b=ucGsmh4OMxORw5KIU9G5QlPsG/QzYrodHT0I+bZFTCJIuMQudkb8unM5a2jiMtrOdq
         mo+NpdCkWrJkFzAaJ7gkR69Pa/TEJTSQSjJkvZQ2YI1eHop0nKGpDdnUbtNyBGvfb3Gw
         fvTFBl6Hk/KtMZDfwEBjRByIxwjTfFEzG1SWDVj4ZJAsZLdSMd/GFIHRjts+eMaEbjC+
         29xeJ7ZIg4/9GWTJ7MxSSAZ6Bo6O3aO6n3vA975yHWBb11hyRpD9nLiTUEswRYKYsNg6
         z/VIf0RM6IORi5mVMsXGlGjWZLxxNkNe1Ozr0whQ6DEUmCam0qS0rf6275G7nTU65FIs
         FNBA==
X-Gm-Message-State: AOJu0YzI4TFHsqUvCMg1lirGWKp/CloE9Y9VVHuNg4aVHN6+b7AfMqgQ
	7bAU+9EBOSAq2/LVBsPSwIbBpCCQaPL/GAlU3KI86sjkKHuxlKlhukBH/iM5
X-Gm-Gg: ASbGncu6vreRMJcywl7+xD7z0AayKatZG9BqmNggnVCkeP1XXRiuvXDjq7jeHjRkKpo
	Xp6zsdw2DnUemc4rmrWbqfSs+7T+BDsuhIppnuijO23wVU2Q2I92uMW/tyEYA2AznsF/Nz0ENpZ
	kVcs1izEyZWkVhK53YPzPYiv5S9gMVj5Z96U7tDHmWoAlrDHejAq1D0ZI//XN5EaXKVwRFPMmvL
	e2pO4A5h/g0ZwUVslI2d5riL5dKpdBo6NdR28rLVemx9nRbnThrDojMAgfzUyQ3DGPAs3xEWEMN
	Lgi0cUrC5b7/G3LsBviWKZfIUcVaw3Y7sur/
X-Google-Smtp-Source: AGHT+IE/BSTpEHmOaTT5v8gstCcLKzks9n8ZF7/zbpMsSCeg/L5p8bf9bZ+WheumUs5TRNestnkFvQ==
X-Received: by 2002:a05:6a00:852:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73960e2cfe9mr9387432b3a.6.1743137264057;
        Thu, 27 Mar 2025 21:47:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971064088sm777413b3a.93.2025.03.27.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 21:47:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gimp: Add libexecinfo to linker flags
Date: Thu, 27 Mar 2025 21:47:41 -0700
Message-ID: <20250328044741.2513702-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 04:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116342

LLD reports backtrace() as undefined during linking on musl systems
musl systems use libexecinfo to provide this API, the dependency
is not enough, it needs to reflect in linker flags too, since the
assumption is that backtrace() API in in libc ( glibc has it this way)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
index 2018ea04c4..f56c12c89b 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -44,6 +44,8 @@ DEPENDS = " \
 
 DEPENDS:append:libc-musl = " libexecinfo"
 
+LDFLAGS:append:libc-musl = " -lexecinfo"
+
 inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspection vala
 
 GIR_MESON_OPTION = 'can-crosscompile-gir'

