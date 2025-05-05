Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6846C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 16:18:38 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.53219.1746459036137201298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxmSmupX;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b074d908e56so3269959a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746459035; x=1747063835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdrezG4g2gDkIsIKtnutlqs0ubgYiWfWP1+FojSwIss=;
        b=XxmSmupXrW+g9jQ14bGDraRuyjGke22/VM83fc9Z/9+oIye4qSY2DbwWSIXW9eagn9
         3SCam+Bz4jQ5uMxUuhj92AlMgFViYIJO9Q2o2MWOgKt23hCD4zHhFoOeklt9SPvSKGS2
         Ejy6nzWxNEHNwq0GO10ZrnJngwMn3JxaiCFN+Vm8bqyX/O88KW5kwwaPdbhkHSfxpbGw
         rHj15xnuB9FJAnMiUDThZRYe5oeOnsMuXKRSAWIDqEzAhaCnoMcuAsz9mFTgUO9YujlS
         Wom/eg8IMmdUjhC3hvd6uS89u1lHNoKb/XwAGq4KsobLGVkVNtCkHHbbO+p27KHHKBT/
         XaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746459035; x=1747063835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdrezG4g2gDkIsIKtnutlqs0ubgYiWfWP1+FojSwIss=;
        b=vO/uXtkCsz7HgT/ceUo8vDrrxvdB/y3cwyz+9PC7TZSx6qiL6ZLWTxxNzju8DJJWFT
         umJf4FN1DLzmO81PvFI7/gY+b49oo57Uck9mERw+Nwu8Mq7R5GnQ9cpD5cgv6BHKK4p/
         8Np464rXDjBFUXlDL9xIJ3MVwwQcKmNja/ogSixj+l/TVY3GvtY6XRKehJvaQX/IQRgM
         0I4P4U4tCH5pNo3UVbw4wWkNOyr+BUYrRaLlGMZZeQBmHwtlKyGUn+a/EfnPpLigm0Y/
         b6/8XaLF+jCh3Ax2rKrzwT8hThNRUY792+6DP3Wb4G092Z5+ocekHzau1JvwOgKI2BA1
         KywA==
X-Gm-Message-State: AOJu0Yyia+QpFspZLjlPB+Pwofobm6Zo2GihxuQtkulNtw8aC9qpraSg
	mJbKFUMTcYlw5UFEPOX5SV2Txxajk1IOClrL09ObFreSkwA/9OKR7R8lfg==
X-Gm-Gg: ASbGncsFM5U4Tzr1E08sLWJZCDTczfKX+ETCz4Yt1jOibQf8dX8/Wy3emotwPtc9YxY
	HCdtNuI60jsXevaYSwyt9Izk9eL0UzV0G/hyuTgs4WaIsUVjcv39zpXKC6thPIyfSj16xOe4JET
	x8Uri21gY4micOSy1dGO1xGPAj3t4C7N3xC90EOOMpqo87kvpgs6RG2WorSBVyJRmoihLqZcATT
	3WlHyzLXlWIqNHvivKM32Out9NkG75XaBpIK7GbzbYudLnYycqZTdkcmWhLr5uTyHHwocEKBlbj
	X0mxjQXRngFe6a4z7IJ7EydBUTnJa7KCu0Nih9nzZ0bCqNzAg6eRtRFWGYFsWm7vtv8bpg==
X-Google-Smtp-Source: AGHT+IGII8/qoz6zrBchdmgY4LPxMbXX//SrLbDnVAcE6BBWTpAkDVJM2pz2QsH83QiEJJ841+EBbg==
X-Received: by 2002:a17:90b:394c:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a6174bdc5mr14829064a91.0.1746459034950;
        Mon, 05 May 2025 08:30:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480e9d4sm11795252a91.36.2025.05.05.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:30:34 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libserialmodule: Add recipe
Date: Mon,  5 May 2025 22:30:22 +0700
Message-ID: <20250505153022.8761-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117326

- Async C/C++ Serial/COM + cross-OS
- Depend on: "simplelog-topic".
- The first version v1.0.3 is sent to OpenEmbedded.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libserialmodule/libserialmodule_1.0.3.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb

diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
new file mode 100644
index 0000000000..02125730d1
--- /dev/null
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A library for Serial/COM"
+DESCRIPTION = "Async C/C++ I/O with COM/Serial Port Library."
+HOMEPAGE = "https://github.com/thuanalg/libserialmodule"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+DEPENDS = "libsimplelog"
+SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
+SRCREV = "9cf920aa1d3ef1d4a4de9a19e695717a6f097894"
+S = "${WORKDIR}/git"
+inherit cmake
+EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
+
-- 
2.47.1


