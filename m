Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.24984.1619986217171805805
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 May 2021 13:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WrJRF8OZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l4so4817956ejc.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 May 2021 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdYfAe7WFdJQzZt8ndXs7qEUVdmrj7088qp3T0WmA2A=;
        b=WrJRF8OZQutIK899gZD1Q/LnYh3CXTXtd3C5RZNkrOM6uwS18d0FLuRkQ6I0FEczfq
         FkCcARN/ZLYf2/qH/Z7KrH6Cc96EuLKavxf/EwiCg8evahAsVK9uL8OUeS0DDJK+K79a
         h7Fl8Rg7ufnbhL31kqe7LknxSc/Q+JV3xodfsjfQLneZFXnVJk+JETvwCtyqmIsuPy8K
         A+w3jPCwfzeGVRWGN36DX/oCJBpPXDwHdjh/T0TtPfgtHJX5hfC/MCd+EaoTis4fFdNw
         zUiEkl8uvLsrcTNtklHsUbqkiNSHIQ8r9d4cvKFx4ic18nig1Ihp8p9MMXtK9edPVC9T
         5vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wdYfAe7WFdJQzZt8ndXs7qEUVdmrj7088qp3T0WmA2A=;
        b=AxpgIHvHCdtJ8fVTOCvaB4hduBtYLn/FbJHyY9b/Z/LHKdGZiHMgtZLEW4QjFGH/2v
         VJBbJFFMEqzzSEHimzC3p+K+rEQ8OoU0ZHMcR/HSFXoqg734O6nTRk+HQsTiTEdj3CpN
         ihRjjc0Z1SGAy2a4/bZ3HkR3EKPzA2I+XrZbaugsBoLQO2zUwC4D4urkiouLc9vkFfTE
         1h3+LV0KLnQctHd89EKF6pGnjuvCMMs3j9Rf4kb3xRQdaZH7/u5FynrBfQFVxCCy7xzq
         F00aTYYEjZ6fteiW/S09p3Wy6W5dLjZuozYV+dNXiksWSFMDw1fjy85oUMTxfxmZftRo
         XdQQ==
X-Gm-Message-State: AOAM5325kTqZbWWfkuZKV08oH399b1uRIXLboZ0V8NjV6XIkgNRhmlJf
	O/UL/DwHcb/qLDcSzIXH+qN7mA5RLCw=
X-Google-Smtp-Source: ABdhPJwM8DTxNcrgo7UPqeMiCfAtR9JiR8cbshVPdc2atbuAmGgq+Z8nvG5wd1fBbwfoG63qQZnaYw==
X-Received: by 2002:a17:906:95c4:: with SMTP id n4mr13569312ejy.489.1619986215313;
        Sun, 02 May 2021 13:10:15 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3e2e361c96f36d2ea84abd.dip0.t-ipconnect.de. [2003:f0:7f3e:2e36:1c96:f36d:2ea8:4abd])
        by smtp.gmail.com with ESMTPSA id i6sm10920132eds.83.2021.05.02.13.10.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:10:14 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] zsh: reduce priority slightly to avoid conflict with bash
Date: Sun,  2 May 2021 22:10:06 +0200
Message-Id: <20210502201007.1044139-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| [log_check] Warn: update-alternatives: sh has multiple providers with the same priority, please check /workdir/raspberrypi4_64-mortsgna-linux/allgui-dev-image/1.0-r0/rootfs/usr/lib/opkg/alternatives/sh for details

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
index 3aab65bf5..aa372b70a 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
@@ -38,7 +38,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 ALTERNATIVE_${PN} = "sh"
 ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "90"
 
 export AUTOHEADER = "true"
 
-- 
2.30.2

