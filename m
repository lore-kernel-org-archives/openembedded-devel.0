Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD49C7618E
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:04:39 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2647.1678867476145916789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TlRFXGBG;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id eh3so16137829edb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678867474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmdODGND32SJDnFw2bRi43lDjib49LFcgl6k5oDZeRU=;
        b=TlRFXGBGYBlcOgxpjkDO6nBBhSLcaYVsN1zofjU9Lt29qWYOvs6UCOXuBDlJT+zp4S
         jDHMYVaw5fn10I4NBc/39pd5Ww+wCSYck79jXBUjLAnQ8HjLkZhLbBqIcnBNzzEzGw5O
         bHeqDz2d1czqZZoydqEck+JA1+ZnyZB1U+MEZfRq/UqnvUJd69+brxz8j37WGJ8blIAH
         SlKdSIyQrv07FQPhBz6KS/ySC/Ja03bnYzauu1cD2I4b6/5+z5rerALqPRnE0YJ9ecfg
         mTqbo9R+sNaLzynEIBdI5SSmmugGFBLFlWLOkyQw1hSXOnUKCxIHwf0BiQbIUTl+iXZM
         60Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmdODGND32SJDnFw2bRi43lDjib49LFcgl6k5oDZeRU=;
        b=KVfml1Wi0VoQ84ehDWTFUTA5RbScOXTsBmfw4rjY/UMKcuOPCOd3ncwI5ITXcyiOcq
         ilp5BXH+HQ2jR4Q9Gt+8vMC01Q8YH44/e5GPsZBREn5jl6HGmMrUmvtvy/Ndbt4T+i3l
         XoX980hgZFuFOs9CxtmCuJkc6YhkgZqvBivFxblbayT939iSr06paafTfMs9uvYGavqO
         xuuMOm3PZ2+vf+7LUrupb9WDb2uASC6CxA+mLRse3IJ4VRBBlk6ext4LxqBK5Il62IIs
         tmZuWSmM76JnG65xUtVDBoqPERZs3g8Mv7F63uoHemfkodZZPzqmQ5QadnuCP7goYx12
         p53Q==
X-Gm-Message-State: AO0yUKV93ljNZr8lgYGwbNzKLDh98XIsqAEmtcp7v3cc+B7K5XazrtFX
	EunM3I8XUvECwvmdOfeBwQP5/BP/EGw=
X-Google-Smtp-Source: AK7set9v0z68JjunLm7Aijz/4BkR+wjSP90bUyCOK0YYRJpfIQXzHOugtbFpTggk/TDalXUN9e4LRw==
X-Received: by 2002:a17:906:dfda:b0:878:78bc:975c with SMTP id jt26-20020a170906dfda00b0087878bc975cmr4820267ejc.36.1678867474153;
        Wed, 15 Mar 2023 01:04:34 -0700 (PDT)
Received: from localhost.lan (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906348b00b0092b4602f506sm2136382ejb.73.2023.03.15.01.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:04:33 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/4]  python_setuptools_build_meta_mesonpy.bbclass: New class
Date: Wed, 15 Mar 2023 09:04:26 +0100
Message-Id: <20230315080429.2722555-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 08:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101529

Some python modules (e.g. SciPy, scikit-image) use meson-python
(a.k.a. mesonpy) in pyproject.toml:

    [build-system]
    build-backend = 'mesonpy'

This class, together with python3-meson-python and its dependencies
will allow building such modules.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...python_setuptools_build_meta_mesonpy.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass

diff --git a/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
new file mode 100644
index 000000000..1d3fdbd7c
--- /dev/null
+++ b/meta-python/classes/python_setuptools_build_meta_mesonpy.bbclass
@@ -0,0 +1,17 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit setuptools3-base pkgconfig meson-common python3targetconfig python_pep517
+
+DEPENDS += "python3-setuptools-native python3-wheel-native ${@'' if d.getVar('PN') == 'python3-meson-python-native' else 'python3-meson-python-native'}"
+
+PEP517_BUILD_OPTS = '--config-setting=setup-args="${MESONOPTS} ${MESON_SOURCEPATH} ${B} ${MESON_CROSS_FILE} ${EXTRA_OEMESON}"'
+
+export MESONPY_BUILD = "${B}"
+
+# Python pyx -> c -> so build leaves absolute build paths in the code
+INSANE_SKIP:${PN} += "buildpaths"
+INSANE_SKIP:${PN}-src += "buildpaths"
-- 
2.39.2


