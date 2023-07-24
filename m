Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC231C001DF
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:59:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.53203.1690217932921772453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=5jqjX8ML;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-63cf3dcffe0so12705896d6.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690217932; x=1690822732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDHwosbYdwD+xmLIm4p6UowfngdCtdluzdnK7Eml3L4=;
        b=5jqjX8MLlT2XU5cqxiJk7aXWzBGq0XFXqYyOHpanNz07LYw2Ld5f++7aZZC4G/139f
         MjwJTa28qgmdyKbbpgKDLsl8kvHzrrMZK6S8WaePYgIgpLOF0rZAa359kJ+HgUKUItiM
         AJEcci/H3tcnA7/6BrJ6W+OX/ucr6/BPbSrGramvOLO+zaxVPHYOEtmvwS8deA1i9AMr
         4HwUjXEDwmyTqxlVx+HIOdXn3t80pnCI+xs7FRXJh96MZDHUPcknDn2D5VysOoU8Aq5I
         7TF7K2+KQ/ViIsiNUdyQUzDYGO9zsp7efS6M5LqLx7l7i6r8Nx+as9YgOjgYaoywddbf
         U31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217932; x=1690822732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDHwosbYdwD+xmLIm4p6UowfngdCtdluzdnK7Eml3L4=;
        b=Q32jJ3vciI9JLGiz9WaUUEOrGyRitK/2JI86avMfExCXe4zhVMlPCn3uq4IgSi50xn
         bd9dzNi/ZWbJpP81i1aiaaeU9s+SMjAKtWw5JbrnJhWH/x+eo998qaIUwlZfI7I/rWnB
         CLEDI+Fst+dRmulmc2p/po1ydZnapbBAqVpspgfji++k7dQuueOjebW3ZQ8P3+byaqVK
         vfu9RO6r6rCquBQAXpuUlYS7ZIGctAVN0G3CYyFgahg9LiEOyzuBiryUZSelqd8To0Gl
         Xi6zFO7fiEhk4Fd+gVTX3BITkbiR7GpNzEStxIraHGcN1NecQYKDULjE0PEfKSdzqLro
         xuEA==
X-Gm-Message-State: ABy/qLaqeOJ3sf1UxQf7+XPUorWYP+uXXgaPevPtbkQSmbQQOkaRmuhW
	0vU3Rmt1ibMLfs537xbAvr699ZCrx6nfjDsKrrw=
X-Google-Smtp-Source: APBJJlHDbTENXGBagoNkFJa7aBhT0WpbUEETax+Yk8xqaXgJAnM3c87gsgI0U1QmpQ3LgAff8K5WXA==
X-Received: by 2002:a05:6214:419b:b0:626:3afa:e196 with SMTP id ld27-20020a056214419b00b006263afae196mr327295qvb.3.1690217930222;
        Mon, 24 Jul 2023 09:58:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id b19-20020a0cc993000000b0063660329d57sm2182373qvk.67.2023.07.24.09.58.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:58:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-mypy, python3-mypy-extensions: remove
Date: Mon, 24 Jul 2023 12:58:48 -0400
Message-ID: <20230724165848.3294-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 16:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103996

While attempting to upgrade mypy and mypy-extensions, it was discovered
that it depends on new modules, some of which have no maintenance plan
in place, e.g.: https://pypi.org/project/types-typed-ast/

Since this is something we want to avoid adding to the ecosystem and
mypy isn't a dependency for anything else in meta-python, remove the
recipes.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 removes the recipes from the packagegroup as well.

 .../packagegroups/packagegroup-meta-python.bb |  2 --
 .../python/python3-mypy-extensions_0.4.3.bb   | 12 ----------
 .../python/python3-mypy_0.971.bb              | 23 -------------------
 3 files changed, 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.971.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b23d24c6d4..c12d475047 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -245,8 +245,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-msk \
     python3-msm \
     python3-multidict \
-    python3-mypy \
-    python3-mypy-extensions \
     python3-natsort \
     python3-netaddr \
     python3-netifaces \
diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
deleted file mode 100644
index 83ac5362d6..0000000000
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Experimental type system extensions for programs checked with the mypy typechecker"
-HOMEPAGE = "https://github.com/python/mypy_extensions"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
-
-PYPI_PACKAGE = "mypy_extensions"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
deleted file mode 100644
index 31fcb06c9e..0000000000
--- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
-HOMEPAGE = "https://github.com/python/mypy"
-LICENSE = "MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
-
-PYPI_PACKAGE = "mypy"
-
-inherit pypi python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
-
-BBCLASSEXTEND = "native"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-mypy-extensions \
-    ${PYTHON_PN}-typed-ast \
-    ${PYTHON_PN}-typing-extensions \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-toml \
-"
-- 
2.41.0


