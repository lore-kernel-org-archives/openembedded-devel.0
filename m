Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670A5C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:11:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23819.1784643069816224334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gB54JaJM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso18040015e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784643068; x=1785247868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3r+HHnoSywpuNz5IMqMcvBkQouyA+6tqgsUrDGAguY=;
        b=gB54JaJMiZNa0+BF2gSqWXa3P8tVsPnLCz25s2PVK3vjG6EJqBeEbFkNcMN7gYEjC0
         VG2AlFUI17OH53UCXdBK0rXpKcAZHnzj3bUVFlo7NxJmI8+V2cZ91PtGZ1KAWuetUjJo
         FMN78G7GbVpEveybw1cAdFGUaMhNgtJv+V6mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643068; x=1785247868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3r+HHnoSywpuNz5IMqMcvBkQouyA+6tqgsUrDGAguY=;
        b=oMLl4N/xbCx0SpBMsLyFwgp6auUyqn2Q3VynASOBmZ6G6plXabdx4MfysSUtHB13Vv
         gL1VV83rlZiOAKv9ZBOCrYB9G2CGVlfxmeIcyiaXOPxvFmPEVzz6FoPQpczWcWVeCvPz
         uBBspb26ER4V8gM7iJrmbSkVkAVQXkLBE/B3vf8x0+0brIQ7kzWlB4kgWHVrdElTfc4W
         wX4AKBmBM6HFrW+3fsARboyzfh8sJqZq5qnE6D4gnQo+OQqnD3UPcucJxJaRMNkop/ec
         fwskQXBSbrLBx1gteUpptI0ZLPXmZtsOsBbcGzsAktLgBCPujjXixqUuANJfIX+3DOPw
         9hqg==
X-Gm-Message-State: AOJu0YwRA6PGjarratrkG4Z4jy7GIbTWQAL4LN0dnA9fx4E5wTnFRPZT
	s5f8vDfqfA95S/R9AX6reGbzQrU4tlHVXK9kfYcfco6AK+cef59Gtl6VvMljTjMkrRMdYIxgSkb
	wGTeP
X-Gm-Gg: AfdE7ckYNC23eqADSHrx+HEo17UDB6fmpFC59WE0LgST9d46h/DAiMNYvIFXhBxN6Vt
	X9cwgU56zyJYC+fTIg3WQV30LLE4ztc5bhzX6H5fm9dxOlSZ1CqpjOSODR4wPheskFa5CJfASTU
	SIfh9ZcBhW8l7mcZSvA1eDlnFPq3p7v9zFThnZm+VhyPaqvMcmXGdFEhz7a7bmW69bCvw45hUD3
	OyFaaCi76nC6nwEH1r3EVsmrcOgK+2a6tO07XiBKXp5LYEf5CsCZOQg0iGE1nw+2OL8NBzes6Uv
	sp2mXTy3WEXjomrQdHZYysXAW/bA4mFmWGy8tphTGRlrX0X1zkMKlYJSBeIAs5NMNodBXbZZiBw
	K99zIm6eGkyBWUs4f1407BKqHcUhUSliM0NWtjhULBWxXFBQBQ2W4W2TIbh9QdwRQ5vFOPA9jj8
	Rmk32rVJ/s4yD9ksXIpH2mQlMM60z5Q5CZ9IuTU2HZ6oBtrd+XKxWW73gnSFCLqg8vArohIxdjp
	jkcXspfqQ+hUZH0ugVb/mpNuFEngLM=
X-Received: by 2002:a05:600c:4e92:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-4954cb6729cmr191297085e9.5.1784643067885;
        Tue, 21 Jul 2026 07:11:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956546de4fsm75401085e9.1.2026.07.21.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:11:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pytest-relaxed: Add recipe
Date: Tue, 21 Jul 2026 17:11:04 +0300
Message-ID: <20260721141105.2648468-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 14:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128351

Add recipe for pytest-relaxed, a relaxed test discovery/organization
for pytest, release 2.0.2:

- Fix dangling compatibility issues with pytest version 8.x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ed-plugin.py-Handle-terminalreporter.patch | 38 +++++++++++++++++++
 .../python/python3-pytest-relaxed_2.0.2.bb    | 16 ++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-relaxed/0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-relaxed/0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch b/meta-python/recipes-devtools/python/python3-pytest-relaxed/0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch
new file mode 100644
index 0000000000..ef16460a32
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-relaxed/0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch
@@ -0,0 +1,38 @@
+From f9822e9fdc2bfb7762eb2bc740f16bbe543e500b Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 21 Jul 2026 14:05:17 +0300
+Subject: [PATCH] pytest_relaxed/plugin.py: Handle terminalreporter
+
+Guard against missing terminal reporter in pytest_configure because
+some plugins/configurations unregister or never register the
+builtin "terminalreporter" plugin, which caused an INTERNALERROR
+when RelaxedReporter tried to access builtin.config on None.
+
+Fixes:
+
+INTERNALERROR> AttributeError: 'NoneType' object has no attribute 'config'
+
+Upstream-Status: Submitted [https://github.com/bitprophet/pytest-relaxed/pull/35]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pytest_relaxed/plugin.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/pytest_relaxed/plugin.py b/pytest_relaxed/plugin.py
+index ed448de..840082b 100644
+--- a/pytest_relaxed/plugin.py
++++ b/pytest_relaxed/plugin.py
+@@ -42,6 +42,9 @@ def pytest_configure(config):
+     # TODO: we _may_ sometime want to do the isatty/slaveinput/etc checks that
+     # pytest-sugar does?
+     builtin = config.pluginmanager.getplugin("terminalreporter")
++    # Guard against missing terminal reporter
++    if builtin is None:
++        return
+     # Pass the configured, instantiated builtin terminal reporter to our
+     # instance so it can refer to e.g. the builtin reporter's configuration
+     ours = RelaxedReporter(builtin)
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
new file mode 100644
index 0000000000..6e56d20b8d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-relaxed_2.0.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Relaxed test discovery for pytest"
+HOMEPAGE = "https://github.com/bitprophet/pytest-relaxed"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a8815068973f31b78c328dc067e297ab"
+
+SRC_URI += "file://0001-pytest_relaxed-plugin.py-Handle-terminalreporter.patch"
+
+SRC_URI[sha256sum] = "956ea028ec30dbbfb680dd8e7b4a7fb8f80a239595e88bace018bf2c0d718248"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-pytest \
+    python3-decorator \
+"
-- 
2.47.3


