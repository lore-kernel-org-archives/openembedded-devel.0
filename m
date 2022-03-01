Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10DCC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:34:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web08.6313.1646127258038241567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JlSRWpFA;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id v28so21012498ljv.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=salGlr6vzwvL9WujyOxTSa0Yygbu3HyiCw4ATi5OcNU=;
        b=JlSRWpFAjYaxv/ljG1toZKL59cVXNN//d/Ujnr4F0KRT4Ae1aL2fBpu66d6KS5ZaKc
         f5OPQGp/fbliGNKMIjj+IVjRDCUelr35RrWlPDWcgXg+zm6XWvtxaq+p+18qiduayix2
         kOvVuUuvLl06skB96VdPxLCgXktlSlJZlA69xZ9L06+Hd2o/eTvMwJZXlPU6t+FkzdIU
         LtCjlXrIZ36BO+Xi1b9HePHL6Q7pvv2LDfTSh6sjPMMalECkDO8P68xgGUJprrC09+44
         UGaVwnYm7yKZKR650v1A1PreVMn7ICAgsQjQd5uFmlPTrdBSGXltOiUVeMbTfQNKTOSJ
         bTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=salGlr6vzwvL9WujyOxTSa0Yygbu3HyiCw4ATi5OcNU=;
        b=Pg+CfqWvpapK4H/eaCPih6mIXrw72H1bwTXVv3Ep4+hLMGrrI1Us0DoBmOu6X6S22V
         jA5NUyMsfTssTiUhi+SXBbndAAAcfTJOsgEjs2fz4ISsZEG2yciFZiBFqGDGM7QN/sqh
         SK9hDSpFc9lHk3ornuJiNHN/dhCQ/IgsbzsXOzFWtNQn5wtp7xHvA19p7zqgLDCyEGnS
         VCkbXogmLPOIbWSvLTmSNGZBfAOlszLSREpFKOAGvDWhTbDoC7syVHO6GUPfazg+TbAK
         I9C79tpuQF5y9Yp1aHyOp827EuYtFzijdhSD+tgbduHhQU4sEz6XiYv4BrZIZ83+QuIS
         2gaA==
X-Gm-Message-State: AOAM531iXbMz7C06m/gACF76/AvWj446MGL14wHLTFvUXJjd7c8qIUq1
	otSJti8P45vZ1oo1oJo7PIIPc7B7ZzQ=
X-Google-Smtp-Source: 
 ABdhPJzMKuAjsnwNih5PuX3r8Pmr+5h+uQVZ6NEEuXk9BTi0B69WQZ9ZDJ9viAUyzbMZjigNReCNEg==
X-Received: by 2002:a2e:904c:0:b0:23e:d7ad:3fdd with SMTP id
 n12-20020a2e904c000000b0023ed7ad3fddmr16981575ljg.239.1646127255910;
        Tue, 01 Mar 2022 01:34:15 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 4-20020ac24824000000b00443afc86517sm1395932lft.152.2022.03.01.01.34.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 01:34:15 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-antrl4-runtime: add recipe
Date: Tue,  1 Mar 2022 09:33:54 +0000
Message-Id: <20220301093355.2746877-2-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301093355.2746877-1-samuli.piippo@qt.io>
References: <20220301093355.2746877-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 09:34:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95622

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-antrl4-runtime_4.9.2.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb b/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb
new file mode 100644
index 000000000..6d67861a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb
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


