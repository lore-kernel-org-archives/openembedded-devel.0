Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93583C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 08:38:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.4846.1635928693206103702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LYGg5yYa;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id f4so6302765edx.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUaOTK/Y6SI+nbNeJsTuHtbPInNpcRnJhJF+gI09XnY=;
        b=LYGg5yYa0beks0oUP9DVqfsOhVSiidQ3pxcmbSG6p7aY7GcfrOCf3srF6pafNb/QCD
         PhxZnuY3xihxuPPDCmJXAhc738BwfGlMsfzHlpHFnsqmOjZCKaGXaRcMf4FMoc/8yw5C
         hTEu7OnJPqrvD29iyDPXqUQd0+R3RJ05l2iytsgpr3VsaqioI9HVnU+e0e6y4XZWT9z1
         Vu1OK0qGip0PCg5jUOhVQ2uXhjQ2zK/cejWOftMIPwtNhbTNwznCi+yqx+c7rNECTrfd
         SWgxnJqMiaQ4Vc2d14kqcUUyKxOETExMVXRDV9lqGwdutIu7+vn0qtRLFIdZnhfZS6Xz
         ez+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUaOTK/Y6SI+nbNeJsTuHtbPInNpcRnJhJF+gI09XnY=;
        b=tCT4UOLlP98VJNLmST+0+0s0H0Q79v8zvzvPz9hy9R8wP6VpfcDRwFIS9qimnni/V5
         BLEXsgGv+dY19oTYpZnTHMD3HDgPZDD85nH+kLFlKdiyCLw2yCCEvNbrFLHDI3gVarSY
         w/+mOY/KQIPhSWOqECQ5qBEeFCH71EbIDE7CYnUUbd4/QbblrrRswfbP+UVdaJ2h5P4x
         CyQK7a7eEUT9kZC6vIZAYXXTywGgA5hhZBqz6+ojsd3eNLaCofsPiY1yc9yTQVVdN+aV
         y3xNgNUezKa2DHhNxO3pOMwghI4+9bTBwHONveSSY5VQG35/UVKa3TnaN8vKi0jjF8O2
         dmgQ==
X-Gm-Message-State: AOAM533H1O9+hOIF7Xovs2LztQWGBslN0FGAGTJq/bzRPAYGolIpgbex
	mVBmH8VZacuz2lxa53ZuM5Nx/8VfJAw=
X-Google-Smtp-Source: 
 ABdhPJyntMYKqR0SKcrEf6mAZLxs85OHpzAoBUFrXhA21YDEOcBn4UUMrk/JHGHox/U8Wv7vGW3tFg==
X-Received: by 2002:a17:906:58c9:: with SMTP id
 e9mr12458932ejs.181.1635928691464;
        Wed, 03 Nov 2021 01:38:11 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 ga1sm761550ejc.100.2021.11.03.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:38:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-prctl: add protocol=https in SRC_URI
Date: Wed,  3 Nov 2021 09:38:08 +0100
Message-Id: <20211103083808.237835-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 08:38:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93799

* the missing space before \ defeats
  openembedded-core/scripts/contrib/convert-srcuri.py
  adjusting this automatically.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index b87a470b40..4686fb620c 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -13,7 +13,7 @@ B = "${S}"
 SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
 PV = "1.8.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
+SRC_URI = "git://github.com/seveas/python-prctl;branch=main;protocol=https \
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
-- 
2.32.0


