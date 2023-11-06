Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52B6C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:46:30 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.54087.1699278387976105497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WYmTpg58;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so7447291a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699278386; x=1699883186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3IH9cc2ORI/j4M+4ar4P9RxystLV2V8rF/vatEySrs=;
        b=WYmTpg58+92khvC4S8P1295zhyWTFnXgShXql+mlHU/pz88c0994LfFDAN2NxOygmq
         dw3L32J4kwuP1Mu9OoVCO5jqPb/JZX3+fj4xjhBhYRsOGD2bbKMIVYaGKPhkyKNR/lAo
         GIaQ2mDfBCz9p13QfioqlMyVDS0fUPIdg8biw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278386; x=1699883186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3IH9cc2ORI/j4M+4ar4P9RxystLV2V8rF/vatEySrs=;
        b=cp+LJ7ZSETbc976mQxarH2nHw4tE21pHN9Ypn85zqzVBkbXQKhQSFOp5ng47QdRjrY
         hmcG8I0fU8lXYgbqgwviV/U/zSpEUkzst333I4+i8Lg3sw1W0+ZlOdZQZNt1hl9HXUsh
         cJPo7lyRlyFmdVRI7ulJloZ3+QEu39/EzYFg+5aUi0id07uNyey28SjYYTtYfS258s3j
         PfLyNcYsxMFieGwm2iTGSzhl6cwSCOYCwi4Xhntll/VexOa4wv5qHBCcSCW65Lhww09a
         hIuwZrrSfqzkLZVoa0XxtCDbsAV19I6D0Gp/jvXhSO8otHrOByDKgLiJHcgIc3VhCAjT
         EJ0g==
X-Gm-Message-State: AOJu0YxRRD796DMwAS8BwcS4F6yNQnLbiJk3ZNXxt2iYqWKe7aJYj9i1
	kF+imep/MYnElFOHSEqAtO3hFuflTZb10gLFh8o=
X-Google-Smtp-Source: AGHT+IEMGlNrIOw44OExOx8yn1zkprEetTb6/YrEvcGNEjh5PvBiRxDbNNSetIXYfdq6HpL4ydzcRA==
X-Received: by 2002:a50:d658:0:b0:540:4c04:ab94 with SMTP id c24-20020a50d658000000b005404c04ab94mr17773363edj.42.1699278386050;
        Mon, 06 Nov 2023 05:46:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ba26-20020a0564021ada00b00533dad8a9c5sm4324013edb.38.2023.11.06.05.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:46:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pybcj: add recipe
Date: Mon,  6 Nov 2023 15:46:21 +0200
Message-Id: <20231106134623.11522-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 13:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106412

Add pybcj, a bcj filter library. Version 1.0.2 brings:

- Support python 3.12
- Add cibuildwheel config

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pybcj_1.0.2.bb             | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
new file mode 100644
index 000000000..34ffb9793
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "bcj filter library"
+HOMEPAGE = "https://codeberg.org/miurahr/pybcj"
+LICENSE = "LGPL-2.1-or-later"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[sha256sum] = "c7f5bef7f47723c53420e377bc64d2553843bee8bcac5f0ad076ab1524780018"
+
+inherit pypi python_setuptools_build_meta pypi
+
+#PROVIDES = "python3-pybcj"
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-toml-native \
+    ${PYTHON_PN}-wheel-native \
+"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-importlib-metadata \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-compression \
+"
-- 
2.39.2


