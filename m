Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BADECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.67932.1661756213897612762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oxvN0Bvf;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id l3so7080154plb.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FxgHlczSpNE4DsnSP56QtqQ80o6QymKpdAYVfRI6xaE=;
        b=oxvN0Bvf0bMezGQI7ckXqnemhKIw6k8x3uO/rL8QqJt7rQ203+cd2w8vaCUj797jbC
         NkXqEIeDHxAb6sWH647L29mMMyy/wjHseY+/Xj3Vx83vQ8hguYFA/pvS2oyA0jPr/2XB
         PpgbSlLcuMP+nTYXksabXMTpXLwfLKMrVE9xSPR1WtydN2+GAg9PQ9LhU8pdTQkoL3KV
         zTomQzNapBfnVhjEB+jAKHmUeeGKojAf0/WpRRcLeVKIa5CAmdigX/eumty9CcakUWYy
         Z/xjEW0wHFlJjc2+Auba3LdFiz9heCKiVTTmRuV6Jpp9OchOReK3YIxh3ppWECvohNlk
         8l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FxgHlczSpNE4DsnSP56QtqQ80o6QymKpdAYVfRI6xaE=;
        b=PqNspw3Kht18dXaF+3166Fy7nmLBBkJEmBCrdvgmjvd41nssjHq/1N7EDuEhlfDv66
         RrT0lKb0c8kJZ7qYG7XS3beIxWA0t8DiP+N5DxUFinvPhFiCbr+lLncnmJz7clLcqpc0
         5ilAALbZMpWQwTghybIs5gNOiovEs/BD9DImC2rf5U6Aa2TEjAHW4q1PANWV4y2O/u9m
         Ze7z5M50u5ESbqCWVTMKIiK29OfhQpJZh1SOlimhOP0XipSMkdiVHSxXoOGk+80WwlQn
         TjRrSxMgNB3K1cfWs46TnPFwDcPSH6aUTv2ZHfLw0nVqNg4Gfzp/NkGQJOLwulDnvf7A
         j2bQ==
X-Gm-Message-State: ACgBeo1Ubqsu+mhJyjfEGj1Va19QaaSW5taBIuP6CsyCjFBH9taWKUDC
	bvHQpBg7EiOaj2uO5canX/Dz4kgzimgBwQ==
X-Google-Smtp-Source: 
 AA6agR4de3ZWIgJ+4T2JgUXCNdPQG33CqddkC9nrgGeHbVfC1/RoZd5gU+6o4wJe7SRhIBiRt0Sbnw==
X-Received: by 2002:a17:90b:3b8d:b0:1fb:72f5:2d1e with SMTP id
 pc13-20020a17090b3b8d00b001fb72f52d1emr16529859pjb.135.1661756212972;
        Sun, 28 Aug 2022 23:56:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/7] python3-pyephem: Fix build with python3 and
 musl
Date: Sun, 28 Aug 2022 23:56:44 -0700
Message-Id: <20220829065649.808556-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98513

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Don-t-set-tp_print-on-Python-3.patch | 44 +++++++++++++++++++
 .../python-pyephem/python3-pyephem_4.1.3.bb   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch b/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch
new file mode 100644
index 0000000000..a84d852fb0
--- /dev/null
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch
@@ -0,0 +1,44 @@
+From 866f7560034e8b7a604432611b3cb2c92e76def9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 28 Aug 2022 11:03:39 -0700
+Subject: [PATCH] Don't set tp_print on Python 3.
+
+In 3.8 it produces a compilation warning, in earlier versions it is ignored.
+
+Upstream-Status: Submitted [https://github.com/brandon-rhodes/pyephem/pull/245]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extensions/_libastro.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/extensions/_libastro.c b/extensions/_libastro.c
+index ce07d93..c9ef1e6 100644
+--- a/extensions/_libastro.c
++++ b/extensions/_libastro.c
+@@ -372,7 +372,11 @@ static PyTypeObject AngleType = {
+      sizeof(AngleObject),
+      0,
+      0,				/* tp_dealloc */
++#if PY_MAJOR_VERSION < 3
+      Angle_print,		/* tp_print */
++#else
++     0,				/* reserved in 3.x */
++#endif
+      0,				/* tp_getattr */
+      0,				/* tp_setattr */
+      0,				/* tp_compare */
+@@ -669,7 +673,11 @@ static PyTypeObject DateType = {
+      sizeof(PyFloatObject),
+      0,
+      0,				/* tp_dealloc */
++#if PY_MAJOR_VERSION < 3
+      Date_print,		/* tp_print */
++#else
++     0,				/* tp_print slot is reserved and unused in Python 3 */
++#endif
+      0,				/* tp_getattr */
+      0,				/* tp_setattr */
+      0,				/* tp_compare */
+-- 
+2.37.2
+
diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
index 29697bc251..8c4f0eb405 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
+SRC_URI += "file://0001-Don-t-set-tp_print-on-Python-3.patch"
 SRC_URI[sha256sum] = "7fa18685981ba528edd504052a9d5212a09aa5bf15c11a734edc6a86e8a8b56a"
 
 PYPI_PACKAGE = "ephem"
-- 
2.37.2


