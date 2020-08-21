Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.136413.1598022534160346414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 08:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UjVahLHm;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id l2so2256097wrc.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Fd5qlZGKmcD+ZR52m+8PX9pFVeotJeg3ihPjOBHitQ=;
        b=UjVahLHmkdQRm8B/m56POwjEFCmCaJNaDKcj18weJ/eSx8pVrcVuwbYaKAkove4nja
         PLYdCocedQYIUQvQP6Zbv20GTRC64uyu3xPd/LuuJIwnPB/e0uuRjt017D5AOodQA42A
         dlOeQ+CzgKF8xztTyrvxW4eiTlCq5ZJcKx9wUnrbBr8Pmc2UsX9lgvRugsP7ve1jhTVA
         0uF6986Z0ddRFT4w2zxsJQYD0EA9zC2jpSTZB/Fu3dhDkFSb7j/T9y/OVYhA8u2GYc1f
         Dxhb++vmEoWMuvsbT4LM5YVoTUimVj/J5xkYsVau4SvJGiTm2oDILtoB7Km8lP7zGIbS
         jOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Fd5qlZGKmcD+ZR52m+8PX9pFVeotJeg3ihPjOBHitQ=;
        b=Elk87gMO/b9DFD01HsnXERhzrpS333L5N7WWoBel+LuhPIy9mVO0tNa+Feh+Z4lMsI
         g7HrwFmVIsaBQLE4v47AxuwaPUoMQQMW+b/fLtbvjfDZp4SgSSlXdnq4dk4RZkT9lytI
         XD6DGYR+v9xi8BCZ0CjgZ2j6di5r4FR9nnNi156+IAPFWYJr71+u5dGGv7tozGjzYBQf
         78BRzv4VDY3eRVlPNSET9cP12dkUudEmLCjD1t+BjcjAAIDcZLPKgrGvBkRIxucJZEtd
         2ttMm3NWnj9QdddPgZywG/LLpojOdU4WYybQxqNb8C9chHjLZ8YYxaRHr2VATkGB/uyE
         t5qA==
X-Gm-Message-State: AOAM532V/aetuaUjYkLEkyd4oMenAcFZcgIy7cqj0Ofg+fagLSvqysJb
	+kks8nYlV4Ri38FY3phAI4Xl/WDOLaY=
X-Google-Smtp-Source: ABdhPJwqoNRuyVypjVnYRnSJs5141tOwVGJ0GPZaWT/Cpwxi026/Zc7NzV0MAPOguKfV4c5Laeth4A==
X-Received: by 2002:adf:ab55:: with SMTP id r21mr2985494wrc.332.1598022532270;
        Fri, 21 Aug 2020 08:08:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q19sm5188797wrf.48.2020.08.21.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 08:08:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] fbida: require opengl in DISTRO_FEATURES
Date: Fri, 21 Aug 2020 17:08:49 +0200
Message-Id: <20200821150849.1166160-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* dependency on libepoxy causes:
  meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.14.bb DEPENDS on or otherwise requires it)
  libepoxy was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  in world builds without opengl in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.14.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
index 29d0f64ac2..7ac302821a 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
@@ -19,7 +19,10 @@ SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
 	   "
 SRC_URI[sha256sum] = "95b7c01556cb6ef9819f358b314ddfeb8a4cbe862b521a3ed62f03d163154438"
 
-inherit pkgconfig
+inherit pkgconfig features_check
+
+# Depends on libepoxy
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OEMAKE = "STRIP= 'srcdir=${S}' -f ${S}/GNUmakefile"
 
-- 
2.25.1

