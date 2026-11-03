Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4300.1793738747107221419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PHZTuv04;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9b69so64747c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738746; x=1794343546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyZZd96FOp06DCSaxP/SXZ5bEzQItK9SUTFvsZh1Zfg=;
        b=PHZTuv040woDaaMD7hm2DYW7+fRvlWbDqfcbFke1t6oygiOx14cdRzckCXD7YL0BMq
         iVdjSzMJiAIekio6KquKy95Gum24O3hDP/NNed7lmv0g3/3YgZH3MM+hEOvzJFXhJM5l
         MR8WaKi2gDOsYwdGBunic300Pl7Is4O7MrIb5b7LGjXngB6Nk+qoQxZUYOdXZolX4qKP
         RENNHZnD8IfjC+WLVWzjijXJg+4ADTIS0bZPklXq2/9b1MTKPpVgrZa4orI2j6C4NEZC
         nwupgMNfL+9oLxNAxx9ywwhLeelsyRmb19ioNpxqZnUG2u0lkniCAa1dWNS/Bo5MqwUk
         RPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738746; x=1794343546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyZZd96FOp06DCSaxP/SXZ5bEzQItK9SUTFvsZh1Zfg=;
        b=irGROF13pCrfDk/+HDIdXgOp7l6mpYrqk6m3km+QeaR3mbWe9OWxeV9hzPtLzyjD5d
         nyXTUdoVACrLRGj8zx96xC7rg7S4B3VkNO+hY7VzrnE/RgznK0EK0Mibfo7Qn9qIW/GU
         gcUYlxe2Q+rbiUqpFxGlOQfsIg2cBzpwwxCJPbQhBf+nsLF6oxG+sSP9xgCM+xMk9o+1
         xaxMHzFoQUPN2r1y7WDZkiKj1IHedps/64Mk39SQthilzpt4NYAVDGcIabiBzia9+mt9
         px8yJuTBb7YfohkaDtPuIFh4tGPLARUnQ/KboDEMaXO+LogLHlTw9cdeEiZn+s5tT/Bz
         yyrA==
X-Gm-Message-State: APuU4Z/b+aMJbjz033z8XaHUSODDR934PZkgmxSko+ZqWviVJl67i4BX
	W6lzICBIViY8ymrEIbvnyeSnt41kxDRnLiAgDwZtZtdNm4yA3+UejDicZQOjhA==
X-Gm-Gg: AYBFou3OnItVgjMvwgs9CGHkPNd4XAPk7nu1dookF8LX+USEnzPzwxzAMqt8r6gpMkf
	TOM70Vw9a9w1Y9AcosiUQI5G8TOCLvZ0vtj+seePA1Y6hHg3d4YL9HRLsYujwio1qWIWKv/dpuT
	VYGuVoNpgRcABW21XVP2vx6AoobEOIXBVAKbcJLi0MXNWdl6QHDjkqcSQJa2znXXP/ory6UJVKX
	X4hoNxfEvl7pAA779Lj6FhiO6BI7T7knoR+j6pUwPBhL1kSjW5+Xo8KtoDaLHGTSBDBr3hKhKeb
	g7oOqsHC2nXfRGXzx3zYc0RsyMD5jc3qQqaAVRG7e0th1ICqVvXE0St9pT/g0CB+hs6xpVwmUZ8
	s//XZoAkrEPYHDt3KSpBOBaoiIevI+U1zUXHWZ9Ge7I9ru/kijypGS+2xu2mD5EP5rAraEiCtZz
	7CnS1jhyqi7gteVloBq0ZUKw7Dvo53DIOcv+QFBexa/Fe2sGphsr+k9uTf38V9crsq+mbwz6ocT
	u2f50g6d6SvhpKyGrO0c5hfLmML15nzBPJoCc0cMl4iTmksykQ0cSySlhaHgmv+3Z4aby2xyLcy
	v8kmPryjAikAixMrZ/XjMPfyKU89e1uc6C2mJOFmeoVxRLBYFH93T6HhGdlxRA==
X-Received: by 2002:a05:7023:d09:b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1ac5e320bd8mr20597925c88.28.1793738746486;
        Tue, 03 Nov 2026 12:45:46 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c47076sm1104555c88.16.2026.11.03.12.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:45:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/5] ctags: upgrade 6.2.20261011.0 -> 6.2.20261101.0
Date: Wed,  4 Nov 2026 09:45:28 +1300
Message-ID: <20261103204529.1094356-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
References: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131829
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ctags/{ctags_6.2.20261011.0.bb => ctags_6.2.20261101.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20261011.0.bb => ctags_6.2.20261101.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
index e2f6b309ef..ec80a2fa25 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "82494361bb3e7d4f7cf1d2bdc0d0e9001c926e45"
+SRCREV = "692cde832a9b0bc74ad5bebdbed4768b00435436"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
