Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C065EA853D
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 17:57:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44440.1772992665597215666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 10:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+4x6n3g;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b790af67so4369581f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772992664; x=1773597464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y85/o8lCidNJHLlaXNTU0nmBNwfXJudFD1ENMAWKFfs=;
        b=G+4x6n3gzGGyQqdtd2qk7ZdaoyS/wRLgM62Xmu0xMapFOV30uNOYGY98hkzOVCGfKH
         EdUo5bFCjByDtE/mIPSX8D3ToAErNzaWSe6bXq7h9Li9awqwnsXY1v0AdJHcKZ8FCLdQ
         lGLw3bDsULUOjPE666/p+VSy9JAZkrGlV1ib1nA85ncQkOKZDylpFgkfBWf4+dbu8pW1
         AXaNc+fjSod55vbwSXfdsFvxDMymP+mMMcJJwJk5aLZcEht0P9YWT6SYmP7/JVPn5vxS
         x/ECgQCdpQOgtzvbU1MhsGTJ04nHQLUg22Hm56BKGZXUJLhpgSj6FiCXRuPh23g0qtT6
         vhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772992664; x=1773597464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y85/o8lCidNJHLlaXNTU0nmBNwfXJudFD1ENMAWKFfs=;
        b=oRTntTSn/p/R1Xr1aQhMYaecGPbIGxGLcyw+4zSybw0ZscUyrQ3NIxEXSwcLEYuV10
         J+NUBv4uGA6idE25I1vLoYbIktp/MSYxF/GUGV1fnToFdGfDFWXWIEGc1NdoWpQ0Woq8
         mdf4qA4AjUF2D00jBgemi6fz7R5QKsjaxzbbBUfRE2jt13IGCjTj3hUXmKmn8x3h++KS
         QoP74y6WNPCla6XJXijkHH3YgSYU+Rj/I3Yyk7euVdISXmaETSHhOLc3kMpt0YstaLo3
         PMyK0rtXXf0On4ja5rrrpt6W7UYCeAGsnot+yQRg9dxhx6D3K/gy1IdK3DsUf7fSbM/b
         HfQA==
X-Gm-Message-State: AOJu0YxfsBhIzz80MnoRJ87XiY65GO3BA/1HrvbN/ODauqIS7FdyMBOc
	ixTL4RfsofBy6Uio89+uFjo8qzVgNi735GErpquSzzLdENa0zpDYWM6zsNP1Vw==
X-Gm-Gg: ATEYQzyC3t6xLtgpacR/GktfYJQrYPje/i6HX9vQYqo/jnTc9+2NoV2jnmcFm816Pmd
	rxrVxYD2hQWBQcn5crJ0tIJ4bSGu4ZXbJqQWk+o9FltANZjO6fJR3s6cyxsoUPst8D1lvQRDM9l
	j1yFUZt+pJRbU5Cm8RFnLlal+Esx4ySGb+bruQtpUdvmtatjUZ0B0c55hJDen3rD16ZhTJ4+IRN
	D4fGDysGy9oKxI3RQqDRNXgVGmR44rg+f2ZYctgaJVrXTLIha1vO8DbpQ2eKLlrtSfGx600wiIb
	MEETlOWoM/6HPL2GttqJ3fkQyfuDJeJSH57/H7VTul8xnz/y0LqJBZYuOw9idPe18iz38iXVp3t
	fqx4o0Ov6zDOWxY2822vw4RDYladMxRJ9YJKcIo0RtZRsih1FLZ8PYpSLPWjUnX84LvBhEULJU2
	XojeC9Ql0GFVGf6+3DzC56
X-Received: by 2002:a05:6000:40db:b0:439:c39e:d9ed with SMTP id ffacd0b85a97d-439da3637b1mr14510251f8f.17.1772992663663;
        Sun, 08 Mar 2026 10:57:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm19952676f8f.0.2026.03.08.10.57.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:57:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] exiftool: ignore CVE-2026-3102
Date: Sun,  8 Mar 2026 18:57:42 +0100
Message-ID: <20260308175742.3614559-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 17:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124944

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3102

The vulnerability impacts only MacOS - ignore it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/perl/exiftool_13.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.42.bb b/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
index 5d97cf5838..08549ad2aa 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.42.bb
@@ -26,3 +26,5 @@ do_install:append() {
     # Fix shebang and QA Issue [file-rdeps] to use target /usr/bin/env
     sed -i -e '1s|^#!.*env perl|#!/usr/bin/env perl|' ${D}${bindir}/exiftool
 }
+
+CVE_STATUS[CVE-2026-3102] = "not-applicable-platform: affects only MacOS"

