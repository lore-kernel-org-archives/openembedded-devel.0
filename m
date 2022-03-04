Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FB0C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 20:03:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1137.1646424188365972053
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNFGPT5X;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m22so8256487pja.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+arrONJCPYiXfTfwDryF8mCv6FJafoMgheuXhZCdx4c=;
        b=KNFGPT5X+ppHN4t+zplcdvlJYHlY3Ys0vjZ/PRD59xLJYhVvv0GkQ+5iiLfsM7+d43
         vvagmihYAHnf07yoUDmnrTFbXaPFyyLtckr398LDm6BVdrm5+8hO9c6Y1G2O7/ATurOO
         mbm8ZtZ6vgScMZkVqRLpjO0Mt2IeG72Df8g85ng8T3A9lo2QuMaJIAYGLYdDvyF/cV8c
         VF1i7nsl9pZkuSkUuK+hi8cb9iGMXN5FqsDatUocT2bMQZonJX6luKnDaODFl6ZGI4EN
         J+l8/bLX/U7onAsiB0Rsh7KXFlVvH10oF4Sv2IZJlwlgEdKNOIZWHkv7bLBEzEhCE6S1
         c4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+arrONJCPYiXfTfwDryF8mCv6FJafoMgheuXhZCdx4c=;
        b=o9kAIf+4i6tIwqvvYkz5lwAy85HAdCMmKuqMeL3/YN1ab4ILIkTb5Qx+t/zQg2L95L
         iQh/mITF93viMJAfwp4xGWfSv6/2x99/e8G4dAcid+29IH90MUxONsCLQNDTzmY/0PkG
         xLURoideZkBt1Djy9G28nlRK7wMy5kowaFnFg9Go7bHOd9JA37JlFTkiFQwBMjPcSWcg
         XBj1uWMzyxQpv0+tOype98aP769uC/BVyjbSyzuLaf22eN3pdLe0yzsO6MgQBMW2b+6v
         he+klDXyU23VWZuA9sag3Yna9lcUPDKf4wzu1IMALPu9G2LiPljw0oEJfnbSr0E+099J
         uELg==
X-Gm-Message-State: AOAM532c5QgFvVxWF9AQxYS5BDYCTpELuUSk8Yy+q4duQGQEae0LDCea
	5wfKrxE33/XrRogDJMnjpFiCzYGowT1TTQ==
X-Google-Smtp-Source: 
 ABdhPJxGz7hUW5LBsCGYdOIH/chj7ZEIIRl3tfq8SaWhBAyPOf6IuJz3/eJc+8OZ2wTLbkA/XD/5GA==
X-Received: by 2002:a17:902:8a97:b0:14a:c625:eb2d with SMTP id
 p23-20020a1709028a9700b0014ac625eb2dmr48160plo.26.1646424187591;
        Fri, 04 Mar 2022 12:03:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 s21-20020a056a00195500b004f65b15b3a0sm6624051pfk.8.2022.03.04.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:03:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] unattended-upgrades: Inherit setuptools3_legacy
Date: Fri,  4 Mar 2022 12:03:04 -0800
Message-Id: <20220304200305.2678538-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 20:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95793

It does not yet build with new PEP-527 packaging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unattended-upgrades/unattended-upgrades_2.6.bb             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 478d3691a7..2196266b99 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -13,7 +13,8 @@ SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools_build_meta
+inherit setuptools3_legacy
+
 PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
 
 DEPENDS += "apt intltool-native python3-distutils-extra-native"
-- 
2.35.1


