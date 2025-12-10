Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098E1D3C545
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:50:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14650.1765371003306720870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1oy4diy;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34a2acb736eso2278844a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765371002; x=1765975802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgJwbIuNvHWMMPHCGmLxUMg6hpwINWZ93YdI4pvJt30=;
        b=O1oy4diy++GbzDHufirp3ErtK7nb7Wo0VjHjKSsMyQO/EC+GFzF7ivNPPj4V9xW3R9
         mL4IkkD96dGOi1Ihneidyb+NKqPCDemfGrkc0X29UtWM0VkFYC3aHDTK8nDvMfNsPJEH
         kwoamnDToBysMxY2aqX1MhjwhR2B24ml22SROf17ODZf3C+OT/Zzue90JBodysDnDkAG
         pct6C3BygIKGkh4cw4ycJfvjmTQynmuCzU1pmrb2/TZyuexe1ImRsfNkgzAI6BOEhoDS
         INlpGFBx9NrETl8EjE8Q+yT+81MF2CCZ5A7gu3BGQKNgGzDZYGJmDkhPfzWIUs44XHiS
         Fk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765371002; x=1765975802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgJwbIuNvHWMMPHCGmLxUMg6hpwINWZ93YdI4pvJt30=;
        b=Y9tJmy3yuQP+9jtksDX72JSOjiDIoLtxOUqBWu2hDC7p76wl5QR44WLi5AQ6va925h
         U2tt/k/7pwj//Tt40hGsvqu5xPjzwBbb3m2YqEgk6mXv/xyiiqfE5qeYDmxsSqByp6OB
         /iWtGiWbycp4cyCP7LEMmTKa2MDQsLOtarYWQMSuCV/E/+K/2JXj4Y/PjVUa0pkPoQy0
         AMMWWDM23fN2BsbZdVy+6tn5U9LK/n09w++5y8wyp1zGyemj9LPMkLJL+0uHf5gI7MIf
         9qhi3F+Ye9xsvsFkHIghjvoIG0X5I+vycQt/R9l0EOv8l7zj82rKAtNeuKPJ54XZ3ME+
         0vHA==
X-Gm-Message-State: AOJu0Ywb6Bfn+FfFf1f7s0bD55pGDEGTPP3VsgKtrVRyqCJJP9P2C159
	16xzMnFT56NPKEWwyl4LdAgeSuOtJ0+N8Ah0JPTG/z61tqsrZmKJTzlr10rBcw==
X-Gm-Gg: AY/fxX44mBbJY/cD2oq78exOWUGBJcq8B6JLt0jP0ER7wOJORYH9G3lFkdeBeYFWNgQ
	jZJApiRVpN4bj/c6z++yyvWhd8UogXpYLXEwpnEf8qjR8nqhr8+d6os09a3/3l2qXqVErQfRRBO
	nKpxFwFw2PAAj+oRvo6nwRiQ6kjMhNsATugyEQauyknccD972nKjRDHDt4kPdBch6rZwq29y3ht
	XwB7+Mq8z6yuZ1ZJEZM28LEZgegadpjdtO1wDWNNwGPK5w/EQe9vn+BKR3Vl7fEtpZ0hVuwszO2
	nyPxt66i9WyGWLMnw3M/WKNqWjG4BY5qdwoHg2CLN3qtj1m4hN4GhgucFKV01g+BrYBU/hYxcXW
	6LneFOhC19uyfNt715UdRirjk95loNn9s9djwL9zieHdpHYDzgIiwuREKUgniUkNPCCzCxHAdKq
	UBWRMGSDHF5sWhOp9GIAtBSQ==
X-Google-Smtp-Source: AGHT+IEeYVPIb+rN6pYbNkE2C5mI+fjZn/jYOoVaQApETee8ydHj6OsKE1pS364yzn7XWNayBGivQw==
X-Received: by 2002:a17:90b:3d0a:b0:340:bb5c:7dd7 with SMTP id 98e67ed59e1d1-34a72808b46mr1821997a91.5.1765371002461;
        Wed, 10 Dec 2025 04:50:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:50:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 13/43] breakpad: correct SRC_URI branch
Date: Wed, 10 Dec 2025 18:14:57 +0530
Message-ID: <20251210124528.10696-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
References: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122517

From: Gyorgy Sarvari <skandigraun@gmail.com>

master was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 185ff8cbccb99768fca91537b9cf4d47b4117825)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

