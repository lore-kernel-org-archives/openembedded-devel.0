Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387A5C52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.64588.1723135137159704778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aGMqkJNk;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc4fcbb131so9232325ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135136; x=1723739936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWQbGsmDXditMjZlBYy8vPQUqbFkZLNPJp96FfbDOQU=;
        b=aGMqkJNkquh0hmP9ywAvF35eN+B7ZI8Skp58Qb0bIRWkRDWdpLJ0HhXkV41LGvULg5
         7ClEu+Fo7aVTPIoMMr/U7JvSIUVx2ev10kxN+HvDOulH54m5GMc+LssZJLXVSWMOS1wB
         8dg9fRfAD/fa8XR28bPeGMq9IB3u7xL+xdwsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135136; x=1723739936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWQbGsmDXditMjZlBYy8vPQUqbFkZLNPJp96FfbDOQU=;
        b=IxOuG1M+PBuCCZI9TYEqoobwBZXoikLgFSsYtR28UxU/zU+0DIk2pW+iywRITuQ52O
         lsvbiHAbOBYEsdJ26ZkyhMbjTKkdrqZnltZXbTSBKcoJ28AeBuaKg6DmgcF/PIZgJ0NE
         MJYJN8x4IVUJHGTTxJSzjBgCIR8rFlQnX68DZjw0CbxljSNBZd8ppjOnlN5qnR3fxe6c
         1bGvxbc2w5+t6PPbqCbIx6aYSPgbRcSZXhh3vLAqkamcZqwQxy6C5lQYvUSm1u41sAa2
         4FJXxmiga3xqk7ID91z9u1TDUHu6KW7XJzRRpzVLgz9rSR7v1tmMGW915lw0w696nNn+
         jALQ==
X-Gm-Message-State: AOJu0YzY+QDWSaTfTgyql3lHCyKtQxkHxMTgpmi620mlTon9lO5SYZia
	FsHzuN7lmP5F8unKxU49HCL5vPweV5SWGHU2wdRWFDoBlajgzpt/Gtgj49awq9pKGkQdK1bcTgU
	7mzg=
X-Google-Smtp-Source: AGHT+IGvPQ2xQJL6w40UR5Esyb0C//y9z3zPLm+nFehHxKOQK8eAETqrKhwB9Gjlya/vV5jN4hCUmg==
X-Received: by 2002:a17:903:2310:b0:1fc:2ee3:d460 with SMTP id d9443c01a7336-2009526351emr33462145ad.35.1723135136113;
        Thu, 08 Aug 2024 09:38:56 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592976b3sm127320275ad.252.2024.08.08.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:55 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pydantic-core: backport patch
Date: Thu,  8 Aug 2024 09:38:42 -0700
Message-ID: <60a5d0f7cb4dd09c3ec77e3d1867728b9a8c763a.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
References: <cover.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111674

From: Tim Orling <tim.orling@konsulko.com>

We've seen TMPDIR [build-paths] contamination in the
built pydantic_core/_pydantic_core.cpython-*-*-linux-gnu.so

See discussion upstream in:
https://github.com/pydantic/pydantic-core/issues/1365

Backport fix from:
https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.21.0.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
index b4ca66a54d..b24e141f60 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
+SRC_URI += "file://0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch"
 
 SRC_URI[sha256sum] = "79c747f9916e5b6cb588dfd994d9ac15a93e43eb07467d9e6f24d892c176bbf5"
 
-- 
2.46.0


