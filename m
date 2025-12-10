Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5AAD3C540
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:46:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14830.1765370810732538783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGee4FtP;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-349b711d106so3449914a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370810; x=1765975610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU2oohCBcJozJiZO1YV1Sv7NRtDGrrejOSJxGhInOU0=;
        b=VGee4FtPNeyOfVmSr9mD9bIGmBaGcotrKN8hBkN4ziSLbZ+Rw0+IsnMJtYjFqJoldJ
         fvy3bL4al3N/060g22eyvYAWAPbMffY3Y4yd0PeIIsrrT568so8BBZNJVPx9GQ/TwaE8
         SKobx7DSUxEYrEJbNnAOK0JuIkpm6cLF5CWvQ+4lBjg3jGGyYQPrhyGfIR+FssR/fSIw
         q95ryYIOWa845gmPgkpPIjju5epUmQzCsDTrnLILCFVkFqh0Rr55wMaYVANwTcG13rE0
         9gy8U6YTM3vAS0cO3D6npbsTyNhncPJD45BCj4vRpLhixgoQTWpVgHZPk0o1Mdqnswyr
         Eb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370810; x=1765975610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MU2oohCBcJozJiZO1YV1Sv7NRtDGrrejOSJxGhInOU0=;
        b=M3avtp8LG+CdUKRgzXl1oZlHsTZ7A+XRUNY3oZtZ0hFsr1MeWjcK+jIZuR/ZKDEFIB
         f3tzPtD48NAAsW8wFBGEYKmabNVie35GrA9c4zEDfOI+bdWur8WI5MrKQCJodumwV8XE
         31/t5OTgY50hsrfkAC5zvIS8PtvGuarXd/WH0/PqXHMPxwUDF+c98V9orAQPEARcSRN9
         mwE/avvvF9HeABQVqfjY2vlEVDvOmXND5FFyJVz1wrgiA+XmXQlfWktK0/A798DwjlxL
         KrViTVeVlJBmQ4GwAVk4pPmQq02/0e3npTzedIsoOmspxyvsp/FQstEsLiN2uDmGJXQd
         njhA==
X-Gm-Message-State: AOJu0YyKKpB8TlsZpR7HOAZDyDg620VgbDEqlfJFZD6Ki9F2LOMDMRCU
	jZlSBUhB9dG85640skcdAW39/+fVyeKhH6AnLuCM1I6shV11LAPZETmUoGBRTQ==
X-Gm-Gg: AY/fxX7e6RCqDv9/u7fDjeHFZPmwi3M111OhVMXarN0cU2VU5+/lq6+7vRF3JbRofQ1
	u/lv/Tm2vxlPNKhT4qOJZ/0endZaZXUxYdIayLcsQ4eS/muRLajB5X/FzcB/1UdPJ+uz29XalyN
	0nlSXTRLf3tNMYjoxDVUeI8yGl0CuiGxMMNdlqn/1tCcNuH31whXRmgHBJ2kyNHQBfbpAUGG2N0
	tMB0WpU8BMP7loGfY493XU3AQvSWbG3/dO1TjQjwvPYk2fA5MlhQOxKTaEgp4qOgcoD4TiJDD0B
	4AwfZvJS3d5slmO252UeQ88lqIlM4cheQ1FuBsMXDqhY75naV41mBWrceE4CsJNbpOfQJy6jXDp
	NlUFpWwns3qUU2fw24gak0D6Kaozq6fxotfobYXO8qityXHgOBhdt8WVH7O6yAyG4rwQSc2QApY
	SUaIVWF55vUf3T1BWdD7QQfw==
X-Google-Smtp-Source: AGHT+IGFS+iO/Dy6QjOP95fGtw2qVJSvPMT+ytp8XPEHT5kK5C4m5UFTrgEd5sOPaDmr4zGMQzpnBw==
X-Received: by 2002:a17:90b:4c89:b0:340:f7d6:dc70 with SMTP id 98e67ed59e1d1-34a7281d757mr2119843a91.13.1765370809897;
        Wed, 10 Dec 2025 04:46:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:46:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 09/43] sanlock: upgrade 4.1.0 -> 4.2.0
Date: Wed, 10 Dec 2025 18:14:53 +0530
Message-ID: <20251210124528.10696-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
References: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122513

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 387707f7b8c6828947369582b63d64dfdd0e02cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sanlock/{sanlock_4.1.0.bb => sanlock_4.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_4.1.0.bb => sanlock_4.2.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
index 2f4886057e..8babaf8017 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "57013022da9c06c13f65a24684522a04323f59b6"
+SRCREV = "efe86d2e691383da07942fe9a4bccab13046f3d4"
 
 
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

