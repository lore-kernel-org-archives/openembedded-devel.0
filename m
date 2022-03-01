Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9AFC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:39:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.7135.1646134773448817185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHOcOUB7;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y24so26384566lfg.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1+V1IINUDvdQv1pKCcg6nGHx4fHJesZ+TXEFlCqJ5s=;
        b=CHOcOUB7/Xd7DevwgW8vxEah1nWIZ1m2XqcPTewOjhB60HaF9VShbn0b59GAF0sTQw
         VtqQnH3dWEy7ICrNuFNgv/QEa2ergBUkxQChEBKK+ud7zKBH5fx6uf8cx4A3IWDn94I5
         dpRYCQoU+oxCPvxjYYwZAJkEBJ69Wrrtw0WhP84wRBxbIZQo4NM4siTDRtnU58VqYBUW
         yNaS4EqgSIHcRmNfAExOa1WtdwKYbsgomeqg31q/8DSBe834ruFoFSDUniTzdCbJQ8CK
         s+YOybVz3IOraDvg/bwSpmc67d2QGATT8vuu4hp+717eiOAojcSIrOUkFmY3ZrNQTcXr
         2Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1+V1IINUDvdQv1pKCcg6nGHx4fHJesZ+TXEFlCqJ5s=;
        b=M2dqVbaVs0PrMRb5+hin/SEqdhXt9PTZnUD1YJ5NgUpJphWpG4EElgZMyTbJVeL7u1
         jwLFHXrh5EvU+7FgezhEZh5Xc10T/fqKUXgVJvojTgneiqiKHf6ALk0wXnh5G2UQFkmB
         1K1DG4MhRp/fNfjqP8UZZuYdXD8MaFZxJT3FX5RIXYpyPe2+gTWOhSiHj/zEyXIReqSO
         6/eTIi/Tn5+nnJ+NDjvrmhS2XN5D2Pwn81J8F+J11otjj0urUaWPEDOA18vigmcBLr12
         Gpi8DMwxpF1jK5RQ9q0lgS3SIhpW/J6HLT7zA/JKq/8dpKAmeYKCOpVAxXjrTZFL+Rwp
         rMAQ==
X-Gm-Message-State: AOAM531A7qUTxh1N/lXRswFfzTIRw4U9LxAJU/a5b3SdpwUKVu83gFGE
	WqNFh/yP2ivuPrazuWqMBuRUiRuOe9I=
X-Google-Smtp-Source: 
 ABdhPJyzYfFoBjQdyjxZOlCeYHW+M974ZFfOP/WqMDmw4Bbc74/UdVjOtK+eifZmqvLPq/XN9N3yhQ==
X-Received: by 2002:a19:ee1a:0:b0:443:40dd:cedb with SMTP id
 g26-20020a19ee1a000000b0044340ddcedbmr15415549lfb.28.1646134770852;
        Tue, 01 Mar 2022 03:39:30 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 m15-20020a056512014f00b00443cd5b013fsm1443933lfo.244.2022.03.01.03.39.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 03:39:30 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCHv2 1/3] python3-path: add recipe
Date: Tue,  1 Mar 2022 11:39:24 +0000
Message-Id: <20220301113926.3204930-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 11:39:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95626

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../recipes-devtools/python/python3-path_16.4.0.bb     | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-path_16.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb b/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
new file mode 100644
index 000000000..0fc0a33b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A module wrapper for os.path"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+
+SRC_URI[sha256sum] = "baf2e757c4b19be8208f9e67e48fb475b4a577d5613590ce46693bdbdf082f52"
+
+inherit pypi setuptools_build_meta
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.0.0-*.whl"
+
+BBCLASSEXTEND = "nativesdk native"
-- 
2.25.1


