Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1A5C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 21:49:21 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.11639.1640123359818611372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lBPX4b6P;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 207so463017ljf.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MNuYxQ5yKcvoCYC7ut/aNiCzYt2pG1xFGx1BNMuTFE=;
        b=lBPX4b6PTImUkhRPoRnr50W2fhQykzL4y4T7bCFSLQ6ZBF0/Gy8T/XCWtKXFXjK0Pj
         d/uTbOIKZjVGNtnfUqbu4i04Wo4nYRZMEAbFdLk1AK7v8WzqXdly7xjCbSFoVL13TaKu
         mV7vCmBh1yQvdHNRKcQ6zdphJ4RZZpVwr+Zc5qK2Sp3qNMo4oCeulsSYbSYfPGV6T+sy
         stroK577e0BEFlsaMxsTLN31/DGtyeNcIMKWQQVwugmkvyXAbBDrtq3uGU16RyR3FCOt
         fH+EZj3Jlc4EC1uVFcwKXwTcHi3h48/3q+jMgcg9AGT4oi4NNhiwVRBhadLoKtOYWIok
         wYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MNuYxQ5yKcvoCYC7ut/aNiCzYt2pG1xFGx1BNMuTFE=;
        b=7+dtwXACxugrLb2rGsKb/giQA5e19GiiyD1Rkhb8HBPcJ97l9k9IHLX9o/XsxbSLjp
         mYQkl2LbkxakzRTkDKKsOO3GjZvpQvzEpGE16Jax5e09mn1zMITJqYLZkkruWCno6iHN
         sF1vIRI9eQj6giW2FzCFofk4vmD79gc4QFSZTyxyFOnMBnMj1Q6PWrEKnKsym721lF1C
         dqjs4D20+6ZhLwJ4bSosvBOvh9ws/AlrQT1YWgr4QO05Pn358/7+oDyyHhTCZFMmPhaP
         0O6O6H+sTKadGrJ2Dy4I6HJf17JCUNOkmQQ32mQ0LNEyKJhhb5/fvHC8NHiVtejlRIXt
         cdjg==
X-Gm-Message-State: AOAM532vYDPy1/tuzx4IHBUBWENP/aHX2KuO/1pOqmBQ02SufSfTsW7U
	i79GqlNg9l9vFmzJc0G2jdoPTYz100CqhQ==
X-Google-Smtp-Source: 
 ABdhPJyW8Jkz8WEt1m+ME4vePBKmP7bgA+z5jzcklvXmyrLwD7eyAb8aSMPpNmt6rjMbQ4Wxp3KkXw==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr245997ljb.214.1640123357739;
        Tue, 21 Dec 2021 13:49:17 -0800 (PST)
Received: from nova.home (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id
 l11sm19708lfg.248.2021.12.21.13.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 13:49:17 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <clst@ambu.com>
Subject: [meta-oe][PATCH] Add pycups - python bindings for CUPS
Date: Tue, 21 Dec 2021 22:49:14 +0100
Message-Id: <20211221214914.1882209-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 21:49:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94470

From: Claus Stovgaard <clst@ambu.com>

Used for access cups and control printers from python.
Placed in meta-oe together with the rest of printing support, as
tools like system-config-printer depend on pycups.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
---
 .../python/python3-pycups_2.0.1.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb

diff --git a/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
new file mode 100644
index 000000000..dd00f444e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb
@@ -0,0 +1,19 @@
+# Python bindings for libcups, from the CUPS project.
+#
+# Copyright (c) Ambu A/S - All rights reserved
+# SPDX-License-Identifier: MIT
+#
+# Author(s)
+#   clst@ambu.com (Claus Stovgaard)
+#
+
+DESCRIPTION = "pycups - CUPS bindings for Python"
+HOMEPAGE = "https://github.com/OpenPrinting/pycups"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS += "cups"
+
+# See https://pypi.org/project/pycups/ for data
+SRC_URI[sha256sum] = "57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90"
+
+inherit pypi setuptools3
\ No newline at end of file
-- 
2.25.1


