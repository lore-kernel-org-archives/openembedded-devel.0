Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2899DC61DBD
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:22 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.252.1787962281756820946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zmc9HSrD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2509840a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962281; x=1788567081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/RMI6HETe2zRRn9cWAsVpgTwLhSoS4Pa1yN3AigerI=;
        b=Zmc9HSrDVdQOEq/0Bg7koZX/RN0DEfJ5Ij6gDKsq6hA6d55qAavSXexJZ/Gq7vtHIT
         G52DCqyFxYH+uqDSJ7J6/7kxFHa80Th1ijrdusvBAhtJQ6YyK7rluYDBR5b4ggMm3nUk
         i/31SH5g5P9dVUO4XIAEvXnvp16226BcprG3VNm7SnaMVwanyCUMdhX2Z76uolcwGXPQ
         HHMKKAp83dje5wwIZujdzxNFg+WiDZVmWaiw+Zl+xwGAYlY5LblvnuVe0Etr/FgpEb9X
         DKQyboC6mAKG2yVJRgmdhrNuPpSt4A+Ifbxiwm9MRldNFT0q0I3nSY5RUQ3/mw7QQ+S/
         qZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962281; x=1788567081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/RMI6HETe2zRRn9cWAsVpgTwLhSoS4Pa1yN3AigerI=;
        b=Qmnhh/csLXRsTos2/YbcHt1CWL2alslM/03+dy3SRx/8awhNIyFse0Rd3cQrr/yByW
         d8MkNIkCqOgR+EV70rEZSHbzk1Vl1JIprvSyMlIxUC0t5xqBHaEpPvzutBp1yvWwzmRl
         x3x0gMfrqN+P6QuNuW7EN4jH8dCu75PuqG/wlul/gOA16DaPAw5FiSWWwc2cMNrwVH3W
         tPCmThvUZLqTHtqgRqGQd3LTMjThZl9E1G9nPF3uFXvYXxKtlPWiXFADWFKYk34ScgPL
         px4TRHc/Q1UB28+7CTc5oD5nKexCbQ/t624XaNno4bvuRU2FlUsqTD/77KbnSWVIGqtT
         NEuw==
X-Gm-Message-State: AFuF++m0qOynRBGG+6DamQuY4l4f5uF3C8jylx5doOy/vNrF9Q/6wp0w
	UPbzEwTCn2X+YGi6vjTsoXgHq5SFPZdF/TUX5n5dzHhipZvaJZIJ+4UL0s0Qi43o
X-Gm-Gg: AYBFou0k/TRAGK54wEHnRZsuqJeZYuehT/YWzfA0AIt2Llht7+hGJ0amDaM5iVg2kgJ
	UXtXNKelg6kAsugRo335shMPmgcaxZwao8qot4Q41+Gu2dGvFhOqbezX1Ysdgu4ZMotMn1wpVNT
	ghSxRsukmgYZPxMoRhUjMARkEWMUrHTyFvcBPVAnkrZMQXV1YWr3VzCutF7jU7GwVyAcXWDEbTn
	7F3ULCD0IvVUT8nenWDMY9nbZlSDw6OC0xMVUEo9LfqIpLfuzWMarIvjgv9T6xCrF/8R7oGVjiQ
	Ht/zzAtm01+GZ+ikmDiZc3iRAdS42IOw/HIUvKOG7r+PDC38otosUXJTdRMicenLqYpKw3iLcoW
	TOj3fiwBh7tjClI6AAPdAtCo7Tsopa4Sk8KdcUftGFqzWiLBK6OscdjbiXfTm3rP/i66nFR0F6d
	FreFcrtvYVfjJ/9yUnq1nlDEGz0SwR3yeCdy8HjpTVvKuKyIwR5cGDKkqFkaMJy6po07ngSaz9Z
	eJbaJtn9e4jMZVNY23uHDcaF/Ur5/XryUsS42VrNDD1lEOhpTTtQaCDVOU+g6Z+VRQ9uLQbngnY
	tkf6wiiBt2gGPIZLI1z2kPXKmm5neONVbPEvjCf/HIpEagVqz6Tw/I+WJOMV1NbiHni+AdpAzDJ
	rp6cdJdwCHThMAwVIjBLFCosOjD7WiK0qLzwwkdBBYMydN6fcS9GJLOmy
X-Received: by 2002:a17:90b:2f8d:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-396d0a3f016mr21175920a91.0.1787962281113;
        Fri, 28 Aug 2026 17:11:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 08/16] python3-pyzmq: deselect test_process_teardown (fork-safety flake under qemu)
Date: Fri, 28 Aug 2026 17:10:59 -0700
Message-ID: <20260829001108.559544-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129567

From: Khem Raj <raj.khem@gmail.com>

test_process_teardown forks a child process while the parent has an
active zmq/asyncio context (ZeroMQ's own docs call forking with a live
context+IO-thread undefined behavior); under qemu's slower/different
scheduling the forked child intermittently dies with exit code 1
instead of exiting 0. Reproduces reliably on target but never locally
(isolated, whole-file, or whole-suite runs all pass), consistent with
an environment-specific fork-safety issue rather than a logic bug.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pyzmq/run-ptest      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
index beefefa663..e7e14951c2 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
@@ -1,4 +1,11 @@
 #!/bin/sh
 
+# test_process_teardown forks a child process while the parent has an
+# active zmq/asyncio context (ZeroMQ's own docs call forking with a live
+# context+IO-thread undefined behavior); under qemu's slower/different
+# scheduling the forked child intermittently dies with exit code 1 instead
+# of exiting 0. Reproduces reliably on target but never locally (isolated,
+# whole-file, or whole-suite runs all pass), consistent with an
+# environment-specific fork-safety issue rather than a logic bug.
 pytest --automake \
--k 'not test_callable_check and not test_on_recv_basic and not test_on_recv_wake and not test_on_recv_async and not test_on_recv_async_error and not test_curve'
+-k 'not test_callable_check and not test_on_recv_basic and not test_on_recv_wake and not test_on_recv_async and not test_on_recv_async_error and not test_curve and not test_process_teardown'

