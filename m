Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC4DC7EE29
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.1310.1683046211974603411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=TrfgaXSh;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-5f95cedb135so18267126d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046211; x=1685638211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkm+UwBotn2Oy1ENr13yXOxIiWiWLkdjfvnGGl5u2dU=;
        b=TrfgaXSh8IR3iGsoXFSxdXArDihpkD7dadwE31h29t45AJczikixbmDlsx67Fvh0z3
         5RgyUz/P8PRm2JkuClkhRY9AY1v2vW9RMagKUt4FI6FVjmG/89DsJb/lwo+817smw0RC
         IDDqARYimXiWTY7qZJgMqLdAXXV4D3deeYIV3m44nQzCraA2eL8t17cu2iZkEtT8xQ/R
         880V27n+A/aVVrQ8dj+ygwGuCLIEcm09UqUg+9m+aLH15gRXSM7JlbIdARFdx/KFcArW
         dkX+G9/j1WWXbK7n5153Z+sDLxQYOKEfAflxExJCLqgumO9Ff3zjGRKfvKuIUoUfrDUp
         7yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046211; x=1685638211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkm+UwBotn2Oy1ENr13yXOxIiWiWLkdjfvnGGl5u2dU=;
        b=b+fsxio4WeT6NlNVH7QMJ3xq+VOPN7xxLk/rRs+eKgYdKSKIVdYGHYRJwCa8OvKbF5
         0QleHf36+YRtjKOPvZYQdcmPq93KdYu9IrcHKpNa5Esq2wxdaZISlmu2TXGEw+uq5c9r
         vpr+LHya3fmRcDFiV8z9SEvfZgkKtnLURnp1kZyo4krm0p9tXhYR1BCwqekoM9FR15oV
         RCYOH8b6g6P0HVAvG88FeqQqY0OgoHejVQofi7+EOmeXfKmz93iP21eC56SANoPxUsH4
         XtMWZLJXKDh7onfibubQ2D+YLoGhT8S+YEgmcNN2iiMld4Aa/K+0m7Ida3LG2t11jVxn
         avLw==
X-Gm-Message-State: AC+VfDxVI2lR04sdqICQA+lH8fLdd6pjluK0wJ/3DE9p3VuPj02+2FX4
	V6RxWM9QZuLe7OKdi/BApa9kPqLhvq3L6L/Vxgg=
X-Google-Smtp-Source: ACHHUZ6Oz3C2bqolF2x2QCLwG0HDi8fhWSWMneKYRFdzb8n/ib2atvkPiWzgmAjt/IAV0Hi4mjMQYg==
X-Received: by 2002:a05:6214:2422:b0:5a6:1571:1eb with SMTP id gy2-20020a056214242200b005a6157101ebmr6968507qvb.27.1683046210887;
        Tue, 02 May 2023 09:50:10 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/6] ptest-packagelists-meta-python: Add new tests
Date: Tue,  2 May 2023 12:50:05 -0400
Message-Id: <20230502165005.880470-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102271

Add ptests for python3-pylint, python3-platformdirs,
python3-pytest-mock, python3-tomlkit.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ef5d20bcd..f5935e4a9 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -23,13 +23,16 @@ PTESTS_FAST_META_PYTHON = "\
     python3-ipy \
     python3-iso3166 \
     python3-parse-type \
+    python3-platformdirs \
     python3-polyline \
     python3-precise-runner \
     python3-prettytable \
     python3-ptyprocess \
     python3-pyasn1-modules \
+    python3-pylint \
     python3-pyroute2 \
     python3-pyserial \
+    python3-pytest-mock \
     python3-pytoml \
     python3-requests-file \
     python3-requests-toolbelt \
@@ -39,6 +42,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-smpplib \
     python3-soupsieve \
     python3-sqlparse \
+    python3-tomlkit \
     python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
-- 
2.40.0


