Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC377CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 08:38:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11144.1759912687421477687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 01:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DJIgXJOJ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4c89df6145so664031566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759912685; x=1760517485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Egbdgpq5+TkT2tQSOU2x8/P5+hZczFO6Qt8YxZwdXmc=;
        b=DJIgXJOJ2GW1ZZU6DDR2MxqKI39siMwY0P4IswEhHZ03ZJlSKbtWTHuBu1FVTawbO7
         cxcFXfGSGwmtG5UXEl1DicoI1VWBefpI5NLhbVZcNloydBJawFUD7lPPpTFzNVzxGaMd
         M6m0CoAfw/JPZ+wrJmsxeDTgpLM3xLLy7eXsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912685; x=1760517485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Egbdgpq5+TkT2tQSOU2x8/P5+hZczFO6Qt8YxZwdXmc=;
        b=nv5cg4E1/b5RGHPZEM17omB/kWDAemxLP8jLeQVfjnDY7fqCL+aRHrOxeLeZWfRS5h
         THs3zIJochHlISQpT6A3XlK5j4CXMGuWlrk1BxxkJzWV6MYH062jS8/fPPiEVDWUqEkA
         WbS+P5aJkLN1614W5GIepw6/vI1WJFFm80jf/wfwaqf6uGbgQVnf4LcuN05fXWXee2H1
         E9HYreLnRpopMsiNTyuEHsscK7NmgHcWj7r5F5UgO9kVKrL6FxncURRRBw7hwCwoHW0b
         VYpj/TA8TyDqlCTKvGy6iT59wV2MveZ+KI7FoV+Wm8sIflbDRHrw/0g20CHTNeR3OduG
         tomA==
X-Gm-Message-State: AOJu0YyBd4ThW0esNy5bpdStonCIhnp0eXWKbk1Fal2/nPfqWR/LByTF
	cJb+Ch9FkaYvt26VU/89vrVmx6M+3dFup36ABuPZE6vmiIe5s2FaOzjYMBYNS7BDazhA2BwtfYt
	Grbjm
X-Gm-Gg: ASbGncusmh4PpAzxM3/D8foWwexMDb90Lt+FPYTKPdkSU4+j8rugCgR6luMtKNkHPfm
	mE0zxDidEr8j6AfSF1MCqs8gwmSDmWfejoabPesh+YR0ewz4ez1Dx86v8/o8IXjNe3xPjtY7KKW
	Vm+jJZPo5DWV7EQXRhSxzLwxn3APZkoi2eQ8LKqCZyScjABjsOoZIRpz+M6hRRp14G5euhaG5pB
	0RE+ZU8VDR9k36I3zJXOduYLTNT8SbmE2DW4vEsprUtVRF68K4ujn9DvQkbdVN1XyT50D+HMFqK
	B5NP7l/DmQd3Dd/Be2WHkwGBr4+9CvQGzRyEbeM/W2gUILzSG4DXIh9akA4H81LozrLBrjZ+lWK
	8MIYHDrZuKz8UTXbtD1Lxao6ppkWDZi10/AZ4QY6TDZYQXUzQNaXh1nEWzhTp
X-Google-Smtp-Source: AGHT+IEVUxor+78dA0xRFpWDE1lwR+xWFSfXs4bXDXmHG+OOrXhp7In84jPc4AhwcQVTvoKCC2SrQw==
X-Received: by 2002:a17:907:e8f:b0:b34:985c:a503 with SMTP id a640c23a62f3a-b50ac1c34c9mr245620066b.35.1759912685348;
        Wed, 08 Oct 2025 01:38:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a60dsm1577054866b.63.2025.10.08.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:38:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 8.1.3 -> 8.1.4
Date: Wed,  8 Oct 2025 11:38:02 +0300
Message-ID: <20251008083802.2012181-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 08:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120357

Upgrade to release 8.1.4:

Security fixes:
- (CVE-2025-49844) A Lua script may lead to remote code execution
- (CVE-2025-46817) A Lua script may lead to integer overflow and
  potential RCE
- (CVE-2025-46818) A Lua script can be executed in the context of
  another user
- (CVE-2025-46819) LUA out-of-bound read

Bug fixes:
- Fix accounting for dual channel RDB bytes in replication stats
- Fix EVAL to report unknown error when empty error table is
  provided
- Fix use-after-free when active expiration triggers hashtable
  to shrink
- Fix MEMORY USAGE to account for embedded keys
- Fix memory leak when shrinking a hashtable without entries
- Prevent potential assertion in active defrag handling large
  allocations
- Prevent bad memory access when NOTOUCH client gets unblocked
- Converge divergent shard-id persisted in nodes.conf to primary's
  shard id
- Fix client tracking memory overhead calculation
- Fix RDB load per slot memory pre-allocation when loading from RDB
  snapshot
- Don't use AVX2 instructions if the CPU doesn't support it
- Fix bug where active defrag may be unable to defrag sparsely
  filled pages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_8.1.3.bb => valkey_8.1.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.3.bb => valkey_8.1.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
index 28b375bde2..9947a9299c 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "d063dff523340e5a075f7ddc436e0c2a43d04061"
+SRCREV = "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.47.3


