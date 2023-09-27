Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3772E7F15B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 03:40:34 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.10145.1695786026655020382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 20:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77428510fe7so326976085a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 20:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695786025; x=1696390825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuvEGxN/BDRs4Bavhz+u0wBl4PBolAGapvxtmT3//CA=;
        b=Dtn4Un/EdZWk2jGwG9jUILKGuQQtl+R8Oq3dbBU5+kPjvR0Jkj2Ffr4wkTH1kbrPNO
         PoK/14bHW98rglXJEznOdMtLHkGJ7fwH5e/2vTQJkf0x1Q3ZW2aAI2WwVRRNxBW7T6bg
         1UmI2cu5MgTiu6RasEKXvKALuoFcKjxPBbw6RFnCM02nsy/+DfZicIp9gj6AEZuTnejX
         IaUZqzKUCUU/x40ikq+31skUggOs3NGXLJrsf5UsWABGiplrYlNUiEBnBslrTFNlaWqY
         vSNuRvnfY/hrxPCkE57gZ1B0++mlbMlRndIpJvknHhqKipsj9OeVUfbqm+1UjGijFo7V
         yBzg==
X-Gm-Message-State: AOJu0YwLWsD56l2tC59MiVzeXiQVbuZdBuj6j2SGmGdKUZJWn7YsU/aF
	ehFe2UlX1yUx0p36agEl7dvS5WcbBwYYHA==
X-Google-Smtp-Source: AGHT+IHO56nk4H0rMaO1RNN/kSbuL2/2+P1+DgrCOBcXaURwc7iXcxgyfzjxlgDnQ6QgyC4vLHdl6w==
X-Received: by 2002:a05:620a:1a05:b0:76c:ea67:38e4 with SMTP id bk5-20020a05620a1a0500b0076cea6738e4mr753492qkb.12.1695786025308;
        Tue, 26 Sep 2023 20:40:25 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d26-20020a05620a137a00b0077439a5400csm1514233qkl.62.2023.09.26.20.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:40:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyasn1-modules: Update version 0.2.8 -> 0.3.0
Date: Wed, 27 Sep 2023 03:40:13 +0000
Message-Id: <20230927034013.1618076-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105153

Verified license is still BSD and updated the checksum for spacing change

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n1-modules_0.2.8.bb => python3-pyasn1-modules_0.3.0.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.8.bb => python3-pyasn1-modules_0.3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
index d6a2749c2..d158876fc 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
@@ -4,10 +4,11 @@ DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
  data structures (X.509, PKCS etc.)."
 HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[md5sum] = "107e1ece7d0a41d782f69f8a95a4d9bc"
-SRC_URI[sha256sum] = "905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e"
+SRC_URI[sha256sum] = "5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c"
+
+PYPI_PACKAGE = "pyasn1_modules"
 
 inherit pypi ptest setuptools3
 
-- 
2.34.1


