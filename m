Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CAC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.4369.1634339058808474512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=6hOeZcmO;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id t9so46971176lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxTN9eqTX4mPW5gLXpaLEFW6zD09XWTX1+XJSBP86RI=;
        b=6hOeZcmOrLfm3xd30AlFHVGozKZOJ3gg7NSL0imV7/CkNCfjf/5ZjbmbBZsi5tFUoZ
         ikVgSP4+eEAuccA3ucTmSAmxq6hHt7E+aH1nXqWdRAL2kt5Sr3kIH2DI1MeuoV/3d/TF
         +GoVvAZi7Y5jC+Mbnr5PBTDQEGnVraPTHHOW+vmmgt2Mz17mZvegPU73dfDLldn9Nb6S
         kCcRvruKjfBmFTg5rf3s5uYtfMbU299Q05kLGvGEDBkBVP0t2bhLIks/fZsJEAq8D0Y/
         S+/Bpp6+2Xne6qqhgv+GnIDuVwDXIbK9nv1KYs/37OR+NKCLTAQ3LsI0crLhlFpQPrft
         MEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxTN9eqTX4mPW5gLXpaLEFW6zD09XWTX1+XJSBP86RI=;
        b=X4BWxfFJT2j9OJPx7cTCfRzRbU2sEQYtqxrRT5jJUgk+z/fDBYZqbiCG2Sh1F+JGjL
         2qTESBuNBozUO3nVPeW1vCkZPL5J5CTaXmr1B7HdM+501y+6mCLKfyZW2tvNn0nwwuik
         FYp4G56uMmMQfnfeIunZRnpkw9B//M6/cxY+ysadgNUkDxIKk9Ge90/n+/acgI2xJVWq
         /53DmEM1G0Lc+B7Md2HomUElqo3XCCwbxRC3oh4n96DqVuN1aNKa3EDz68BZVck2NDQJ
         NDz5bVOnkVTpSI2G9zwSUY/ZbswR80YukOxpRco0Mc0WaEA9Xw4CcrZgLj58dJQ91MMU
         fC/Q==
X-Gm-Message-State: AOAM531IXrjvZ2CERyHV6rFNx6EciwlIyivUj8ijRYvvfZkXmlWIPA/P
	ezSwqvU7j47KJgpkpNFHBsx8GOaomS3Zybvt
X-Google-Smtp-Source: 
 ABdhPJyXh07xCy3WjDqH6dAs0zZ5IILIHIGawaqp1t+tdCGE2bixzruX6pzUOJ2Xe1f6mrug9ePsTg==
X-Received: by 2002:a2e:83c8:: with SMTP id s8mr16042938ljh.189.1634339056125;
        Fri, 15 Oct 2021 16:04:16 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q189sm700047ljb.8.2021.10.15.16.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:15 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-absl: update 0.14.1
Date: Sat, 16 Oct 2021 01:04:14 +0200
Message-Id: <20211015230414.4166792-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93386

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-absl_0.13.0.bb => python3-absl_0.14.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.13.0.bb => python3-absl_0.14.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.13.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.14.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-absl_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.14.1.bb
index 2ebd358e5..270dbf200 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.14.1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "afb3ffb4b59d53575e8eb073c3a52803"
-SRC_URI[sha256sum] = "6953272383486044699fd0e9f00aad167a27e08ce19aae66c6c4b10e7e767793"
+SRC_URI[sha256sum] = "eb0383bd431c0d7b2320179904cab00120a10977e3c9671d99efbbed17efb55a"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


