Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653ADE92FD0
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 18:18:54 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48612.1767032332223467068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 10:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bz75F45F;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bc0d7255434so5440766a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 10:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767032331; x=1767637131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk4OQXSFYin1V16QJVd77I2lsgNYVaf/eecwlDkkYHk=;
        b=bz75F45FZq9SvEvzvTDbCclBBzlcBzWGHatrFYF7fBuwkfwksQdGzs3xePyRQ4uPH6
         t3GX+g8RfV9cy5oZg9VfCbSeZLIIIulLLuVmHEun69XYl+aNNJLYNBNllEZ9B9A4/Kd3
         4be/6ZrOHQaTfQnXfmjElNaDLHzY339XF+3OaVzE0xPBrTa71s0xyNvgXFs5m2vcF4tx
         aX+K9MzDU98vzbbg9Hw1ctAG3jO0kU0iMgfB9oTIFsnOJOb8198LrQEGeDdQgfFks1PQ
         s06TdI3G6ZGnH31haggTXc9M9+L9LiIyjxW/UevTQ2ZH06uZMISfb3+dlMAasFHVipSK
         yaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767032331; x=1767637131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk4OQXSFYin1V16QJVd77I2lsgNYVaf/eecwlDkkYHk=;
        b=iI5XZPfFs0gPfopTv3+3vDyMkvN/eJX40hDo1Z6S7X4Hy8nDmEeYT2fLzKxgfsQdsQ
         VGziFQ1E4+KarN+Ij5iKwvmdEL5iCZmxHPW0OFTWnFjStsNP4pU8uTkyzPz+KBDE3RYF
         asZ9qS7fWISojWr3Dw2PkM7UI4m6UaLF3SuXY3H2M3pP1HE+CC6C0AzO8b7lVe/CwpFe
         R6+DDwusMBAruFi5K8tV10MFObDowJdK0bLrRjqILBMQN298uM+9wWmdyU+O9VSif894
         skreTsYAUcRoFmYn9sCn7Ca121yAo8qjYUfPgMbJ+nTMzlnQj2iJJM3di6SrKqoJmVPR
         cZyA==
X-Gm-Message-State: AOJu0YwvThFs07z3Yl3r1Pewpv6QLuy6tYce/aXxMlgyY/stRfjhgkMJ
	rAC+PTD5Z4bvFfYGGobYy6FovHh1T/1zaQBAGR5ZozfKjGDGKMZsMNUmr9kcUqnn
X-Gm-Gg: AY/fxX571zJeUOO7aKp7NzmBCB3F/k29p4pt6OLd6ZHKeintwqOBlWKRU7W7ipJh+FK
	iPoP0YicV5e8Tr1l/Y25UCxVuyVSLOiEDUB89XWk5mTjVgAqq8tqbg+m7vr4ELEG/wb5gmlgSxz
	+A0L78w3wEAxbMsZrZXN5Gvot118H1xc1PuLzS5ehSIZ7tLQqHx5Lo6Pvb86OcjOC3n4cpAT+tj
	yGQAozpj/69EneuhZwuZA7xSm5c2IDj6QkvE8T48vuqW8epxLHYG5sLddfHuqEN6J3tgzpuzcZ+
	SJ7nP6+SkwxsDc2hLjYsWBVFw7VNtIOB6tZa7a6BbSsKiJQVQK7fH/hvYYst5r+k21pOJJSAWJK
	SA0ddhVmK65AQJ/4TCvWcAGdf/0T5iMId0kwxo5HngLU9JFzq2FWyQMeU0CTXne88PcJAaMarm5
	tw7LBoDh7ljsX3+iAJn6Al6uPzHFc8DdH7Gyj7BmyFINqLaeFUxcK0Ev+VyyxFija+XCcLL9t++
	h6gUgWxO8CvRpqkI6vOHg/UKn3THiA=
X-Google-Smtp-Source: AGHT+IFe9AmpMLPFTNvAI29D7iajau+efze9tgl1VJAhdZriEahpTsQMi/Hvsd0nDtVBO5ct3CztMw==
X-Received: by 2002:a05:7300:86:b0:2b0:58b8:753d with SMTP id 5a478bee46e88-2b05ec0512amr14811560eec.12.1767032331059;
        Mon, 29 Dec 2025 10:18:51 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm82981428eec.2.2025.12.29.10.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:18:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] initramfs-kexecboot-image: Allow supported architectures
Date: Mon, 29 Dec 2025 10:18:47 -0800
Message-ID: <20251229181848.1160714-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 18:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122996

Not all arches e.g. rv32 support kexec atm, reflect that here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/images/initramfs-kexecboot-image.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
index 7e6e03d8e7..681abd509c 100644
--- a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
@@ -27,4 +27,8 @@ IMAGE_ROOTFS_EXTRA_SPACE = "0"

 # disable runtime dependency on run-postinsts -> update-rc.d
 ROOTFS_BOOTSTRAP_INSTALL = ""
-
+# Match what kexec supports in core
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*|riscv64.*)-(linux|freebsd.*)'
+# makedumpfile would not compile on mips/rv32
+COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"

