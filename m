Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB57C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 03:14:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.93496.1679627687095551593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 20:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nOntL4x+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h8so2700572ede.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679627685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rq3JTMRRZz96DEX498LGZQQKRwnIQOm+Vsx2o9Hk6y8=;
        b=nOntL4x+DqCtZHY4WMPLABuYGq7aOzwce5l7zdqVxw28XzHucypaUFtrOlgcX8L5uK
         IXKaHkEEB9YEFKINF59y8uUIwNSsKIT+o8AROQ5yfomQeiw3eK7rXz072Cw79o5WG8W0
         LJuRZ1DuFGlIBYHt5kYiSy5BcqgQWWBlnl6r5m1ksl/PPtlsrEd7zNOwk4B8MvXc1NNH
         1qDzzUM2c4RMeq/XPY1Ovhq/WnlFAKIKlcS10NOAYk+EqvMHfF7yvNj+RbCh2PF5qHdq
         ljyRG4EtqSOrnUiaGB0Z13x+Sd8R7YEbbiYElUGJLeZi9TBs8Vy+AY1MEc6u81p0uGfL
         uTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679627685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq3JTMRRZz96DEX498LGZQQKRwnIQOm+Vsx2o9Hk6y8=;
        b=PAUl2U9SIKqbPca1VCbVDqur8Lj2RQuM+zCYCd9WNb5gXEabOCj1M5loREXD0lNcBc
         pJHnjkhJ/q4+So//IsEQvdUf7SZ4serCz4MNBf1iZw+ZefLQUUfwHPfEurcBitf/Zsb7
         m1dP2hMuDjIZrIzcc/3WrcHfpf0GlEs+/J0jVF7/6XuciXFHIfpgfHJMI0f3aSWG4sq4
         to+ihZ343FqWAVHPVoVffuntftQBRFr35PlrhmtN4DskKsZQux2dMOiWn3UgqlXPagjn
         odj73EmdXr9+WfuqcHHSMBC6jExD3PyJBWCaZ87eDaGB87C+5FES4dhw9pFbw7/eI3v7
         nLvw==
X-Gm-Message-State: AAQBX9fkAD2dZPwK5mbMxI1Z2JDNOUoPR64HwEERu+QpGbhS7HGvxcu9
	aguuQtdyOpvDJsfzNeT/FHJOH4BH9FY=
X-Google-Smtp-Source: AKy350bOZuE9PYIeW8I5fXXb7i4cH87IV2JkJf3SZe2TGhD/9V/yO3AWZgo6bUtTcm9+T+e4ERz6kQ==
X-Received: by 2002:a05:6402:212:b0:4fa:e8f3:968e with SMTP id t18-20020a056402021200b004fae8f3968emr1443285edv.12.1679627685300;
        Thu, 23 Mar 2023 20:14:45 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id o2-20020a509b02000000b004faa1636758sm10000010edi.68.2023.03.23.20.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:14:44 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v3 1/2] python_mesonpy.bbclass: New class
Date: Fri, 24 Mar 2023 04:14:41 +0100
Message-Id: <20230324031442.1799-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <174F084936A66D24.22739@lists.openembedded.org>
References: <174F084936A66D24.22739@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 03:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101701

Some python modules (e.g. SciPy, scikit-image) use meson-python
(a.k.a. mesonpy) in pyproject.toml:

    [build-system]
    build-backend = 'mesonpy'

This class, together with python3-meson-python and its dependencies
will allow building such modules.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/classes/python_mesonpy.bbclass | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/classes/python_mesonpy.bbclass

diff --git a/meta-python/classes/python_mesonpy.bbclass b/meta-python/classes/python_mesonpy.bbclass
new file mode 100644
index 000000000..d35ca9eed
--- /dev/null
+++ b/meta-python/classes/python_mesonpy.bbclass
@@ -0,0 +1,27 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit meson-env setuptools3-base python3targetconfig python_pep517
+
+CONFIGURE_FILES = "pyproject.toml"
+
+DEPENDS += "python3-wheel-native python3-meson-python-native"
+
+def mesonpy_get_args(d):
+    vars = ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
+    varlist = []
+    for var in vars:
+        value = d.getVar(var)
+        vallist = value.split()
+        for elem in vallist:
+            varlist.append("-Csetup-args=" + elem)
+    return ' '.join(varlist)
+
+PEP517_BUILD_OPTS = "-Cbuilddir='${B}' ${@mesonpy_get_args(d)}"
+
+# Python pyx -> c -> so build leaves absolute build paths in the code
+INSANE_SKIP:${PN} += "buildpaths"
+INSANE_SKIP:${PN}-src += "buildpaths"
-- 
2.39.2


