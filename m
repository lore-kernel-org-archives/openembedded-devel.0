Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ACFC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:14:48 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.30998.1723029279299668816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfDM8DFP;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f1870c355cso17608631fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029277; x=1723634077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fQrB/ltNY+zdDKa5C0JPtXo5mIevWs//2iViU9IKyc=;
        b=BfDM8DFP+7ZzmrM2GhPv6DisfR2BgUjXY2AcINgo99JntLrmmUFp53RuWBseM948hu
         E53am97EfWaq4a4P24LHpR43r0QahLSD7mC977w7NmdC19HyDMRo0y3CjOlxB/GVP3EA
         rIjJSc1Q8w5xIE/paZFmJUfYNboTZVFTA2OYX1Fl99zt8MyYmHedl0wlGoba3VQDqCHv
         W7gnL62cRop7BbBAQT+ae3tKpYnIbt6F0H6iljzOr5dQSwg7alzFKHBCwEcsWCxMEWUk
         xZOQvGthKlU8e0wwzq4IyW19iXqDFDp4eY63vvKhoRWMWmOeW3FwzlAj6DfFPivbn0w4
         reJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029277; x=1723634077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fQrB/ltNY+zdDKa5C0JPtXo5mIevWs//2iViU9IKyc=;
        b=THSKbhVW/nz0n762zweKoN4ty8d/Pz6ISXv8TYOTSkPmwdp3upUMagg/jgmHGsiqG8
         BvNj/mrdhv9PLPsd5fYGuHQB5YY1EeeaAhF43H0cpi0O8rJSon4q7nyui7Xdvkb8v+sW
         GEMQP03dtpBZCGDzk918ednQmwsT1QcykfLt3XG0IZUeGBSVTk0uiKoHXKrTKj9MT+F8
         sU/CIo+p4i54rL/3u1ZFRfF143Wi1ZsgVZi38swLketoAOXtvMbIAvKhOXbZnApCt+uW
         bKyAZH7H2pS9H9YibyNY1SugtC9cbd80dzfZjp04P3WBmmi42i5djac2xv397+fPOfJM
         Ee3w==
X-Gm-Message-State: AOJu0YxSxggxABPVAv2DAGx0qEcRWWko0m5uF6qqlkErWXoGIk2iiyAy
	DBCi6PoGDVm8bONUnmPlhjmrTFjohD2+Y2mMKUQuM/ArFRAHVkBKY+PmxgvP
X-Google-Smtp-Source: AGHT+IF8gFN8Uu51GYXU76cXOSTJuNORg+HxpvdlROyLQ7rdB8rvEeR0tIepHgIaen5x1S29IfdspA==
X-Received: by 2002:a2e:8e98:0:b0:2ef:24a9:a75d with SMTP id 38308e7fff4ca-2f15aa95c7dmr116204611fa.14.1723029276570;
        Wed, 07 Aug 2024 04:14:36 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059622f1sm24279595e9.7.2024.08.07.04.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:14:36 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-dbus-fast: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:14:32 +0300
Message-Id: <20240807111432.55020-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111611

The project has a proper pyproject.toml which declares the poetry.core.masonry.api PEP-517 backend.

Fix:

WARNING: python3-dbus-fast-2.22.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with poetry.core.masonry.api, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-dbus-fast_2.22.1.bb   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
index 882b7f6cb..c705b1700 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.22.1.bb
@@ -7,7 +7,13 @@ SRC_URI[sha256sum] = "aa75dfb5bc7ba42f53391ae503ca5a21bd133e74ebb09965013ba23bdf
 
 PYPI_PACKAGE = "dbus_fast"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
+
+DEPENDS += " \
+	python3-setuptools-native \
+	python3-wheel-native \
+	python3-cython-native \
+	"
 
 RDEPENDS:${PN} += " \
     python3-core (>=3.7) \
-- 
2.25.1


