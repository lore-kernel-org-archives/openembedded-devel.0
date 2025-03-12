Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55A3C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 18:31:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2685.1741804311047898903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 11:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsP7jj4i;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so650815e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741804309; x=1742409109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxErKV0kcwqTTwxBNF8s40qfub7KvGMneNnVYF0t2PE=;
        b=XsP7jj4iffm5AZBxwef3DXGxY1SW+KCIr7yQ/v22/wW0YcRAJgLi+N2+ymy/FKxglY
         7RBGxG0Xi1K/+roTIezB8SNUXCyLwagqcucmclvT25KJfjaqVDIiyyMRtyicUFG4tFWC
         T0uxu1QydOAlv1fBE3YJgrPoGh0dQ/qEUAEm4p2OxvwGHLuO54T7emYV0EOe4EDFs13a
         /asDAsyW2PV9lOiuOYx0YpmD2JfDwCMQRCJQ5D09to17xVVggjveVsOtQM9Nw0YdEaOE
         QpoR9+049KTKfbmhsO6oQTfMlr7gz+TyrLNSwA2nf9Rwl7VjO4W/d9z7XjohigcpK+bs
         TLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741804309; x=1742409109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxErKV0kcwqTTwxBNF8s40qfub7KvGMneNnVYF0t2PE=;
        b=h6wL4RAwhG1TSVXJrMPwWrJfXhUdf2j8LJ8gRm9laundZxVNNBNwrA3dMya0jSga0f
         BAHRBHTy2gSeAUIXctjvZTjTG+rjjij4/PDJZwrk6XdSYl7QmB2nT0l5ss9G6tq46i1X
         NQHY+lrsRanEYyT1x9yyRxWPrOAIXXxVgVWSI/TiHhCCp2F+wrk3JFEj46i48i68zPya
         ciPR5LHa9rWPJKfKxXmGlkU84kTy/gQQDUjvTVpoK9cVZ+fg/4KLJRCe6LDUJ9HRjJhf
         MKVNUsWN4T335AbJpkPyTRq4/oc41eOCrkTRo5ZGyXLlxUBpIYEAY46o/w5qCo5TfITa
         BAfw==
X-Gm-Message-State: AOJu0Yxj8qqbOWydsmINTYV5kAdUf5mM2P5Wfn+mN6I0dl2TiNt3Wlj8
	Xa5V3hEqYFrEmKbTC6oXsp3S2mJEFU1CJIwSBcSctMIhVQDbBIY8bXqNactq
X-Gm-Gg: ASbGnctJrVJq5h6rnaScje8t1F6ZRGfcUa8YM+A45uqVwdb0dUeT5CubDC8UbEWxYbC
	a5No+vxbyri27DXqaMw06WGazRyVvlxBF3VV/uBuSDwwq8f3yyfMxg/2oQJrgnTDZVoFWCaIapx
	Nvq7kYoPfcxEc0KdqqIsZJUl4kWpG2xzEEhG74We+WW1DvlDl1iMsnaPp531qoRjTGgZvJSozUZ
	+hR05CqnPISNLOaohtWy3TjfkvGbPssoou2YPva1huZGh9sozm2RCw0QqisWNSOTtpwDOIhmz27
	822FYOibr8GebkRXm6fqql6o+BvXXiWv2kF3ndtMZKHXmAo=
X-Google-Smtp-Source: AGHT+IHAuKGGhkDU+jjIP0VIyaIFBFzrCdvQJqzNHD2lEv1txkvlHjiapHFsIys2vUOqSTBhKiLQeQ==
X-Received: by 2002:a05:600c:1c9a:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d01c1daebmr80191355e9.22.1741804308632;
        Wed, 12 Mar 2025 11:31:48 -0700 (PDT)
Received: from elitebook.. ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c101febsm21248374f8f.81.2025.03.12.11.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 11:31:48 -0700 (PDT)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>
Subject: [meta-oe][meta-python][PATCH 1/2] python3-legacy-cgi: introduce recipe
Date: Wed, 12 Mar 2025 23:31:32 +0500
Message-Id: <20250312183133.3403868-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 18:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115938

With the cgi module being dropped in python3.13 a stop
gap solution for modules relying on cgi is to use the
legacy-cgi module. Introduce the recipe so it could be
leveraged in the upcoming changes.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
---
 ...py-fixup-interpreter-according-to-OE.patch | 28 +++++++++++++++++++
 .../python/python3-legacy-cgi_2.6.2.bb        | 22 +++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-legacy-cgi/0001-cgi.py-fixup-interpreter-according-to-OE.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi/0001-cgi.py-fixup-interpreter-according-to-OE.patch b/meta-python/recipes-devtools/python/python3-legacy-cgi/0001-cgi.py-fixup-interpreter-according-to-OE.patch
new file mode 100644
index 0000000000..0af8ef4842
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-legacy-cgi/0001-cgi.py-fixup-interpreter-according-to-OE.patch
@@ -0,0 +1,28 @@
+From eaa9964cd6d22564fa5f1270d194eb65ebaef57c Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Wed, 12 Mar 2025 17:44:39 +0000
+Subject: [PATCH] cgi.py: fixup interpreter according to OE
+
+The underlying distribution is required to update the interpreter
+by design. This can be referenced from the notice that is found
+on top of the same file being patched here.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Awais Belal <awais.belal@gmail.com>
+---
+ cgi.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cgi.py b/cgi.py
+index 22897a1..f86db84 100755
+--- a/cgi.py
++++ b/cgi.py
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/python
++#!/usr/bin/env python
+ 
+ # NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
+ # intentionally NOT "/usr/bin/env python".  On many systems
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
new file mode 100644
index 0000000000..2b2840ae14
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Fork of the standard library cgi and cgitb modules, being deprecated in PEP-594"
+HOMEPAGE = "https://github.com/jackrosenthal/legacy-cgi"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
+
+PYPI_PACKAGE = "legacy_cgi"
+
+inherit python_poetry_core pypi
+
+SRC_URI += "\
+    file://0001-cgi.py-fixup-interpreter-according-to-OE.patch \
+"
+
+DEPENDS += "\
+    ${PYTHON_PN}-setuptools-scm-native \
+"
+
+#RDEPENDS:${PN} = "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[sha256sum] = "9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f"
-- 
2.34.1


