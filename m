Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E6BC4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 09:36:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2697.1784108171825483074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 02:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fkrnjbZK;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f365afc5aso1941618f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784108170; x=1784712970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfiPHKYVHGeSa3BBqbs7LXxDYK55dfvnvvsTrgILlxc=;
        b=fkrnjbZKIwXIsWPJoBUiAE5BMTc4M11bB0BGYhz+M7IaWNVvhDeOssARMMLZ7CMqos
         oOkM/OIMeGwCv/kBKrRqKF5nZfoFUdSfccApXjypznDPqSQk2HhWejaSYXBm7oQemB5k
         LDquwWLNfKMO8piV3VdC6GCzW8tfF6iRsJ+Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108170; x=1784712970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfiPHKYVHGeSa3BBqbs7LXxDYK55dfvnvvsTrgILlxc=;
        b=DOzMj47gd7mGgNY6C8VUK+ZZ+lh9qTXvpONtP5odtz+jRq0X+wvIWUOvkV603iERF8
         e40tLur+uJic3N10Gv5zoyurt+eKHhe214JrpyYq/08JuilgKgyzgApYENEb9GageDgh
         IojMksJTAceCpjt+aHCbs/KHbXZKeNalBee7Lasp/XhVwI9riszUIN9MqavnTlTAyUrz
         oljOOw6Jbs8RAuDr9anxfsamCn4ujogaQ8DE67Tnjw/dBunmLMqVbcLOM3EsjpEus1zg
         GAj90Ov0S5Vnqsfs97c/e0LepZQ0ZCzLxa5WBtnYbUdvnI65kQjqQWj+7GYVKSVZKIHe
         i7Qw==
X-Gm-Message-State: AOJu0YzGvb8/D8+DwRM2hZF6ReIASFo1ZnlGHes3ZvxetWUYLLuIHosz
	f1SymxA9mH959aEueUYkpIV1MIkSwjnzpj+bEt/iJOn2omhzb3hrcCluJqdWATeErL0oW4vrg0j
	K66Mw
X-Gm-Gg: AfdE7cnFPpA2kOZ0XbvEiBMCm3DwXDIK59i3YRSquFFPNew3+Uo09HUaNbr9TVvN/2t
	NOkvW3nXOy/wB1T+ZT/NdGPKLdOvoZR8Hyy+8CXlGih8iIwPLH5yL4lTp7D8wO7WY2PLROEJPrY
	XRXitpXdOBnFgc53o0QUC0FZkbeMA5WLGHmkN656Zc1SqGK68fMTFTwQanVOcP4J/38HlyQIyWn
	QwYLn7OJn6sdNvJn+9AguatH+QXCOrkVfz5VzvBXhViRNqo6ZCRfCBFtpiG62sAUSunWEESVgZl
	GdMk7Itn+7Smpq3Kofbdwnv26wEPBDW7LwL4Ly8ns9r5Bw+BOiEjN82SikH1uUG1J/vnCcD6RwX
	sCllEIriKwKBH41Q5ZagHiI124RlZ91Kx52rBJLdWeUCbNQFnRRYEzGsrDUi6bcetnbFJ6iHChG
	c+39mwrYwFFgRvcORU2R6IZRHsYju0C8ZkA7Jge4VswC8TAFIOJLEafWdHekvR7ZfWD4uYayxot
	XauV2mwvdHotyXwEIKj45UwkKWf9JudtEDfoMtMDQ==
X-Received: by 2002:a05:6000:1867:b0:47e:f3d:2b3 with SMTP id ffacd0b85a97d-47f488b3045mr6688093f8f.39.1784108169812;
        Wed, 15 Jul 2026 02:36:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm15032791f8f.33.2026.07.15.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:36:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-asgiref: Upgrade 3.11.1 -> 3.12.1
Date: Wed, 15 Jul 2026 12:36:02 +0300
Message-ID: <20260715093602.2749784-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715093602.2749784-1-leon.anavi@konsulko.com>
References: <20260715093602.2749784-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 09:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128173

Upgrade to release 3.12.1:

- Restored the previous SyncToAsync.__call__ internal code shape,
  which was relied on by some APM services.

From 3.12.0:

- AsyncToSync no longer captures the running event loop on
  instantiation
- Fixed an event loop deadlock when exiting ThreadSensitiveContext
  while its executor thread was still blocked waiting on the event
  loop.
- Dropped support for EOL Python 3.9.
- Fixed StatelessServer.run() failing on Python 3.14, where
  asyncio.get_event_loop() no longer creates an event loop if none
  exists. It now uses asyncio.run().
- Fixed Local leaking data between unrelated sync threads when
  sys.flags.thread_inherit_context is enabled (Python 3.14+), so a
  newly started thread inherits a copy of the spawning thread's
  context. This flag is on by default on free-threaded builds and
  opt-in on the regular GIL build. Local storage is now tagged with
  its owning thread and re-homed only when asgiref intentionally
  moves work across threads (in async_to_sync / sync_to_async),
  restoring the documented thread-local behaviour in sync threads.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asgiref_3.11.1.bb => python3-asgiref_3.12.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.11.1.bb => python3-asgiref_3.12.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb
index e372d4771b..01c5568dd4 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[sha256sum] = "5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce"
+SRC_URI[sha256sum] = "59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.47.3


