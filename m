Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC001C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:39:34 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.7136.1646134773537219857
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FD71o9An;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id d23so26298858lfv.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rIYPSLK+Fda+72vKjKPE4sBGrbKVmPpPtXrTxWgu2L8=;
        b=FD71o9AncY/4Eb6R3WNNBsL+Hq6a/Mb2QnxpKJBOd0NcluGeAZsI8xOpxaVw098rV6
         GIIVk9rNs12t3Qpa6oCLBJn8iVMSEpDt7a0Bnc/sl9p5W2naQUpC3dljEJHDohaHmHJg
         DjmQ7PsEJWg7rRbROASXFfy/lW9f5t0PsRrPOYy6uNtzgWlmMJeLmp25zUTAIEr21Gaf
         BQxNL20y2DgKKUGCtnnjMXELltuN3xYvcr5ABoFhQBCBVOtJHBelrCXw0QhJfc4zk6dW
         IMvQ+Vq1OYqW9En2OxBrLKGTOnBImBEqyiBm+B/7Gyxjh4Tq/TwkeVrIAqfVXtoQLBCC
         iIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rIYPSLK+Fda+72vKjKPE4sBGrbKVmPpPtXrTxWgu2L8=;
        b=4e+LVvSNh/McRnXkxa3sHrmKF1Ij/TS3z62IQfCle9oKEBz5mQGB1WjfKpcoK9jfk2
         M+KJtgs7SkoicxxkkAG75yCYvsrxVKV+KJTPwxAIv6RheggnSpScnSANzFZUetB6oZie
         PDV1F42w2xay2ixAE4PFpzpragHJyRLhm+KkHBT/IaO5oNM95s25/mA+OSsZPg2nrUUz
         uehRzepTzSvYLKxhz5agE6fCstzVOViEC9kF+Xz7Un0liuN9LiNjtbnNUBixU0nMmPoQ
         iV3hMGBamxsB+YT6L0Y4XBvDPr6jSax1a/XpQw1IOvFu00NCXia0yF6W2B1XhqHXHg/Q
         b07w==
X-Gm-Message-State: AOAM533Z/iNBlFu5wxt2cP727PxvTi4JzBbYbZur4FDy/pVtELOdqM7h
	3aG0iMdfscyaJ8qvzP4u2IfU1ax1rdw=
X-Google-Smtp-Source: 
 ABdhPJz9pam/moN3sxIhAfbcI4sTIDeUGVQdmPGKrVwM4/M15prbzqXCubLbWEGHD7OOxIESfzCG4Q==
X-Received: by 2002:ac2:5fe1:0:b0:443:4e28:7ccb with SMTP id
 s1-20020ac25fe1000000b004434e287ccbmr15240242lfg.30.1646134771529;
        Tue, 01 Mar 2022 03:39:31 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 m15-20020a056512014f00b00443cd5b013fsm1443933lfo.244.2022.03.01.03.39.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 03:39:31 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCHv2 2/3] python3-antlr4-runtime: add recipe
Date: Tue,  1 Mar 2022 11:39:25 +0000
Message-Id: <20220301113926.3204930-2-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301113926.3204930-1-samuli.piippo@qt.io>
References: <20220301113926.3204930-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 11:39:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95627

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-antlr4-runtime_4.9.2.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
new file mode 100644
index 000000000..6d67861a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.9.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "ANTLR runtime for Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c96f0ee5f5d08fd4387e5f00507bb13e"
+
+SRC_URI[sha256sum] = "31f5abdc7faf16a1a6e9bf2eb31565d004359b821b09944436a34361929ae85a"
+
+PYPI_PACKAGE = "antlr4-python3-runtime"
+
+inherit pypi setuptools_build_meta
+
+BBCLASSEXTEND = "nativesdk native"
-- 
2.25.1


