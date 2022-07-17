Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52B7CCA47B
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 17:31:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.18062.1658079112263202809
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RAV2cBaV;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id g1so12502706edb.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PtW58ThXdP+Ea8sqBQvUAMpaYtoS6KCrH72vVPbCmMg=;
        b=RAV2cBaVaUv9xDnD2loHz2RX1hUELAedsR0j0vxtmcs139OsfFAsl1Ae9TGh0k3lEQ
         5ro+swBMGvms70MMNL+bI0f7O/KAiXXROsvnPfQLS46XvnB3jcWXYPqUSJwkiVkJojzg
         QKVagv5RDl/2biPySN999P33HOAmhStt0Pfo56j/aIwqR/AZbEW3LOsTvXVufoU7bAjQ
         pZHQO63TfcR3S8ST2XpZHuf2O3kN64n19TGThdqp/mBFKOO+V/EPVcNRiLNcuqW8SLFi
         mJA5KESepyUCxE9wFu6wnj4yACpMqvEPuuL0JeCMihZ8Hf5nqbgRl7uFQVK0AXpE2uHe
         6W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PtW58ThXdP+Ea8sqBQvUAMpaYtoS6KCrH72vVPbCmMg=;
        b=NnoqCnCQGC99C7EZh1rUjp0UivRwqp7LSIJYY0M688X5W4pLb/boZfrLOD3pAAlvqJ
         WDMLgusNJ57lPe6rLEpefzRA/F+CUi/7yoWX0CWQkNw2dZXMTMGctIiE5VbLUEeEBF5U
         2WUywdJfnR5qNFbAHvk1CVP3Hs0GUUQsoT6NBhgfMyssY09U3F5LVrWKyngwtPti9bMD
         glzZMncsY++GClK8Bt1M9P1NOlsazoHls4dA91jkkjZier/1y81sHsYPhAN2j8IXyCZJ
         mdxfiO4jQbgbyw2kwJRgg3sXI51E5mlmw3QAXlE5jhoSH2r9BNDfpV1EpVO8CtJz2DZZ
         rjfg==
X-Gm-Message-State: AJIora+jSi3/nlL/4dkOh+x3ObSY6DBLQXCE18vUKe5x91zSDWt7vRbS
	1xj+zCFlM/UzCaRYGXNnrnOFGsQyUt0=
X-Google-Smtp-Source: 
 AGRyM1uJI2bxORC0N9ccDhHnXiLywqSayPfENVz8cdvrqvbarwIqiazh6Wb5Wkb+iDmrMzly74YccQ==
X-Received: by 2002:a05:6402:e08:b0:43a:f435:ff1a with SMTP id
 h8-20020a0564020e0800b0043af435ff1amr32053560edh.123.1658079110499;
        Sun, 17 Jul 2022 10:31:50 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45r07ru9hofylq19.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:fdf0:ba80:8823:350d])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a1709067cc500b00726e108b566sm4587591ejp.173.2022.07.17.10.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 10:31:50 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-jsonrpcclient: Added the
 jsonrpcclient Python package
Date: Sun, 17 Jul 2022 19:31:34 +0200
Message-Id: <20220717173136.2777245-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Jul 2022 17:31:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97860

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-jsonrpcclient_4.0.2.bb          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
new file mode 100644
index 000000000..26ee3786b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Generate JSON-RPC requests and parse responses in Python"
+HOMEPAGE = "https://github.com/explodinglabs/jsonrpcclient"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=10f3d7679914df805c98fb351172e677"
+
+SRC_URI[sha256sum] = "c0d475494b3e1b591ecdee7883739accaf5695edb673f16b7383b8c6bbdb1ca3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    python3-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


