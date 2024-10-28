Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6D7D5B853
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.112.1730140096078216096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1yxRQUA;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4709115276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140095; x=1730744895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P16ZSDjVkmErfgdjkfkhGwchwJUp97zA08Eyy4nEI/U=;
        b=a1yxRQUAkRE92YkVKM2TEPq27fSTjEKuOpgtJmcWntraYllFOI7fLQwVhtZzb2vwEN
         3DiGzSicmbfF9gc7mEUemctk9bkw7NC2tqs5ogkaVs8hMzU3i8AKoM3iXv3m/vkkuJPV
         2AwPEPVOBBau/gNjvNXhFgCGuW25tjYjsVei/+luZOjEJPZT0fUv3S9o0rBivJImfxxl
         Hg3UlVBXYD/60S9Z0Cm7MKpJWgBHScl8MdMJwlqJ7ug1Yf2nYvS17KXYNtxDeOPw9oOo
         3h/mcJD2LRI+XuQzKQpUxW3931QDcNFq9ZFM1JltynpNHGRwXk3nNdHQlVqByPIJ32ph
         106Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140095; x=1730744895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P16ZSDjVkmErfgdjkfkhGwchwJUp97zA08Eyy4nEI/U=;
        b=URGDrwrPWhbJyOCdQD1rMYrvBD7E07MekMfgXs6XV2ZrBtxDLL3F2EzUdbm02+3AgT
         ijOFihwsSBHbMb1CMLtEw7tgD7LOnE4HNwokhXmfC5X1ZbrZqtJQc1rFZxPl4CtmMNG8
         dcSRsaK70jQvebGhk4pG0RBI3/0GuDYb1UZW6yBsM+4NiaMh8sL4P9Bfhg16t5psuaCx
         LuK0n31q8kwm8EXUNSP5gjmI31Qx7RiQ6bxZGPZMcEiBYp+AEcTvbQS+nqwjkolb3XHb
         j0Cx4sOk8HmtKsL8ApfK9dLSheJTMdl22SbzJDFjTk9qsLCHig2+z8seugTUSINKdAM9
         ig5g==
X-Gm-Message-State: AOJu0YwnmOv5mHDJVAXCQw/es95xUqYitSw9LGbDrgdHQ6+O3Eymwe6+
	g6PEcqH2rDd1Ufj2LQJ7InuTZg+5khgowaGJnrtFRXBaGfmwA5hXD8l8zA==
X-Google-Smtp-Source: AGHT+IGUZgTLhKFv6ATRSqaDk3w3ctc8++MHtGutNtoW7WpPUfBro1+7gYB0Hr3I286EsywlFs4gjw==
X-Received: by 2002:a05:690c:3388:b0:683:37a8:cd77 with SMTP id 00721157ae682-6e9d8ab98c6mr92107267b3.29.1730140094591;
        Mon, 28 Oct 2024 11:28:14 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:14 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 06/22] libdigest-sha1-perl: Use
Date: Mon, 28 Oct 2024 14:20:22 -0400
Message-ID: <20241028182749.5058-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113274

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 22c6d3d33..dbfe8d3d2 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
-- 
2.43.0


