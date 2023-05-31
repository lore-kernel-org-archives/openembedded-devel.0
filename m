Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FDC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9050.1685521510292316342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=INmXYfm2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30aef0b8837so2318748f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521521; x=1688113521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zwkUG2DWHJYJfvYf+3Wz8yXiaxv0EKn6H8KxQU357g=;
        b=INmXYfm2phGfrfNWPkJVePL265vhpQZhgk/60BDZ1nwYk9ALZWbwxwnf+Lzbv/8fGO
         dxr8USwLZDV9a83VX10ET//a14URjunZAGGBLbZ75A47KcKIvOHvhXioOxwctXS4plR5
         vbnOhFSxA926abMYs1Qn/R8m2t9S62WOVieytRVtHFU69US8AFv/yB+UNOMEfYqWV53q
         CpvtR41QVnOvtOAy7b3vwlzG4cRYVZK/2IUCNtFziCdLOo38EiCzkOITF7T/i3Zq/cZI
         WM6akCeSrZqg5HIXdMTpKjfK9FIr3KZnGLvqXBaa15Z9R6IGN9/TVQ/7zkUtnOzHnJDR
         LZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521521; x=1688113521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zwkUG2DWHJYJfvYf+3Wz8yXiaxv0EKn6H8KxQU357g=;
        b=MDpAlMdjwR0RbUEolJmI3tRwvoV6Rhw5NcxQaOnuAjz+KDxu5bSz8EX3sAjmWKTjRq
         /9CL11j+qHKrPfE95MCXHsvsj3btWRd3paop3qzh/FDMvpEcgEPbnRa/PIEppGM+tVDi
         AC6jjK/SnVpbs/H2q6aY9WbA761HjXQAauPf1dmrNtGnjkV0WPIHJSaw8hJJhMoZzKoJ
         EfsBuSacWC5IfABRCQXBMyrOk07ApHvFVKoQYgw0mkfi+1G0bSfnQPEFWydYBMrL26yk
         Frg77FEoqqtwfbfLjgxQwAjO/ayMjcD7DWeAtB5mkK4wq1U4P4Rw3Eiegj8b2gm2PPxt
         GzaQ==
X-Gm-Message-State: AC+VfDwR3eh6SwjG/b/9wzpcNSgq1c2nv5aloEI+R9FFG0meCZUojTcL
	MnH5aisWw82/rHXlwQMLTLnekf6EfNo9L+9WpHs=
X-Google-Smtp-Source: ACHHUZ6HFqKRiNJMEqsY59DMxoj4IWzAdOOHkiY5/z1CfsP2xZgHwFWFLLamhWrFA3MOP3X4z7iLdA==
X-Received: by 2002:a5d:5544:0:b0:30a:e86d:17a3 with SMTP id g4-20020a5d5544000000b0030ae86d17a3mr3487262wrw.46.1685521521561;
        Wed, 31 May 2023 01:25:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 014/149] python3-parse: don't use PYTHON_PN and improve coding style
Date: Wed, 31 May 2023 10:22:22 +0200
Message-Id: <20230531082437.10646-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102941

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
While at it: make indentation consistent.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-parse_1.19.0.bb  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
index 2bf55cbaf..8db482e14 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
@@ -8,18 +8,18 @@ SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb6
 inherit pypi setuptools3 ptest
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    "
+    python3-datetime \
+    python3-logging \
+"
 
 SRC_URI += " \
-	file://run-ptest \
+    file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
 "
 
 do_install_ptest() {
-	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
+    cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
 }
-- 
2.39.2


