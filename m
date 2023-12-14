Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AA5C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 00:27:53 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.10171.1702513668359064600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 16:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-35f519f3ea9so18051895ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 16:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702513667; x=1703118467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS+gTxd5Nev9PHQTc4hzzs9d4SXG5xry6b7swzFnwu8=;
        b=XKhM+cQRXVtOCpO2nybuW/r78YwQ0OTbG7v4LVqQXEOMbfz0AkwQRwStnPLEsnfOUR
         pI4Qnzm9eHgnKVEL5B9wIA8YJbUNv2Q0ArCYL8BPA/aEBcNOuDIKseAdxmbAZROteMy5
         5mlpWR+F+8KC35iAxegXXSKfYd72PdtqCjU15JM8uDVel9LohKiK/CUGP0+bO0RQSrAP
         jsAuOi/qk7ylED/Kx89Xa/xTdZTqeWi0Nb5DsJcgMjFtNCkoqEEHhgSbVH2NGbHOnYyG
         KKUDhfnROvUdX9hhnDBlFIq7KyIzOfR7mGY128JMKXav4EppxywxbPvlUli2yRhrJOF6
         Vm6A==
X-Gm-Message-State: AOJu0Ywr5Ti1jv/b2I5ZAQEtJaAmChoscjy/toaYp/m+ep6w/AmRYzcs
	unHXXxF7ooQyRohTJHISIgOEWJZq99c/ng==
X-Google-Smtp-Source: AGHT+IFRjji1+gzfkY5FY1JksoTR3rM8ddViLMFidX78JGrI6DgBD7VNw1vwurYg9fuqFMjZQnIFQA==
X-Received: by 2002:a05:6e02:1e0a:b0:35f:7ea7:8584 with SMTP id g10-20020a056e021e0a00b0035f7ea78584mr224044ila.119.1702513666701;
        Wed, 13 Dec 2023 16:27:46 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id a21-20020a056638005500b004695b2d024fsm576282jap.119.2023.12.13.16.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:27:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pint: upgrade to 0.23
Date: Thu, 14 Dec 2023 00:27:35 +0000
Message-Id: <20231214002735.1137483-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 00:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107403

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pint_0.22.bb => python3-pint_0.23.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.22.bb => python3-pint_0.23.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.22.bb b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.22.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.23.bb
index 0eed33f79..82709ea08 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2d139f6abbcf3016cad7d3cec05707fe908ac4f99cf59aedfd6ee667b7a64433"
+SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


