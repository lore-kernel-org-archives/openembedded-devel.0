Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC66C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:21:40 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6986.1789017697510807693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r/1RFgTt;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso778709a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 22:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789017697; x=1789622497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWUXTuTaRQf3PnyqUvzuC2CPaWFnJ3vbnfKPdFufLDo=;
        b=r/1RFgTtxRd7OFZR4g0XEy/fFgvv5/cf4zlwyBxuvcNl/r81ZsdTOiVc5WSD8Zc6sA
         6/Yl/pc1brVYjFZqzuxKPo2bAsJDGhaaR/SXL0j1Wr4E8cH6+MRFqblpb/CSEBSy2wik
         n4hfD3tWJwYK+SNDMyQI3XKGOz1bUO1kd7vBgEuai09MQniahUdRwmZ2CHGtTR5bCIGp
         KhL7PPx7yB9oE42QXSTeJxQ5TqqVz33y/Le6JiCiHyTVceh8ck+gVPnVep5xa1ESjI1g
         dr1hF6PDOpmDjXAiAPK/NEAdjtUBndK8JdCSSbMnosMD4zudofzuMXOBZcHZ6Xiq+Bt1
         cJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789017697; x=1789622497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWUXTuTaRQf3PnyqUvzuC2CPaWFnJ3vbnfKPdFufLDo=;
        b=NjJa8M1ILS6RYK220fIpmAvKBmf16okUUbf81JFdKuvtaQNsYcBX2EGymzZMuu1rdt
         OBOAiIdMrjmACLIgYdp+kJRnJzzB9/v/yhBR+sQq7D8haljqhloHQVz70Ex9FeGemPXA
         xzw0935OTm4TgP/LCGpMqqDTMxAwz/FfLlA17dA0nLw0l1FZP1dVuIsuWt9bGefKqeLU
         Yjw7eNCUoyv7YrHM1qEcJbIXEuvF22/dm41Fp+KS2hTGAkBS0+DM67owKcY33oPxkHiu
         xFd0Y2532IO1KZl0e+WS31XYiyW13M0T0qQxQ176KWeq5ke1m1r7c41AuhWkjGEwoWki
         SCCA==
X-Gm-Message-State: AFuF++nb/T/uyvD0xnv87U0moCliAEMfRlgSvS0HTCTLroSSyr0HQj8M
	Zj9dhznmvUoaOYjm5O8NMzRSdNeHWZU+WA+k0uvhtVMkCR/lShvpRWaqQbPzmw==
X-Gm-Gg: AYBFou2Yil4yCSkG0c+zFAc4k2fiC76vi97RaRYNXSNPzW7e0KRAO/bKiM/FADXpIBQ
	Ne0KKfu3fixKYFJbfggjGU2IEXKlG3uAA6r9WRLePhpJuOAUdG6PXihpaC8RwTnWF6NZJGm7YRC
	PhW6k74EzzBdInKrZMdmsagLYYOfxfZQw4VaZOFhbbQPhj+jxCH8Ikb2xCaIf1LvPm/qoNHaGu6
	Rvxbb65kyr8q9dvv/a/VhQNM0etJt3b3K9mFLGEEwZMFzvOVbIeVFmtgN06GTU/OWbyFV+KXoTi
	S6BUHdsbiNPNC7JqLj078eXuMh3TQ1hbgU43mqPcqAHsGKH01uys2wivNO/OTRKBj75HnSTPf6P
	dzy3KS5m2NdmRmM5PrjDpFmzYcw1km4wKMgFpBL636j+8AJqgYGD0V+aplQEvjHC8+DTX/GOqyD
	4Rp4wGe3rREQ20dem1raUPtsj0lOTkSxUnTpXj/fsXs2kuWavDx+E1xuK13eog8/t1jmJC0EZka
	ZH4/4k55nhnakQO/DXyC6YugCnTbJnAE4rMkXRLb+Nj/Oc0O5DPp2FQE0D+O8sgfFtMI0x32Vrh
	zdCA+8YUq/DW06xfQ4hvNOSDaQwD3TxVNc18+fy2lwaCbou/A2LmxZjmaVseK6L41JIKToF0qGJ
	PJ1JclGpIGij2qHmwEyKhT82NcLj8ivZbQe3euqZaB+p2BjEUhOvFmyQc
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr8759221a91.3.1789017696614;
        Wed, 09 Sep 2026 22:21:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm54554111c88.12.2026.09.09.22.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:21:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] dlt-daemon: Fix build with clang-23
Date: Wed,  9 Sep 2026 22:21:32 -0700
Message-ID: <20260910052133.2153716-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 05:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129903

clang 23 added -Wunused-but-set-global, enabled by -Wall, and the build
uses -Werror -Wfatal-errors, so this is now a hard failure:

  src/lib/dlt_user.c:132:20: fatal error: variable
    'dlt_user_housekeeper_exit_requested' set but not used
    [-Wunused-but-set-global]
    132 | static atomic_bool dlt_user_housekeeper_exit_requested = false;

The diagnostic is pointing at a real bug: dlt_user_atexit_handler() sets
the flag to "Signal housekeeper thread to exit", but nothing ever reads
it, so the housekeeper thread only ever stops when dlt_stop_threads()
cancels it. Not fixed upstream, master still has the same dead store.

Add a patch checking the flag in the housekeeper loop condition. Leaving
the loop that way is equivalent to being cancelled, pthread_cleanup_pop(1)
at the end of the function runs dlt_user_cleanup_handler() either way.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...t_user_housekeeper_exit_requested-in.patch | 43 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_3.0.0.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt_user-Honor-dlt_user_housekeeper_exit_requested-in.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt_user-Honor-dlt_user_housekeeper_exit_requested-in.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt_user-Honor-dlt_user_housekeeper_exit_requested-in.patch
new file mode 100644
index 0000000000..a3adbd9d76
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt_user-Honor-dlt_user_housekeeper_exit_requested-in.patch
@@ -0,0 +1,43 @@
+From 9ddee0a5f46a1d7fea81228e6905ebc485e678a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Sep 2026 20:24:55 -0700
+Subject: [PATCH] dlt_user: Honor dlt_user_housekeeper_exit_requested in
+ housekeeper loop
+
+dlt_user_atexit_handler() sets dlt_user_housekeeper_exit_requested to
+signal the housekeeper thread to exit, but nothing ever reads the flag,
+so the housekeeper thread keeps running until dlt_stop_threads() cancels
+it with pthread_cancel().
+
+clang 23 added -Wunused-but-set-global (enabled by -Wall) which spots
+this dead store, and since the build uses -Werror -Wfatal-errors it is
+now a hard build failure:
+
+  src/lib/dlt_user.c:132:20: fatal error: variable
+    'dlt_user_housekeeper_exit_requested' set but not used
+    [-Wunused-but-set-global]
+    132 | static atomic_bool dlt_user_housekeeper_exit_requested = false;
+
+Check the flag in the housekeeper loop condition, which is what the
+"Signal housekeeper thread to exit" comment intends. Leaving the loop
+this way is equivalent to being cancelled: pthread_cleanup_pop(1) at the
+end of the function runs dlt_user_cleanup_handler() either way.
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/dlt_user.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
+index daf5e8b..9fa2906 100644
+--- a/src/lib/dlt_user.c
++++ b/src/lib/dlt_user.c
+@@ -4850,7 +4850,7 @@ void *dlt_user_housekeeperthread_function(void *ptr)
+
+     pthread_mutex_unlock(&dlt_housekeeper_running_mutex);
+
+-    while (in_loop) {
++    while (in_loop && !dlt_user_housekeeper_exit_requested) {
+         /* Check for new messages from DLT daemon */
+         if (!dlt_user.disable_injection_msg)
+             if (dlt_user_log_check_user_message() < DLT_RETURN_OK)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 6de62c2a3d..79f28c2901 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0001-warnings-Fix-clang-generated-warnings.patch \
            file://0001-dlt-daemon.c-fix-wrong-len.patch \
            file://char_conversion.patch \
+           file://0001-dlt_user-Honor-dlt_user_housekeeper_exit_requested-in.patch \
            "
 SRCREV = "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"


