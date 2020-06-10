Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.5402.1591772709246071276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=afpMx4oQ;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hdKb3fwWz45
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 09:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591772707;
	bh=dInfOUw2ammQsbk0F3w5J/ACvNDYIfPDRub2DuXQGJk=;
	h=From:To:Subject:Date:From;
	b=afpMx4oQ6UVF/B2ksXx01o+3pUz2imol3/r1iCuAca7ndvpvZF8eNt3WVuEX1+PRi
	 vgXeHvrBVB0Ur01MFstdn+Ewa9H3ed1MBWL5iGGuFlyaCQ1iPN5TfUShO2K/o8pXEw
	 HLQY8nkPCgAwMCWOlmTTw36Skg5XayKsPGtFo8KcejGt0OTinKV5W+9i7NNTdU1RDd
	 Xc8gcmpjYQwNPAz9+mFaBxOZMyhVSnG+FqnwUqNs21s0LVQZo1fqGwEJZeoZ1OwJVv
	 dftEKeh16DNp2YTJsoUigzp90aWVA0I6Bxi4P4LuzbIAsmdohdl3uSQAzOm4SoI6q8
	 zAq+vk3Nqr5MuL9b8Zo9Yic+KLV2FkLKtkjzDSLnUoVVzh+cusV9qjbU3q/7Pu0ejU
	 3R9ygQHMZEsUlk/knrGNo9uUwe+LmUwtFEjrRGkIwxQCWyZq5QCHzgayXxBOX2kLC4
	 Bpw+h6gYdoTBrIViyLLgnWTc1mAhHgQvM8YrPJFTGef/boh6BCiwZH1kTKE1HQysmb
	 xnU5S/c1ND5LLTvZztSebJH21imEGBS8GgVGGUni2SyvsxHNaSwoRHdw/tXOR5bYzg
	 k4wvE4rTotewXHrjOspG0EDnpI8u968tLP8ySdwLFvSjmDQwIv0pqXZncHqaiU6mpB
	 wlt1Mh5pwIn4DyYVxtJKlUoQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][dunfell][PATCH] python3-docutils: Remove, moved to OE-core
Date: Wed, 10 Jun 2020 10:04:58 +0300
Message-Id: <20200610070458.10008-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
[ python3-docutils was already in the Yocto 3.1 release of OE-core ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../python/python3-docutils_0.15.2.bb             | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
deleted file mode 100644
index 321f55572..000000000
--- a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "docutils"
-
-SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
-SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
-
-BBCLASSEXTEND = "native"
-
-- 
2.17.1

