Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8433AC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 08:33:21 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.67337.1723537994307838578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FBOC/hiC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so836671366b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723537992; x=1724142792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TvGNM6BGvQKNBHp8gMbDZa3S+9hGZaoYKA4k0TTnzE=;
        b=FBOC/hiCXj/Tv/wuhFZImooSoEFwpAWH2+mdnbdkKJVM8/RboH8qsN1dfLvFOaNnN4
         RfxL6NK2+cEN3PoJ/RMWubvlBSWcT4Msp6usEa7C9PFRG1xUqr3W2JTEV8Z/vHAycPE4
         Tw0bXph6AgkgZFrbLR61Y2emoDFCUpfg6lIOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723537992; x=1724142792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TvGNM6BGvQKNBHp8gMbDZa3S+9hGZaoYKA4k0TTnzE=;
        b=sV8ZibT1GFPRBjIEKeXNl/thgmRHDDaOi4dC6GsZ3eUWoeus66jiufXgQGMrGuyeye
         i1uFWIUmjahXFBnb5QnisUILrz+7uzIrnwMGCYhWX5UH+nqBgd16YXwsqz1+YpnhRtJS
         cyzlTeBENJXgqwrnkPdSxL/ZLNV9H0SSjda0EyACDUHFxrPqutNWalodn6h6P6frR5zm
         dIXrZQextz8NZrBtRq8DyKAOuv9MDGyC6np49vTBcnJm31ZqMXZP0o9bz4ekos0oqD/6
         2fAlEMHF8JleoRLu3P9ew8CML8ja88l9YnwNQVd8JnhTMInsLxnqjMmNlrzz7CV7IXd5
         dcVA==
X-Gm-Message-State: AOJu0YyY3efULabI2NQVC7QFu9Tbi7us3ii4Nc+t9PBpr5+ubDfCHBBc
	hkDXM2oxV47LHVWDZYvBkc9TxkFLDB4eiofb+ujv6u+0GSNQjbu1EbnTKXEZtqHSuSDGfXssgp5
	f
X-Google-Smtp-Source: AGHT+IGieSD6fWlrmX/C+9MEO1Tg5j8rzmBWCwGo7CtOl9NkKcn6jAazJ+Xk7siSb/6YMck4MLc+bA==
X-Received: by 2002:a17:907:d93:b0:a77:ca3b:996c with SMTP id a640c23a62f3a-a80f0b2dc4fmr208674966b.16.1723537991889;
        Tue, 13 Aug 2024 01:33:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4150226sm49202966b.182.2024.08.13.01.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:33:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-imageio: Upgrade 2.34.2 -> 2.35.0
Date: Tue, 13 Aug 2024 11:33:08 +0300
Message-Id: <20240813083309.3661502-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 08:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111788

Upgrade to release 2.35.0:

- Ensure video stream is closed when closing the pyAV plugin

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.34.2.bb => python3-imageio_2.35.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.34.2.bb => python3-imageio_2.35.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb b/meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb
index 5fd08f3bd..92c659e73 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.34.2.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5c0c0ee8faa018a1c42f649b90395dd4d3bb6187c09053a0cd6f1fdd51bbff5e"
+SRC_URI[sha256sum] = "e88f759803d2968e19a55fa8372e9fbe12967a8598fe042d8719ca46d03f4256"
 
 inherit pypi setuptools3
 
-- 
2.39.2


