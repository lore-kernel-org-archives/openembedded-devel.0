Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E0CD129C
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:31:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6614.1762612306826148299
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgwjCJk+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b32a5494dso29361f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762612305; x=1763217105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lrazc7tjerBam9CUDZ9/LJ3TCrMaZFXVZvzz4iLYSoQ=;
        b=SgwjCJk+/HUDHPda29A3EQ7vFfZYx2coFWYdCC6CY0LU+is1s3ynmlf8vFg0wsvhbp
         tEHrScslaBRQgbI6xC24JSxeIa0gvNW0lfZpWOhFfz7/G98jSIfuht9OzLH7HPfGCZzN
         GDx7fa7Uae69kzpmQgPqFFkPtTnYiLSEdXmHcPtVnQlQBqFFMvB8N7Yg6l55nTp+OGJU
         YlqcU/XSE4Iq6Z6YrES8sGEmvwm17UfV5onS08/J/Uar0QI5ZoHcW5tuIWuok7QZ5kdH
         jy3UWBjiL26nwVw0GuiueE6Chour0sX0ci3MCGjGzr4MSSaSFIrlv9pHH4NDIKzCoD7U
         jOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612305; x=1763217105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lrazc7tjerBam9CUDZ9/LJ3TCrMaZFXVZvzz4iLYSoQ=;
        b=TPOie8sT/o4SqC7DDEYrBPCllcX62nwl878b6cKZ0+TivdHne5Cif/tMwxcRsRJlWB
         yNW0gOhbeoJGJskftY2Si077qdyE+ROqbClsE7dzKYVF8BOhSkk5pJEj6TWKG1ZNfShm
         6f+MixEvZxjtAUGvS3Ms/Bf/FmLZjEfSObcEZbrjZ5k+d4Mo+fFZmf6uuFA1EHz90RgB
         7rkuK3a1TK4+qcrcaF0M4MTcMuTEDIb9GCAr4gHm2qfn30QoT5VIKcf+gwuHKqnbUhM1
         3THjLBuKVVBf426x/o89gzmcLA1tdSZd/BMkMTlaNQc8xsr4jU0vxG0xfvK9yGE28wrS
         TJTw==
X-Gm-Message-State: AOJu0Ywf8OPEzFzNKNoRQxqA084noUt9ULqOoBTTFd7+BMP25qVMH37w
	021VphboZwQq90Tktn031IyPy3bhG4nnmYQd0gaVjXnNVZTDolS2ck/7PlNn88SE
X-Gm-Gg: ASbGncuWrNto4a9t1pCVsjK1zcThiqfp+KiL9h1FNDF0YxPrC9UorZt0PQhokTGWLJn
	kWQfY7IN8hBFAk0BYfSSaFc8u45bu00yQfbmQ/hpP9ZKtD8xBVbIlUuVTYReZX50IagxStY8VT5
	RM64eVmRK5zbeQpKgalphQQHeOnENHo+V6As/uqLg223sIw0/Rf5R5aD1WyAX3s87t86oSpA8EP
	bQfQtJU0k4Ah+6WBlJWLveNOXm/f4i83OQZH9fFGNxjyrXVStK4ZBKfd87QKD2TzikC9Uo09Khc
	pngjHRF0eH0P9KeaKktBFDYohk6rzVOfCHYQFH0HRa1FIDYRcLVLI+PmiFO0kt+7l0YPeuwjrzO
	uTcz5RQ7VJ8qXerzhJqxYmTEhFgs78OPpxAM9JYw7ZFpXJhemWVSmqHU+PTTuDCQ2epXVoZ84BC
	Cusks1wFWo
X-Google-Smtp-Source: AGHT+IHjOMFEVXwCEcRcjgF40QK5kmSR3xWQkK172BRZm5EwGyz/DVhuhd3kxt0FGsdlMfW59DvjtQ==
X-Received: by 2002:a05:6000:2b05:b0:42b:3023:66a6 with SMTP id ffacd0b85a97d-42b30236856mr916835f8f.40.1762612305121;
        Sat, 08 Nov 2025 06:31:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm1012211f8f.0.2025.11.08.06.31.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:31:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] breakpad: correct SRC_URI branch
Date: Sat,  8 Nov 2025 15:31:41 +0100
Message-ID: <20251108143141.3117797-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108143141.3117797-1-skandigraun@gmail.com>
References: <20251108143141.3117797-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121393

master was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index 0e51289507..e7cb29289d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -28,7 +28,7 @@ SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
            git://github.com/google/googletest.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/testing/gtest;name=gtest;branch=main;protocol=https \
-           git://github.com/protocolbuffers/protobuf.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
+           git://github.com/protocolbuffers/protobuf.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/third_party/lss;name=lss \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \

