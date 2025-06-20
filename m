Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1C1C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:03:16 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.3604.1750410194525155400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 02:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EYkNx8Ce;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so3345805a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750410192; x=1751014992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpMvwFpQphqNL1D3BQxOEkhMlNs/AwnBTb/N3YWiplo=;
        b=EYkNx8CeYxA8ylTm2dNPjyABE3hYLM/RoEKV/qgG9h/vuXtHP/p9bkyFMp47iLAc/S
         eoWsIZbnh96wHuEUFv7ZS7dG3P+F3vvbTXFV04vb8Eq6qq/W444zHfI9s8SXJGgDh1Kj
         +7paNIAdhM83bK28QK1bpOQV6eDdqK5583iGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410192; x=1751014992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpMvwFpQphqNL1D3BQxOEkhMlNs/AwnBTb/N3YWiplo=;
        b=aGASiQ++geUX176uarQY0KJyT+mjxNtbN8VanPN1/w68MbirWlRtH61jywTcrXs0H+
         a+YhLC4lA8RllyvNG3Sr7iQOvmZxpFkPwFPPDyiuhceYdIFbi5Ty3zXtWdDC419Fjjsm
         2lM/3cMGSGAExNpuvznsUi1LlC4jOeIg4wiIFJob3QWT2vMvDcnSlRSr3lHbB3shH4RI
         NAeJzg7jcIUCWaDuGf1YRZatr7vOhvC82/36ECzf/hRaPoHAZR+mROthx8zFWytDJ60A
         R4WK8mM/FKMshdQG3QAFkL0gpHGV94DjX6qpT8Y9+NQ5DV8LgFDaCooVsQrqDoFgPmbw
         W9Zg==
X-Gm-Message-State: AOJu0YwJPPZV9uNLSO9Jgtho+Ky+gs6N+tp0weprMMs8Xraq0c+AqH1R
	276a10ZgJw8oPWC9/vswfSehz6d/Y9ECemaJLa6jiIjh6W66sdNc/1ECCkQ1WTl+JeI6ykJRiFp
	iCTsT
X-Gm-Gg: ASbGnctEufmICk+FxSBfId99OBzofg5TL9DHyCHUEzRwhRQJ32zgcUX32IlkAv1O2dh
	JSBewv8NjH6cCFlf+SOt83V2gSYUZ8iJDGwbvF33E1U5WKQRyomxdGXh3dIi/LX5Ha53wB11HCJ
	ZOdFJ98m8TJ4mh8weXO9qvJ9OAqY78x9oEdPjJkgHPH9udnyB++9qIp+fx8+shuHdNIe7AeV3iU
	Vn/1XneAMx2AJhbw2QyviONw5xSA0kM02xfWpdvmz0VEot9FMhSmMYtMvoh2fX+90KtDq0bTuVH
	Lpe8uS/y9GY8WsAsSS9uoZMgqkYjdZcmf1TsZlQ5uis96yfY+jgdCEXbI5+p474IHXxPk44F0co
	tUxLK1YMjgE4=
X-Google-Smtp-Source: AGHT+IEQxNm5TwOgg9VQASlISUWuh2eIHl6g8AlZzsucLlcPRRT0FSuHA2/8/VnI3x117/c/z218Gg==
X-Received: by 2002:a17:907:7b96:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-ae057bc88cemr210577166b.43.1750410192304;
        Fri, 20 Jun 2025 02:03:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm130551966b.102.2025.06.20.02.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:03:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-yarl: Upgrade 1.20.0 -> 1.20.1
Date: Fri, 20 Jun 2025 12:03:05 +0300
Message-Id: <20250620090309.1619406-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117962

Upgrade to release 1.20.1:

- Started raising a :exc:ValueError exception raised for corrupted
  IPv6 URL values.
- Updated to use Cython 3.1 universally across the build path
- Made Cython line tracing opt-in via the with-cython-tracing build
  config setting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.20.0.bb => python3-yarl_1.20.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.20.0.bb => python3-yarl_1.20.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
index 04e150e164..bbf9e3d782 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "686d51e51ee5dfe62dec86e4866ee0e9ed66df700d55c828a615640adc885307"
+SRC_URI[sha256sum] = "d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.39.5


