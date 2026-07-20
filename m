Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864E1C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:34:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10484.1784558070790291893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=smXlru52;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474560436c3so5142898f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784558069; x=1785162869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaKP4TbWejiMomvj4HcBGJDtEkyQFV8ipm4VdgjBYNQ=;
        b=smXlru52bLSK/1nj42URrUp4gC5sDkUbeNLr0QZRXWCWmmY7aow7cY2EkeF9HXCTPl
         Y2wjt5nl2ZE26xMs6HOJFXUo1FyWjUfM51nSLVSFO3J9xH/mSp4zl2BgD1F+9Kv2WbeT
         jJNqnm/p16z45yuNhcdcWUSxqneqPgaV4ZxSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558069; x=1785162869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaKP4TbWejiMomvj4HcBGJDtEkyQFV8ipm4VdgjBYNQ=;
        b=lepGWLotP5vYIjjuscn4/OsLSY4+EfxuiDX0FGvR7L1isMQEuSHE9Ly+iTsdKHJaTJ
         XZxyKkqlyjFTGqt1s2AbuLc4FMnpQcaUhNp5mqGB4wI+ui86pv9BRBMYR0ePkynoCyEX
         U/1+5CiflVTpIBqwcow9PRELa+g+8LAeawD9Ona46OAd4WkFnPb82sxhBnx5aPOKHyO3
         XPA+G29PGRKQJg6wtY7flw2aY4Zavo/UNIwzNXd/ZLpXOHSzlHg9dYS16L2Rrl0NreOd
         vQavzX52TspXp+oLLyanjL/PaJo336lngOwZb8CekEfNNxWGQ9+eujdEhiZaOkranDC8
         gMyg==
X-Gm-Message-State: AOJu0YzwN4J5K6jSPLrGiH02bLySO466WTpOCDGY6//xMpt1eNHgFEGN
	DeZZQvqQ7DMBmtgt4+HqBFxQKNuBj8r5SzuaaU9oYlRPXts9dZs7lBuy5+KVAt2mGMFBBbNKc5F
	z4pRW
X-Gm-Gg: AR+sD10wE3tlVNIy9v2ACh2thDWieZ+jx6JYTK2N0WZ/gKWmym+1iEo6oF9OvKvMv/3
	ZzUQY/6bm4tLHnX96FC7wuHfTExFxNF2jz5Pu9Jo0tpAFSchgSxPX1ro4uc7KN59AQmZISdXfWT
	asvUNlgBvpU8R90GO2L5p4IVEoA3il/S06Wv/Lwtx1HVdOJl0vTQ5vl0ybP7uBQ1LbKmP1EjGE4
	q60j4rZJanwt/UnJPRgjd8RvZfpn4eUnd0j+WcqrWX2uI5MlTG50e9SUJnoLtNnC762LESnAfyF
	yo1Q7C6yIxkmFu4a/RESsd+hxpxkuTSlpjImFoMJe/T1gfDMCrBG3B6PDte3sUs5qUrv+xtM8JM
	QDjsGQoc9J6DYeBJ6AuXX4i9uOHDeNGwHRHrSSHC8Z8i9LVnAWnIbg3DmHnVB8dvNE1dLKR2ECD
	cgolteSGhiGrHGvLaKRcNvGTbAIFcKi8k/gBk4U6bq2YZgXSyUaDSktdSW8EdHw3bFE+/eKf0xP
	DjUHxFMeaarZj6Fhbd5S6f21Cu47qs=
X-Received: by 2002:a05:6000:41c2:b0:47f:5a97:2a63 with SMTP id ffacd0b85a97d-47f622f2acdmr18105325f8f.9.1784558068824;
        Mon, 20 Jul 2026 07:34:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm29498970f8f.25.2026.07.20.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:34:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-imageio: Upgrade 2.37.3 -> 2.37.4
Date: Mon, 20 Jul 2026 17:34:24 +0300
Message-ID: <20260720143426.809643-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 14:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128277

Upgrade to release 2.37.4:

- Set filename parameter of FileNotFoundError exception
- Fix typos in docstrings and comments

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.37.3.bb => python3-imageio_2.37.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.37.3.bb => python3-imageio_2.37.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
index b90f1ba863..5beb1c5239 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6c492278d46e42af592aa26d7cab1e54"
 
-SRC_URI[sha256sum] = "bbb37efbfc4c400fcd534b367b91fcd66d5da639aaa138034431a1c5e0a41451"
+SRC_URI[sha256sum] = "e45cbc5e83502047fb138f7f585f7f105a136a57eea5f4b3cfc6ce1b52720bd3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


