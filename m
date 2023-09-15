Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BA2EE6430
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.15552.1694761656401859969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/Ij22X6;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bfc2b26437so27543591fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761654; x=1695366454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkXqpnYvi+QL/FB5dq65CvDV6mQ7Mc2I3R2EWoHhjgM=;
        b=S/Ij22X6G6rrc1Gj74JiD1HjLmteoNuWc8hc69+vSbFf4GKsI6PxhLbi+CWgwZW2Iu
         UcjXz8/HyJFwXN5F0Tml2jHpyH8S0tb6NchBQKBCX6NUd49g2bpYT4t8M+QR03Taj3SA
         SazQeM7XhbuzARTms/q5zINHAPmKtBOUWjaZ3SLGLAk86LnYuTNRwwBLuFRysmLCaoqo
         CtTN9TYNgRWyHcKogAHpFIKiyCRlSXTzz99mYgPnTYzzSl42vFnRLoMQdLomgJw24C4x
         j+HqQL1dReBoY9dQX/sZI2LIW9Eh8/nHLwJruC927tv+m5I041PdG5wyV2WE3mmhi6Qk
         hqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761654; x=1695366454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkXqpnYvi+QL/FB5dq65CvDV6mQ7Mc2I3R2EWoHhjgM=;
        b=A6ljTN08E1ydse8iNVp3VW4IAvA8h2FQA9iSIq2B21wVMsSHk/jmdApqqdqf7L6IuD
         YWTtqQkzb+J+xVumXBLDHTw/3d80d/iyn5QbHWKP+BIiyLmItjU+1WJljJB/j9mLBNw/
         A1Lod1NqdnSGh0CZTCulP/vyq/nK8ziEVTHH2RldhLskRWHqeObW9RQSdt6RIxWVCpun
         9Eo2YufqIZyQfaS/NTiGwfRjwOywgle+0HR58ueR/yBl8Dbk/cuwVq6HO4yU6yrkgGUF
         Wiy2L5OjV4jm+g4GqoNjfA+AQv4gsjDQyBiF/+Hx5z8u2mCoJcX5yxRuc1fTxf5vWX7R
         vgEg==
X-Gm-Message-State: AOJu0YwCICiW3uCZ/fHUbQXos1whQNRsqD/sAsN1xzpm1AIrjGQfa7w/
	I+7m1zjIovqALe1W+r6Xy4VT6zbkzg==
X-Google-Smtp-Source: AGHT+IGmaoVCdGpGoUKfIQqLb9FP6Lyl3IsxmLSBFmAHeuGC7BwMKVBZJis4ECpCP/dtwCIIbFUgYQ==
X-Received: by 2002:a2e:900b:0:b0:2b9:e93e:65e6 with SMTP id h11-20020a2e900b000000b002b9e93e65e6mr826791ljg.35.1694761654031;
        Fri, 15 Sep 2023 00:07:34 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:33 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 6/6] python3-apiflask: add recipe
Date: Fri, 15 Sep 2023 09:07:27 +0200
Message-Id: <20230915070727.4026-6-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
References: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104890

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-apiflask_2.0.1.bb           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb
new file mode 100644
index 000000000..ad946470e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "APIFlask is a lightweight Python web API framework based on Flask and marshmallow-code projects."
+HOMEPAGE = "https://github.com/apiflask/apiflask"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "APIFlask"
+
+SRC_URI[sha256sum] = "7ffe29e082c6cc76d8ae78ba2445b5fcd69092fac04f4f8cd23b1c887cb291cc"
+
+RDEPENDS:${PN} += "\
+    python3-flask \
+    python3-flask-marshmallow \
+    python3-webargs \
+    python3-flask-httpauth \
+    python3-apispec \
+    "
-- 
2.34.1


