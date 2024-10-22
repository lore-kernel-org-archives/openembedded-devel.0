Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB76CDD0F4
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.21802.1729612105544458901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmyGeHbY;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e314136467so51353787b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612104; x=1730216904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44E30lADb0rHx3J7nHDGotGg4bFT5R6WJ5IQ01Z5CPI=;
        b=lmyGeHbYhGfe2c8K/9O9pZYdGUJTIXnUGK0RLAIlowrPG9Ah7DUcdss59a0AX++8yb
         uZeSKz9T4l2egK0DMlrGikTATI/x7tUkgRLOseFL+cdSJ8LloBrYbwurXwl6x1B0leYJ
         8XJcvU4rKczwEhzGjMIrNmJwsExZujFj0WWhsFQLJLkuClVuhUGs4qWI5P7ymBgUbPLY
         DGpR4r9Zuac863xuBrPDKJFWOcpbkL1GUg1IxRzFw3xAirXbhhCBHSNEORIVii0KU5nQ
         JdkBVyAbezIwRfJvuHAMVSaJLGCqi851C6SwwpHE+61nmjS977wpZm274GlLnMuuUSJt
         Pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612104; x=1730216904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44E30lADb0rHx3J7nHDGotGg4bFT5R6WJ5IQ01Z5CPI=;
        b=RSg3Ea3uGiDpTP0mXToxm673DVm4Ps2Z1Y8XJqsh1UXx7H3DRApJ6fKKnXyxSOHWe3
         aPmbOhS/DvBK0MC+nwMOAe/wELTwCcZ34HgVawFGgMobYTish3pKEhJTUE3prHGLYmv9
         XatD+fQH6QhEAAL0fn95fzqfIJq22uUseCn5yhAPXKcb6Zy54aVAS3dCQ/5i1PVtZNpO
         Y83pyy0H5kxqXJK972ht3hctRPd1NZULYdIRW2jY7vPuMb52QIjvBo6CJh02P7j4G9Ve
         dmeLNks7yDNMnvY/wqswIbrh4ODLVvnw9LxuD25UggQItbzWv4x1UD3FbDvzmahmw6i+
         Nuaw==
X-Gm-Message-State: AOJu0Yy/558G9V7FF1qAPtf8mY6Fub4WNST7+1ipAiFtrnORCcz439gR
	mCdqN6Ubvq6I5xiPi5bR6BB+keD9bN3P/13/6HpTPgyC9IZM6qxVyKVifw==
X-Google-Smtp-Source: AGHT+IH2UZochBOIldHachtImwV2ShYs21+qIpGiskqHXRa612nMcrnVnUzJUpww0mnX1M3GCrqwDQ==
X-Received: by 2002:a05:690c:11:b0:6e2:5a6f:d90b with SMTP id 00721157ae682-6e7d4565fa2mr30803587b3.2.1729612103175;
        Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 44/46] libunicode-linebreak-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:45:02 -0400
Message-ID: <20241022154729.20331-45-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113136

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libunicode/libunicode-linebreak-perl_2019.001.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
index a7a998c35..ae922d9dd 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=5;endline=9;md5=b5e8b1099b86b86fbc31
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "003d6da7a13700e069afed9238c864b9"
 SRC_URI[sha256sum] = "486762e4cacddcc77b13989f979a029f84630b8175e7fef17989e157d4b6318a"
 
 S = "${WORKDIR}/Unicode-LineBreak-${PV}"
-- 
2.43.0


