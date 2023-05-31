Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A171AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9117.1685521545500770069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=S2GZd4A5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30aef0499b6so2273548f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521559; x=1688113559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJRDBmLMwv5oyQUddw1MXvnfUUjNyJM8cdUsFzrqBY8=;
        b=S2GZd4A5KVZSS9fKau60r/9T43h39HWEMx5YU8pk1uv/MwkXcmJBZVjUCWrJhT7rc8
         E59BnG1lqVb26AIv+kPkjVwTVZ0fQe84b60cw/rWKayHiAucpIrWMhxb/HWRwsSDdn4I
         YXXKv/jt39aSvIpk/F3uzji3dlfWw2qi5j8o1hXJVAljzgYZUIHHcQroPX+rKBNVH7Iw
         UtszXc+F78ZQOdCXC++I+BcLvIt7oqcL3YD4RP5qK4PWpO4PqVZnczenIWJZ0RTMX0Hh
         b7fJ3TI7JWxacSLpPVJdpH+PSj7izqs1waFyBhRtX0pnXTfLdh+yoftxz/fMBbjfwc0U
         o06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521559; x=1688113559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJRDBmLMwv5oyQUddw1MXvnfUUjNyJM8cdUsFzrqBY8=;
        b=YqoNKjL6KhTEPlP0cc1yywguJObPQ39FgmWnZFKfDqL5jcpzuvW7d9hi4W3RWYAVXB
         BnFSuGMhgmuJv/FpVQvQqP/qp82brVay1ROLM1EH1FIVEqPWbgqSc1Vj2j2slaETsRQI
         gcWxWO1Np9ePkzOftAMlmHKk3IvkLzurj1awZo+Hm0blNSQVlklEwiX1MhzYsuyhFKao
         AaBB6Edhwy4VCIBCG4GKenjWgBUXCC3k0h9BZmZ9KgS0Ux/ss0GmQNs/8uYnh35ig7CX
         CXe/6QrdY+bt1u/7VTX5hum/V9rLlnuhrbS4O+yM5ulALhJ3iGvTgqfv68mdXeg0Do/P
         xiSA==
X-Gm-Message-State: AC+VfDy8hXXR0XcTfWWhfsLhYZiZSKzdmLkHYpdho9TKeCO8ANwb4iUV
	LkSwmPye5lLCO4rVoAaxdCBgWD4NQvfllxJHPc8=
X-Google-Smtp-Source: ACHHUZ5DBC1w3v4meOeC48ZUGwHo5h3v6+YwBrfbWKTqY7pcTdDbjM/tZVEYptczGgFj/G0TvTNWMw==
X-Received: by 2002:adf:e585:0:b0:30a:e511:e65c with SMTP id l5-20020adfe585000000b0030ae511e65cmr3433930wrm.37.1685521559137;
        Wed, 31 May 2023 01:25:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 048/149] python3-xlrd: fix coding style
Date: Wed, 31 May 2023 10:22:56 +0200
Message-Id: <20230531082437.10646-49-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102975

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Put RDEPENDS on separate lines, don't use PYTHON_PN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-xlrd_2.0.1.bb        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index da0dc2671..03c18e545 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -20,10 +20,15 @@ inherit ptest setuptools3
 PIP_INSTALL_PACKAGE = "xlrd"
 PIP_INSTALL_DIST_PATH = "${S}/dist"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-io \
+    python3-pprint \
+    python3-shell \
+"
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
 "
 
 do_install_ptest() {
-- 
2.39.2


