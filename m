Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6738.1618307333218918557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWFey-0007BP-Tp; Tue, 13 Apr 2021 12:48:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-sympy: Upgrade 1.7.1 -> 1.8
Date: Tue, 13 Apr 2021 12:48:33 +0300
Message-Id: <20210413094835.20465-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413094835.20465-1-leon.anavi@konsulko.com>
References: <20210413094835.20465-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

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
---
 .../python/{python3-sympy_1.7.1.bb => python3-sympy_1.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.7.1.bb => python3-sympy_1.8.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.8.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.8.bb
index d4508689f6..3c05c76396 100644
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

