Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0802FC561E6
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 09:01:08 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15048.1786006861206653751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 02:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z/LRm180;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fd66a094eso756956f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786006859; x=1786611659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPdNYwqNkJoIgeyjV889bSuDWM2TXwy89Wo81GPXlJY=;
        b=Z/LRm180xgSxJm+NY2HrNkp6je7wvlpUM2Pv61UlG9D2hVYXu2IQC+/yXyf3ZIRJ2D
         7Jkuq4MoDP1GDxnDaVqbipVRJUNhOwbBkgepIKVtI84nsi9HyxQ7RUs08lUhO40YgcaK
         u+69FRME16dKGZ862FqgDZ7G1runkrfXGIxbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006859; x=1786611659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPdNYwqNkJoIgeyjV889bSuDWM2TXwy89Wo81GPXlJY=;
        b=qJNo59lC2NRfOApTaxHQVUKkfF/5x3IN0svX+GjZCQwqfy+2NQ5aenyPxRibeM3yWO
         QZu4AX2ydafzGMMrSZaqCGtXkzpt8XC6O2oRIkTqWNigWBs0/qTGp3QKfRD1A4mQxkkH
         OLqwlUN3BZ2JS/3O1lta6QNLGLS6OSWox0Ae7MA8VZ6obgj6Z0kVw2JLDqKx23+5qwGY
         ltn5tUGILdpByTE+g62/pjaQvu+Ak/9NLigCIvupLjy7LiC5ZPPY1D4g7CktxztF1AmB
         KUBYvNJ+9Jab2gASL9YWTs1PNRAnOc4mYOiuZuRqovX3UlwblfZVA423+ntQWNVg/34C
         CTjw==
X-Gm-Message-State: AOJu0YzUfAPIYwYx3MzNnMhNvgaWb3BG4YHyuXe7TZx7zhTApZb01nSz
	3Ogqixu/ncOsfw19lSwtKnQMIeD04EJJeUBkyOuGxKzldLVCvwNfL15OKd3AH2Vy1ndVNd2EqDa
	nXOy3
X-Gm-Gg: AR+sD12KQNT+Y3qWUmiMp3QPJZ8hFSvgYcEyLG3FvTHBzPVlg621CD6My0klIen6v7r
	n2+kEpg7HkbZ+ujH92qYkIC58zkPY6ebezkEZAM7oqnvu2+ZX84no4aA+SINjg+NFVDzZsClNDi
	M2Kc3bHbAi5p3jOh43bRpMhp8CkNyzcN4lMLD8J8+r7NLSIoi1rzc4cOtdjSrdv1gxoeysxXrR7
	Z+HR2+/U4JvXCu5M05O3m7Bdkx6QiSC65vYi/0c3M20RFUQfFx9zgMCzVSPLNXDI25bMle+RuBr
	ZsUoBExzC6m99kRbVbw6kVIMTYylbYMt6KaYmJwjY35OQbQEA25o2qpEEnQMQsyDFDZCr1mhyXg
	opgnZBlhzubbRbOg/K6gZmhJZThmeYx9NKKPDHEByt9TF7JMwuWRHmz67xGlTEzYpLLhhRnzAhP
	tY6cR/id/iHc8EPpY24J2awvtNw7pgPpxq9MbAryykTzjSLXFc1QQiMKDpn9cbVLwPpvnUsyvU7
	zTESfCElvx/p6rGcms5ZWwUr4a1PDpOZPPiuKtMK4sfdkRD65wnV1CmKmP66lR6xnmdhMnZsFWx
	/56FSCjcA1X40A==
X-Received: by 2002:a5d:5f48:0:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fec63136fmr20080731f8f.24.1786006850237;
        Thu, 06 Aug 2026 02:00:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79b32b1sm4795692f8f.9.2026.08.06.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:00:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-python-xmp-toolkit: Add recipe
Date: Thu,  6 Aug 2026 12:00:46 +0300
Message-ID: <20260806090047.3887066-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 09:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128841

Add a recipe for release 2.1.0 of python-xmp-toolkit:

- Add support for python 3.14
- Make exempi a run-time dependency
- Add missing error codes
- Remove tox
- Use flit for build
- Remove travis
- Remove packaging dependency requirement
- Remove support for python <= 3.6 (All python2 code removed)
- fix exempi returns char-size bool, not int
- homebrew path fixup

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-python-xmp-toolkit_2.1.0.bb       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb b/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb
new file mode 100644
index 0000000000..3c761ba1dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "XMP I/O wrapping Exempi"
+DESCRIPTION = "XMP I/O wrapping Exempi"
+HOMEPAGE = "https://github.com/python-xmp-toolkit/python-xmp-toolkit"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=30fa74de63728af31f13dc3bb8cb1756"
+
+SRC_URI[sha256sum] = "ca0aa2c60d418dd2558767db59953ab5954fb5b87dc0b50cecd60566b0b4e2da"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "python_xmp_toolkit"
+
+DEPENDS += "\
+    python3-pytz-native \
+"
+RDEPENDS:${PN} = "\
+    exempi \
+    python3-pytz \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-core \
+    python3-pytest-cov \
+"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/test
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


