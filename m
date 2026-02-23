Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1D6EA4FD7
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:19:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37386.1771859984715366558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bsX0NkOD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso38166595e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771859983; x=1772464783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JS6wu7YeTUw32GuvMo/Op0S+KBjaygIlguJILIVoKcU=;
        b=bsX0NkOD1aYxduEQJqg1vVe8eLHgtMvaMLUB8op1dyNWAKRFh/mjXaDaBrowaS1NDS
         nNqWu+1jwgqIQynvu9WmRHQK6TPef/4kPIWfoAWuRtdVp+Y3HY9Smr5TOr3AvpzzEJoQ
         xLTM2z1l07dL/qwdhx1zIJ78mH6sU0bMFRnNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859983; x=1772464783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS6wu7YeTUw32GuvMo/Op0S+KBjaygIlguJILIVoKcU=;
        b=btkOAV/wz6KAG5uBQOg+AJo0yYB3dY5M8T94g17bBmiqvQJbw5i+i9VYlCyVewfEDQ
         NWwVim6ABZ6A1iGBcvcsdpiyXxdDFWfh68HiGxQU/A95fAjoExIE28XSlh4XDp0dkbhf
         7Ev4FZoWPhjtCkY5BQUJ8oScZTr0zXrahYq/vGxFryjN5qDzdMM4ezdaw2N9dMBnY3nO
         AcIygXC/eSzr4Kyx/Wb3b/iTUowS2DfUNyJ1ZdPClYKpwU3BCB/CSXyD4yE6pgGPmkpg
         uDJfIiWNoNY2jAs+wClAZQYrk1HCnnCRoVnIBCTRVA8rNql4nDoZWN/Hn8JNKQk/CGTN
         3IZg==
X-Gm-Message-State: AOJu0YxXkC/8iTKxz1hGotDsSGc21PIck9ONzsUPncg8Y9Q8+3RGUcY9
	8f0eV4jSHc2T4hrhLtgWr2J38FKzGDWUA7r2ofhy2FTzZQVTV1T76ebAuGoiWPpJ0MfenWrx0QX
	oaj5l
X-Gm-Gg: AZuq6aJgklT8H8dArPujuZHQP/FIjgEZ+4cw98TXaXQLyShXQAs4M+Mg+pzk1J9pAs6
	0Rr+OF8ih4R4x8jZLp8X+y6l/kNyMI2wd9aGzBsxsTeB78EyDVO23T6O6kmXIglW9Rc/E3r4VtS
	V6O04ukdy0k+u+IMdwIoVDViR2GL2hP1g8Y8sQsb9v/5Y19EmQe1dFO2wQbqXbqHZsvc5A70eqF
	8EjlpQioslIJyB6aiNqlYOecmPOhNVp5jmk/i8zfM2q/e+CifI4EB5eyM30KxbFyetTeYihF610
	RMwND/2D7X3ejLkLoyiRO1DOhsAhXbjT4fRz5gxBKVYOD13+Q5rfNWaqGWmV7JcaknDaDxunenL
	PmBAyfIQYoWqUseFbjnMdbhhbwi9seA/yOEUaYSB+X7VbTFUTq66z8u2yR9p87m8QWWGSftFx8T
	Wyi6tm70wKiygVD0f4xq4xrPua2SbQRpFkDEyxdfoXS55qHeo=
X-Received: by 2002:a05:600c:3553:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-483a962e3edmr163298575e9.18.1771859982155;
        Mon, 23 Feb 2026 07:19:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm195184285e9.14.2026.02.23.07.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:19:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-mpmath: Upgrade 1.3.0 -> 1.4.0
Date: Mon, 23 Feb 2026 17:19:37 +0200
Message-ID: <20260223151939.1352991-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 15:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124549

Upgrade to release 1.4.0:

- Support underscores as digit separators per PEP 515
- Add rationals converter for mpf's
- Rewrite bernpoly/eulerpoly to avoid dependency on bernoulli(1)
  convention
- Support base kwarg for from_str()
- Support randmatrix() for mp.iv and mp contexts
- Added rank() function for matrices
- Add plus flag to select the B_1 sign convention for
  bernoulli/bernfrac
- Add mpf.as_integer_ratio() method, support construction of mpf
  from Decimal objects
-  Expose lower/upper_gamma functions
- Support mpc initialization from string
- Support asinh/acosh/atanh in the fp context
- Support binary/octal/hexadecimal string output
- Support pickling for matrices and mpi
- Support matrix.__array__() dunder method
- Support more number syntaxes
- Run mpmath as a module for interactive work
- Add signed option to to_man_exp()
- Add fp.hypot
- Support inf/nan's in ctx.almosteq()
- Implement mpf.__format__()
- Support conversion from scalar ndarray's
- Support rounding modes in mpf.__format__
- Support '%' presentation type for mpf
- Support gmpy2-like rounding modes in to_str()
- Implement 'a'/'A' formating types for mpf.__format__
- Add mpc.__format__()
- Now mpf.__round__() returns mpf
- Support 'b' (binary) format type for mpf/mpc
- Implement mpf.__floordiv__() and mpf.__divmod__()
- Add parameters for MPContext constructor
- Add MPFR-compatible aliases for rounding modes
- Support negative indexes in matrix
- Better introspection support for decorated functions
- Add moving sofa demo
- Support spherical Bessel functions (jn/yn)
- Add pretty_dps context property to control number of printed digits
- Support thousands separators for formatting of fractional part
- Use PyREPL, as fallback (no IPython)
- Add exp2() and log2()
- Support rounding property for the mp context
- Add Fox H-function with rational A/B parameters (foxh())
- Provide experimental support for free-threading builds

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-mpmath_1.3.0.bb => python3-mpmath_1.4.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mpmath_1.3.0.bb => python3-mpmath_1.4.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb
index 21bae9778c..12ded173e9 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.4.0.bb
@@ -4,13 +4,13 @@
 SUMMARY = "Python library for arbitrary-precision floating-point arithmetic"
 HOMEPAGE = "https://pypi.org/project/mpmath/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bde3c575382996b75d85702949512751"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6607bd72611b702183473dfb4e6198b"
 
-SRC_URI[sha256sum] = "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f"
+SRC_URI[sha256sum] = "d272b40c031ba0ee385e7e5fc735b48560d9838a0d7fbca109919efd23580a22"
 
 CVE_PRODUCT = "mpmath"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += " \
-- 
2.47.3


