Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE35C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 06:55:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2663.1686120955115045382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 23:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KZyNPBH4;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso58284845e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686120953; x=1688712953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juUTJZMsBMlY91K+5TSuaFjTx2q3btX42DBdVnnCxK8=;
        b=KZyNPBH4vatsC1WKfU4vr+syvQB+FPCWFrJAmK8UDTQpCylBYryNe+SjCOYkxeepMo
         bmZA5m7ZENNvHpMTlgkgEUnbZHDfirglIt0I53q8FwNoWQVfxvClp1EQlv66mRL9Yz3N
         RGptOrun8fnyvFh8z/bvQZXB565dH+AiK0rl3FnACxptul+1z3FMzv9mj3UzFy6sNTzV
         g8SFGF0ARUswcwtZ0CvxGFakmrviiULZr3gAf3UevejnLNqGiXnlssFWQq/qg6QAElPG
         U4jkrJtMlPmXT7DTrzms95YMspRo41b4dvojWZZBbFusGGmPyBtsR8S1WTBaptVI+oKG
         9y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120953; x=1688712953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juUTJZMsBMlY91K+5TSuaFjTx2q3btX42DBdVnnCxK8=;
        b=Xgfw5PmMH7pmmWpsNgZ0Xorwv6dhNFAYvdrgiav5oF9o9p6egpLTDWFlNgdwNIc8cx
         rChvuzmZTRLpl6FIHvF0Z55Vg1hUK9ugEMzoKcJ6UwlF6pDqx3enGlisbQNBPqDj3qGi
         XdaN35XTunrI2pmcw6Qq/NJgq7x8j72e3jnsxPW4KHXZg4mbZtxgODRZGC3eyjEBbwuX
         wWqvfozKHmzS2mLGVqRIApA8VtUSuFqq3o7lrwS5YJOfDsjaNfhnaECmjb6BdlYbunHz
         I4C2YXzjQK95f+rMO9HPHVk68FRoOScBSVYP+ZBbc8KDpIPFc1a/hKjMc4UNRoRIYUvp
         IHDA==
X-Gm-Message-State: AC+VfDwAHC7QXJDG8Qr2vdnNuPI3NewCDUpDFfYbcbfybVNPs09Krq93
	O4BsVBlBMPXoeW+jIRuw1QucO/s1JU4=
X-Google-Smtp-Source: ACHHUZ46lwiOoIyYZ1L1bchown9RuRMc/cpmx51g2Suqa1LTy+UC+V1GAYGz7zVWOz0JmEtKE2b2yQ==
X-Received: by 2002:a7b:c30c:0:b0:3f7:310a:3ffc with SMTP id k12-20020a7bc30c000000b003f7310a3ffcmr3772692wmj.5.1686120952837;
        Tue, 06 Jun 2023 23:55:52 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n18-20020a1c7212000000b003f60482024fsm1050274wmc.30.2023.06.06.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 23:55:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/2] python_mesonpy: New class
Date: Wed,  7 Jun 2023 08:55:47 +0200
Message-Id: <20230607065547.128661-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607065547.128661-1-zboszor@gmail.com>
References: <20230607065547.128661-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 06:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103163

This is a new PEP517 compatible build class for python modules
that use pyproject.toml and this:

[build-system]
build-backend = 'mesonpy'

The new class uses python3-meson-python-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/classes/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-python/classes/python_mesonpy.bbclass

diff --git a/meta-python/classes/python_mesonpy.bbclass b/meta-python/classes/python_mesonpy.bbclass
new file mode 100644
index 000000000..1da8b005a
--- /dev/null
+++ b/meta-python/classes/python_mesonpy.bbclass
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit meson setuptools3-base python3targetconfig python_pep517
+
+# Filter out meson_do_qa_configure from do_configure[postfuncs]
+DOCONFIGUREPOSTFUNCS := "${@d.getVarFlag('do_configure', 'postfuncs')}"
+DOCONFIGUREPOSTFUNCS:remove = "meson_do_qa_configure"
+do_configure[postfuncs] := "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
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
+python_mesonpy_do_bootstrap_install () {
+    python_pep517_do_bootstrap_install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.40.1


