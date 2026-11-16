Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34316.1794851697532959509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PkD/aekJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1140269eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851697; x=1795456497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aoj8YKnF00/llqIaaqt88uqTwqkdNGj2WuqDYcx4d+A=;
        b=PkD/aekJ0+sN81uUroAHXItT4pxm7C6wKXpkCtshl+B8bGtITeojxnE7lGNme6BEWH
         JO4diKc7KvtBgwCrvabl2Bo1tBl0bFnUS40FOmVr9/1wU2/kt+4HC+L2Un5bWjgRk1+H
         72gINadiFvZNiamOQ5okqHY30DdVzaAcYxAaQ9NxyTcK2/87ITHBNnlz3/P5FdppVjtw
         MI4McsPBEpI4F2zeZP0/Id8psHzGwhcmXJPigbgJGANl0jS7M6C+ott3wTCp8H8Dt/4K
         6Dj6bygj+pA/tRej6H8aDEwEvVdN3OzJbJW3/F+xJbuRbko44BNEsuwYDO8no1NilFwQ
         1RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851697; x=1795456497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aoj8YKnF00/llqIaaqt88uqTwqkdNGj2WuqDYcx4d+A=;
        b=OhXtfI2VUxYKmg5bwypl90md5/Ku3+6i/+w8G/DvelmzJw+YPfA/e4C+qtzZxbcrYa
         WhMxaMiCw1XlFep+4mtk0nIEhQLh72SKYGiyV6+qg6Lbuu7vF7QmX8Lxh2Ysyv+Gm5Jv
         dxlW9JUovpBxCyNh3udsTYDFat5YdUbB8/+jVr0S7pK/i+ecUZ/xZ2jrSSDyCVAkN0DZ
         q/CddcNUnzc0F8i6GGWFqw0e4szBYIdm2iORnPaRu4b22o0HqPiYzVRixGMVplIaEXxp
         1PEXRbVpEVFfRzw9cVSbKYb4HxqCi7bduY96QEHRVpj23P+0Akvk9jvzFaJQE+USdY03
         l4oA==
X-Gm-Message-State: APuU4Z/x2pESY9UIdA3I5TBiAYw4SahonxVcssXTJ67cyzwAXCg0TWOJ
	XIuTzb/6TKVnWbvHkCeiDzOi3fx3zFzQl3Vyr5Kbeuh+py5gRbK83gnGjK9Lv1d6
X-Gm-Gg: AZFdTZdr4kz4pbVlErpGNZ1C8bJfwYU9B+AbGVUlOvVl0gxdYstavSYroOMONaQKtEy
	z4ADckVKpoyZPNe0xLC1ud4bpE8QSl6S2Dswtg+Orbk7Zr5+QVo1FOIaZ85Fq8QT4nQUwToVOiV
	aCD0qmex8X1OXjknPCCEe4KhOJPqKSCez4o23QY8UTlPU753wW67EdiUKuedFPgXSrZDSsb4Mrm
	sfBnSzWkj4Ak9XZLS/oeiDkDme15+030nnw2DPIOOvpKX/dQu2x2PWbO7Qg7ubSShQ/n0FBRFsB
	LsiGIytg3kWylYal65Mhp5FjR89sUdnwtqMO/TGkO935FS4Ca7H20NmNlA+ecCpia7We3Nt2Mz7
	4i7y2HwH2g7oaW2NUKUC1wAsNnRflqSsBzFclzaHfCRiAyJkYa/sdslxCq4EbidNxgptQzQV5h4
	MVv75l+TCBUu/DfmPvR0LjNcSyEaAqZo1BHc+tO/Dax1NOw2yz9coifzUOuI5xULVxMrJpbG7xG
	EYBUaimVnaHg8dGZhiJ2shruWqcf+NkCmOoxT4Xagx4fF2kXmsuLyzQxzT06i0LDsWATU1aAJNS
	Zfw6zrTkxnyaws9PeO2QlDZ7XtyY8ruozUuaSXMP0MvGAidzUMXTyKhHG8Vxg2HcgeuMdAq7wtf
	cAfFFPkDuMcqfO74fe4vadVZYnBAYFa+/kj5y8Tgs0kY1Ro2ClcGp9KjOiPgzB1n7aG0Z/NfdnK
	cZKzvYDRTCVQ1BmPCv23AG/hlhiNtzlAAHlPk4of6KUhdV8BdwBe9vUdxPxte+EzQ9/YyOFN6RI
	ElN95vtUPmopVE3Pvm7XdxhuijwaJQhUK1Lg4D2nYHMg0o0hhK32pjEFjsBowOK99bywdG9X4AW
	y+b5
X-Received: by 2002:a05:693c:811a:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3796695b721mr11312073eec.26.1794851696823;
        Mon, 16 Nov 2026 09:54:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 038/105] python3-graphviz: upgrade 0.20.3 -> 0.21
Date: Mon, 16 Nov 2026 09:52:50 -0800
Message-ID: <20261116175359.342679-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132494
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py and now ships a .tar.gz sdist; inherit
python_setuptools_build_meta and drop PYPI_PACKAGE_EXT.

License-Update: Copyright year bump.

Changes:
- Drop Python 3.8 support; tag Python 3.13 support.
- Add format='svg_inline' (header-less SVG for inlining into HTML,
  needs Graphviz >= 10.0.1).
- Switch to pyproject.toml built with "python -m build"; the sdist is
  now a PEP 625 .tar.gz instead of .zip.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-graphviz_0.20.3.bb            | 16 ----------------
 .../python/python3-graphviz_0.21.bb              | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.21.bb

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
deleted file mode 100644
index 0fd81b0ee6..0000000000
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.20.3.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Graphviz protocol implementation"
-HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bcdc1cf20245c598f9a563b550605785"
-
-SRC_URI[sha256sum] = "09d6bc81e6a9fa392e7ba52135a9d49f1ed62526f96499325930e87ca1b5925d"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "zip"
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.21.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.21.bb
new file mode 100644
index 0000000000..4cfd89bee0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.21.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Graphviz protocol implementation"
+HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4b25184bd855af83b70418a1497a1208"
+
+SRC_URI[sha256sum] = "20743e7183be82aaaa8ad6c93f8893c923bd6658a04c32ee115edb3c8a835f78"
+
+inherit pypi python_setuptools_build_meta
+
+
+RDEPENDS:${PN} += " \
+    python3-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
