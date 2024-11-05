Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2B6D3612F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.27767.1730831938632662500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/UfdRW5;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea053b5929so47997637b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831937; x=1731436737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gBQxb8OX2RyJ5y6KPa78vjds9ASfSAr3kbFHp2uOkA=;
        b=Y/UfdRW542awcBJa+Qg+mcItNleY9SeIEJK7fABfjeBdNnkg35h2L2Y0SY+JwigES/
         SWCxPaEiDNI/jEXrWuTx4gO8vLIP2sAYL2fZM3O/zkf3AfX1rE/nmumIbNQrAJ253cja
         EnpAHDgz01gjEtHG2IPXmMtpFS5JFrFqLRzCjNHAzP2bYSc2s6IMRNdviIXj8bMFS6UJ
         Mimo1sCPRezx2MISEDfbe6Figp7Zz1mDe/r9oxR8znKAFPrI+Nyhqt1wYyMPdkX4/QL7
         MdxXXDGggQ6deyI8IrvcfNY4xnRd4rJgMYGSYCfNdPy+lzEpbmD8DpGM9v7hSP2NH6o1
         tybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831937; x=1731436737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gBQxb8OX2RyJ5y6KPa78vjds9ASfSAr3kbFHp2uOkA=;
        b=BCIS0MJxkooEVMciwqJpa7/igJXlkCWi2Cm/XbZDX6gcdabEaVqxqUUb03dwLlLRpA
         Yco1lDwIyX78voGURGICXqTYwqcRbG98TrYXIx8AJLI9oh53hVUESN3FGb8uSnxErbiJ
         9h/PbUEuBtZ5bnD+eFBx42XYerLk7I5665HBc2nOdFQhWze+qfETsUszufRqQIF2Rwg0
         LizGTNoLEajX6W/2/B+WbLcmXqIoxtc9y2GvWslCaLNe0joIrzQg7/ESh2oxi8e8XkcN
         bjxZ0gppA0sVGbnM2p3csxsCHqI5/aVZQWfd4xh1zXDKg24kv3xN0fehJLSA33YbwKQM
         YaQw==
X-Gm-Message-State: AOJu0YyygZqBIUbKGpRQeLK0cnev/mGDLuMYmmgIKgbi/vVrbhAG3NFH
	odojKmWepoHGWrnA2vWXQK9XZSwWTmY11lmQeQTwvpMsDIXABznb9jrU6jS2
X-Google-Smtp-Source: AGHT+IFKkPukrNEDlp9663EQhj9h8KX+D3Ru3JEIVjWF8sM71ssuCXIvDuMvxJzt+PO3Ul3+Bd91RA==
X-Received: by 2002:a05:690c:c84:b0:6be:523:af4d with SMTP id 00721157ae682-6ea64aeca34mr159881617b3.11.1730831937144;
        Tue, 05 Nov 2024 10:38:57 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:56 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 072/161] libsdl-ttf: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:48 -0500
Message-ID: <20241105183658.34982-74-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113587

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
index 797c38d8e..c10444431 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=22800d1b3701377aae0b61ee36f5c303"
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
            file://use.pkg-config.for.freetype2.patch \
 "
-SRC_URI[md5sum] = "61e29bd9da8d245bc2471d1b2ce591aa"
 SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7"
 
 S = "${WORKDIR}/SDL_ttf-${PV}"
-- 
2.43.0


