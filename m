Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3123C0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:51:22 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.53406.1690217476638608225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=a8hD16Ai;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-403ea0a50f7so35608911cf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690217475; x=1690822275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmqJDK3odnsTwyyTvAaunHm8N1eUyQf66NI1mzYN4pQ=;
        b=a8hD16Ai+9fkO2LjPrAQxfp7Rsxpnj3aBYAEFcoqK5xeBRwa42JDlJZuiAVSUNDuCc
         P4pjXY34rlX+e4xhmWkYtJiHFJcJgaZ7wkM4F3INKtuvheWiQ1mszBgiJFbgnfCPNOwN
         4fqkc7CRIb77Wml0SRXOjDJ6re94tBjYO8laNydS1OR/8FVywlpkkd8hHlVbBQVih/os
         o9TpYeNUBuAOUmZUlykeoeLiICiOf9chEteoNXVHWACEbdhsQHA0HCN9JE7zeE+I0cuX
         20bo3PMtGvwmYkFBuqSmHqxALleUyuoiZw7scWFoshS5OeUpi2sH8XnQSKfF6MNWZW/a
         vbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217475; x=1690822275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmqJDK3odnsTwyyTvAaunHm8N1eUyQf66NI1mzYN4pQ=;
        b=hWkQj8B0Ey4D/7fgYLNvmll7IncIVN6dnzOZO0YLw7zvJCxUvpnpnswUxHPEyxfftA
         pn4pwkk6emLJwJ6/2LvBz/ISqKb83kZ8rxmLmMWYsf1mI3OkVHi/JGr1spMjftASl2B7
         QCyFz1RaEkzU/fRxvYqM9u+97djxht/MmhGKLXGSyWD1twuB/tdnihu0Z9WNw0tX1+zh
         YsndosudwQ1+gWADtlY18gz2sorj1u4SK6ClOIsS50a2JNuHcf5o5e/0BIg/7LexTAwd
         +mln7XitJEsHVogSatLGKNp+6W8Y7wvnZId953ibnBF2WuiFbp5FeAaL0dlJy3QTP6dZ
         N4iw==
X-Gm-Message-State: ABy/qLaU5u4CD6tv5e3uEayDNH9yf286Eil2+HRADOpfkxFnNJqx8sOf
	ySdimLcrslQUai5yP0ZlIkPywPPL/J5TfnHEdWI=
X-Google-Smtp-Source: APBJJlGc/MgNphHiiIv6BwwDJolwdk0nzKXrzXzj5L1uwaw5vGHUgLoaKZw8KHcz2LznhiR2dNDZGw==
X-Received: by 2002:ac8:57d0:0:b0:405:51c5:21be with SMTP id w16-20020ac857d0000000b0040551c521bemr363909qta.62.1690217475505;
        Mon, 24 Jul 2023 09:51:15 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h19-20020ac87773000000b00403e80cad67sm3451551qtu.41.2023.07.24.09.51.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:51:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-mypy, python3-mypy-extensions: remove
Date: Mon, 24 Jul 2023 12:51:13 -0400
Message-ID: <20230724165113.2925-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724165113.2925-1-tgamblin@baylibre.com>
References: <20230724165113.2925-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 16:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103995

While attempting to upgrade mypy and mypy-extensions, it was discovered
that it depends on new modules, some of which have no maintenance plan
in place, e.g.: https://pypi.org/project/types-typed-ast/

Since this is something we want to avoid adding to the ecosystem and
mypy isn't a dependency for anything else in meta-python, remove the
recipes.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-mypy-extensions_0.4.3.bb   | 12 ----------
 .../python/python3-mypy_0.971.bb              | 23 -------------------
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.971.bb

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


