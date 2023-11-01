Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C596C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 12:33:30 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.5846.1698842004890724305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 05:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=khGvLR6L;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.44, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d0ceba445so39165866d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1698842003; x=1699446803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaTRNQL1m7g2omCKTNm36xHJmAsoWfee5y3myRxUgo8=;
        b=khGvLR6LWIZqabLFwbD01Sv9OEq2EaxcsqZT2m5og60Wppwyuc7ZlAyWrJWFF2WcSj
         +QmV5uApRRNFNVYQFQYubYFQ1XoSU+rCdwWldHSz8wD+Vz+6YYIdtwdN9hgDeFZwe8W5
         1OfmuAqwffxA1Ah6kF/AXsIVkZH0Yj07J/nxuK0iSxqshnW44cU5SfROB5uVgl70/hm0
         Aaar6+tijw2UTy15JU+aUm2+2Hdb0X1VyuO5rVPaq7kSTCfYCbJ97ruRyoIK19MB7dlH
         7foKjeQ0u50w27zYrjn1LJ0SORyjdvzOxgIP23mso69eCNAxvGgYK8wVem0660dVyYPN
         O+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842003; x=1699446803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaTRNQL1m7g2omCKTNm36xHJmAsoWfee5y3myRxUgo8=;
        b=RLz98cWC1p0cZKAMBkRKu8OESWIhRtYZ0FKet8t7xjPcrQGoqR1USZt32e6PEZ//UY
         LtsVlt9fpF5G0id6YTW1/9krP+WbbO6dZZYTIxbzlOp5Hq4Cmn+JwGseynbI549TMt4D
         OtZPUIGaOoNtGvf+cikzCHltscunvpoAe66+gDFoSCGYS2qteIGGTVQnSNPWQmfZIton
         SxntW77REGOCWHQDkVaB5jg3ZdzlsZMYgxtLNn9yPnkI8Ezeje9zxWSV12YTHbtLVZ82
         hZ1Y1NjWjFk89rOuh45gbpyBRF/rimp0n5mSkRInlI/Bv0IITkXmGFZVZufqiOOwYBf8
         5MUw==
X-Gm-Message-State: AOJu0Yymkf24LUkqV2Hij3F2OON64L1j2zq0UCEn8VjIdYJzCIH0PHxo
	H/u2K/Yvy3BagIU7dKGN60Yoa3zGvqLL5uilDMb2Sg==
X-Google-Smtp-Source: AGHT+IGz4l4/BFTTCDL50UuQraYiB6XG8EYOC7hakjVUijJQOowlS4qMNrNpbu0vCnA3ljggolzEUQ==
X-Received: by 2002:a05:6214:401:b0:671:567d:b13c with SMTP id z1-20020a056214040100b00671567db13cmr13713405qvx.63.1698842003236;
        Wed, 01 Nov 2023 05:33:23 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id i5-20020ad44ba5000000b0065b22afe53csm1422601qvw.94.2023.11.01.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 05:33:22 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 1/3] python3-flask-restx: Add Flask-RestX Python Recipe
Date: Wed,  1 Nov 2023 09:33:15 -0300
Message-Id: <20231101123317.1806460-2-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
References: <20231101123317.1806460-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105816

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit introduces the python3-flask-restx recipe, which brings a fully
featured framework for fast, easy, and documented API development with Flask.
It is released under the BSD-3-Clause license.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
update license to BSD-3-Clause
---
 .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
new file mode 100644
index 000000000..cff797139
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Fully featured framework for fast, easy and documented API development with Flask"
+LICENSE = "BSD-3-Clause"
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


