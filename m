Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344CEC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 12:29:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7587.1686227377434965988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 05:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AJMvMHfC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so3476385e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686227375; x=1688819375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjXeZDcMlUeRwz9/SrX75y45lnXpQyb/NSHopXT7n5s=;
        b=AJMvMHfC7O5WiPeH5X2rn+NodNS1lLT8nZioFT6OiHP3GV7+p1QSzanAa4A0KXjtaH
         u21CiTMlnJmm8NuTHCzr7PtXlw6uhZ4xA0K13iNgtybv8zaP6Mlnb9U5JAmD3RG3222S
         oQ9dpWJvbgOJYxBoTP0VchRuDyygdXwh8bRbW6tO5rWS1B1D0fmE4eh+4DxvmnCR2x/I
         x0Z3RB7xR9WVts4SxTNBc1wYHWqlBisjIxyG7GJBlHBURZyWTvTKQYEvJMe9PzTSWr/j
         JMVmGIenfbErb+x8SmkPqzeYOqRA/5JVhjcmCKmwQ+vv720Vwo9JEfErrcvaduoRoeaM
         2E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686227375; x=1688819375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjXeZDcMlUeRwz9/SrX75y45lnXpQyb/NSHopXT7n5s=;
        b=PW1eXoWTet9/k9OnXhn6SpKGZ+oH/IT1q6pxy2ohPc1+jBlW8yzhSF9xwESCK8LGvR
         WxHNm/uSeeEnhvo2le/BWXHZ5GuTgd8Nyts0IbhJs6Wv1TLHmT52kpmsEwyr1vpBF7cX
         28c7sh9AMVywzkOfrxZkZVuhYamHbT52gxRWWLIbnsKvHsBTk/IMiFt6ILLvth8IkwHe
         TvZlnZk79bBXQuFySGkpcCaEjRQAO2OUiVxW8GaEYGHvZ1CMmZlk7vxsISKTZsMYJCnS
         D5ucSUtweDMbI4ZaUtzEwx6fJLnbkg8YavNrIDJb1E9kyksj6rnS5jLcl8s82k6wxPkL
         SwBw==
X-Gm-Message-State: AC+VfDwW74JNwFX1IxUOpeFhJA/Hdt8wdpEd/U5RyS3Ydx3RYV9P1uJ8
	t14zx1X/J3qVY09wZKhhi7spqsV9x4Y=
X-Google-Smtp-Source: ACHHUZ65MwHc+Z/0TeSRuZAzsECU+5BvLC/m2c8vWK/PV2D4Tw17rPDFfUMpQNjP7LqVf1V4sJNtQQ==
X-Received: by 2002:a05:600c:2044:b0:3f6:795:6d1a with SMTP id p4-20020a05600c204400b003f607956d1amr1321606wmg.22.1686227375158;
        Thu, 08 Jun 2023 05:29:35 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d43c5000000b0030abe7c36b1sm1445798wrr.93.2023.06.08.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:29:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 2/2] python_mesonpy: New class
Date: Thu,  8 Jun 2023 14:29:26 +0200
Message-Id: <20230608122926.1447252-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608122926.1447252-1-zboszor@gmail.com>
References: <20230608122926.1447252-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 12:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103189

This is a new PEP517 compatible build class for python modules
that use pyproject.toml and this:

[build-system]
build-backend = 'mesonpy'

The new class uses python3-meson-python-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/classes/python_mesonpy.bbclass | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta-python/classes/python_mesonpy.bbclass

diff --git a/meta-python/classes/python_mesonpy.bbclass b/meta-python/classes/python_mesonpy.bbclass
new file mode 100644
index 000000000..131fa74be
--- /dev/null
+++ b/meta-python/classes/python_mesonpy.bbclass
@@ -0,0 +1,52 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit meson setuptools3-base python3targetconfig python_pep517
+
+# meson_do_qa_configure does the wrong thing here because
+# mesonpy runs "meson setup ..." in do_compile context.
+# Make it a dummy function.
+meson_do_qa_configure () {
+    :
+}
+
+# This prevents the meson error:
+# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
+MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
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
+
+python_mesonpy_do_configure () {
+    python_pep517_do_configure
+}
+
+python_mesonpy_do_compile () {
+    python_pep517_do_compile
+}
+
+python_mesonpy_do_install () {
+    python_pep517_do_install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.40.1


