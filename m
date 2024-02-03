Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA6BC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 21:13:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.25805.1706994795628896579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Feb 2024 13:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZoM6Wmp;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b1b21c020so1746655f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706994793; x=1707599593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbp77TxK3/tUeXyN9VmlDn/Jprc9KNXP4501X7vK/qY=;
        b=CZoM6WmpMajWBqYUAs35ip1YBiJK+kgukz9wbB+3C7XDTzIEFQByPm0Su8iQUbl+ac
         dE94XG+XOEee6j4KfQvqO0y2TN2AlT8iYJC/883o1W03h02S195pjjvwf1Orbgk8juL3
         OVUTnvTBNgNfaPt14GW3Ut8WSucEHfCgttw3AKdO9144xd7x1r+EPP1zo/2OVbr1wSNj
         GePmmJzluqdbU5pzlutZUQS6Gohpwd7hBM5vn3axJ1RwEtTc0T+WIJ6RvmUgdKb7Sn6g
         ZcLxPIwZFf74oN+1a6T0OK2Yb61cdnHzWzakpubQKrYr6T6Q1V3NKWj50MTsFjKKxZYE
         mhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706994793; x=1707599593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pbp77TxK3/tUeXyN9VmlDn/Jprc9KNXP4501X7vK/qY=;
        b=W1ppcI0hIPwxx5L/emM0H5emXhhW92Xh6Pa1b0gsL9O586H8amwyb+0BxbXoqCBXP5
         sV/1JrONqnkk5wkPr7ggu6i9ZGIXHyPu1aC2brEYff2s7gZwAO9y9+FcQL1k6YQzbDhO
         CtgQzoDrgRiRXkTTLmIOX7Hgg5X7Mocy58PX3IiSxytQNl8YxzfuGTKSmxTaanWHqloH
         8JKjDggs0hh980wdaXlKkp8XKNmuUd9iJb+yNBpWFe2BLMhTpjCPOAN3/ZydU94wipOu
         ofiBf1d81wlg58C05a0XbXrtxJ6u7eycguV4rAcQr6FZE9lauKv4aim2CTi3xszfkExh
         jHBQ==
X-Gm-Message-State: AOJu0YyTTWyrotAuf+YVS4VCXYwZWfFrpEGhHrBB+WP9yG9z7M3vhAvu
	urTkMqKDEwMHHtYjG4f+vyzGY/0YP9lHWUYBft1HSKW/nMmuoKulR0jbjV9uKC4=
X-Google-Smtp-Source: AGHT+IF9KfMM1FfE/PbJKCZpXaZmw8v91gxvC+PnuLijb3Gjk4qb3PO7kOSHArlh2b6mhQSUnpPJuA==
X-Received: by 2002:a5d:5448:0:b0:33b:1a0c:abe0 with SMTP id w8-20020a5d5448000000b0033b1a0cabe0mr5469259wrv.8.1706994793239;
        Sat, 03 Feb 2024 13:13:13 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id r18-20020a056000015200b0033b06fdb8f9sm4705177wrx.37.2024.02.03.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 13:13:12 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-scikit-build: upgrade 0.16.7 -> 0.17.6
Date: Sun,  4 Feb 2024 00:13:07 +0300
Message-Id: <20240203211307.86988-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 21:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108556

Moved to hatchling as a build backend and requires hatch-fancy-pypi-readme, hatch-vcs. Also, added tomli as a RDEPENDS.

As stated in the upstream, the license updated to MIT only.

Changelog: https://github.com/scikit-build/scikit-build/releases

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-scikit-build_0.16.7.bb     | 21 -----------------
 .../python/python3-scikit-build_0.17.6.bb     | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
deleted file mode 100644
index c033c56ba..000000000
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
-LICENSE = "MIT & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
-
-DEPENDS = "python3-setuptools-scm-native"
-
-PYPI_PACKAGE = "scikit-build"
-
-inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
-
-RDEPENDS:${PN} = " \
-	python3-distro \
-	python3-packaging \
-	python3-setuptools \
-	python3-typing-extensions \
-	python3-wheel \
-	cmake \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
new file mode 100644
index 000000000..8f6e40fa0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Improved build system generator for Python C/C++/Fortran/Cython extensions"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c96d2b08b3cec6d3c67fb864d1fd8cc"
+
+DEPENDS = "${PYTHON_PN}-hatch-vcs-native ${PYTHON_PN}-hatch-fancy-pypi-readme-native"
+
+PYPI_PACKAGE = "scikit_build"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] = "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
+
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-distro \
+	${PYTHON_PN}-packaging \
+	${PYTHON_PN}-setuptools \
+	${PYTHON_PN}-tomli \
+	${PYTHON_PN}-typing-extensions \
+	${PYTHON_PN}-wheel \
+	cmake \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


