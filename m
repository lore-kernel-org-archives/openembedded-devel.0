Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FE3C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24492.1786747568702283669
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QmOAlnd3;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso993881a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747568; x=1787352368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deZIsGDZ/x09SaQ6ocIh1mD5H2FkSLXljaxHXiKfMhY=;
        b=QmOAlnd3jsh9JjyhuZtOJKgzgGin1DHqvQXUuJy1y7j7VHJWM/iGvOhCLdbPw4QKk0
         fJXCGBMOzMFu1uYCgv4FS0iCP0bFJ4jvaDKFjJOlg4pFq4HlXg7pM8bDdsigvD+TlozR
         zsWSOc4ishf+H5VV6uxFHbbEo9MrfoXHMOixHFEDXRtsSLawBXa81hROvTOO15goArcS
         Xfbpi3BWIpEJ5Uwa5Nr264jgh8IKLbuCp22YW+L1urIXXg6S+hiYQYYs6SCD4hycNp6s
         DdCoLwu2Quc3pWF7gfLG+jjfMQZGMCJxFtd1PmCg3JpzYc8vONBNivmFeuyB6b6eyRer
         A6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747568; x=1787352368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deZIsGDZ/x09SaQ6ocIh1mD5H2FkSLXljaxHXiKfMhY=;
        b=DEWKVX81qVvHRoguEw+n8U7OACs4OzxlLsdoDP7G6SL7wy+YaTiHpNNPeoBccPKJ8d
         6ExUoBxQCIdxcGuBIeMeDyvr8Qe72W9W123xAbMJfMh0CDDgN21VKXSII5R46IbMgj8V
         sDpacL/hz28vIQeULKnax0m7OcBOGEpNB/d3quc1UTlDz7EER0hSiWUtXPg1D8C72Ygz
         5+ZL2nyEWUesaxEvJkv9Bji0UIycK1JPUS+ua10VVEjff532dj8rf+xF/umVdC32ikZ9
         TDuzv8pUY9CkMR2pgKezZ0AuCm2Nz13lFZAYAakQhJRCBgBZ+HMc7PwLlx9iQXiOy9SH
         kkMw==
X-Gm-Message-State: AOJu0YwPRY+zXsfYPQkiU+MJxDNAiQtslm/hQ3p9A6szIO0SsT9EJ6gP
	4daviHcX9P2hlwHLY17325+aCToU8B62GvHIRC8u7VxzT3+RIpucl33+TBimYx8+
X-Gm-Gg: AR+sD136tpsD68oTj79i32uWH6+q9iNxEIPhvAg7SepfpghkktSf6x9kFJjln5hZeVl
	gLtunXpRNALmijGUUSP5OsVwbTmhgcBOd4oRPtL+NL/SMENHBVU3kc+GeVTTpIVinKTwmzuXk2N
	wUfIK7QnizJl7SvoMPPXxyc+oALGpjSk2cwbay6Vx6wXRLa31XwjtbQNExGHBmxBi7u1KTLxKVD
	JwsJkx2nopO8NbREHx9NsTlCO95QrWTwEnigZuPbEPe3aZOH2cEruGLPOmngUpPIV+SWNjTejn8
	1M8sJ42gdXGMRTtLfYu/XSp9m8DPR0JGHDa6oiGmmTsa1CF8q3iGPeETjhCERDgdjl2rUmJ6Gmt
	NHwwUijtcI0hcTr6U1C1uHH5oXHg0NDwvLOKA90ABNpfDaBtcAvmqxGWQimLii1Ajanhix772fe
	udg0EvzGwFy1WAe8UniqPSmDsmC5u/v3B2qSY5Rt5XYEryjPTvcvEUX5MNuxlsz9ggg8MUsYO4F
	hKmK4bPEMlrBH0DLcL9EPkTZbaNUggofzdBPcTyfsJquhXg0qPtMv8Q9nqwJACFX4PfXq4mm3PA
	br5uk7DMPE8HBHOCDLbqSwCXSdHJIx6AMl6wkBwDqcD5SKq551N4f1Z/Gta5H0vuOJEGxZ15wvn
	9nazAVsT5YypMQxbvQ4jeSfGGDv4DR5PnpVbzK/xpcSd1yZy1SZ4FSUwY
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:8de9:c647 with SMTP id adf61e73a8af0-3cc71881d83mr10393095637.0.1786747568028;
        Fri, 14 Aug 2026 15:46:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 023/109] fluentbit: upgrade 5.0.8 -> 5.0.9
Date: Fri, 14 Aug 2026 15:44:09 -0700
Message-ID: <20260814224539.1523174-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129087

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fluentbit/{fluentbit_5.0.8.bb => fluentbit_5.0.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.8.bb => fluentbit_5.0.9.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb
index ee01821e95..3996b22582 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.9.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "c2b1cfd5f5b3530d613c167fc999a7df4eb2eabb"
+SRCREV = "a1e05fc1f703fe0ab0373578896f395a04a7eeb5"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \

