Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDD3C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 18:19:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.1286.1713723565150013933
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 11:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXCczeIg;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51a80b190bso229856166b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Apr 2024 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713723563; x=1714328363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eICiXy9mVpachzbX4++PAR3OTmUSRSMqHDtAMQeTNSY=;
        b=CXCczeIgMbHnwwO3a9OrcVqPyu3hKng5oNf4q+I6DD8lJ0mdiarcIXS08V/VKBatn2
         rh9U2PR9aPylxx3jOEXAZkpccNZ/Z31bLzWa48h1i/+B5lZn5uGhOOexps0rsW1o4L4Y
         5AqITWW3svRxV5QgM6m/JUarZhrhqAsb7BunqfV0KOckfptAw+kzWKyCMYnh2KU6kvye
         pfWydErsboJ1KB7k4KjhnoRlGa1Lfy9c5AQ7Ai687QA9XDhxSWZ7ZaKoDfQMJUQx1P7b
         Er3Xu6WdkZqOXgYC4MZGy4pAVTt9Bd5sRi8g6JF9+bnyfZjpI5yaFGPtw0YMv6ptMfGY
         +p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713723563; x=1714328363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eICiXy9mVpachzbX4++PAR3OTmUSRSMqHDtAMQeTNSY=;
        b=QP+4yUgQowtvo2oJwkGIX+feZTY/vZxVVAHJ22aF4KGR30yj0mMtXRb66Iosf2r+XI
         wo1fVkhWh9cOquP3YHDUn95S7ZskGE3kqUaE6+5kPgD8hWUavCDIwk5V1kXaUw9MCXwx
         E10ZeNW/db9ZkYACgU3YabeqWcLQLflQozSGP648WtuJyk2NF6lWuL4cPKl2IefSPYk6
         c6NEVF9uKfcjll97nHomoBm8Med6XfNcsq5E9JO/5itKaNpKqPazxFhBaDIrBVQgnxt9
         1IGVrj2G+Py2Zz/QG31Im2aKFiCLnyhgeU9xs+UrfXGYZBBX06Kuj8w/FbqArvywTTPH
         iTZQ==
X-Gm-Message-State: AOJu0YymXMgi+XxJbmmK4wu786w1m27ZvPmmZ4UzW7uJ7AL6vVXYRyG6
	yNKr1mryKzNgnQ5TcXCJ/JrlFZ7J0QhWFnCP7SNZGAEARzjJj2riTyX16Q==
X-Google-Smtp-Source: AGHT+IEhgUhkWgWbQP7te+oiACbkHO/D13rMUvwiUdjOrAlWjBQ8Jt7jAiilt/Z7HDU9UqoBhhBPfw==
X-Received: by 2002:a50:cd1d:0:b0:56e:d54:6d63 with SMTP id z29-20020a50cd1d000000b0056e0d546d63mr6257712edi.15.1713723563135;
        Sun, 21 Apr 2024 11:19:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7dc0a000000b0056fe755f1e6sm4577114edu.91.2024.04.21.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:19:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] vlc: do not depend on mpeg2dec
Date: Sun, 21 Apr 2024 20:19:16 +0200
Message-Id: <20240421181916.1830535-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Apr 2024 18:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110074

The format is obsolete, the code hasn't been touched in well over 10
years and the recipe is about to be removed from oe-core. VLC can still
access such files via its gstreamer module/ffmpeg.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index d25a20ae0..21bc408f6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -9,7 +9,7 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native bison-nat
    dbus libxml2 gnutls \
    tremor faad2 ffmpeg flac alsa-lib \
    lua-native lua libidn \
-   avahi jpeg xz libmodplug mpeg2dec \
+   avahi jpeg xz libmodplug \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff"
 
-- 
2.39.2


