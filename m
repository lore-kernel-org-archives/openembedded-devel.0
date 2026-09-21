Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F0DC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:22:32 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47822.1789993349685375843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TCNUCqcl;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso7668095e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789993348; x=1790598148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ija3EWhhUq4O9CujHZrb+EbPvh4cMyDbLJNGGn4voo4=;
        b=TCNUCqcl8gPGfy38uTaeMGh6zQ7tkkq+HSmXb5gebW00w1cWWDoQ2qieViyD3zpJsn
         bqxMLONAgS8l9DfyMLFhaRACvXDvi4hCxLT8lk2MDpEVTIs4/B7Lvwp5ZckY5SNIbGCi
         PIqeccf1zdOqXubuYMYT35talf8z/G+GqCg84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993348; x=1790598148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ija3EWhhUq4O9CujHZrb+EbPvh4cMyDbLJNGGn4voo4=;
        b=Ae+BUYK7hhba0HPBtMmlQEcexNyVJIfmsOOqV0wL9iU0jntmnqhL1zFpySmh2cB/uV
         oFqgZRnNbV/pBFnUbpImHrlq2ZeskI5+PH5XGpiWK110BKjeoblpRgLSaR78ljBEDmtY
         4GeeJhFo+EfF1H5/7O8JgJNGHRLKZw8C6bT+IIJcLpPuyT1+lZD4S2H7shGUJOjutvof
         yn6azEHBk3rqYHWix+OR67qgj87o5BOohPnwPlQSaE1Ka0Exrq0rCFKksfMul1ValXCC
         xrbOTS5VAnQnBbIDoM2c/n8pee2hOGvMqzhPQgdhzbaO7lwbXxaoxJE01jKQgL/03Ggo
         p8cg==
X-Gm-Message-State: AFuF++nGYKmA01xRHCb3xrweCxPLleFhQS0nG7FYrSs/SPO/rwiG1XLx
	rwjBbY75RtvxosuP2tKb1CzAz8gOuCVp89uPuH6sUVjwXToHBB5N2AV8EsHawDytuDBWqZ6LM9r
	mIM3/
X-Gm-Gg: AYBFou1Nc2alfSKgRBNGceqLjDLEPZlKbXxCBuIyxN4QoHCjX6P9PNetlKCg2w5GPV5
	SAeRe1sMS0xryWCQN9A7Hw7TkzSnb0Kg8L9B8rUmEMLcO3SmfW/1epJOE7yJG6MMqJw1CuUyyzZ
	Ci9FWoSSNsfni8/cxbKiQoRitO+WCGxTWmKfHp69A5MBWv0ixBfjenxDXB+g3owdSe09Nxdx2Dx
	dpK/sE99AtwCoeNBnxtKFl+ntBUGp45YPOB9aUfn4IMh2gtzt8WKsUMzyhWNDOOgCT/YmU7AlOt
	1cpz36tZbzEI9S9cJK0u0eHsWg/e48iPjSSg6Hj+vs1FzCEP8Pejz+UqNybfhIft2OQcpvrSY/D
	YWrEhkowBIpQYz+CRJ5ThnEiv57WmjGEv6//SOENPG2py1ElFWYzoiZWrsChW6BnrxV4ILIuIJo
	OiMlANcZ1ycpAFgdsvJwO/mg5g15bXDhQoI+jlU3y272MANCA7R+OPTvHVyPgYWf+me7A9eLCHR
	VWv365v2OZ4x8Xh5BxoUtHae0odOX5lZ0yka/1HTsaVcabumyGEjF6T6ts2elraqXyZwt+8JWxZ
	oaJRuSJiuBogSJAjMw4w15bi
X-Received: by 2002:a05:600c:c1c8:20b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fc5aa9f08mr107773695e9.8.1789993347827;
        Mon, 21 Sep 2026 05:22:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm208150005e9.2.2026.09.21.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:22:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pikepdf: Upgrade 10.11.0 -> 10.13.0.post1
Date: Mon, 21 Sep 2026 15:22:21 +0300
Message-ID: <20260921122224.4185627-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921122224.4185627-1-leon.anavi@konsulko.com>
References: <20260921122224.4185627-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130163

Upgrade to release 10.13.0.post1:

- Behavior change: pikepdf.DataDecodingError now derives from
  pikepdf.PdfError. A stream that will not decode is a defect in
  the document, and the same call that raises it -
  Object.read_bytes() - already raised PdfError for other kinds of
  damage, so except PdfError was a handler that looked correct,
  passed on healthy files, and let a traceback escape on damaged
  ones. Code catching DataDecodingError by name is unaffected. Code
  that orders except PdfError before except DataDecodingError will
  now take the first branch; if the distinction matters, reverse
  the order.
- Behavior change: pikepdf.PdfParsingError now derives from
  pikepdf.PdfError, for the same reason.
- pikepdf.PasswordError remains a sibling of PdfError, not a
  subclass. A wrong password does not mean the document is
  defective, and handlers that report the two separately depend on
  except PdfError not catching it.
- pikepdf.NotExtractableError is now exported. It was already the
  base class of the exported HifiPrintImageNotTranscodableError but
  could not be caught by name.
- Fixed the exceptions documentation, which referenced a nonexistent
  FormCopyWarning (the class is PageCopyWarning) and omitted
  ReferenceCycleError, PageCopyWarning and NotExtractableError.
- XMP assigns a type to every standard property, and software that
  reads XMP discards a property whose type is wrong - Ghostscript
  strips these silently, and PDF/A validators reject them. pikepdf
  used to choose the RDF container from the Python type of the
  value it was handed, so meta['dc:subject'] = ['a', 'b'] wrote an
  rdf:Seq where the specification requires an rdf:Bag, and
  meta['dc:creator'] = 'Author' wrote a bare string where an
  rdf:Seq belongs. pikepdf now knows the type of the properties in
  the standard schemas and converts values to it.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-Do-not-strip.patch          | 11 ++++-------
 ..._10.11.0.bb => python3-pikepdf_10.13.0.post1.bb} | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.11.0.bb => python3-pikepdf_10.13.0.post1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
index 7483ad413b..575c3abb7a 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
+++ b/meta-python/recipes-devtools/python/python3-pikepdf/0001-pyproject.toml-Do-not-strip.patch
@@ -1,4 +1,4 @@
-From 22020dc444aaf3f98dc40f38c0a8aad48476db8f Mon Sep 17 00:00:00 2001
+From 1b326de10bee40f497386921072dd80e2d7ecbde Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Wed, 8 Jul 2026 11:45:11 +0000
 Subject: [PATCH] pyproject.toml: Do not strip
@@ -19,7 +19,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 06ccfbb..475af59 100644
+index 9e991c3..d7cee23 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -7,7 +7,8 @@ build-backend = "scikit_build_core.build"
@@ -30,8 +30,5 @@ index 06ccfbb..475af59 100644
 +cmake.build-type = "RelWithDebInfo"
 +install.strip = false
  wheel.py-api = "cp314"
- 
- [project]
--- 
-2.47.3
-
+ # The wheel-building CI jobs download qpdf's source into ./qpdf to compile
+ # libqpdf before building. Without this exclusion scikit-build-core sweeps that
diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb
index b18632f926..df98507aae 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.13.0.post1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "4bebc59ac74411064e7c97a4036174023e22ccbecd22b78750ab76551eb38988"
+SRC_URI[sha256sum] = "4b73f926ebae81f04bf14527af330bd00bb268be767e0f189f7c4c3e4ad7ae0a"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
@@ -47,6 +47,17 @@ RDEPENDS:${PN}-ptest += " \
 
 do_install_ptest:append() {
     install -m 0644 ${S}/pyproject.toml ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/LICENSE.txt ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/README.md ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/GCC-exception-3.1.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/GPL-3.0.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/libjpeg-turbo-README.ijg.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/libjpeg-turbo.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/microsoft-visual-cpp-runtime.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/openssl.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/qpdf.txt ${D}${PTEST_PATH}/third-party-licenses/
+    install -m 0644 ${S}/third-party-licenses/zlib.txt ${D}${PTEST_PATH}/third-party-licenses/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


