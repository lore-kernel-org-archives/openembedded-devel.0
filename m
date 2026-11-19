Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1911.1795113502573609437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eWxar2sB;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so108850b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113502; x=1795718302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBAo2CjiumD4/Har+01Qsf/ylrxyQmFtyQrTXqGdvdk=;
        b=eWxar2sB0ensh+vbRgyND/EJfef2Rl4a7iuhAKDrFcEGkohznx/YOfoFIjc8IcRhQq
         L6SyDp3jSYZX61ub6BvfeSCOUYy5I61yWevGiXJD9KAwyqQWatJ5ErqbWoxqJa2SvDsI
         LcN76+1j7SJp6kf1Y/FNxJJ+pTBpOGD2/aokg1F4KvJhQ26TJEEBO++Y3CfdEQFfJUoG
         GPl4tchd/lfkRUeTBxqDVgK4YomRaFsSxUeuqaHbtd8aXxJwyYoe9zRJ3QLqz5Hd+7Gs
         aZdrwc4Gz50bO8Fr2A05SRDAmhaZ3IEHP16EDEkAPivWmWeEA1k474ID3sgL4AEwzxqY
         IOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113502; x=1795718302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBAo2CjiumD4/Har+01Qsf/ylrxyQmFtyQrTXqGdvdk=;
        b=RbROY/O8eQD4C+q+vFicis+quzbQYu8+Tk17TreErzVQOHVxrrOSMNPHshKAJKWxpw
         4QePDfIraz58AUZtdir38t2/Y5RDcwSrXHvCTBqMBRli3o0wI9CRv3gch6SYuXaO7i0x
         A1eSgtrJ1nEAYQWKW2EY8axq8vTFMcFMCEkcZfLWPZLrRGePTSPJX/haxea115EjynFU
         jLCVUDWzs8q4+zm1fDjX6wfztsUC6zDQ744F3+IOHw0i954O8mNqcDeCaJnIarL6a+NQ
         xLNzcYXBmqUT//fjW5EFHIgPkuuX5fryhTCCVRboMDoi0DHcV2JQRBmEZZslFw5Vj8Lg
         8tlQ==
X-Gm-Message-State: APuU4Z+S+B8CRPd/vFxe3gS82c9xbNgH5g+NNxFmuldgM0eUf9KLVxC7
	CYZJzHySC6vjWhUBJdFVuNhLQZ1nYc0LaOVDkPHVjOt7nM59EUEbnUvCkQN3sA==
X-Gm-Gg: AYBFou3hc8QqIKvv1lk/sy8xz43K8gJ+H2sPaFlhrTwHxQSMxRYssvCM0nz8IdC8dDw
	039Y+FkMDAZzF8nY3Drk+PCc7c2tVilcxw9m4c/jqn/51/3GHiiIAK45oVGfjwO0V1qaV9rc/jG
	xMZdUKYvhB7OD4pLQ2366AiLMwnUzMSpiLhA0gm4RidtffqzZm3GK92sgrJPLXgg9pa2JZQvOga
	B2x6biV0tBOArPEWFcvcSza/QG4fTeA/isSjMo6lq9g+X6ytKi7lnnyD7ErHFpEh7OVJW2L3rWt
	qsfDrcMgiM2tygkTiOa5XH/WkB9NMEplco3dGUV9tvijMHPmZ/F7416IxEmueXuvfcD8WAq/3dY
	egevPThfuWTe8LlmRTqAVTywJLCBtbGuEESOT50sTEhcpa6YD6uClONglOvY6pnsMSbnlaAv0ew
	YvdekcPenB7yEPTHL3tNeOIbLmHWx8HvoExAnrU9LxSkZRxJ95OrADujes51GTJnkiIJEXOlnbH
	0IOvnjppTh7kpjzJCcSTJS2uOVWhIMIRrHLCglrxWTAYQhit+7qSb2Wualn9nDEi+lAIqrZhKwA
	CZsQFT2R8uJbaKuh2Rot5qKrvMhxG26nkPp/i2W/yGxU2YyEQzitY+AnimNk3w==
X-Received: by 2002:a05:6372:a70f:b0:3fb:4a1e:2f7c with SMTP id adf61e73a8af0-4014e351c1fmr414613637.57.1795113501923;
        Thu, 19 Nov 2026 10:38:21 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:21 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 57/64] mongodb: upgrade 4.4.29 -> 4.4.30
Date: Fri, 20 Nov 2026 07:33:25 +1300
Message-ID: <8227b9d8fb8e9e7837b3a7d48bf6bc7abc6a244e.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132747
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

This is a security release to fix CVE-2025-14847:
https://nvd.nist.gov/vuln/detail/CVE-2025-14847

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 08c49b447b5a615aaaeb89802f503ec6d1722b74)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index ae9123c7c4..ccae6e9dcd 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.29"
-#v4.4.29
-SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
+PV = "4.4.30"
+#v4.4.30
+SRCREV = "1ae4c9990dbc5711f3500748f0c3f8b5d375d8c0"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
