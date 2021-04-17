Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.3515.1618693591034562336
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XQrJNpNl;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id b17so21556001pgh.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cpfTW8780yMbccZvvch8aZwxmpBW7AsctwRA7W85IxU=;
        b=XQrJNpNl9LvOP27fRhd/OjP/eu/7kugyuRzUk9FsPVQKhyYdYrt0yqtFLsHoSCKUuj
         6v1jtbbL+1lmBp/4NQHbhAxyIO5H7ieqlIfbatv5AWU9YdS5KEiPc+x7fCW7mVqcQuOA
         THEhN1xPhBa+8ShIAQbBRUr7J3UzSxaqRTBo9X8fU5BhcPN0WQRfXl4WbB8FpSC5opEl
         HmmDbgIGeeBthGJswMXEA5ZmpQ/MgTT+KgqX/p49eACvS89yn7khAIRCQkUQ4JrYC6cO
         SWUmsHn+cZQJlklc3O/wgOooChGY+GKPDqIzw+YbeH4HHP/qp8hj1hJRrYGtix0Mnzrf
         WO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cpfTW8780yMbccZvvch8aZwxmpBW7AsctwRA7W85IxU=;
        b=lWj0mzw1K1aANZWc7uGNgAAkxqJS0vcTxJDJNtRMUMbt2uRIhe/GIT2Q8F0Mx6sHlW
         M5QbK2yKcpoiXmErwy5JtB/K9/b00PuKB5yHqEd8zRn7w+V/Jer3QQk3WqQtjTJDQt/g
         od3QE9/l5bKMIiFRrZ+6yka6lcOysWy1J8kTi8/H/Q/PcBb1YEQcBTyrFHRtAC1xavQF
         Exox7LS8bk+TQPR24y3U8rJZvI48g2M7lZhn0mNHufUaY4520VFEea1rXNLl0ucuVB9+
         D4ETk8gK00/yexHJQneuhAfucS2p9FBmMBjNz3LEmBZ9EeULtFl7uj2iwbPKx+PxyFVv
         odwA==
X-Gm-Message-State: AOAM533Q8EIjUnqJwcUG+DyUlIJp6Jebhgbu/pj9m/tfVaGKfR+V7j+l
	hT2/PcPbNiLtwY0ZiVRgGotMJp2irQnTRA==
X-Google-Smtp-Source: ABdhPJyxFk/qURGOAYDcBYj4371g2CF6lVrOqj1XxPrbsu4E617DjpoLQ9wKp2SPC7BjAEfujneLuQ==
X-Received: by 2002:a63:c6:: with SMTP id 189mr4602962pga.216.1618693590473;
        Sat, 17 Apr 2021 14:06:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 29/50] python3-sympy: Upgrade 1.7.1 -> 1.8
Date: Sat, 17 Apr 2021 14:05:38 -0700
Message-Id: <e922c012cf3be238ad3938692afde02dce38a803.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.8:

assumptions:

- Q.infinite now correctly evaluates to True for oo, -oo, and zoo
- Assumption predicates now correctly evaluates to None for S.NaN
- Relational objects do not need to be wrapped by Q.is_true to be
  asked or refined anymore
- Q.is_true wrapping over AppliedPredicate now just return the
  argument
- refine arg(x) when x is real and nonzero
- assumptions/relation module is introduced. This module
  implements binary relation as predicate
- AskHandler(), register_handler() and remove_handler() are
  deprecated. Handler now must be multipledispatch instance
- Predicate now uses a single handler which is multipledispatch
  instance
- Predicate can now take multiple arguments
- Predicate("...") now returns UndefinedPredicate instance. To
  define a predicate, you must make a subclass of Predicate

calculus:

- Using maximum with a piecewise expression over a domain no
  longer fails due to a bug fix in Piecewise.as_expr_set_pairs

codegen:

- allowing for multi-dimensional arrays as arguments/locals in c
  code generation
- create_expand_pow_optimization is now customizable with respect
  to requirement on base
- Support flattening of elementwise additions of array expressions
- Fixes to array-expressions in order to properly work with
  ZeroArray and ZeroMatrix
- Fixing matrix expression recognition from array-expressions
- Minor fixes to the way the AST of array expressions is built
- Add normalization of CodegenArrayDiagonal when it's nested with
  CodegenArrayPermuteDims and CodegenArrayContraction
- Increased support for the normalization of array expressions and
  permutations of indices
- parse_matrix_expression( ) is now able to parse traces of
  matrices

combinatorics:

- Added a section to the permutation docs about containment in
  permutation groups

geometry:

- Fix AssertError for vertical tangent
- Geometric entities with symbolic coordinates will not be printed
  in SVG

simplify:

- Fix simplify calls sympify without rational parameter
- TRmorrie now takes powers of cos terms into account

tensor:

- Introduced objects ArraySymbol and ArrayElement for array
  expressions equivalent to MatrixSymbol and MatrixElement in the
  matrix expression module
- Add class ZeroArray for array expressions of zero-valued
  elements
- Make Array differentiation(derive_by_array) work with non sympy
  expressions
- Added tensordiagonal( ) function to perform diagonalization of
  array expressions
- Adding an array with any other type now consistently gives
  NotImplemented

utilities:

- Added official support for using CuPy to GPU accelerate lambdify
  functions
- Added Replacer class to simplify the creation of replacement
  expressions with MatchPy
- Added tests for optional parameter in MatchPy patterns
- Added string printers for MatchPy-compatible wildcards in
  sympy.utilities.matchpy_connector
- minlex no longer accepts is_set or small arguments
- minlex and least_rotation now accept key= arguments similar to
  sorted

vector:

- Fixed a bug with integral over ImplicitRegion objects

other:

- Expanding documentation to include all class members with
  docstrings

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 71acc03cbde585335bce125d6018f29dc70509ca)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-sympy_1.7.1.bb => python3-sympy_1.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.7.1.bb => python3-sympy_1.8.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.8.bb
index d4508689f6a..3c05c763962 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
@@ -4,9 +4,9 @@
 SUMMARY = "Computer algebra system (CAS) in Python"
 HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2245824980a408ef1749391dfba32b3b"
 
-SRC_URI[sha256sum] = "a3de9261e97535b83bb8607b0da2c7d03126650fafea2b2789657b229c246b2e"
+SRC_URI[sha256sum] = "1ca588a9f6ce6a323c5592f9635159c2093572826668a1022c75c75bdf0297cb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

