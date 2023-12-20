Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E971FC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 21:56:43 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.33267.1703109394049752343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 13:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so3893039f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 13:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703109392; x=1703714192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syxPoq+HcRMLv4u23pOEYO5S9qT/uN7ebnv39X9Iy9g=;
        b=AwZwsDu/D7LwXmiWEZTymnmC+W0FeqyHSnWG9it8PFKh1XGBurEnWVsAq1APs87Rmk
         nFs3t1ATfqNk06KOfXJFb6zZ6w0I3EUjbivI2CDY05uwhByhDj0x8qlfb1eWDNAOYXK0
         aW0YYErt4nI7+IB+s57r9IKk89WNpXYdoQpWPjPl1laO9bxZNi+hA8cQgOElJzyePusb
         pt88TA59KHUZjICx87dOnJI97SeXnR0uoS1LQdUvXnb9NHcDsoKyhKJxlIGR3Go+Yah4
         kJAJXwi1f/QHXiSeimIoxdhgIbwmaf886YzjDqQ3x8H277CB70YIb7yCFSVZMplUYYY0
         W+jg==
X-Gm-Message-State: AOJu0YyJiRrqX6xdh2ooxKsSuwLLblG0sWW1MYI/xOO3IFfeRWBxkvQF
	unMAgk+K7n4u6FhSIJWbPKptJjtHpKqq5A==
X-Google-Smtp-Source: AGHT+IEPdRS8yazEf/jEDK52XZNmesOCQZkxpN3HZknPLBSAWBi7JyJ/HPtbb+opRVnpo0b5pCM4jA==
X-Received: by 2002:a5e:a804:0:b0:7ba:7db5:1e62 with SMTP id c4-20020a5ea804000000b007ba7db51e62mr1216133ioa.14.1703109391991;
        Wed, 20 Dec 2023 13:56:31 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bv13-20020a056638448d00b0046b68ee8fd6sm118941jab.116.2023.12.20.13.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 13:56:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pymisp: update to verion 2.4.182
Date: Wed, 20 Dec 2023 21:56:18 +0000
Message-Id: <20231220215618.3782492-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107676

Leverage pypi rather than git for the source download

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-pymisp_2.4.179.bb => python3-pymisp_2.4.182.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.179.bb => python3-pymisp_2.4.182.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb
index 69c774221..12bf6245e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.182.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "cc6391233c01362a1b4b483c4ea8e67f306e3459"
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "888e848494e04148c8ff5887f04154a2b40f3065c53d93f9cec65f7ca7171362"
 
-inherit python_poetry_core
+inherit python_poetry_core pypi
 
 PIP_INSTALL_PACKAGE = "pymisp"
 
-- 
2.34.1


