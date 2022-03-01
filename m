Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1293C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:34:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.6312.1646127257428864264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m4k+appV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id y24so25867039lfg.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1+V1IINUDvdQv1pKCcg6nGHx4fHJesZ+TXEFlCqJ5s=;
        b=m4k+appV4lG/JcBw8/ZVj0Sh3lciX+0Bvf9wBFUkJo0SNnkSebY8iVvjRyX92qOJkf
         j3RfieqHwxRXKDSExlqhPSsHd3RbKYhYrIf3RT/as0XLOkEWPblSiYf3vfsUV96BMDkz
         DfAhm37UsYdVsD08VLWpCGjYttm7DPReHUZFpHAbHwiNz78RRYPg/Q1fYovnyHC6j3Kz
         IRI3tXG9KxGcF2IsubLzKpGfusTppmX/rKmkMjcinZWIAwJrxqLbOpo//Bk9t6YV2SO1
         8aiyZgYRP2xr3yOqCork1w+4mby1Mwmm+UVYrlDMTz3qM3ZPWBcAO7HRd/nV2vvSCe15
         29VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1+V1IINUDvdQv1pKCcg6nGHx4fHJesZ+TXEFlCqJ5s=;
        b=RzzQJNBK704/vFGX4ef+x0pRu14lszOAZICXqKFTYfs6unMDHmkQNKB9MLvX8DuJj+
         Y9dsOB7lU8GCvYK+hidQL1mTVdObMFBfEp2CVXOP2XejBc23xfdDVf4iqAaUNBC0pB6v
         uDPB04YAH/wGiBiH8NSEz/Gh0xPcPykMGxNfs4rqPbUtvE1Pkak0Yag6+lCeWiqqGT9z
         1rsAoSyl9+ytfnpORyIp4enylN9A6AivXQK2ZfpmHy2gB8ROiSxxMzrB3QPUZ8aMyTPn
         MR1iF7bS/WL4D/K9nkU0eM5FOz3cMQ6WgEPgtI+bvKdhsPxkFv2o6gD/vB+toHmy5Z07
         ntEA==
X-Gm-Message-State: AOAM530gtT+UrqsWCdMMV+UNWcsssYSAve4E/qgnE7OSGNpkzM/5KS8l
	Xl3wcJEPIY0RQ7XpRLpmpTVeldIVGb4=
X-Google-Smtp-Source: 
 ABdhPJzHDLXGXDIDVVNHiZ9BNAfjL0E4bKFbvTo1qA8Qle+ySCduJbb9bXUZx2YN0Ze96BZdry1Bpg==
X-Received: by 2002:a05:6512:306:b0:443:5e0b:1d9f with SMTP id
 t6-20020a056512030600b004435e0b1d9fmr14651239lfp.122.1646127255019;
        Tue, 01 Mar 2022 01:34:15 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 4-20020ac24824000000b00443afc86517sm1395932lft.152.2022.03.01.01.34.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 01:34:14 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-path: add recipe
Date: Tue,  1 Mar 2022 09:33:53 +0000
Message-Id: <20220301093355.2746877-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 09:34:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95621

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


