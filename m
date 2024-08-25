Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99176C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 19:22:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.37965.1724613766988863989
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 12:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+Mae+jY;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428178fc07eso29661425e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724613765; x=1725218565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErycPY52UAmS0I6Q/39BgQJPDSPz+QVqNjBn/9LrrPw=;
        b=N+Mae+jYX9GKmOm5ynlpXsnbH3mWFI7IzWxIb2I3WvkqKYQnKRWwoNRTofsopIk6MT
         yOeVo1Ye+qDqtLEjAZSnkbhcWuuulKdyOKCyFiwNgBiFWtCq5Plfwxy5sYa72jWop57Z
         ayVS3EjT+/uOj867yUZaOJJSe3v0c5JDJbk5PtiAQMv9iPDQm1aly42/FQIxyce+74wY
         IOFVOwhcsB02HhSc1Ms49PyimKV8FJFUlIe/YlXSC93gvlVbUmC47AmdY2KE0ixK1g6L
         cThZfNcRF/RXP18senumKzT/QkJwIhAQs/hmUa0v+gm8CrBs8DQlzcL5yT6vXzub+W/I
         Czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724613765; x=1725218565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErycPY52UAmS0I6Q/39BgQJPDSPz+QVqNjBn/9LrrPw=;
        b=RtTCnVdY4s9HfCb3A333YAu2FTPz5cxWqm4i5melyR+nuMTYIcmbP/9uIVrPXFqhEB
         gcv47JsILoI2GwbjYK6QESQs6e2vs4QGayTmA8H7Q5PeqENIpNqJUHQ0D1fSOVtU0Spk
         oczPHBQ0Vr6IZfO/73ux6GR2nE/BHw+j16W05JOQ6Swz00ADChSfYK6BCVfTSBc1Md9d
         ULUI95lbEHk8pUKwaDmNgJYiGyaanGIX447rO0709ZY98eE3Pao1AyNH6Lf4QzO+mVOQ
         jSkSxwCNkmE9q684nKVwlCzyAOxzbhUO+8MzQmUFy9v33+RPuz3mjD3xOHyFL4TjaJ5w
         Lc9g==
X-Gm-Message-State: AOJu0Yw0gmZ50wWOa72h+P04FCVNciNeKj88mNhmQ2xUKmr/WOUM1Hei
	QP8gU4Seq1SCgwt97gkR/j9DxyLLATJxWKE7Ddi55xnGMJaO3J6BciCs6A==
X-Google-Smtp-Source: AGHT+IEwTZDOAqFkRCwEzkO63aynOw35UVSspfC3O/sHaKFEjlgfBxYXhY5kd/bMAoVMID/Ke9GvwA==
X-Received: by 2002:a05:6000:184b:b0:365:f52f:cd44 with SMTP id ffacd0b85a97d-373118ec939mr5573382f8f.57.1724613764782;
        Sun, 25 Aug 2024 12:22:44 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51622b6sm129726375e9.22.2024.08.25.12.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 12:22:44 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] protobuf: version bump 4.25.3 -> 4.25.4
Date: Sun, 25 Aug 2024 21:22:40 +0200
Message-Id: <20240825192240.2733993-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 19:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111937

+ adding UPSTREAM_CHECK_GITTAGREGEX because `devtool latest-version` was
  going to the 28 release (what still in rc)

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../protobuf/{protobuf_4.25.3.bb => protobuf_4.25.4.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.3.bb => protobuf_4.25.4.bb} (97%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
similarity index 97%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
index 4f8515471..cc5204de4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
+SRCREV = "e915ce24b3d43c0fffcbf847354288c07dda1de0"
 
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
@@ -19,6 +19,8 @@ SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
+
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig ptest
-- 
2.39.2


