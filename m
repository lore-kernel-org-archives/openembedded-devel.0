Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2307DC7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:03:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.3608.1750410195898774138
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 02:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JUhQYi08;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad891bb0957so287262766b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750410194; x=1751014994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7vdxIkqbXYXbVQyeCAHlLtkDENXYsTrNA8FCiJYdYE=;
        b=JUhQYi0890SGSNW92loIGhlBkxpUVUN9f8o0GjEaU3z7cubgejxxtWq1MP2yv3g3lG
         n6TBRXN3JBFLkNDiozm97WZTECyFYQ26NL55R/jrLnknTgtdWSkFKOG07g4xg2zExhkr
         bqjltcZQ1eyyu7WPlMERJC7o4QSAdP71jNX5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410194; x=1751014994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7vdxIkqbXYXbVQyeCAHlLtkDENXYsTrNA8FCiJYdYE=;
        b=bCUHjKG9+/WUJgDDUcoSLFSaajHi33DunL6LWpak/YUiFZDP+yPKjJpqqLT+KSDGzK
         NCPDebJ6yybgGhJ/NhWnRlYsF3Qw0xxqKP3qZb67ObxRtesq2AqnXf+ZvBYT61pNFNXI
         6DGcVW/Tzb+635Oe5MQA4a9soB30Cq6p4U1h58Bn3FkktTCkpXr7hA1eIUYKv8udiV1C
         GqQWOvTr+iOpuVVWX2Nnp+xqiwKxeekTP3ZKkPW8d35NohsJkiMVUVWG+J2Igt6EOcKs
         owv1HsqmhFSbkEIWJAoQAYz6MsS45GdvMl1ZMR7Ch7nmIpWG1IRTIwKAvv/6HYg6LPqr
         ZF+g==
X-Gm-Message-State: AOJu0YwBfEpGTKyYzcrFEJcvrQyhJDNYJtboARjyJb/IttTCkjPWN9+e
	TfZyTn/hZ+lgtGP1qqeEXq/jKz5pJAaY3qaiK5DLDNeRBorAucgeK8U4KKqia0WetN+KkuuWSb6
	TyLiO
X-Gm-Gg: ASbGnctICWqHt3lmu41fWq8oUnCGoewJicCwL23qvdDl83JnJf7BLU5/6Mh+wOo56Dl
	2QZjAK+OefAU4ZRbkva2SSc/5lsoIsnwGmv6+4pSWLPy08Hob5wsHVYZ685n5q3Rm/KeBcGXrly
	8aprK+npTlgU28Y5XrEdTRy1P2DtkmZh/s025DC30Z5eyswPXaEVdibiEv28N4bPOn/CHEMuGZw
	4wOqY2Uwq+SgdqtQc8i402q4Xcw9vcLgcbX6kbgXcNTybIemRKm/+2HoPiFAUqNnRkZOksrSnOy
	MjZHyln3Pe1ZH79xDvUOnMc07UA1rVOe5JfRGwhiCSpVU90s2RCVQKFh+cophC1qSALOhEnqiPQ
	A
X-Google-Smtp-Source: AGHT+IF6VXRnbw8C1pZn+Co/Z+z6LrqA3JZIGWYeY5Ee2gMFLbCT6Yk7ifkWwsQbFfawcsCwDGyAyg==
X-Received: by 2002:a17:907:1b0d:b0:ae0:4410:47e3 with SMTP id a640c23a62f3a-ae057c6f0d4mr205458866b.51.1750410194013;
        Fri, 20 Jun 2025 02:03:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm130551966b.102.2025.06.20.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:03:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-nocasedict: Upgrade 2.0.4 -> 2.1.0
Date: Fri, 20 Jun 2025 12:03:06 +0300
Message-Id: <20250620090309.1619406-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620090309.1619406-1-leon.anavi@konsulko.com>
References: <20250620090309.1619406-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117963

Upgrade to release 2.1.0:

- Dropped support for Python 3.6 and 3.7 because they are out of
  service and to simplify development dependencies.
- Dev: Changed 'make install' to no longer perform an editable
  install, but a standalone install, since pip will remove support
  for editable installs.
- Dev: Removed support for the env.var TEST_INSTALLED that used the
  installed package for testing, for simplicity. Now, the local
  package in the repository main directory is always used for
  testing.
- Test: Python 3.13 was pinned to 3.13.0 to work around a pylint
  issue on Python 3.13.1.
- Addressed safety issues up to 2025-04-27.
- Dev: Added missing dependencies for development.
- Test: Fixed the issue that coveralls was not found in the test
  workflow on MacOS with Python 3.9-3.11, by running it without
  login shell. Added Python 3.11 on MacOS to the normal tests.
- Added support for Python 3.13. This required increasing the
  minimum version of several packages needed for development.
- Added '__version_tuple__' with the integer versions.
- Dev: Changed from setup.py to using pyproject.toml.
- Dev: Split safety policy files into one for installation
  dependencies and one for development dependencies.
- Dev: Split minimum-constraints.txt file into one for installation
  dependencies and one for development dependencies.
- Dev: Cleanup in the Makefile.
- Docs: Changed versions shown for the documentation to be master
  and the latest fix version of each minor version. Changed
  documentation links in README file to reference the master
  version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-nocasedict_2.0.4.bb => python3-nocasedict_2.1.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.0.4.bb => python3-nocasedict_2.1.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb
index 31bd15f8b9..a7c3f55702 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb
@@ -3,9 +3,14 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "4ca934f65df57b10d0fcab5f0c39e9dccb93577ff9f22bef98265ddbf12f8af1"
+SRC_URI[sha256sum] = "b563d5851cbb0e0b10fbb6189ba87e0612d22e5a6f3a004a4573ab5b38aaaa7d"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+"
 
 RDEPENDS:${PN} += " \
     python3-six \
-- 
2.39.5


