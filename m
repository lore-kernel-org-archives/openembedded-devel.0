Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B798CA0EED
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 17:41:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.57012.1755452461873037188
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 10:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PfUcazE8;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a25ce7978so5183055e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755452460; x=1756057260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnMrNTkvS0DlaoFQTjCKkIcYIvWv87mYEpBA70q/b24=;
        b=PfUcazE8c7jPruMoQZh/VIfJzdmthdK2caRjd+fmi9czYWLBnxQe7tNLDU7CFNPaJn
         ADa8JVJ3MfhSp2yqEQC14MgKNxDPJOTDLF7wW7Y2I5pDCGUM9+SuBZZZHp8HVg6CITlZ
         xmQ9qyIcilFatDmZgROnls1NlmoKDhZTC9T0BxIErnjV/LH/JTBhjl/pMY++CY9OAPlN
         3hGzQv4fHnENxFZp8cIXEoX8jsOKUn5drxsjVvqFrH2EJ4XwX83hmM5JGE234UTMMdU3
         OLcSq7Cm1O3HUGIjXb1/7UMyvhWRM4r8tB1vURE/1azq1PSYoIh/3+bmwDydX2FdyhON
         iFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755452460; x=1756057260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnMrNTkvS0DlaoFQTjCKkIcYIvWv87mYEpBA70q/b24=;
        b=qChUO90PZje56/P5ZoJ8NV/7a3BRxyX5K29U5bknCfKaGmi3wcuxiqGTU1fXqBVFYR
         gmgFQcJdQ62iTV3jPPHMrIZNF2st/VibYek5rFnVAJvm2E8W2rGNlMot+2v3p8Ey1Bsi
         f4APj/4Tfp0aDNO1Fy7ubCxk9r7/a7BltJMchjxVWER+rUEY4RW2zoUO7tgO6DEAOkXc
         ThFJMiC6MnYZMR8/GiaKCmc2ZhZrtecEhtNKwxJJVSveWq6Aeh3E8uH6oGTMtn/Yuqe3
         JsNfOvp4Tw9T0aYi6uM94U2KRgM5HjG4iUispFXB+P6DVwGfJgZTaCtESHs1kOaDta/D
         B3Ag==
X-Gm-Message-State: AOJu0Yy0V+xtP+48yNaEp4RDvhA4dua+lBWYnjUcX4VbILPR0mMJpUXG
	rsKhdpboVJ8P9YT/wjpN4xJW6uOmzXEnzcmaSB2YWJnKOnqZ285CeZ0PkcZqEw==
X-Gm-Gg: ASbGnctLeBQTzDdEdS7CMyvcQgzSnY9wXS3+TudoBFHLZs3XnPGMZFooPdLp+DWaDZj
	gmpK44VpIoN4qiwhDXuAtT1T4l2UszqYtAes5LggeV0tFq4sr2YaMU+m+kmyjJ+1rsl1KhKJ4jT
	RDqBh7q6WuRAYgbQF8Tw2/Q5cZpgCwAzcCdgUZ8mkSIyEEqMS01urPfDIwukVZmYDQ0CpUB8xn9
	8e/B1H3S+B9OARcI+nyWr0PfWae5ZGhPcCQ3fuSkVfqbaHScdWAOBr7u410MthoawaVjKTJrtJq
	T/Z8ReRWGm/G5/8gLvFipaLCVuG9Dv6LjzQzWPUsbKN3r3jvFdBoVYSsY4poR6SM6XSShcIaRwy
	8Fbj9eh0LGOEJUDm2PNaIw8zPnocjqKNhhE7kSaAWzOcwqrZYsuBPMBvCY54DrF+OEVTuyKaZi8
	OvfMkIbo5/uYGgZIzMVLXhtfyN4awE
X-Google-Smtp-Source: AGHT+IGjF3zO5olkO3e+qglLyhtV8/fiPQvJfJagR7kjzGDLLowiGmKw/2gw8bFPRkTALVOwisqvKQ==
X-Received: by 2002:a05:600c:8507:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45a285ca477mr33730765e9.20.1755452459916;
        Sun, 17 Aug 2025 10:40:59 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2232de40sm97345715e9.26.2025.08.17.10.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:40:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-breathe: fixed location + added nativesdk
Date: Sun, 17 Aug 2025 19:40:51 +0200
Message-Id: <20250817174052.51506-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 17:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118984

* moved the recipe from  meta-python/recipes/devtool to meta-python/recipes-devtools/python3-breathe
  What seems to be a more common location
* added nativesdk to BBCLASSEXTEND

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python3-breathe}/python3-breathe_4.36.0.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/{recipes/devtool => recipes-devtools/python3-breathe}/python3-breathe_4.36.0.bb (93%)

diff --git a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb b/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
similarity index 93%
rename from meta-python/recipes/devtool/python3-breathe_4.36.0.bb
rename to meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
index fe3d1eeb91..a31bc4c849 100644
--- a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
+++ b/meta-python/recipes-devtools/python3-breathe/python3-breathe_4.36.0.bb
@@ -12,4 +12,4 @@ RDEPENDS:${PN} = "python3-sphinx"
 
 PYPI_PACKAGE = "breathe"
 
-BBCLASSEXTEND =+ "native"
+BBCLASSEXTEND =+ "native nativesdk"
-- 
2.39.5


