Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD1AC4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 17:36:03 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.2042.1698773760797277689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 10:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=u8Qz5JSw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.49, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1ead2e6fab7so3902606fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698773760; x=1699378560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ESw3kRB7OBw5Fs/V14BBZp+6umYnVgRasI1f5Z4Dys=;
        b=u8Qz5JSwWPHpeLbUTSQAi0rJm8IFcljM2vfXucRJVlbjHuuuEB/1iE2quYdKYFoX+X
         HuhHso/cBV1iGLLpVxLTr/l650ECb44+RZOFq3czo+RqO2Y2TOm8/9Q6AIuOUxBMSiJh
         Q/Sy2AWvclJ6m+18LG4AnFDhdWmc1kCVoAE+VjZjF5yLxNzTN+/J8QRWb7e5qPhPIf9y
         6QyYtGfry7FXY90elr1hnWDaHQZ1hCDqv3xGXtUTzrtoCefYIzHGtuI/BfyRPwC7rsKk
         6enWFGZv/iUg2dxFqSOR5k1x+dsoniWSQgyUthxrWtMGzghITXLCv1w1wHXpil0Vcfqs
         6iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698773760; x=1699378560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ESw3kRB7OBw5Fs/V14BBZp+6umYnVgRasI1f5Z4Dys=;
        b=QMXZjg4Q/oZrBQiXktvoSsKE364guU6FhKA1mWjb4ipLbc10toWaEVoBIjsYj2IDNT
         BLmbHcvJwqYaXSdwGWB43O/yULrOW182v5LBsNRqYAmu26T1dZqq2PDAy3aPocCklHeL
         CNBEq18K6LBArOqjOT/bXM7bFia/FjVxwUySp+lHIizfmELKBXI/tNTvhPiAT35+iMQW
         6yMSWFMumwkCTevumpfkvxr6C3c9hLEhvNk2ZfIXyYGMC62au2d0f7IG60mDVhJiG+Xs
         tnlWtqF8REFAUGXr23Aogtjof6CeMGiuPOt5sKasgFjXNkbhFnHCplsq6O3l/WmtPoDG
         JvSw==
X-Gm-Message-State: AOJu0YzDTbkrqziUh9Snwrh8Y26IFh9Pgzx542rBYHTA9e4OLZV8sGnw
	4qzvemm7japhUwQGSiDEqGEmm+IvPPfj6HDK+sI86Q==
X-Google-Smtp-Source: AGHT+IHJ6B9fW6kQ+ez0d1AJy90t+Z4jlyQx4kPnDfMuJfGSCsrNmwlxZteLy9Pxe6IBH0fosRxubA==
X-Received: by 2002:a05:6870:cb81:b0:1e9:af81:54b6 with SMTP id ov1-20020a056870cb8100b001e9af8154b6mr20008048oab.55.1698773759809;
        Tue, 31 Oct 2023 10:35:59 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id e26-20020ac8671a000000b00417f330026bsm679984qtp.49.2023.10.31.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:35:59 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 1/3] python3-flask-restx: Add Flask-RestX Python Recipe
Date: Tue, 31 Oct 2023 14:35:52 -0300
Message-Id: <20231031173554.1786139-2-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
References: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 17:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105804

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit introduces the python3-flask-restx recipe, which brings a fully
featured framework for fast, easy, and documented API development with Flask.
It is released under the BSD-3 license.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
new file mode 100644
index 000000000..6b15e2535
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Fully featured framework for fast, easy and documented API development with Flask"
+LICENSE = "BSD-3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c96dd911c6d9e32868b6bc667a38a3e2"
+
+SRC_URI[sha256sum] = "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291305af7a613ce6fc0"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-isodate \
+    python3-jsonschema \
+    python3-pytz \
+"
-- 
2.39.2


