Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC637C83F0C
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:31:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.12401.1751635908103260766
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UN3Deu5l;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso159395866b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751635906; x=1752240706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx3V+wyrwwT73ohiD/2SCNEL7pYkbqVbteufjQkeMEU=;
        b=UN3Deu5lQaxCL1+Q244isPR+EcKcvtl4DPopUOpyMp3whdHWWfg5ZU3d9iLPnZn6vp
         2e+jfVIZr2eI7kL7lboBdgzyXvPnYoo/m4ng3up2eiDNwlPjtaHrQ3lj8hQrQscLopfO
         j2Y6KFPo4vVIDJ7bnW7aY6FV4YgzPEh3koooQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635906; x=1752240706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx3V+wyrwwT73ohiD/2SCNEL7pYkbqVbteufjQkeMEU=;
        b=CHWs92y8S6e6QTXuCTLf0qyfnA/MzpUq2BnKpTGJyA4tckndL4iUSwAMD5iGzWwCzm
         EGzMGv3zvteJCg53bvirzzYNumV+YSTk753uFps0RYQc+8Whc7Nsu/sQu+S2Q81Eb2iw
         zqzXc6+1k65BGTSkFW6L3mKqzkp2WQQNde5v9OedgK/MDcxsQydNcHnt7JOqqAFwMAVJ
         UZrBSVpwtYkXGrQ/BKLyFCTTN0C+VBNak4Nw79r5xmGCXOv1Ob9SSRTG85E9qqcNXneC
         RE+7ENR0p85Y6QSsish7Nhu9x2Q2O+a1jj7lTGJsqEBfAYJtcqmIGkXfjh+PK9srFWk/
         gMcA==
X-Gm-Message-State: AOJu0YwATvmOSps2smkRUIU9P3mVR/BCdbB79FFU5qwUHoQW0PWP47yR
	HDIrbVRpGDIpyT1nUWL0ARFnJvrXpxLkdm7exNk1zEtGj+WcclGiOadte+fcaD66dNG0hmao4eN
	tX5eJ
X-Gm-Gg: ASbGnctN6GfbqWKaujPn2OiBAindVhUn9Am2O3TjWrfVhZUdowWcf9hhQp0nHIH/0Hl
	InJpIflbuk9udi6vlABOWU/5v0IX4tqEgp2L61e/p/LUjnPuFezXxwlJvNF/2Amuk6sGSIA1xvI
	0O3HJZMQBg7arLtN/X48GhmVCQrPKz4iV6pCpwGtybqMbNSQUt00lTLhZ8HshQlOm5RtSonxehp
	LV4TzBfQWyTtE+9r0YJV1ucdCaaUYBQqnaCYGpky/RwUw3sZw+Ro82ghFaZlJlPcu5cNt0zNgLh
	69AoJJ65VKcIL2vXs3s7joro3PlIA2uOtIx5QB9iGms5LvG+yOEs6S51NDahcJsFJ6Q+P9YSxIp
	8
X-Google-Smtp-Source: AGHT+IEfvd4fi39Sm3CgkP3wUn8MRTK46R3wVYJjeuXFzie53mlx4NfEd0GJSD3U1Puq47BgcqAYnw==
X-Received: by 2002:a17:906:27c4:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae3fe5cb165mr171651166b.41.1751635906006;
        Fri, 04 Jul 2025 06:31:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93ffsm174389966b.36.2025.07.04.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:31:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-progress: Upgrade 1.6 -> 1.6.1
Date: Fri,  4 Jul 2025 16:31:40 +0300
Message-Id: <20250704133142.712380-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704133142.712380-1-leon.anavi@konsulko.com>
References: <20250704133142.712380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 13:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118235

Upgrade to release 1.6.1:

- Migrate setup.py to pyproject.toml

Fixes:

WARNING: python3-progress-1.6.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-progress_1.6.bb => python3-progress_1.6.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-progress_1.6.bb => python3-progress_1.6.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-progress_1.6.bb b/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-progress_1.6.bb
rename to meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
index 4a0b0c714e..57c0748a5c 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.6.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/verigak/progress/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00ab78a4113b09aacf63d762a7bb9644"
 
-SRC_URI[sha256sum] = "c9c86e98b5c03fa1fe11e3b67c1feda4788b8d0fe7336c2ff7d5644ccfba34cd"
+SRC_URI[sha256sum] = "c1ba719f862ce885232a759eab47971fe74dfc7bb76ab8a51ef5940bad35086c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     python3-datetime \
-- 
2.39.5


