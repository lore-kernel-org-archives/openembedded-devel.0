Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BCFC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:19:45 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.560.1787203175392623927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lQroFP86;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=30681; q=dns/txt;
  s=iport01; t=1787203175; x=1788412775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RkwaCoKGV0BV0EGy+ADXqsUKFDP0ngJ0scuOi2NHaJs=;
  b=lQroFP86j8mBAoOYB4lntXnYFyBt/Dumq1x/+ytT+HCfMwynvHei9MBO
   y3ZPg4cVcRBhWIgo5bwXD43wCV5IUARHad+t6HizREapT1VlPwwDM5Mip
   LuYZmIQwOdULX29i/cnEN/z2qJLLMAlbpSTFN7qH7OKhzT9px+t070V4U
   koHv7METKskJgeyQBhxEUudtS1JYXnVLyqtGG0nWhMBaJEJ9S1goItPD7
   DfgCK4mUPLecH2wO3IFn6VJSRaovC4FNi2l7OszZXnlk0kF+jMrmuTTTN
   B6iZZkfq3e8DU97PNb+n40Zc9I9X1JB92VCR8RfXXGsevRAUjc3muSg8N
   Q==;
X-CSE-ConnectionGUID: ELTXvWq8QPSVOtwoGto9bA==
X-CSE-MsgGUID: Eez/PB0HRAaU/NOnZTlUeQ==
X-IPAS-Result: =?us-ascii?q?A0D8AgADjoZq/5MQJK1aglmCV3ReQ0mWSoEWnQiBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0aNbQImNgcOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBHRgBGAEtLAMBAlojIYMCAYJ0AxHCSIIsgQGDKAGBVNswA?=
 =?us-ascii?q?QsUAQWBM4U/iCJdGAFEhDgnGxuBcoEVgTuBOHaBBYFcAoEYD4Z+BIIigQyBW?=
 =?us-ascii?q?h6BD4FthmKHdEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdg?=
 =?us-ascii?q?SiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJRQ4JFwsYDUgRLDcUGQQ+b?=
 =?us-ascii?q?geOUSCBQxVyAQEwKDUBBxQPAQQrGUkPIzoBBihLkmoCCJAWgiGhDwoog3aMI?=
 =?us-ascii?q?ZU6GjOEBIFXiz2HA5JRC5h9jgqVNAdITYRpgW8NKIFZcBU7gmcJShkPH44ND?=
 =?us-ascii?q?AuDYIJKgxrGVScyAgkyAQEHAgcOAwuBaJAAAg8XB4FPAQE?=
IronPort-Data: A9a23:i/iwT6uCRhtzjm/qv4mflptHKufnVABfMUV32f8akzHdYApBsoF/q
 tZmKT3QOvuPa2H1KY92YNyzph9XvsTTz9cwSwttqX8zE3tEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw18JLMX9x7
 KwhEAszSQycgM2qx+OxY7w57igjBJGD0II3s3Vky3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgh/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKFI4fUGJUMwhnwS
 mTu0mnrRSkwbPyl4DO4tVSLgN3zmR72YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:iZyofKpKcCdTOdFXfK1odDYaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:7kAEfW+j9qLSl4voKliVv2MwJvA7TWSN9U/rHWikFmFGVLrEQ3bFrQ==
X-Talos-MUID: 9a23:uggnFAaymLrTV+BTmjL+wwlIbOdSyq2TT2Yql6c6v/SJDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813658147"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:19:34 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 0A13118000174;
	Thu, 20 Aug 2026 05:19:34 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 9D854CC12A6; Wed, 19 Aug 2026 22:19:33 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH] python3-simpleeval: Fix CVE-2026-32640
Date: Wed, 19 Aug 2026 22:19:31 -0700
Message-Id: <20260820051931.2263-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129375

From: Hetvi Thakar <hthakar@cisco.com>

Manually backport the three upstream security fixes for
CVE-2026-32640 to the Scarthgap simpleeval 0.9.13 recipe [1][2][3].

Include the required unhashable-container correction [4], which
prevents the recursive security checks from raising TypeError on
legitimate list and tuple values.

Harden the recursive callback-argument validation to inspect sets,
frozensets, and dictionary keys, and safely handle cyclic containers.
Add regression coverage for each of these cases.

Do not include the separate generator/coroutine hardening or the
optional performance follow-up. Omit the new ModuleWrapper API so this
stable-branch fix adds no unrelated public feature.

[1] https://github.com/danthedeckie/simpleeval/commit/9cb4a7b99498
[2] https://github.com/danthedeckie/simpleeval/commit/1654cbf02193
[3] https://github.com/danthedeckie/simpleeval/commit/cffa9f68cee5
[4] https://github.com/danthedeckie/simpleeval/commit/d1e4569db678

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-32640_p1.patch                   |  55 ++
 .../CVE-2026-32640_p2.patch                   | 187 +++++++
 .../CVE-2026-32640_p3.patch                   | 485 ++++++++++++++++++
 .../CVE-2026-32640_p4.patch                   |  90 ++++
 .../python/python3-simpleeval_0.9.13.bb       |   8 +-
 5 files changed, 824 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.patch

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.patch b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.patch
new file mode 100644
index 0000000000..29d7c4bcdd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.patch
@@ -0,0 +1,55 @@
+From 1f59b001d140f3c35b813150de48509bcc61713d Mon Sep 17 00:00:00 2001
+From: Daniel Fairhead <daniel@dev.ngo>
+Date: Thu, 12 Mar 2026 09:33:17 +0000
+Subject: [PATCH 1/4] Add a few additional DISALLOW_FUNCTIONS
+
+CVE: CVE-2026-32640
+Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/commit/9cb4a7b99498c173263bd90f77bc185e160fb6b8]
+
+Backport Changes:
+- Add exec while expanding DISALLOW_FUNCTIONS because simpleeval 0.9.13 does not contain the earlier generator-hardening change that added it.
+
+(cherry picked from commit 9cb4a7b99498c173263bd90f77bc185e160fb6b8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ simpleeval.py | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/simpleeval.py b/simpleeval.py
+index f6a3ed6..91ed582 100644
+--- a/simpleeval.py
++++ b/simpleeval.py
+@@ -98,6 +98,7 @@ well:
+ 
+ import ast
+ import operator as op
++import os
+ import sys
+ import warnings
+ from random import random
+@@ -123,7 +124,21 @@ DISALLOW_METHODS = ["format", "format_map", "mro"]
+ # their functionality is required, then please wrap them up in a safe container.  And think
+ # very hard about it first.  And don't say I didn't warn you.
+ # builtins is a dict in python >3.6 but a module before
+-DISALLOW_FUNCTIONS = {type, isinstance, eval, getattr, setattr, repr, compile, open}
++DISALLOW_FUNCTIONS = {
++    type,
++    isinstance,
++    eval,
++    getattr,
++    setattr,
++    repr,
++    compile,
++    open,
++    exec,
++    globals,
++    locals,
++    os.popen,
++    os.system,
++}
+ if hasattr(__builtins__, "help") or (
+     hasattr(__builtins__, "__contains__") and "help" in __builtins__  # type: ignore
+ ):
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.patch b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.patch
new file mode 100644
index 0000000000..3d3d2eae2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.patch
@@ -0,0 +1,187 @@
+From bf7d5c05015cdbf8af0d298f286e76e9a6abad7c Mon Sep 17 00:00:00 2001
+From: Daniel Fairhead <daniel@dev.ngo>
+Date: Thu, 12 Mar 2026 09:37:22 +0000
+Subject: [PATCH 2/4] Disallow module access & disallowed function access via
+ attributes.
+
+CVE: CVE-2026-32640
+Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/commit/1654cbf0219345f707c79664b8657be6b8d23e33]
+
+Backport Changes:
+- Import only Hashable from typing because simpleeval 0.9.13 does not contain the later allowed_attrs type API and its Type, Dict, Set, and Union imports.
+- Adapt TestDisallowedFunctions for 0.9.13's Python-2-compatible DISALLOWED setup: remove its two PYTHON3/dynamic-exec blocks; the upstream baseline already listed exec directly.
+
+(cherry picked from commit 1654cbf0219345f707c79664b8657be6b8d23e33)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ simpleeval.py      | 31 +++++++++++++------
+ test_simpleeval.py | 77 ++++++++++++++++++++++++++++++----------------
+ 2 files changed, 73 insertions(+), 35 deletions(-)
+
+diff --git a/simpleeval.py b/simpleeval.py
+index 91ed582..69aed83 100644
+--- a/simpleeval.py
++++ b/simpleeval.py
+@@ -100,8 +100,10 @@ import ast
+ import operator as op
+ import os
+ import sys
++import types
+ import warnings
+ from random import random
++from typing import Hashable
+ 
+ PYTHON3 = sys.version_info[0] == 3
+ PYTHON35 = PYTHON3 and sys.version_info > (3, 5)
+@@ -240,6 +242,10 @@ class MultipleExpressions(UserWarning):
+     pass
+ 
+ 
++# Sentinal used during attr access
++_ATTR_NOT_FOUND = object()
++
++
+ ########################################
+ # Default simple functions to include:
+ 
+@@ -603,18 +609,25 @@ class SimpleEval(object):  # pylint: disable=too-few-public-methods
+         # eval node
+         node_evaluated = self._eval(node.value)
+ 
++        item = _ATTR_NOT_FOUND
++
+         # Maybe the base object is an actual object, not just a dict
+         try:
+-            return getattr(node_evaluated, node.attr)
++            item = getattr(node_evaluated, node.attr)
+         except (AttributeError, TypeError):
+-            pass
+-
+-        # TODO: is this a good idea?  Try and look for [x] if .x doesn't work?
+-        if self.ATTR_INDEX_FALLBACK:
+-            try:
+-                return node_evaluated[node.attr]
+-            except (KeyError, TypeError):
+-                pass
++            # TODO: is this a good idea?  Try and look for [x] if .x doesn't work?
++            if self.ATTR_INDEX_FALLBACK:
++                try:
++                    item = node_evaluated[node.attr]
++                except (KeyError, TypeError):
++                    pass
++
++        if item is not _ATTR_NOT_FOUND:
++            if isinstance(item, types.ModuleType):
++                raise FeatureNotAvailable("Sorry, modules are not allowed in attribute access")
++            if isinstance(item, Hashable) and item in DISALLOW_FUNCTIONS:
++                raise FeatureNotAvailable("This function is forbidden")
++            return item
+ 
+         # If it is neither, raise an exception
+         raise AttributeDoesNotExist(node.attr, self.expr)
+diff --git a/test_simpleeval.py b/test_simpleeval.py
+index bc83d50..c60ec51 100644
+--- a/test_simpleeval.py
++++ b/test_simpleeval.py
+@@ -590,6 +590,34 @@ class TestTryingToBreakOut(DRYTest):
+ 
+             simpleeval.DISALLOW_PREFIXES = dis
+ 
++    def test_breakout_via_module_access(self):
++        import os.path
++
++        s = SimpleEval(names={"path": os.path})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("path.os.popen('id').read()")
++
++    def test_breakout_via_module_access_attr(self):
++        import os.path
++
++        class Foo:
++            p = os.path
++
++        s = SimpleEval(names={"thing": Foo()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("thing.p.os.popen('id').read()")
++
++    def test_breakout_via_disallowed_functions_as_attrs(self):
++        class Foo:
++            p = exec
++
++        s = SimpleEval(names={"thing": Foo()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("thing.p('exit')")
++
+ 
+ class TestCompoundTypes(DRYTest):
+     """Test the compound-types edition of the library"""
+@@ -1199,40 +1227,37 @@ class TestShortCircuiting(DRYTest):
+ 
+ 
+ class TestDisallowedFunctions(DRYTest):
+-    def test_functions_are_disallowed_at_init(self):
+-        DISALLOWED = [type, isinstance, eval, getattr, setattr, help, repr, compile, open]
+-        if simpleeval.PYTHON3:
+-            # pylint: disable=exec-used
+-            exec("DISALLOWED.append(exec)")  # exec is not a function in Python2...
+-
+-        for f in simpleeval.DISALLOW_FUNCTIONS:
+-            assert f in DISALLOWED
++    def test_functions_in_disallowed_functions_list(self):
++        # a bit of double-entry testing. probably pointless.
++        assert simpleeval.DISALLOW_FUNCTIONS.issuperset(
++            {
++                type,
++                isinstance,
++                eval,
++                getattr,
++                setattr,
++                help,
++                repr,
++                compile,
++                open,
++                exec,
++                os.popen,
++                os.system,
++            }
++        )
+ 
+-        for x in DISALLOWED:
++    def test_functions_are_disallowed_at_init(self):
++        for dangerous_function in simpleeval.DISALLOW_FUNCTIONS:
+             with self.assertRaises(FeatureNotAvailable):
+-                SimpleEval(functions={"foo": x})
++                SimpleEval(functions={"foo": dangerous_function})
+ 
+     def test_functions_are_disallowed_in_expressions(self):
+-        DISALLOWED = [type, isinstance, eval, getattr, setattr, help, repr, compile, open]
+-
+-        if simpleeval.PYTHON3:
+-            # pylint: disable=exec-used
+-            exec("DISALLOWED.append(exec)")  # exec is not a function in Python2...
+-
+-        for f in simpleeval.DISALLOW_FUNCTIONS:
+-            assert f in DISALLOWED
+-
+-        DF = simpleeval.DEFAULT_FUNCTIONS.copy()
+-
+-        for x in DISALLOWED:
+-            simpleeval.DEFAULT_FUNCTIONS = DF.copy()
++        for dangerous_function in simpleeval.DISALLOW_FUNCTIONS:
+             with self.assertRaises(FeatureNotAvailable):
+                 s = SimpleEval()
+-                s.functions["foo"] = x
++                s.functions["foo"] = dangerous_function
+                 s.eval("foo(42)")
+ 
+-        simpleeval.DEFAULT_FUNCTIONS = DF.copy()
+-
+ 
+ @unittest.skipIf(simpleeval.PYTHON3 is not True, "Python2 fails - but it's not supported anyway.")
+ @unittest.skipIf(platform.python_implementation() == "PyPy", "GC set_debug not available in PyPy")
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.patch b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.patch
new file mode 100644
index 0000000000..aa5d2dce0e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.patch
@@ -0,0 +1,485 @@
+From 030eb59004303dd4b88fedd6d80b7cb3e9d261a7 Mon Sep 17 00:00:00 2001
+From: Daniel Fairhead <daniel@dev.ngo>
+Date: Fri, 13 Mar 2026 06:35:27 +0000
+Subject: [PATCH 3/4] Much stricter lockdown via _check_disallowed_items plus
+ adding ModuleWrapper
+
+CVE: CVE-2026-32640
+Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/commit/cffa9f68cee54404a2ef43d949a8ae8a3311c503]
+
+Backport Changes:
+- Omit the new ModuleWrapper API and its tests and documentation so the Scarthgap backport does not add an unrelated public feature; raw modules remain fully blocked.
+- Retain only the module-access prohibition documentation because simpleeval 0.9.13 does not contain the later allowed_attrs API or its documentation context.
+- Extend _check_disallowed_items to traverse sets, frozensets, and dictionary keys, with regression coverage, so dangerous callback arguments cannot bypass the recursive check through those containers.
+- Track visited container identities during each recursive check and add cyclic list and dictionary tests to prevent unbounded recursion without weakening forbidden-item detection.
+
+(cherry picked from commit cffa9f68cee54404a2ef43d949a8ae8a3311c503)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ README.rst         |   1 +
+ simpleeval.py      |  34 +++-
+ test_simpleeval.py | 384 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 418 insertions(+), 1 deletion(-)
+
+diff --git a/README.rst b/README.rst
+index ed7c655..6ac327b 100644
+--- a/README.rst
++++ b/README.rst
+@@ -416,6 +416,7 @@ A few builtin functions are listed in ``simpleeval.DISALLOW_FUNCTIONS``.  ``type
+ If you need to give access to this kind of functionality to your expressions, then be very
+ careful.  You'd be better wrapping the functions in your own safe wrappers.
+ 
++Accessing modules as attributes is disallowed too.
+ The initial idea came from J.F. Sebastian on Stack Overflow
+ ( http://stackoverflow.com/a/9558001/1973500 ) with modifications and many improvements,
+ see the head of the main file for contributors list.
+diff --git a/simpleeval.py b/simpleeval.py
+index 69aed83..9f3003e 100644
+--- a/simpleeval.py
++++ b/simpleeval.py
+@@ -424,6 +424,36 @@ class SimpleEval(object):  # pylint: disable=too-few-public-methods
+     def __del__(self):
+         self.nodes = None
+ 
++    def _check_disallowed_items(self, item, visited=None):
++        """Check if item contains disallowed functions or modules.
++        Recursively checks containers (dict, list, tuple, set, frozenset).
++        Raises FeatureNotAvailable if forbidden content found.
++        """
++        if isinstance(item, types.ModuleType):
++            raise FeatureNotAvailable("Sorry, modules are not allowed")
++        if isinstance(item, Hashable) and item in DISALLOW_FUNCTIONS:
++            raise FeatureNotAvailable("This function is forbidden")
++
++        if not isinstance(item, (dict, list, tuple, set, frozenset)):
++            return
++
++        if visited is None:
++            visited = set()
++
++        item_id = id(item)
++        if item_id in visited:
++            return
++        visited.add(item_id)
++
++        if isinstance(item, dict):
++            for key in item.keys():
++                self._check_disallowed_items(key, visited)
++            for value in item.values():
++                self._check_disallowed_items(value, visited)
++        else:
++            for element in item:
++                self._check_disallowed_items(element, visited)
++
+     @staticmethod
+     def parse(expr):
+         """parse an expression into a node tree"""
+@@ -458,7 +488,9 @@ class SimpleEval(object):  # pylint: disable=too-few-public-methods
+                 "Sorry, {0} is not available in this " "evaluator".format(type(node).__name__)
+             )
+ 
+-        return handler(node)
++        result = handler(node)
++        self._check_disallowed_items(result)
++        return result
+ 
+     def _eval_expr(self, node):
+         return self._eval(node.value)
+diff --git a/test_simpleeval.py b/test_simpleeval.py
+index c60ec51..f3c9a60 100644
+--- a/test_simpleeval.py
++++ b/test_simpleeval.py
+@@ -618,6 +618,390 @@ class TestTryingToBreakOut(DRYTest):
+         with self.assertRaises(FeatureNotAvailable):
+             s.eval("thing.p('exit')")
+ 
++    def test_breakout_forbidden_function_in_list(self):
++        """Disallowed functions in lists should be blocked"""
++        s = SimpleEval(names={"funcs": [exec, eval]})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("funcs[0]('exit')")
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("funcs[1]('1+1')")
++
++    def test_breakout_module_in_list(self):
++        """Modules in lists should be blocked"""
++        import os.path
++
++        s = SimpleEval(names={"things": [os.path, os.system]})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("things[0].os.popen('id').read()")
++
++    def test_breakout_forbidden_function_in_dict_value(self):
++        """Disallowed functions as dict values should be blocked"""
++        s = SimpleEval(names={"funcs": {"bad": exec, "evil": eval}})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("funcs['bad']('exit')")
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("funcs['evil']('1+1')")
++
++    def test_breakout_module_in_dict_value(self):
++        """Modules as dict values should be blocked"""
++        import os.path
++
++        s = SimpleEval(names={"things": {"p": os.path, "s": os.system}})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("things['p'].os.popen('id').read()")
++
++    def test_breakout_forbidden_function_in_set(self):
++        """Disallowed functions in sets should be blocked"""
++
++        def invoke(items):
++            return next(iter(items))("40+2")
++
++        s = SimpleEval(names={"funcs": {eval}}, functions={"invoke": invoke})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("invoke(funcs)")
++
++    def test_breakout_forbidden_function_in_frozenset(self):
++        """Disallowed functions in frozensets should be blocked"""
++
++        def invoke(items):
++            return next(iter(items))("40+2")
++
++        s = SimpleEval(names={"funcs": frozenset({eval})}, functions={"invoke": invoke})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("invoke(funcs)")
++
++    def test_breakout_forbidden_function_in_dict_key(self):
++        """Disallowed functions as dict keys should be blocked"""
++
++        def invoke(items):
++            return next(iter(items))("40+2")
++
++        s = SimpleEval(names={"funcs": {eval: "value"}}, functions={"invoke": invoke})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("invoke(funcs)")
++
++    def test_cyclic_list(self):
++        """Cyclic lists should be checked without unbounded recursion"""
++        value = []
++        value.append(value)
++
++        self.assertIs(SimpleEval(names={"value": value}).eval("value"), value)
++
++    def test_cyclic_dict(self):
++        """Cyclic dicts should be checked without unbounded recursion"""
++        value = {}
++        value["self"] = value
++
++        self.assertIs(SimpleEval(names={"value": value}).eval("value"), value)
++
++    def test_cyclic_container_with_forbidden_function(self):
++        """A cycle should not hide other forbidden container members"""
++        value = [eval]
++        value.append(value)
++
++        with self.assertRaises(FeatureNotAvailable):
++            SimpleEval(names={"value": value}).eval("value")
++
++    def test_breakout_function_returning_forbidden_function(self):
++        """Functions returning disallowed functions should be blocked"""
++
++        def get_evil():
++            return exec
++
++        s = SimpleEval(names={}, functions={"get_evil": get_evil})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("get_evil()('exit')")
++
++    def test_breakout_function_returning_module(self):
++        """Functions returning modules should be blocked"""
++        import os.path
++
++        def get_module():
++            return os.path
++
++        s = SimpleEval(names={}, functions={"get_module": get_module})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("get_module().os.popen('id').read()")
++
++    def test_dunder_all_in_module(self):
++        """__all__ should be blocked (starts with _)"""
++        import os
++
++        s = SimpleEval(names={"os": os})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("os.__all__")
++
++    def test_dunder_dict_in_module(self):
++        """__dict__ should be blocked (starts with _)"""
++        import os
++
++        s = SimpleEval(names={"os": os})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("os.__dict__")
++
++    def test_forbidden_method_in_tuple(self):
++        """Disallowed functions in tuples should be blocked"""
++        s = SimpleEval(names={"funcs": (exec, eval)})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("funcs[0]('exit')")
++
++    def test_module_in_tuple(self):
++        """Modules in tuples should be blocked"""
++        import os
++
++        s = SimpleEval(names={"mods": (os.path, os.system)})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("mods[0].os.popen('id').read()")
++
++    def test_breakout_via_nested_container_forbidden_func(self):
++        """Disallowed functions nested in containers should be blocked"""
++        s = SimpleEval(names={"data": {"nested": {"funcs": [exec]}}})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("data['nested']['funcs'][0]('exit')")
++
++    def test_breakout_via_nested_container_module(self):
++        """Modules nested in containers should be blocked"""
++        import os
++
++        s = SimpleEval(names={"data": {"mods": {"p": os.path}}})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("data['mods']['p'].os.popen('id').read()")
++
++    def test_forbidden_methods_on_allowed_attrs(self):
++        """Disallowed methods listed in DISALLOW_METHODS should be
++        blocked"""
++        s = SimpleEval()
++
++        # format and format_map are in DISALLOW_METHODS
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("'test {0}'.format")
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("'test'.format_map({0: 'x'})")
++
++        # __mro__ is in DISALLOW_METHODS
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("'test'.mro")
++
++    def test_function_returning_forbidden_method(self):
++        """Functions returning disallowed methods should be blocked"""
++
++        def get_exec_module():
++            import os
++
++            return os
++
++        s = SimpleEval(names={}, functions={"get_os": get_exec_module})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("get_os().__name__")
++
++    def test_compound_module_submodule_access(self):
++        """Accessing submodules of a passed module should be blocked"""
++        import os.path
++
++        s = SimpleEval(names={"path": os.path})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("path.os")
++
++    def test_forbidden_func_via_class_method(self):
++        """Accessing forbidden functions via class methods should be
++        blocked"""
++
++        class Container:
++            @staticmethod
++            def get_exec():
++                return exec
++
++        s = SimpleEval(names={"c": Container()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("c.get_exec()('exit')")
++
++    def test_module_via_class_method(self):
++        """Accessing modules via class methods should be blocked"""
++        import os
++
++        class Container:
++            @staticmethod
++            def get_os():
++                return os
++
++        s = SimpleEval(names={"c": Container()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("c.get_os().popen('id').read()")
++
++    def test_forbidden_func_via_property(self):
++        """Accessing forbidden functions via properties should be
++        blocked"""
++
++        class Container:
++            @property
++            def evil(self):
++                return exec
++
++        s = SimpleEval(names={"c": Container()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("c.evil('exit')")
++
++    def test_module_via_property(self):
++        """Accessing modules via properties should be blocked"""
++        import os
++
++        class Container:
++            @property
++            def mod(self):
++                return os
++
++        s = SimpleEval(names={"c": Container()})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("c.mod.popen('id').read()")
++
++    def test_forbidden_function_direct_from_names(self):
++        """Forbidden functions passed directly in names should
++        be blocked when accessed"""
++        s = SimpleEval(names={"evil": exec})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("evil")
++
++    def test_module_direct_from_names(self):
++        """Modules passed directly in names should be blocked
++        when accessed"""
++        import os
++
++        s = SimpleEval(names={"m": os})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("m")
++
++    def test_forbidden_function_via_callable_name_handler(self):
++        """Forbidden functions from callable name handlers should
++        be blocked"""
++
++        def name_handler(node):
++            if node.id == "evil":
++                return exec
++            raise simpleeval.NameNotDefined(node.id, "")
++
++        s = SimpleEval(names=name_handler)
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("evil")
++
++    def test_module_via_callable_name_handler(self):
++        """Modules from callable name handlers should be blocked"""
++        import os
++
++        def name_handler(node):
++            if node.id == "m":
++                return os
++            raise simpleeval.NameNotDefined(node.id, "")
++
++        s = SimpleEval(names=name_handler)
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("m")
++
++    def test_forbidden_function_passed_to_custom_function(self):
++        """Passing forbidden functions to custom functions should be
++        blocked - they can be executed by the custom function"""
++
++        def evil_caller(func):
++            return func("print('pwned')")
++
++        s = SimpleEval(names={"evil": exec}, functions={"evil_caller": evil_caller})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("evil_caller(evil)")
++
++    def test_module_passed_to_custom_function(self):
++        """Passing modules to custom functions should be blocked - they
++        can be used by the custom function"""
++        import os
++
++        def os_caller(mod):
++            return mod.system("id")
++
++        s = SimpleEval(names={"m": os}, functions={"os_caller": os_caller})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("os_caller(m)")
++
++    def test_forbidden_function_in_list_passed_to_custom_function(self):
++        """Forbidden functions in containers passed to custom functions
++        should be blocked"""
++
++        def extract_and_call(items):
++            return items[0]("print('pwned')")
++
++        s = SimpleEval(names={"funcs": [exec, eval]}, functions={"extract": extract_and_call})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("extract(funcs)")
++
++    def test_module_in_list_passed_to_custom_function(self):
++        """Modules in containers passed to custom functions should be
++        blocked"""
++        import os
++
++        def extract_and_use(items):
++            return items[0].system("id")
++
++        s = SimpleEval(names={"mods": [os.path, os]}, functions={"extract": extract_and_use})
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("extract(mods)")
++
++    def test_forbidden_function_in_dict_passed_to_custom_function(self):
++        """Forbidden functions in dicts passed to custom functions should
++        be blocked"""
++
++        def extract_and_call(d):
++            return d["bad"]("print('pwned')")
++
++        s = SimpleEval(
++            names={"funcs": {"bad": exec, "good": print}}, functions={"extract": extract_and_call}
++        )
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("extract(funcs)")
++
++    def test_module_in_dict_passed_to_custom_function(self):
++        """Modules in dicts passed to custom functions should be blocked"""
++        import os
++
++        def extract_and_use(d):
++            return d["m"].system("id")
++
++        s = SimpleEval(
++            names={"mods": {"m": os, "p": os.path}}, functions={"extract": extract_and_use}
++        )
++
++        with self.assertRaises(FeatureNotAvailable):
++            s.eval("extract(mods)")
++
+ 
+ class TestCompoundTypes(DRYTest):
+     """Test the compound-types edition of the library"""
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.patch b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.patch
new file mode 100644
index 0000000000..d03a5cf4fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.patch
@@ -0,0 +1,90 @@
+From 42483617f1fd47c81bbf66c71c2ce5cbe2d3df29 Mon Sep 17 00:00:00 2001
+From: Daniel Fairhead <daniel@dev.ngo>
+Date: Fri, 13 Mar 2026 13:27:47 +0000
+Subject: [PATCH 4/4] Fix unhashable items inside tuples bug.
+
+CVE: CVE-2026-32640
+Upstream-Status: Backport [https://github.com/danthedeckie/simpleeval/commit/d1e4569db678a3cb42b779f404aa203665d52ab0]
+
+Backport Changes:
+- Omit the upstream 1.0.6 version metadata change and retain the 0.9.13 setuptools build configuration.
+- Remove the standalone Hashable import added by the preceding 0.9.13 backport while retaining the target Python compatibility flags.
+
+(cherry picked from commit d1e4569db678a3cb42b779f404aa203665d52ab0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ simpleeval.py      | 16 +++++++++++++---
+ test_simpleeval.py |  9 +++++++++
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/simpleeval.py b/simpleeval.py
+index 9f3003e..a6745db 100644
+--- a/simpleeval.py
++++ b/simpleeval.py
+@@ -103,7 +103,6 @@ import sys
+ import types
+ import warnings
+ from random import random
+-from typing import Hashable
+ 
+ PYTHON3 = sys.version_info[0] == 3
+ PYTHON35 = PYTHON3 and sys.version_info > (3, 5)
+@@ -119,6 +118,17 @@ MAX_SHIFT_BASE = int(sys.float_info.max)  # highest on left side of << or >>
+ DISALLOW_PREFIXES = ["_", "func_"]
+ DISALLOW_METHODS = ["format", "format_map", "mro"]
+ 
++########################################
++# Tiny helpers:
++
++
++def is_hashable(value):
++    try:
++        return hash(value)
++    except TypeError:
++        return False
++
++
+ # Disallow functions:
+ # This, strictly speaking, is not necessary.  These /should/ never be accessable anyway,
+ # if DISALLOW_PREFIXES and DISALLOW_METHODS are all right.  This is here to try and help
+@@ -431,7 +441,7 @@ class SimpleEval(object):  # pylint: disable=too-few-public-methods
+         """
+         if isinstance(item, types.ModuleType):
+             raise FeatureNotAvailable("Sorry, modules are not allowed")
+-        if isinstance(item, Hashable) and item in DISALLOW_FUNCTIONS:
++        if is_hashable(item) and item in DISALLOW_FUNCTIONS:
+             raise FeatureNotAvailable("This function is forbidden")
+ 
+         if not isinstance(item, (dict, list, tuple, set, frozenset)):
+@@ -657,7 +667,7 @@ class SimpleEval(object):  # pylint: disable=too-few-public-methods
+         if item is not _ATTR_NOT_FOUND:
+             if isinstance(item, types.ModuleType):
+                 raise FeatureNotAvailable("Sorry, modules are not allowed in attribute access")
+-            if isinstance(item, Hashable) and item in DISALLOW_FUNCTIONS:
++            if is_hashable(item) and item in DISALLOW_FUNCTIONS:
+                 raise FeatureNotAvailable("This function is forbidden")
+             return item
+ 
+diff --git a/test_simpleeval.py b/test_simpleeval.py
+index f3c9a60..a654f6d 100644
+--- a/test_simpleeval.py
++++ b/test_simpleeval.py
+@@ -347,6 +347,15 @@ class TestFunctions(DRYTest):
+         self.t("foo(mult=2, to_return=4)", 8)
+         self.t("foo(2, 10)", 20)
+ 
++    def test_function_with_list_args(self):
++        # Regression test, makes sure we can pass lists (non-hashable) items as
++        # kwargs to functions.
++
++        def func(*args, **kwargs):
++            return 42
++
++        simple_eval("test(boo=x)", functions={"test": func}, names={"x": [1, 2]})
++
+ 
+ class TestOperators(DRYTest):
+     """Test adding in new operators, removing them, make sure it works."""
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
index af2c4a1e2e..a8ff053a1e 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
@@ -9,7 +9,13 @@ inherit pypi python_setuptools_build_meta ptest
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += " \
+    file://CVE-2026-32640_p1.patch \
+    file://CVE-2026-32640_p2.patch \
+    file://CVE-2026-32640_p3.patch \
+    file://CVE-2026-32640_p4.patch \
+    file://run-ptest \
+"
 
 RDEPENDS:${PN} += " \
 	python3-math \
-- 
2.35.6


