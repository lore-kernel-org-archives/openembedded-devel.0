Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFFEC433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 23:51:29 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.821.1649103593148771375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 13:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L5sKCtq2;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so436223pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGlqk4IR2eMuFQWkU15nGfybpqqYjJwBjVyzKpgg3z8=;
        b=L5sKCtq2n334GzhrT/kcjzfImZ7BdMufBPGHtHJUy6li5oYxTjXsiyty+JLtEDNQXy
         uNIPyghIcguYXFOTyCItoZ/plkZY7CbE+tqrCt/F4FVYW4K8unNQ+o5RAZJdkL7l7xa4
         Y5pUsQUxCRtuPpHWg5D3lEP5XuO1zZfwfh3h5XdVzQuNVIpi/rzpdgRjzYeNiPkHQrg6
         lxh1eEbqwrI/hPxmPevh5Q6RPafyt5E+2z2qEBwKKTLXNMf68tqLATVB9vzJ7bgQFpgO
         CS0de1iwNC/Kx7nZruqySMYrEz8tq7C59PNBYuCn9oW5vHSw6KDvmcJ7ZTw0E11n/XfZ
         s05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGlqk4IR2eMuFQWkU15nGfybpqqYjJwBjVyzKpgg3z8=;
        b=FtwLyeR0AqrXgMks9kHytneegG2Odu6tMOo/yOg51ly02tcpkwPBBGz91LzwYRAE3t
         9MxHBjaWrL191CkiyQBsOCwZa2zxa/mdiDcJr9Te8Am/8bf4gC6zUZNn47ZIigMb42Sb
         UDP3AD/XoRqUoMHVUU4hgDS1Dqdt56dpZKclJq6tApGNbk6r3/+tsmvXuviC2yPrlHXW
         eU55Rz/I1ixir2uaOF4YIrS1DiDtUUW9qwhPoIHTG+aUl8jKGtpKhVA2kBDtTdx/wGAe
         gY/M83poUeRkdX9uSq5lQUM8cw0bQ7N7G+w2R5aKLbE/phoKJRyC7UVeTp7qcxC3BPTH
         snxg==
X-Gm-Message-State: AOAM531kff7yemvlT1SlCBOne1pVVFRwDT5Gs9sIj+doyo3YGB/BYegh
	y1uLMqohXaSefdG9kUUOY2k46/qcQ/k=
X-Google-Smtp-Source: 
 ABdhPJxj+9dVWH5XVMQET4jqUeDI3TMuTct0GpLadwa77349uXGbatdtJ5qvxdBlfb75CrgcyoA4sg==
X-Received: by 2002:a17:90b:4ac1:b0:1c6:adfe:322a with SMTP id
 mh1-20020a17090b4ac100b001c6adfe322amr941323pjb.189.1649103592275;
        Mon, 04 Apr 2022 13:19:52 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 lp4-20020a17090b4a8400b001c9ada2f28fsm23658pjb.8.2022.04.04.13.19.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:19:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] breakpad: Update SRC_URI for protobuf and
 lss
Date: Mon,  4 Apr 2022 13:19:49 -0700
Message-Id: <20220404201949.2939503-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 23:51:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96390

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 3430e895f4..1e474225a2 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -28,8 +28,8 @@ SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
-           git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
-           git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss;branch=master \
+           git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
+           git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss;branch=main \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
-- 
2.25.1


