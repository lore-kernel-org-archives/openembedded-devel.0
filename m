Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E54CCD188
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.6825.1759997646582558949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e6icovK8;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so96233666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759997645; x=1760602445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfy5o0K8Jq2aS9im/73fut/TRp0AI2HGjVO4bn487FY=;
        b=e6icovK8O8xdmxjYZf2w5t4tx3SqmD0RvX12vDJLYq80AQ6cHgNNWrQVEwxCclW+Mm
         RUnUI4bnM66wncDBNPpgdwSapSJprPuzwJLGcRdELe3MBh8Jk97eFsAkfOKTlxzu8yk1
         wCo4fqcfFdwhJwUBu8hqZRKigcW97mFBD5iyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997645; x=1760602445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfy5o0K8Jq2aS9im/73fut/TRp0AI2HGjVO4bn487FY=;
        b=hnn9cUvv5bVAE4cKopcWtcOv5xDQfG7+v8u40qoX8cC/UlpSyGIvdXka4n7dHufOwa
         LCTxabPbKCzYnGKn5JM8JwBCxJ7A75l+9hb0utKY1E5Jt/u7roqr/J3k8/irzVfYDIwG
         WhX6rgIjGFyslqhMzlYHC7BrrNeAZbCZLvEqqKo9/ZpSY7tRB5SDrX7o1T1CJ1+ci+pA
         zxeAVHohVyh1sL9/f4irH7qwQ10ofdxl9gkqAFPsxmrkf8MsH/8X7ihCF8G4zBPlBKRs
         mqSb2RBDbnQR5rgO/XPISQ5e+pfQxhGzowlkP/hEiD/7qEiNGCKz+vrbMxGLsDGPO2+v
         Cm5A==
X-Gm-Message-State: AOJu0Yzd3E9jsNFajsuUKTy75ls9lFIm2Zvilgu1wZVOQ1xrJpWWhR3Q
	GSHYJGLJ+PGj5BezaE1hpjYwXid7nYqi7d5U0Vc1/3FmdjZy5gSry7Y1AapbNokLGSS0cVYwMlK
	MKzQo
X-Gm-Gg: ASbGncuRspBTu2N63Qhc4r0HH4vj2veVlLgtOykNBuy+K8QH8a4kTuRVttRpFZ0CWs6
	8dHKR+kKba9AB36ou4bhvU6ZWnoc1Rj04t6wrIpWHcc9YlJfSSI9lhVccIFZ+aZsHbTembNkAmS
	ulRdB4xSr675LNzeafdJzmXidp3VuGCx/LmKPUjkZuthWA94alvbnD+Omm9bC898LmsvpDhq40m
	mO6kMpqpZWRsRQg7iyN1CEyhlHPC9RdSrPw8tt2ibZPJTIEOPZSAp5n0mbODWQzLfenI+qUA2G2
	Z3Zu2SgSeQXmdasO2gXtSIgDrbegcB4pZqFHbPFp70IuiQZxFPraez69xu3rpDHfcwkNTRDdt10
	MTdqPs/mjBb096YHhfFu4JWT3GVtJkqJEsrOZVpsfg63p3qG7MXBsBK4n+CLH
X-Google-Smtp-Source: AGHT+IFk92XaGpTI4U7CCoTw/tO8/ZtLbj0JiXavRyitzSUg6CWNm/QUOklAqwXRPc7ri/s/Z4hX3A==
X-Received: by 2002:a17:906:4789:b0:b3e:f028:2d57 with SMTP id a640c23a62f3a-b50acc3132amr777511766b.57.1759997644084;
        Thu, 09 Oct 2025 01:14:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ad839sm1844874266b.1.2025.10.09.01.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:14:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-msgpack: Upgrade 1.1.1 -> 1.1.2
Date: Thu,  9 Oct 2025 11:13:55 +0300
Message-ID: <20251009081357.3446410-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009081357.3446410-1-leon.anavi@konsulko.com>
References: <20251009081357.3446410-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 08:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120424

Upgrade to release 1.1.2:

- Update Cython to v3.1.4
- Update cibuildwheel to v3.2.0
- Drop Python 3.8
- Add Python 3.14
- Add windows-arm

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgpack_1.1.1.bb => python3-msgpack_1.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.1.1.bb => python3-msgpack_1.1.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
index 6704829f7d..85ec93695d 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "77b79ce34a2bdab2594f490c8e80dd62a02d650b91a75159a63ec413b8d104cd"
+SRC_URI[sha256sum] = "3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e"
 
 RDEPENDS:${PN}:class-target += "\
     python3-io \
-- 
2.47.3


