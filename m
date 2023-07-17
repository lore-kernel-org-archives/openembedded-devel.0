Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A662C3DA40
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:47 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.11120.1689607239517267384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=lJ7Yy9o3;
 spf=pass (domain: baylibre.com, ip: 209.85.161.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5657d8ecdd3so2935698eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607238; x=1690212038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjH+LRMzONz0myFioG6BV9JjxIlp08spc6iwP+AD/O0=;
        b=lJ7Yy9o30wXWWu8+IretsgfumRN8xYIoIqX7riljrAgywAfah10WdngFOEcyaVMgVx
         mpm33ffajU0nxiZNFZsCnOiPPhqKR5ZSN/VJQPJYCwOVmOSo2HpWB8nzUqg7CBuG0qtj
         2fA1pJn7ojYQtGCwKbR1en445Gl+pIQipKekTBulAwDWidtRsu4tjDnB23Pm0NZT2MtL
         RxifGjmGlXHisPuD+PV9fK2A/qdlTKbaRccNXc6MRwgY3wu+azrS0dEJkDjaqXDjYLLS
         tVYXUIbK6ovhXyYtIqmJAjFPgL6H/gpAr9bdjVEIFkDOA29kCPJUlLBz9VEou6qNFHlh
         r/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607238; x=1690212038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjH+LRMzONz0myFioG6BV9JjxIlp08spc6iwP+AD/O0=;
        b=TOvSkdefpxQeCCgBKP8dnONK8o0yjR3DIJ9D7N0xZA4+sJljJ67iuK9apq0j09rWLU
         yqpoPWa5LuMMW/y4aYQk7zmxdZszYYWm3NZi2ksZOkeoNa2MCsQuToYXF0kVMGKAIfED
         lRI7VZu/Wt7QZxR9txa1JY0r+3SqfakPzj5CPEWXKyxyu/l5Ra3SkWjwx0DBqIeH0pwA
         dZKbjhtw8FhN05GtBjL4MhdF3qTI4+4rdcbQ0ml+2JK4lfG9e+T8/sugU2KV3I6sluv/
         4ex8Jk2ucIVC4qMZwvOtzU1DV5F76Vkc2l+l071JB79vsaxEwQD2mMb/Cb470khZ6oTS
         YW/A==
X-Gm-Message-State: ABy/qLb7wQXVPkpuyfXAOtLIg6FPOc+wvTm2qzF3QF5Kcoe5ryN5J2ET
	sV91PnbpWetN91OHYF+sj+2h/M7YcfAjEr5A9Sg=
X-Google-Smtp-Source: APBJJlGnAH4UmFyl4DxaqIaJZY9cceccuHdPIgcPKUy5OQGU5V3YPyYXKEJZa6JRYCFs1YbBONzJsg==
X-Received: by 2002:a05:6808:1645:b0:3a3:7c33:9a0d with SMTP id az5-20020a056808164500b003a37c339a0dmr11220501oib.48.1689607238569;
        Mon, 17 Jul 2023 08:20:38 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 8/9] python3-bandit: add python3-rich to RDEPENDS
Date: Mon, 17 Jul 2023 11:20:31 -0400
Message-ID: <20230717152032.3161667-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103885

bandit wasn't imported properly without the rich module, so add it.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../recipes-devtools/python/python3-bandit_1.7.5.bb    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
index 5e2a7e8bc5..bccdf284e5 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
@@ -8,6 +8,14 @@ DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six
 
 inherit setuptools3 pypi
 
-RDEPENDS:${PN} += "python3-modules python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
+RDEPENDS:${PN} += "\
+        python3-git \
+        python3-modules \
+        python3-pbr \
+        python3-pyyaml \
+        python3-rich \
+        python3-six \
+        python3-stevedore \
+        "
 
 BBCLASSEXTEND = "native"
-- 
2.41.0


