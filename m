Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30958.1792964619338698708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pXV2QwUr;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35829219da8so4316600eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964619; x=1793569419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JKPuN4hacNW5qu/o5ca4sey6H409bnStwjBJIZ+prs=;
        b=pXV2QwUrG6CWLD3CuXtkyDTR2VwYTkcJsA6UjaULO/zzTRSTep7Cgqp2F+sqis7RbW
         Js8m3boEN011l/OyBmZdDe+s051Ai3ADXJzkPjrGPfq4EnRppOP8aQJlRLvfLf0/fkYg
         iPPSqE1RBp0wU9epbuZ/0dwQi+F0NDeHTW2lqPIFJfdM+fY/UjQbK+gVuDpXVPz2bPuJ
         Ln6FWBCIWTmOMcl3JOLm7TF30Ex5bYhdEEOk2d6T9N9ioUfk/w9sUWRt8LrAPdSQZXfE
         haT67vMhzk0QCMnh8a50YBLJOfou/tbRz8dPO8Cn6oZV1ko7wIw8v96FcaCeGGtANx2P
         kP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964619; x=1793569419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JKPuN4hacNW5qu/o5ca4sey6H409bnStwjBJIZ+prs=;
        b=swdIHmZS1Iz6up73RDCXCHLmVmDU2fEqc3kQwoqF4a5z9iTKevwIZ30lCjxkEEuHo4
         AX+RIgbnY6VGQj4T4cpTYnARg1DNMhrky26JXBKFCfZyul7acdB++NOMAzmG2bcJc4vl
         dME6rqendz1qVgNaVukuUBGqDpNoYVkATIKaIlmzAil+VklKoOh7ut3QfQtt8azP+p5H
         gF1EadH5fBboB0WIjroZu/VSbYZglHbhWinMxaUCgSAyGAWm5Bxzm72xaN52hU/7tGtF
         s/G8e4SYhJMA7PJcwekwvTzwsNHHktJsritzY5I0TnlB8Csb/TancSYLbGoeKsKHQ4ve
         OWOQ==
X-Gm-Message-State: AFq9FYISebE4pjyCzXv1JLOgSHBOHyI8X4iZV6oAXqdS1qWkxpd/Wf9+
	ycwJp4Vyij8Bt2+apIqOPIlTW9Ypy0RbTLeg/hRuDjlf4uz7Omo5Fc8pfbfVQbD2eh8=
X-Gm-Gg: AYBFou2OrtSfy+VehPEdN3/JFOO4g5UFZGNR9r/zjg4t7h/Bhy11OETTHnKNzVgQ7uL
	B5uC5S7U1JQ/zrTZARy2oDBCHLfm+k+PNBcA14OT8+m4mGPRUG+iWd9cIJh8JO0aNwSNONszeLt
	zYAWd+VYOY5+wbBtmvBGoU3MhotnO/faQrSDTq9j0qSDz48lIuQji4bVEn5duddmiFATZIr+Qu3
	e2djXvqmABwPWBhQQQxtTtdH657CS0py7Xb6zf8K8TXFn5GfnsGl9T+wm4b6zxkAJ7CvpzLMxv+
	cF7gWOZlS54YT1KqhZ0z0LVZzVoLHQwHKfU9tyt/eFr0zJDSyW7nPwsWu2NjxmPCrOgwTLuC459
	zzOyBZurkUF/KMVfpCdM1gUM5vjtY4AwatwuHFWuw/VkxDrpGtQ7wIBPIid5j+Qu+5O13KYF20c
	LQQSif/5Ej5Q7mSaabhywe+gqoHGQV4Nu8uzAhy6gMmsukT9aYny730hE/y++z8pYLAUO/UWIP1
	Lnpd/9eEchDD/kSVYzCHgb70uNXf1mrsJF2LL2NphTCHry6VNh046kPmyKnjtADRontBXpuwHhy
	pYGzuPBfbdgzWLINiSYzUr4vHvRDi/q+2WUfAU5RPDzYOwduWLjxoQuJ/JqcOr/Rzqq5MrqEMEh
	ItKarlCpmRf/BFbbMikg2rVKndAQuHmmjBOqsyJ6KdLesoMutO5EiQ56VbcudsPa13ne2f6LUh/
	12xJ5W8c7r+IwjfIQVF1dL2zWfBLaoHxWHM4clAB6IW88yFuaOOrFvOyJgV7AClx3mhLRKUQHpG
	lpWGB2G17kmINc83suRS3OHWiB5jzrOIysJy4n/Vgq32Xf9+fg+
X-Received: by 2002:a05:7300:6a8f:b0:359:27e6:b684 with SMTP id 5a478bee46e88-369e8361195mr6898590eec.3.1792964618625;
        Sun, 25 Oct 2026 14:43:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 6/6] python3-pyzmq: Skip timing sensitive test_retry_poll in ptest
Date: Sun, 25 Oct 2026 14:43:30 -0700
Message-ID: <20261025214330.653779-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131411
Content-Type: text/plain; charset="utf-8"

The test expects a message sent from another thread 0.2s later to arrive
within a 0.5s poll window, which a loaded test host misses. Upstream
marks it flaky(reruns=3), but pytest-rerunfailures is not available.
Adjust the musl sed to the new end of the -k expression.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq/run-ptest | 6 +++++-
 meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
index e7e14951c2..bfe76654e4 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
@@ -7,5 +7,9 @@
 # of exiting 0. Reproduces reliably on target but never locally (isolated,
 # whole-file, or whole-suite runs all pass), consistent with an
 # environment-specific fork-safety issue rather than a logic bug.
+#
+# test_retry_poll expects a message sent 0.2s later by another thread to
+# arrive within a 0.5s poll window; on a loaded host it misses that window.
+# Upstream marks it flaky(reruns=3), which needs pytest-rerunfailures.
 pytest --automake \
--k 'not test_callable_check and not test_on_recv_basic and not test_on_recv_wake and not test_on_recv_async and not test_on_recv_async_error and not test_curve and not test_process_teardown'
+-k 'not test_callable_check and not test_on_recv_basic and not test_on_recv_wake and not test_on_recv_async and not test_on_recv_async_error and not test_curve and not test_process_teardown and not test_retry_poll'
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
index bbce601f3f..4cbf46cf0a 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
@@ -63,7 +63,7 @@ do_install_ptest() {
 }

 do_install_ptest:append:libc-musl() {
-        sed -i -e "s/ and not test_process_teardown'/ and not test_process_teardown and not test_close_all_fds'/" \
+        sed -i -e "s/ and not test_retry_poll'/ and not test_retry_poll and not test_close_all_fds'/" \
             ${D}${PTEST_PATH}/run-ptest
         grep -q "not test_close_all_fds'" ${D}${PTEST_PATH}/run-ptest || bbfatal "failed to skip test_close_all_fds in run-ptest"
 }
