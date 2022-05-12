Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1C3C38A06
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1882.1652344931110252529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=mhhd9rUE;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 129so2606503wmz.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Rpg2SsKn338dEcWhQygxh7MqWyuAoOpA63xaZhYh20=;
        b=mhhd9rUEEmYK1tRw+LghLa9r+9ZQUzfwpUgKM0MAn8TpPwna3bKaes3oGmtHOr4/Hu
         12y+gtsidL4ngeidBWmL16eP0EiIyROOu/CSBdLoV2TqrgMQJ7/xaf1/dyhI3oqnHge5
         rMeEyGIKiQlTTT+UlOHWjQQkpZ+xSXU1PIjG961i8iY/nwei8tKJyI+hObrOjm2hZ2o1
         CCa/Ij3SeHCdL0XhMVDWb01g+UDKcIj/R0oCLtpaRSFlL53wozS5Xw07rKG0dBEo15W6
         +/UYgpdU5+KNoqBgR5Acl0C+9dkqqhKeHCPW5+GFRijFxOfBC6IO/G7ql2609wrjyOnK
         LuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Rpg2SsKn338dEcWhQygxh7MqWyuAoOpA63xaZhYh20=;
        b=JZ66u3oaTBFlDdwhWOjTkI26vwwUeyqoU5efeo7UgnKYqmvEluxmDVnPfr2h0JqSIp
         kH1KSrel4GCynW87YJ/oIijlj38g37iN1CmCA/xZpHlw4ZpEmXOhYX87yz01Db8cqvk9
         IJhUbUBXD95k0CnoQrrK1MdOqlwyZ17tJgYynxIc9JO5CRXHSy2WDAO37RmqQdxekXpD
         ZtW1BNLFCSaAGxBpkltW687Ui8ANMaTXQ4GpJfVFHU2D1Pq9UEXVtOTvyhjdRDvSrU85
         7yPHx7xqBg0IZjwFj7Ii2Pi4dEW1wfCUDJFC/s6zLfGM3KD7TP/K4z5+4Z/Xu/+KnFv7
         7Rmw==
X-Gm-Message-State: AOAM532+9WVI4tKV8t/UDEUwV3ROR3PhR6YWMW/AkSpjLUeAH0Ei2BUq
	fIZpBV/VgSR6ldk/mDASphIUpA==
X-Google-Smtp-Source: 
 ABdhPJz6xnObjTRlY4YlKHjP763Hp1VhJaNVsHSQhpAc+70HqpQbQyGbQxenMu6M4sLHPn9aBxfwhw==
X-Received: by 2002:a05:600c:214e:b0:394:31c6:b66b with SMTP id
 v14-20020a05600c214e00b0039431c6b66bmr8884885wml.31.1652344929682;
        Thu, 12 May 2022 01:42:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 13/16] python3-eth-abi: new package
Date: Thu, 12 May 2022 10:41:49 +0200
Message-Id: <20220512084152.1388464-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97061

Add a recipe for eth-abi: utilities for working with Ethereum ABI definitions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb  |  1 +
 .../python/python3-eth-abi_3.0.0.bb            | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41e30fad0..db3f8516a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -110,6 +110,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-email-validator \
     python3-engineio \
     python3-et-xmlfile \
+    python3-eth-abi \
     python3-eth-hash \
     python3-eth-keyfile \
     python3-eth-keys \
diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb
new file mode 100644
index 000000000..e1f220af9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python utilities for working with Ethereum ABI definitions, especially encoding and decoding."
+HOMEPAGE = "https://github.com/ethereum/eth-abi"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
+
+SRC_URI[sha256sum] = "31578b179cf9430c21ac32a4e5f401c14b6e2cc1fd64ca3587cd354068217804"
+
+PYPI_PACKAGE = "eth_abi"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-eth-typing \
+    python3-eth-utils \
+    python3-parsimonious \
+    python3-setuptools \
+"
-- 
2.34.1


