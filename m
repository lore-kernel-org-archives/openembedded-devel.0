Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB725EE6428
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.15548.1694761652658355982
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LekqwNol;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c93638322so392432566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761651; x=1695366451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yR6MTggiao6ujYCssIvIb9B4FcmuJn76OVihpKB58NA=;
        b=LekqwNolkgwXC4x1qYkagSDmKx58AURaKoCJK+1gMHz7ji9ytfXD9ICucvTxZk7BBv
         JQi7A/74n0ai1k0P31TyGPP+55EPl4JssTgXAmkzPLxjRosnRwJcPZUWocyMm9XxPPgL
         l6FXVNMMj4LqehQbSMcnZ77fkr5Vi1aKj5Us6iS0QSBwx93JMcfH/oKcYDnhRbT/lu+V
         cuY5rCH02IwHYJXxqyM43K+9BvDfE0woPkKfz34JiJYY54k9cEEvv7zxi/ClBAtcUhen
         Vw4riYFXKX8foXNfJ/+op9n9MRwdv/0JEuxw9sTJqzBMPwO+zo9qVzZUrmlUQIKXFmoM
         CPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761651; x=1695366451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR6MTggiao6ujYCssIvIb9B4FcmuJn76OVihpKB58NA=;
        b=kYpO6C51YNGXO5eEKNpHT3Q8voTgRUz8SkjzoL7qrW/87YYEX6CgoPdxUFiA7AqD00
         tBzz8aj8op/EI40DA853rnvrfQ0Rwd7xx/ug6hr+vCnJS+YzQrrSjubc8co/m6461r8P
         DAo5k7poFeSWQlWjitREvxskRQ32BFfgtNFuUGIVWtHhOeVTmHQflGMW1rG9K6ow20F5
         m6s5Gog6X5RX0Q2WLl962wfO2TNy0CvXYg2bfeharQwEsp8DQxe0PaugX+ZDwLZR4jRY
         L9lS429rbeh/joZZkkM8fc33GhO4U2nYU/93AeJcB2iMVr8CtZAgyaHRyvUmFQW/wTl+
         ErMA==
X-Gm-Message-State: AOJu0YzIyn4+RxB8Nq4UAqeNBzOs9/bf3CIyi+U5MuM+Auh9cqRKhhGp
	m0+ow9Ikl3YTBiOkFmQFwj17evHc5w==
X-Google-Smtp-Source: AGHT+IH9JPj+uJq2WNQAGHy5C2CodJksWPCX/dZKTf4Jru41hyweZZUPsZv/j2akvW6A1gvgxndCdg==
X-Received: by 2002:a17:906:5a5f:b0:9a5:9305:83fb with SMTP id my31-20020a1709065a5f00b009a5930583fbmr1062353ejc.34.1694761650665;
        Fri, 15 Sep 2023 00:07:30 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:30 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 1/6] python3-flask-jwt-extended: add recipe
Date: Fri, 15 Sep 2023 09:07:22 +0200
Message-Id: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104885

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-flask-jwt-extended_4.5.2.bb   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
new file mode 100644
index 000000000..f55d77174
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Extended JWT integration with Flask"
+HOMEPAGE = "https://github.com/vimalloc/flask-jwt-extended"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9166295d7c482b9440bbb2b5c0fa43ac"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Flask-JWT-Extended"
+
+SRC_URI[sha256sum] = "ba56245ba43b71c8ae936784b867625dce8b9956faeedec2953222e57942fb0b"
+
+RDEPENDS:${PN} += "\
+    python3-werkzeug \
+    python3-flask \
+    python3-pyjwt \
+    "
-- 
2.34.1


