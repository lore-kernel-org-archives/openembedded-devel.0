Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505EEC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 05:42:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8872.1711777331938393773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Mar 2024 22:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/SBEixi;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33eee0258abso1415327f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711777329; x=1712382129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fwWgAB74WtPhpjuh4VMuqTV8bNcHRE8420gu6fYCkI=;
        b=O/SBEixielz7tQq92Aws6DsgLe81OFAGBFG7axsvxC2dr8BS+OEGNx1e4e4xkCUEzS
         H4IqNVwSF7rMHkt0BQ69MMB7zpDIh2jJVF8/oUw/OipZUM0pcjbqhg2tZXwsXdK1apNS
         o83+OVUtwuksD2Qa8uVYUtTD/Put4XLePSAZsJohqFnXewZNjU7K+gNnBjy+Na6MbW/C
         F7rtPb0De+dqp7jmXg1sFWIP3Rw/gSXTCMY6zTAkQ7HfBNGmp5nrZUwNLFSot0NK7nuC
         zJ+oBIwQWHJ444B00FTDYPTwCWNEytq+F0yr9aLcKydatFXvSW0Jr11onUr8fGIWTFtw
         2WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711777329; x=1712382129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fwWgAB74WtPhpjuh4VMuqTV8bNcHRE8420gu6fYCkI=;
        b=T//WEIHLunAzwbgFcjE2VJUtQLspecwwGvmI7fH4EU86H6KReHj4PGx2tEbCqwqg5K
         kpn12zW5IXHYR5DqArRy58mMPGtfK+ZBvnxKVmIWCHYxWMN74cCxzQ3SbHGGJplflrN3
         Iw9D2iMkS4ObSS8lObBQaOAaYjbQyY407+cr+PjmNH4ttHLO26CnniG6bEHMnLOxla1N
         LOpq0uQl9e3QQVuLOHroVcYDmNWiaWWqTQlaZLNSwwB2+wk5oykiLHJrqpt9wAHzlNNf
         LSwuBdJxi2CfIZw5VWwkwywNMq0PiVBuaj4ZgkDPWTaGmsshIOMFVz/MSkMya+I67Stm
         LRIA==
X-Gm-Message-State: AOJu0YyOssLDXuxzjDT/tgyxQnWo8Lgv0zrSeOFT87pf+i+oB8nZX5mh
	7SpK84OAYW8SDAH/so5udGKxx2uxKNbSikr7uw/F6nO3nuaPlcHNevLG15pDCfY=
X-Google-Smtp-Source: AGHT+IFqlN2UFoAMmwoxPHXGf78gUdQjkKvsKMEyvYpxvvtWbDPi7CYCpTVxTiD+WyqZAO5fuMMlKg==
X-Received: by 2002:adf:fac7:0:b0:342:8e72:d397 with SMTP id a7-20020adffac7000000b003428e72d397mr1964592wrs.21.1711777329219;
        Fri, 29 Mar 2024 22:42:09 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id bq24-20020a5d5a18000000b0033e45930f35sm5708406wrb.6.2024.03.29.22.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 22:42:08 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pydbus: Drop ${PYTHON_PN}
Date: Sat, 30 Mar 2024 08:42:04 +0300
Message-Id: <20240330054204.80741-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109685

Python2 is long unsupported, so we no longer need this variable. It was used to handle Python2/3 compatibility.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pydbus_0.6.0.bb       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index ac9b8e8ab..7962c4322 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -16,11 +16,11 @@ inherit ptest setuptools3
 
 S = "${WORKDIR}/git"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-pygobject \
-                  ${PYTHON_PN}-io \
-                  ${PYTHON_PN}-logging"
+RDEPENDS:${PN} = "python3-pygobject \
+                  python3-io \
+                  python3-logging"
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
\ No newline at end of file
+}
-- 
2.25.1


