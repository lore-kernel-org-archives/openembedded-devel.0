Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F53DC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:39:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.338.1708364369654921035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=epUAzGh+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d953fa3286so27670685ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708364369; x=1708969169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAmFZXtmeqx+wSweb8q4ZBqH3zJUdGf/eCvkNNWDO8A=;
        b=epUAzGh+GjAlWClkfoizJCrcWWKqdo5rh5X7KVPfAbFBiK+XTwkLoDOdv3lX5p0NUy
         dBfIX04RLB9Ixsxqaoho7xu4ywwltO/Z1MU6FworKWKhQ3U+NP8AbRF2V/YncpKQlgnX
         5qNdl07z8CXglvXaSsTs8Awc4N4NbIZ48fWVkK6zOfk+IcCmOCmyd7E9jorgLcjE8ZEo
         kf2lCRJ5mqyayQWELvkoWbPwqiEMkqEUU1zh9Chbx8oFYxMfH5zATL+KweVgu21sKUAK
         gtmq3DxYuMTnwRJetkwwt4CqJ8JIzn2XZ5GPPYTAu8mataF7stTngJhSPzrjDeoTSUjY
         lpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364369; x=1708969169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAmFZXtmeqx+wSweb8q4ZBqH3zJUdGf/eCvkNNWDO8A=;
        b=Ad4VF/F7X4crehBZC3pTrIc+7ZlnBRtM40qLtwSOeFSBbnyQmMaIdPX4/T7Ghlpdg7
         Pf9l0bO1fNoajnjlaI5vOph4raNsNgCOBcTlLsVogPqH5/8GSIs5XvpiHGm0G+dYXFZu
         U8z2wkJRdDTUIb8LsELykyM7sJmVDnSz2y1BAUwjpJKi8RJT5h+XQnvrAN+Vn7H2OPRK
         l593i2hBrhEKLPEJHiqwFSqk+/IIcIJnXBx4GrYbMN8reL9UnkRnbWvqD9jm85RO8Tac
         64c60HXIiHtJrRHZaSlwVsN4QKp4lXSSBgJSRtzXjNov4iM67iJraxv8nQHT9NRTsi5O
         cKUg==
X-Gm-Message-State: AOJu0Yyh9jegQxepVI30HhuFCmXHHwkjRbdWNaTn1VaGtt+d/FjtqYfn
	B8nhPLz3SLR1UTBsxfTUoD73bQvQeSlUTAt3dr6vR2/BA1Tu5rhwl/eag51A
X-Google-Smtp-Source: AGHT+IEpdxJWp2jYa6WzqfZnlxWY3XzpFBjLpFRWZCYwxnyv19D5JXlMGaI23luPr4rcErYoRSBmEg==
X-Received: by 2002:a17:903:246:b0:1d9:af94:9f3d with SMTP id j6-20020a170903024600b001d9af949f3dmr18665223plh.28.1708364368625;
        Mon, 19 Feb 2024 09:39:28 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id kr7-20020a170903080700b001d739667fc3sm4683455plb.207.2024.02.19.09.39.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:39:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python_mesonpy.bbclass: move to oe-core
Date: Mon, 19 Feb 2024 09:39:04 -0800
Message-Id: <310caf099b8e305b21876671c5911e879534b6b3.1708364156.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708364156.git.tim.orling@konsulko.com>
References: <cover.1708364156.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 17:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108873

This is now the declared PEP-517 build-backend for python3-numpy

Move the support into oe-core

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/classes/python_mesonpy.bbclass | 52 ----------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta-python/classes/python_mesonpy.bbclass

diff --git a/meta-python/classes/python_mesonpy.bbclass b/meta-python/classes/python_mesonpy.bbclass
deleted file mode 100644
index 131fa74bed..0000000000
--- a/meta-python/classes/python_mesonpy.bbclass
+++ /dev/null
@@ -1,52 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit meson setuptools3-base python3targetconfig python_pep517
-
-# meson_do_qa_configure does the wrong thing here because
-# mesonpy runs "meson setup ..." in do_compile context.
-# Make it a dummy function.
-meson_do_qa_configure () {
-    :
-}
-
-# This prevents the meson error:
-# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
-MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
-
-CONFIGURE_FILES = "pyproject.toml"
-
-DEPENDS += "python3-wheel-native python3-meson-python-native"
-
-def mesonpy_get_args(d):
-    vars = ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
-    varlist = []
-    for var in vars:
-        value = d.getVar(var)
-        vallist = value.split()
-        for elem in vallist:
-            varlist.append("-Csetup-args=" + elem)
-    return ' '.join(varlist)
-
-PEP517_BUILD_OPTS = "-Cbuilddir='${B}' ${@mesonpy_get_args(d)}"
-
-# Python pyx -> c -> so build leaves absolute build paths in the code
-INSANE_SKIP:${PN} += "buildpaths"
-INSANE_SKIP:${PN}-src += "buildpaths"
-
-python_mesonpy_do_configure () {
-    python_pep517_do_configure
-}
-
-python_mesonpy_do_compile () {
-    python_pep517_do_compile
-}
-
-python_mesonpy_do_install () {
-    python_pep517_do_install
-}
-
-EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.34.1


