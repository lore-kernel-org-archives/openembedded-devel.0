Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A085ECCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 14:14:19 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.34851.1759760050971563921
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 07:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KmwX2c4D;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so7667473a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759760049; x=1760364849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYC7ZwiBiqZ1soI5r8a0RK6h0/EIh7GTrpt1B2qD65M=;
        b=KmwX2c4D3my4jdG6s9/LVclzKMRduDTOhek+kjPNqH6te7dIJZ+Z1Tjp3NAxLra7W+
         XMxnh17WBkDsHX2yz1Xb1EurOXYK+TSB9uiAku7uitCsnMcY+r1qz5sIPxcjSoFypJMw
         F3cMZnJBgeEysbKaieigV5ow7GVl7mGKi6/Mixaf8p8BZS/J414XmjD+Dj9LFy7HfS6S
         jgeFI2ph/vtgo+Sizl7AYJSK0KmoEQp9o3C0PZvxNjKEpep19Z3ROj/n6NcQsQrThM76
         ZCNm7m61A2tEB8aoppFNYvJpXHa5rIjcwXLw4+becoDCICGFlfyBPQGntKFLtWtkw/Iu
         UdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760049; x=1760364849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYC7ZwiBiqZ1soI5r8a0RK6h0/EIh7GTrpt1B2qD65M=;
        b=aFItt6dOvcyK4vV9hatwElUEFd1X/+8u0YsTHx3V7tNAp1sipN0T6PPgub8EhSMtjN
         3ic3IN/7QG5RL8NZzGQY+KvR8p3zyGL9kt39WL7f8Fcc2QK9/j4vtgCgCn2mFAJKsqtO
         7cj99yIgM/qEkm4pXWTyXeRj2r54780pSzfFOjojvZH3Bkoi7mQltBX+nN44PxOtGoiR
         ANQlSdd2940oR3kEISM9z+BiKI5LT/AVmc8Hwcb2PUx4oXdbqzBQPr3z/6MKDTYHJ2fA
         Kk0+uYYJUk+ix7HsXZCTqzPhjhCYzdBt+UDJKZ0hxt+BK4K7mGHB6S/CNdvA+8bzKfSg
         gRqg==
X-Gm-Message-State: AOJu0YzdQwoLfMgIFkTjXmv4kpXaDlUbj8S3b7jws4eR1j9cc/vf/l4e
	sHS4qWpTqWWg6CNriYGSVOhGNe/bNiwi1dYmE59tKsz1CEPgMgr8J2hjjZUMeQ==
X-Gm-Gg: ASbGncsfTj86usFaGp1uWEAr/GIcCdEaG53dUnEBLrCyyOmcB3HMYv+gQNd5nd2uOl6
	rHV4RRRtaRk6xo6SSqCuaXS19fcCghEETTAAkPggLrwKW2PvsyEy/vsxN7KHOHpjMdGsEM4Lj3d
	ACwhkXY3VcyAAkbBV9qibeZ1eH3kUjWW+ddtZODwVP596Pms9FgbFxXaIJmjAZjvGPdAvVGT+Nn
	aFOYLkjQtyIhNXUJyMuASb+blroqj8iX99vFGZOeNgXqSQm0R77SFCfsAUKtK4bTa0jqhngaYfg
	/JxdmO44GjFb0eWAZOz10bQEHm3kHchzO2UlHCxL/MLnZAbRL/PxhzCWwU/KqY61gZTj2cOPh+S
	3tCdrbjx/sca0U/LJ8ubxejmAVruH+Z7SJlDnYizAq8vwb7N82WDYr9U=
X-Google-Smtp-Source: AGHT+IGUCFFwGBFYqit8piM7O04o4dibydceryPEUQfcjHuwMRPts9mEETra4CvoLF7EDTg7kd62nA==
X-Received: by 2002:a17:907:26c8:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b49c344524cmr1564218166b.63.1759760048984;
        Mon, 06 Oct 2025 07:14:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83e3dsm1139432066b.29.2025.10.06.07.14.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 07:14:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: ignore CVE-2025-8672
Date: Mon,  6 Oct 2025 16:14:07 +0200
Message-ID: <20251006141407.2477930-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 14:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120291

The vulnerability only affects MacOS: https://nvd.nist.gov/vuln/detail/CVE-2025-8672

While touching it, also remove an outdated CVE_STATUS, which has been reported against
a very old version of the application.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
index 414f9c5203..b04fab67ef 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
@@ -133,4 +133,4 @@ FILES:${PN} += "${datadir}/metainfo"
 
 RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
-CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
+CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"

