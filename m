Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DACC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 20:35:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7040.1702413331276381073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 12:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCTOZmtC;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3fe6c1b5so32452695e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702413329; x=1703018129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTCb98y2SYCBJghB9mN53JrQcsse+3/0MbXwhvtYW8M=;
        b=GCTOZmtCw1N1jQYCNOqU9qXky3hi/X1Xw5VKQR5DBmnI10zMsAp0wTmbIcMgz31bLa
         1KJbgUjn48QW7OMrBD1I6BTAcB89QX3vdh9HCGD18jpaL+JuDMXNbf3F7fN5OABszEtr
         xRKsBzx/9uJJfRPfFoAqap0TkEBEIfTWPU8PpeutuL1t/i0OoWzuwX2aIL+tveeOBVH6
         KYP0XzhTagw1ZJMUcdYTtrbgpcmLBoBFJ7dEBJ7f1sjS3oXllQhABVgMQe0JXNgrwIKF
         Z27AtAGf9skexJY29TJS4stszU2x+DNYVPSN16pR2QqGc2X1OsuqUO+fO1nY2VLfPeea
         ugiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413329; x=1703018129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTCb98y2SYCBJghB9mN53JrQcsse+3/0MbXwhvtYW8M=;
        b=DNZpW/Vbz/RvQR7cdRB4vmJMYcUUka3itfAtGjtzSmD5ss/ttZ7T2nG1IpVmb2JNUf
         8md3wmAPbjIyAmwGTjoiF0rSMbaUuY7pnh+BJS8W/9hWJhtdj80yyVDpKFtzKbOeRRB9
         o3TL4EqI0cj075pWKniGFKri1QXIYH3FJR/H3VDXYqvx2BFIqe5BsmSdBs9DawH+Je39
         7fwakEeevTj6Btj4+uks+xVFjPR4ycxu3SiExGZr05NN85EqBRLw5DVyx1hTKltNxqUU
         N8h4xZF2t5FkQk7uAgUxbWdWTt+vRdwIqvV5In/98Jshe3rqa3AeGKXHSt41yIE7ASxG
         sWsw==
X-Gm-Message-State: AOJu0YxpfvEW1MB0aXrV9RcjGHC6wGeLMzpaG+1xqGfOnVFsse1Moh8D
	cZJb31I+S4wCS2AFGoyUeiHa6aNy7oUvqg==
X-Google-Smtp-Source: AGHT+IEewXaUAOPwRg0Olgc3Mbu+8dwvILoHwHgeJqHv18wfRZQTVCqXjsW21d5osHc+YY8frZevRA==
X-Received: by 2002:a7b:c849:0:b0:40b:3d9f:eedf with SMTP id c9-20020a7bc849000000b0040b3d9feedfmr3604803wml.15.1702413328939;
        Tue, 12 Dec 2023 12:35:28 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm7554730wmq.47.2023.12.12.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:35:28 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH 2/4] libmxml: use autotools-brokensep instead of setting B
Date: Tue, 12 Dec 2023 23:35:07 +0300
Message-Id: <20231212203509.902175-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212203509.902175-1-alperyasinak1@gmail.com>
References: <20231212203509.902175-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 20:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107342

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
index 2f6b1f247..38e270c03 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
@@ -8,14 +8,12 @@ SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
 SRCREV = "fd47c7d115191c8a6bce2c781ffee41e179530f2"
 S = "${WORKDIR}/git"
 
-inherit autotools
+# Package does not support out of tree builds.
+inherit autotools-brokensep
 
 PACKAGECONFIG ??= "threads"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 
-# Package does not support out of tree builds.
-B = "${S}"
-
 # MXML uses autotools but it explicitly states it does not support autoheader.
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
 
-- 
2.25.1


