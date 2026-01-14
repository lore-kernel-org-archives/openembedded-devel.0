Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4B6D37E2B
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:08:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9473.1768396089107448561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6OHE+De;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso5127075a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396088; x=1769000888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=F6OHE+Dew5ok6kPWTEgTtAj+xEbZ6BBCZVBYuafhF/MVDSvgwyphgU/tE1PWR07Wur
         XG5UH7Y3XwhAJtBBMpSEaQZXsEjQ2DVvX+kbKhbVKZomqUdGWILISo4wzRlBy2bFcjk7
         7NftGxqPazOUtrbMiw5d4DzqIpevkQOilldk2DyvOF4IJSL+lHtOKFmVvxR6Wcjanknh
         nG4Hf6vU+pQtNH0DkEWfsnDZyoxHQLKTpXY0Jw2q5Lj/6CtggpMF0gRo4HRR7/5lYojT
         JPMFiHhx2qH52XDRoyAmCDBCkbkxwwLkZ26QvYq2F3PI+hsbpDedXLM6WEKCf/DhXsFR
         WkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396088; x=1769000888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=SYlgzBqmqVXCy5mmPhl+kfCreiqy3161dRJABHJ0avHrn+R39KLx27hmWu6SBJKYh/
         Z/WOqmjJwmmSLTTJYS95Tc76sPOo0AsiVn1b2vE7Z3lzsIs2UwNHPPrKHBUaFL1wNITY
         jL8AHhgm/mQr1iUlArrMJye/N1DuLzM9ElX2jynAO5AxvWZKM8Y1vFx8OpD/JjUqDHwa
         K2DXBhI9bZ/oQ0GT5QXioVsjnS/aLqC0ZkRZC7Qjs4X6jBfHpGB1738KU3yPvIBLF0qe
         wEoyYAnrH3bweBno6Mr8GVYE+xjFUxkzS+kwb1MDXhbh1UusHHLaoRCIev28RyheqIp6
         Focg==
X-Gm-Message-State: AOJu0YzyYwlSS6J0cuV7T5MNootvBRLkF6cz9SShll9HQrLySe8ddcAe
	UYh84pisjdlYNDlkj/cYHl8n8GKcbaj26B3ChYnyJF3lnAmbJCJAf+IzOmz+Dg==
X-Gm-Gg: AY/fxX5Vyxdbuh76J7hWcUfpcAq0HVLIeVdnlAMlzW1xkEMbtiZNwVfRg6kgpEpcYVI
	mQaLNhh0zpK5wep8AmFoOwH/ZGkvu0RnL6l3VBXY7Lko5WHY4Q853wGi5UuZUjiJTTilOa1mgBD
	/F/pDXfCQPTIWfHLrnzS8ShI9H3BbdeHVTodgwKlwxAkylr+A9UcLPIpLbKZwgikoMlJTEBW1OJ
	RL0j1HbthXjofaFhvl/GEIakO9umvATJEFw/WwjD7L+2fdl6AUVGuvxsh1x+cxpB2b0NQ6m80sg
	ZjZxo5XC2YEq9eiVt2VO1iqkVihQWV3n74CxYOWcayeGnSHvmHLTbYDUp6zq7cO97jiGs3HT6Ou
	E5qW7iV5wB1DgNwSU8JPPySwvEpMY41MS51gjJtmFpVxL2mSVuIPZKoQX4CYQGsgIxpNHZd4HQm
	Ay2kACGBjikWMZOs1ztvSkFbM=
X-Received: by 2002:a17:90b:4d83:b0:334:cb89:bde6 with SMTP id 98e67ed59e1d1-351090922aamr2602835a91.4.1768396088155;
        Wed, 14 Jan 2026 05:08:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106914b1esm1296398a91.1.2026.01.14.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:08:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [PATCH] python3-virtualenv: upgrade 20.25.0 -> 20.25.3
Date: Thu, 15 Jan 2026 02:07:55 +1300
Message-ID: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123474

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-3-2024-04-17
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-2-2024-04-16
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-1-2024-02-21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hon3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 1858fee25a..fee5250c4d 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
+SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

