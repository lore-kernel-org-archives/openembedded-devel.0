Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5F7C282D0
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 21:23:43 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17827.1740864222084952155
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 13:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbiFwJYx;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22185cddbffso73690065ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 13:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740864221; x=1741469021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0trFa154o5QWvFf11y/30ASd/HyJKj4ZIukHW6685wo=;
        b=LbiFwJYxeWiKCrbQBkdIOgpgPlZNutGmmrv/hSlTNYRZGCzNACxa96IChc4zaM/4Nt
         zSzPr6ZZVvRdqdFvD4e7xBDtzZfw3SaGoG+o+ORFydfsXlS3EKqEMMwOpzCiXHeEDYb4
         bV0h4O7SSc5UQwoham/ML/TIaGWp/Es77KF7B+tKvAhcOYdBHA+IbZ2GgZGMSECzGCPn
         2wfYfSpthH3R1g7/zTfcAk3E88mk9/R2pGQnmwQp5Kwv1aPiK65QGk6i6fPiSiHs2Z5b
         8rrdltbH5xTS9Sx3Ww+XLIXeuxSSFYb97UbEr/vesJn5FfXhsPEZC0FKl1ZVvxGdgvov
         yiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740864221; x=1741469021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0trFa154o5QWvFf11y/30ASd/HyJKj4ZIukHW6685wo=;
        b=bIUKVqnidTZ3BRWZHBDrM3XhtLrNx71eiaugzQvGPDnFXguzRHCYaDnURXxvn6rkNQ
         f4DPBQvKlq43Z3zmpl0s3KJs3izh2AcRzwemvX6cXuTi6uSlYBnGfkIRrNUl0cqDTqBo
         rgy/fTZZWHGRZpyHiV1qdEOWtFZpRwUum61ixdW8Team9DpgTI2RQT5DhyreIzKWhSGG
         ITMlX88JKs4X0O5uZPsCK4lbwudVVZ1Rh698NmICkZ3C8rZme3BwG96lgSgw3mke4s4k
         PBs5rkfPrIeJ42PoLbKp9hrVIOlb8SrsV4W1tlvMqLR/OZ9wstS83clSqKt+8WAlnD4P
         D9jQ==
X-Gm-Message-State: AOJu0YyzaD/yOpiD3nWY9nhOfJ8NMnfGO6RgE036eC+2eGl/GOkimxpm
	WJXu8cwV7fyP4n0B0LcI9lADWPLjart2YijS7qBIm9tnMQCs5mkUFITpOjV2
X-Gm-Gg: ASbGncuMdJC3Pr3QYbOGtgF/QKt6VmAdrbxM8hERQSkJ6B24umK+pgCdE11PG1OrtWu
	Q/T07P3wxfSSXsqY2B/aaalt25vtRY/TWb0RPc1GHmqV5R5SGAxv6fnfuJdUmHWeCEK/9RhH1Tl
	S4/RU4u9XiK9+mgs+HCqStD8RcnJ272y1YOGxwLtnfayb4yCunoxUEhOwLkQb46pwAB/qZw/Cfx
	xpwuyklnwJjqDYMdATIcujZ2TUzfdKaW5o4giP/OnpxNBWLaafulHLYZfLPqPJCENt5Envejr2B
	Fg/TIu4wRmRIaAUa2vkJrLsebGqe4lX4i/iO
X-Google-Smtp-Source: AGHT+IEvKVIorVgLnoTVObZx4wTLgJiVpuYA881Hx5UKvqIoD6AvvaO7Cp7qIx9IOwXw5VjMsCXkrQ==
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr23720008b3a.8.1740864221250;
        Sat, 01 Mar 2025 13:23:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c3fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003dd3csm6082588b3a.135.2025.03.01.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 13:23:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] cogl-1.0: Add m4 dir to autoconf macro search paths
Date: Sat,  1 Mar 2025 13:23:38 -0800
Message-ID: <20250301212338.1560068-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250301212338.1560068-1-raj.khem@gmail.com>
References: <20250301212338.1560068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 21:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115719

autotools bblass do not search for the .m4 files in srctree anymore [1]

[1] https://git.yoctoproject.org/poky/commit/?id=a4b1fa2b22794d59fee716afe6e269dae7f87ace

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc b/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc
index 3da361b3ff..b1ef57ce57 100644
--- a/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc
@@ -29,6 +29,8 @@ EDEPENDS_WAYLAND = "virtual/egl virtual/libgles2 wayland"
 ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
+# Needed for introspection.m4
+EXTRA_AUTORECONF += "-I m4"
 # GLESv1 is rarely tested, so disable it
 EXTRA_OECONF += "--enable-examples-install	\
 	       	 --enable-debug		 	\

