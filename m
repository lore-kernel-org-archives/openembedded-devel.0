Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8A4C28B30
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:35:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.13298.1742528112895382373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 20:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B6D2iXuF;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso3020882a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742528112; x=1743132912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XZjDDkyrBYTmTaCH3Isr/jBt/US2sG9L3IocRISP6I=;
        b=B6D2iXuFf11YxRP9qxX7HzuNkhCgH0SOofye5UmCQpuMiOtr5IdR7dxptXgGbL6nYw
         8abkSRDRzftctzoeTRT+J9lJTk0HX+PSu5jCdXD3opekOmUFy4xJ5JHtGB38vK+wm8Vk
         y/HuZhTKut2MqxTs/k++ykSG8220ADN2ZlYpAJHRSxzIBZ3FoOD9fUB2cGYeB+N+OCwA
         DShofG+fQtS7g5HUGuESI5CPA4wlpHwXctOak2z0XCgvuEfPMBLnhgRkk7D4C1XVNvOl
         yUYuaMvzWbxAj7UnEv10KNJD5Ufg9ciLqycrIEeXRxJg78eQtkX/dildjmwgfsEBj51V
         Mb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742528112; x=1743132912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XZjDDkyrBYTmTaCH3Isr/jBt/US2sG9L3IocRISP6I=;
        b=wk6WxPV4Vg+TMWwHBUGzn1mdJT5zyY2x263FgVDpzu9i0nw9gJqpgPf3bxIFyK/WOz
         gyOf2R3bKClxT1O3MxzXmFEGFvXDfJ3yVRA/JP3IAe96jW3BBW58HWGxaitEILI8fWHE
         Q1tjLCXiW3WXbZW4qU51xkKBp6WONtShdxkTt6xXW5dO8VXxtqUgFhX+FBvzVN10mJtJ
         I4QMLOO0sZk/dcOYM3LPdp2agHhs/aS3JuI0NLCVqg4KfqPlC39a7abitCxylLg3XX86
         40eu4kVEpr8m4AXR+fYxJLg/e+G4TeDc1fynx8QAgTzdL7NZd+6tWu3sbc86AeHkCm+i
         qdXg==
X-Gm-Message-State: AOJu0YwmO8rMP9tt/Rvd6SHE7s76+XQzU6+Sl+fppnBSYBf1e2GTV7pH
	ubp+CX8HlKGOgcEd+kgNHzu13lKnlGbeq0eV0DO51tfOeU//sgTVpkhmGbpn
X-Gm-Gg: ASbGnct/uV22DN7l7NzO6IrY47ANj7rmERNYEss2Zk6rfAtn4J15tHQO+iXexlhJ4DV
	DNCYxJdQOBC7C/9KCkP+ZaYLdiWnEMH1eW3kC7FFQ9qGVCn7VV/mWIezD2N0q81QUcgerprcbW9
	uekymtbEFkpHeZfd+m3uftlc5B+5YL6PHss2Pp6mC0K/dFM9xqOIpGyJ8CEzY+7guYUDSAUG9eT
	4DtjCKIJSXnmV1EfDjf9IUrap0kwifnT963vfkAXi1XuGqpu8LYISu/I/WBK5m9DJiIG526sVKH
	6Nt865GURfTSDhKCtQJHD9W/zsF8l88PgsPu3Pt7XCl40Ao=
X-Google-Smtp-Source: AGHT+IH1AsvV/iNo70LyLTmz5pezaxZp8A439QoZxDKaMcFxZrIYLSMaW8Xd2PZmkwo2VcA8n+S9WQ==
X-Received: by 2002:a17:90b:2647:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-3030fe95343mr3350187a91.12.1742528111909;
        Thu, 20 Mar 2025 20:35:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301b9e19ceesm4960020a91.0.2025.03.20.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 20:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] grubby: Do not inherit autotools class
Date: Thu, 20 Mar 2025 20:35:08 -0700
Message-ID: <20250321033508.2408459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116156

The package uses simple Makefile for building

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index ff673e21bb..ff18b0b190 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -24,12 +24,21 @@ SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=main \
 
 RDEPENDS:${PN} += "dracut"
 
-inherit autotools-brokensep ptest
+inherit ptest
 
 EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' 'LIBS=${LIBS}'"
 
 LIBS:libc-musl = "-lexecinfo -largp"
 LIBS ?= ""
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
+
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}
     cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}

