Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.23001.1589726103024773881
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=I5/jtwqV;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q4Rl2Mm2z4c
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 16:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589726099;
	bh=1NKvcknYo0o3AF95u0kbwu16d4JMVh4eyydIur5oHJA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I5/jtwqVAMmXK7fI6/r5hTcVLRPv2nF4wlLlCswF1+2mzy7KIWe6LHeU1BwEYEL1R
	 HTVIPJzvCwwGpBv/JUgH2ZQNnwnFQP1dVVTWKrluZcSBnGeDjqDGloOFKfdO3N5HSG
	 BVgYAOoviS8mrvYXh/uyadNCjjLG4Bs12/UBeMNVFaqREQJ4t1wQg+pA0uwGnW6L5+
	 Jw3uv+Q+lwk7P6K33fwJOQwsDvTq0H0zkcoF7Lg+s8Fl15+L9429r1rR0atXp7KAMr
	 pd9qru2e0GzGiIBTu/rBt1x3TxdgwgHWcHHSsE2hMakJwIRp8FiuxSrmHzViN+VzXF
	 TvjQoP2p+m9o62N5ctHJTss8MdZsHNCFjI+INI9WyEbE2UfU/Ghe+D/rKte34rkKfH
	 jov0ML+Q86uk9o6rTPvPxIxst8lsS69Hs5IzKtkjOZImQZaZmsRhInx/vMSHgwImd4
	 X4O1e47k7Gvi5uVtsc8Yc3NnLIVLYpD1RCAMp+oAYjqxAcUQIZUMCZVQNl8obPSd1M
	 YxKfJ5AgKdupvBnZd5pPiNpGKShu1VqWMoMf1Yu2rAHqdiz0oGgzKRZmNq3dd0nni5
	 pgKtIb09F+eydEoz6aenqHdAflbn0iE2nktQOPjhubAiY6aF1GzK5qa+7ZvPJDIttV
	 84H/cpQ+a8vUukAuuih+SXGM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/4] python3-pyparsing: Remove, moved to OE-core
Date: Sun, 17 May 2020 17:34:56 +0300
Message-Id: <20200517143456.24873-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517143456.24873-1-bunk@stusta.de>
References: <20200517143456.24873-1-bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 +-
 .../python/python3-pyparsing_2.4.6.bb         | 21 -------------------
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 596c20a8c..c03f610da 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -18,7 +18,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
     python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
     python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
-    python3-behave python3-pyparsing python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
+    python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
     python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
     python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
     python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
deleted file mode 100644
index a6ec1cb9c..000000000
--- a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Python parsing module"
-HOMEPAGE = "http://pyparsing.wikispaces.com/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
-
-SRC_URI[md5sum] = "29733ea8cbee0291aad121c69c6e51a1"
-SRC_URI[sha256sum] = "4c830582a84fb022400b85429791bc551f1f4871c33f23e44f353119e92f969f"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

