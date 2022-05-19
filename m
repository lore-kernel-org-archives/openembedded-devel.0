Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794C4C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:46:09 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.7681.1652967968371693940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TaB6BH6J;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id c12so7024668eds.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7NM4ySRPJz8R1lGSwgmz/morY/w5PtnmCprlyjKJxh8=;
        b=TaB6BH6JYPzjR6CWUIXhe2c1LjCSOX3qMY8uHIILfhLIBfMSw8+oIvW4tAM/KRE9MH
         QxE5g1+9KNzEOyPU7eTLpYDzGwse0CPvZd15QwKoe7jr9Cs0XSwA9p8QwADAbaFfkJUP
         /Z/39hV0BgCrH/UBkQIF7a76vK2lqGPkaXY8UMLRMGOMOzo8MEvgqenUUx1d1n51ZCss
         Lvz8mt1dHhkhZQ2PNA25ew31TQ9mt1wkUuD4bZzQoHPpfwmOIPXbbdv2t731tBqJOV1d
         rlQtprpCjXi31WG1hRciuzCms7GUOXL+eY5GIL4QqoVQ+C7Hz5cJ0DIbY2KubAJb3tzs
         dzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7NM4ySRPJz8R1lGSwgmz/morY/w5PtnmCprlyjKJxh8=;
        b=ix6UcnB+HxZYfZImyqt1wnBMB0RsOFdn4f+2Gu4kHxiwikUmKFXREu8wYVrCKJRxAr
         f6fDOZivwcMSI24Cjqg5Sy6dKBTkcO9sOj6aGJ2GSO+Lt3fU4ORtyXG0W/usI8ZsrS+f
         0HFina8JRMVi1jUxEb1PkKw4S+ZKcb7m84kVrcX+VSlp5xDUl95oBXxp56wKziYM9oVV
         w9bHZ/nEVKJ5WHZznf/veoyGaOc8xtQH1g+7j7zmQReVfBYoavSSWdVkXq8UHQMyx9Y+
         y164V5vsNc0D+2dcd67RDU2QjQbZwEjIr25PRMRYtS64k6mrc4AsmN8vJ7DEaxqDVlsE
         eJuQ==
X-Gm-Message-State: AOAM530PENThrVdxkkG2eePaBdaejv28ZH7B4NejTg8iCkSwprgGxCb2
	dQBpzlAXWPZaI2rXhxxla61Ln39fHkU=
X-Google-Smtp-Source: 
 ABdhPJxHpygoqehzG6El2acHiDGCSj0z6Genkljwf6RjMK4qrlvd/cM7PEgMWzivHMuxTYkZCIzwiA==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id
 et11-20020a056402378b00b0042aad8c628fmr5441317edb.90.1652967966642;
        Thu, 19 May 2022 06:46:06 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([93.68.172.225])
        by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b006f3ef214e4fsm2118305ejc.181.2022.05.19.06.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 06:46:06 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] sdbus-c++-libsystemd: Bump SRCREV to last commit
 of 250-stable branch
Date: Thu, 19 May 2022 15:45:58 +0200
Message-Id: <20220519134559.808802-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 13:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97197

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
index 6bb5f7abb..d5c799aac 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "1b003bbc806198dbdd57b405d968f30565495e70"
+SRCREV = "73be9643910c3f7f3ff84765d63060846c110016"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
-- 
2.25.1


