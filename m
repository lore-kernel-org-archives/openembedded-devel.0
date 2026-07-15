Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033AAC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 07:51:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1486.1784101879245262485
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 00:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LfVa8Lpa;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-470174001a0so931598f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 00:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784101877; x=1784706677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf291q8TPyAxsjjDkuJK6iOxesFxyhMZlfpyF5xHqQ4=;
        b=LfVa8LpaBLXBS/5Bf5XHnVs449j6V/Ba7abudGHkU+X0LiLKGSAXtjCp1KpHQQlFWW
         KQfp9P+FQMspl1BiB0YBU+LjMG4alHh54iExWssVvxtnB357nA2iKXXkNpE9d7dhXanD
         obO3+iDaldM9L25UCRRovPWG8biNl4z8gTqt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101877; x=1784706677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf291q8TPyAxsjjDkuJK6iOxesFxyhMZlfpyF5xHqQ4=;
        b=EwtuYO0f8ePQlaE7NpjljhWyBjOeFMsYKrQ2p8Oh2ET/yUonKXcb6+qfZLBWWGmkKN
         rlbz/msCzVs6T3fCAK67V4koqugKueHfYCmepzC95Igp3gbPifWR4WPU73Rv/kgFCrv1
         75AKJ7FSdSgtnIdzfAWp2SfiT08nbgpmNt8FrmD9zNYRXKSgo40grfipkd6dsRVMYhhi
         3AbS/yuCaepPGQJO0sucvQIViGje5jEZJ0JDIuEfODC9HpOzTQhFrKZzLcZDL9f2G4Xv
         Zk5RnGKezg+TdAHTFkoRuwOT65IDllENMzO2aXiopoTryzKi1u0tCqYkFEix3rSng403
         c0lg==
X-Gm-Message-State: AOJu0YysEL9crcFUYAqfyOIn+ksHYTehN1qJEwo0uLTz12yNiaKcQa/y
	UZ5WEQik6pV+KV8fI1qyS71Vh7ndlJmFDTNEW1dD+LsjUtm+wOAzfiub8j5nDNOVjrFmLFK2j/X
	7ze+U
X-Gm-Gg: AfdE7clmR4wU/spKN1Xwq/+9R2QgJIZqFjctiiVx7/L8IsWbQZv+8F3GUdVPiveoHwe
	1El4z/iiZFMqHeGKWyTgOd8Z/B8TZPp2sUuBz2zmAy5CmepF8aZGtqBTlGpAgNaOU/bxksdHILJ
	uNSVab4oXjTlZ+58qLycLSfPzKE1Cxfez5eM/mgyQ+4VRmrX+Y2FF4DHVk7rQUqCce9NbE8e0xP
	9uESUwUpxrOUQ46zGrKPIOKgsycwGPWiq1/dRWFS9HTGn7tA2kBqbAUZHExP/haLkNvEruK5OUq
	3qPE0r09UP2d/POn7JuZ5kWokBYmrVhHBF51NL0TLyYHqPcT9qiBpNyXu8uI2KC39Ro+VDG6oJj
	WxCoh5vT8d0j3XqTI7Dkv2x/Ravn/QLgogTY2jFK2wPsTZxnv3laWh9Wil8CMkpCFAMInO6QYYw
	Hnk4qfmKZYgyCXCPqzyWSUQjU3828GYhNZIdHG0/zdlDMru9yMPiRbmmcESPhoqbmXHCjj30ZH4
	OaKdcn06MLyfjnfEgo4Yu4i7GRZulkNpjm9k7HZyg==
X-Received: by 2002:a5d:5d0c:0:b0:47d:ec60:6578 with SMTP id ffacd0b85a97d-47f2dcec4efmr17977869f8f.50.1784101877273;
        Wed, 15 Jul 2026 00:51:17 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e0e4sm15609047f8f.4.2026.07.15.00.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:51:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-oletools: Enable tests
Date: Wed, 15 Jul 2026 10:51:13 +0300
Message-ID: <20260715075113.3705549-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 07:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128170

Inherit ptest and include tests for oletools.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...s-olevba.py-Fix-deprecation-warnings.patch | 187 ++++++++++++++++++
 ...tils-utils.py-Adjust-source-code-dir.patch |  43 ++++
 .../python/python3-oletools/run-ptest         |   3 +
 .../python/python3-oletools_0.60.2.bb         |  23 ++-
 4 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oletools/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch b/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
new file mode 100644
index 0000000000..fe97a4b9a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oletools/0001-oletools-olevba.py-Fix-deprecation-warnings.patch
@@ -0,0 +1,187 @@
+From 2ef513c9a5bd0751db6d879b7ea80ffbbee7dd05 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 14 Jul 2026 23:56:57 +0300
+Subject: [PATCH] oletools/olevba.py: Fix deprecation warnings
+
+Replace deprecated pyparsing APIs with their current equivalents:
+enablePackrat -> enable_packrat, setParseAction -> set_parse_action,
+escQuote -> esc_quote, initChars/bodyChars -> init_chars/body_chars,
+infixNotation -> infix_notation, scanString -> scan_string.
+
+Fixes:
+PyparsingDeprecationWarning: 'enablePackrat' deprecated - use 'enable_packrat'
+PyparsingDeprecationWarning: 'setParseAction' deprecated - use 'set_parse_action'
+PyparsingDeprecationWarning: 'escQuote' argument is deprecated, use 'esc_quote'
+PyparsingDeprecationWarning: 'initChars' argument is deprecated, use 'init_chars'
+PyparsingDeprecationWarning: 'infixNotation' deprecated - use 'infix_notation'
+PyparsingDeprecationWarning: 'scanString' deprecated - use 'scan_string'
+
+Upstream-Status: Pending [https://github.com/decalage2/oletools/pull/888]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ oletools/olevba.py | 40 ++++++++++++++++++++--------------------
+ 1 file changed, 20 insertions(+), 20 deletions(-)
+
+diff --git a/oletools/olevba.py b/oletools/olevba.py
+index 23be15b..c9a3bce 100644
+--- a/oletools/olevba.py
++++ b/oletools/olevba.py
+@@ -313,7 +313,7 @@ from pyparsing import \
+         CaselessKeyword, CaselessLiteral, Combine, Forward, Literal, \
+         Optional, QuotedString,Regex, Suppress, Word, WordStart, \
+         alphanums, alphas, hexnums,nums, opAssoc, srange, \
+-        infixNotation, ParserElement
++        infix_notation, ParserElement
+ 
+ # attempt to import XLMMacroDeobfuscator (optional)
+ try:
+@@ -917,7 +917,7 @@ re_printable_string = re.compile(b'[\\t\\r\\n\\x20-\\xFF]{5,}')
+ 
+ # Enable PackRat for better performance:
+ # (see https://pythonhosted.org/pyparsing/pyparsing.ParserElement-class.html#enablePackrat)
+-ParserElement.enablePackrat()
++ParserElement.enable_packrat()
+ 
+ # VBA identifier chars (from MS-VBAL 3.3.5)
+ vba_identifier_chars = alphanums + '_'
+@@ -954,15 +954,15 @@ class VbaExpressionString(str):
+ #       letters or underscore (e.g. "VBT1" or "ABC_34"), when using scanString
+ decimal_literal = Combine(Optional('-') + WordStart(vba_identifier_chars) + Word(nums)
+                           + Suppress(Optional(Word('%&^', exact=1))))
+-decimal_literal.setParseAction(lambda t: int(t[0]))
++decimal_literal.set_parse_action(lambda t: int(t[0]))
+ 
+ octal_literal = Combine(Suppress(Literal('&') + Optional((CaselessLiteral('o')))) + Word(srange('[0-7]'))
+                 + Suppress(Optional(Word('%&^', exact=1))))
+-octal_literal.setParseAction(lambda t: int(t[0], base=8))
++octal_literal.set_parse_action(lambda t: int(t[0], base=8))
+ 
+ hex_literal = Combine(Suppress(CaselessLiteral('&h')) + Word(srange('[0-9a-fA-F]'))
+                 + Suppress(Optional(Word('%&^', exact=1))))
+-hex_literal.setParseAction(lambda t: int(t[0], base=16))
++hex_literal.set_parse_action(lambda t: int(t[0], base=16))
+ 
+ integer = decimal_literal | octal_literal | hex_literal
+ 
+@@ -974,8 +974,8 @@ integer = decimal_literal | octal_literal | hex_literal
+ # double-quote = %x0022 ; "
+ # string-character = NO-LINE-CONTINUATION ((double-quote double-quote) termination-character)
+ 
+-quoted_string = QuotedString('"', escQuote='""')
+-quoted_string.setParseAction(lambda t: str(t[0]))
++quoted_string = QuotedString('"', esc_quote='""')
++quoted_string.set_parse_action(lambda t: str(t[0]))
+ 
+ 
+ #--- VBA Expressions ---------------------------------------------------------
+@@ -1056,7 +1056,7 @@ def vba_chr_tostr(t):
+         log.exception('ERROR: incorrect parameter value for chr(): %r' % i)
+         return VbaExpressionString('Chr(%r)' % i)
+ 
+-vba_chr.setParseAction(vba_chr_tostr)
++vba_chr.set_parse_action(vba_chr_tostr)
+ 
+ 
+ # --- ASC --------------------------------------------------------------------
+@@ -1064,7 +1064,7 @@ vba_chr.setParseAction(vba_chr_tostr)
+ # Asc(char) => int
+ #TODO: see MS-VBAL 6.1.2.11.1.1 page 240 => AscB, AscW
+ vba_asc = Suppress(CaselessKeyword('Asc') + '(') + vba_expr_str + Suppress(')')
+-vba_asc.setParseAction(lambda t: ord(t[0]))
++vba_asc.set_parse_action(lambda t: ord(t[0]))
+ 
+ 
+ # --- VAL --------------------------------------------------------------------
+@@ -1072,21 +1072,21 @@ vba_asc.setParseAction(lambda t: ord(t[0]))
+ # Val(string) => int
+ # TODO: make sure the behavior of VBA's val is fully covered
+ vba_val = Suppress(CaselessKeyword('Val') + '(') + vba_expr_str + Suppress(')')
+-vba_val.setParseAction(lambda t: int(t[0].strip()))
++vba_val.set_parse_action(lambda t: int(t[0].strip()))
+ 
+ 
+ # --- StrReverse() --------------------------------------------------------------------
+ 
+ # StrReverse(string) => string
+ strReverse = Suppress(CaselessKeyword('StrReverse') + '(') + vba_expr_str + Suppress(')')
+-strReverse.setParseAction(lambda t: VbaExpressionString(str(t[0])[::-1]))
++strReverse.set_parse_action(lambda t: VbaExpressionString(str(t[0])[::-1]))
+ 
+ 
+ # --- ENVIRON() --------------------------------------------------------------------
+ 
+ # Environ("name") => just translated to "%name%", that is enough for malware analysis
+ environ = Suppress(CaselessKeyword('Environ') + '(') + vba_expr_str + Suppress(')')
+-environ.setParseAction(lambda t: VbaExpressionString('%%%s%%' % t[0]))
++environ.set_parse_action(lambda t: VbaExpressionString('%%%s%%' % t[0]))
+ 
+ 
+ # --- IDENTIFIER -------------------------------------------------------------
+@@ -1096,7 +1096,7 @@ environ.setParseAction(lambda t: VbaExpressionString('%%%s%%' % t[0]))
+ # Latin-identifier = first-Latin-identifier-character *subsequent-Latin-identifier-character
+ # first-Latin-identifier-character = (%x0041-005A / %x0061-007A) ; A-Z / a-z
+ # subsequent-Latin-identifier-character = first-Latin-identifier-character / DIGIT / %x5F ; underscore
+-latin_identifier = Word(initChars=alphas, bodyChars=alphanums + '_')
++latin_identifier = Word(init_chars=alphas, body_chars=alphanums + '_')
+ 
+ # --- HEX FUNCTION -----------------------------------------------------------
+ 
+@@ -1105,11 +1105,11 @@ latin_identifier = Word(initChars=alphas, bodyChars=alphanums + '_')
+ 
+ # quoted string of at least two hexadecimal numbers of two digits:
+ quoted_hex_string = Suppress('"') + Combine(Word(hexnums, exact=2) * (2, None)) + Suppress('"')
+-quoted_hex_string.setParseAction(lambda t: str(t[0]))
++quoted_hex_string.set_parse_action(lambda t: str(t[0]))
+ 
+ hex_function_call = Suppress(latin_identifier) + Suppress('(') + \
+                     quoted_hex_string('hex_string') + Suppress(')')
+-hex_function_call.setParseAction(lambda t: VbaExpressionString(binascii.a2b_hex(t.hex_string)))
++hex_function_call.set_parse_action(lambda t: VbaExpressionString(binascii.a2b_hex(t.hex_string)))
+ 
+ 
+ # --- BASE64 FUNCTION -----------------------------------------------------------
+@@ -1119,11 +1119,11 @@ hex_function_call.setParseAction(lambda t: VbaExpressionString(binascii.a2b_hex(
+ 
+ # quoted string of at least two hexadecimal numbers of two digits:
+ quoted_base64_string = Suppress('"') + Regex(BASE64_RE) + Suppress('"')
+-quoted_base64_string.setParseAction(lambda t: str(t[0]))
++quoted_base64_string.set_parse_action(lambda t: str(t[0]))
+ 
+ base64_function_call = Suppress(latin_identifier) + Suppress('(') + \
+                     quoted_base64_string('base64_string') + Suppress(')')
+-base64_function_call.setParseAction(lambda t: VbaExpressionString(binascii.a2b_base64(t.base64_string)))
++base64_function_call.set_parse_action(lambda t: VbaExpressionString(binascii.a2b_base64(t.base64_string)))
+ 
+ 
+ # ---STRING EXPRESSION -------------------------------------------------------
+@@ -1140,7 +1140,7 @@ def concat_strings_list(tokens):
+ 
+ vba_expr_str_item = (vba_chr | strReverse | environ | quoted_string | hex_function_call | base64_function_call)
+ 
+-vba_expr_str <<= infixNotation(vba_expr_str_item,
++vba_expr_str <<= infix_notation(vba_expr_str_item,
+     [
+         ("+", 2, opAssoc.LEFT, concat_strings_list),
+         ("&", 2, opAssoc.LEFT, concat_strings_list),
+@@ -1195,7 +1195,7 @@ vba_expr_int_item = (vba_asc | vba_val | integer)
+ # operators associativity:
+ # https://en.wikipedia.org/wiki/Operator_associativity
+ 
+-vba_expr_int <<= infixNotation(vba_expr_int_item,
++vba_expr_int <<= infix_notation(vba_expr_int_item,
+     [
+         ("*", 2, opAssoc.LEFT, multiply_ints_list),
+         ("/", 2, opAssoc.LEFT, divide_ints_list),
+@@ -2393,7 +2393,7 @@ def detect_vba_strings(vba_code):
+     vba_code = vba_code.expandtabs()
+     # Split the VBA code line by line to avoid MemoryError on large scripts:
+     for vba_line in vba_code.splitlines():
+-        for tokens, start, end in vba_expr_str.scanString(vba_line):
++        for tokens, start, end in vba_expr_str.scan_string(vba_line):
+             encoded = vba_line[start:end]
+             decoded = tokens[0]
+             if isinstance(decoded, VbaExpressionString):
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch b/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
new file mode 100644
index 0000000000..dd8fe026fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oletools/0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch
@@ -0,0 +1,43 @@
+From e387d7d7c1c3f22496e95def77889a6465ddff08 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 14 Jul 2026 19:42:24 +0000
+Subject: [PATCH] tests/test_utils/utils.py: Adjust source code dir
+
+Fall back to the installed oletools location for the directory with
+source code if the sibling "oletools" dir doesn't exist (e.g.
+packaged/ptest installs).
+
+Upstream-Status: Pending [https://github.com/decalage2/oletools/pull/889]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ tests/test_utils/utils.py | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/tests/test_utils/utils.py b/tests/test_utils/utils.py
+index 45cedc8..c0f3aae 100644
+--- a/tests/test_utils/utils.py
++++ b/tests/test_utils/utils.py
+@@ -14,9 +14,16 @@ PROJECT_ROOT = dirname(dirname(dirname(abspath(__file__))))
+ # Directory with test data, independent of current working directory
+ DATA_BASE_DIR = join(PROJECT_ROOT, 'tests', 'test-data')
+ 
+-# Directory with source code
+-SOURCE_BASE_DIR = join(PROJECT_ROOT, 'oletools')
+-
++# Fall back to the installed oletools location for the directory
++# with the source code if the sibling "oletools" dir doesn't exist
++_source_base_dir = join(PROJECT_ROOT, 'oletools')
++if not os.path.isdir(_source_base_dir):
++    try:
++        import oletools as _oletools
++        _source_base_dir = dirname(abspath(_oletools.__file__))
++    except ImportError:
++        pass
++SOURCE_BASE_DIR = _source_base_dir
+ 
+ def call_and_capture(module, args=None, accept_nonzero_exit=False,
+                      exclude_stderr=False):
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-oletools/run-ptest b/meta-python/recipes-devtools/python/python3-oletools/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oletools/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
index 991d0d1baa..35b9781d60 100644
--- a/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
+++ b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
@@ -3,9 +3,30 @@ HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=062477247e75fcb78ae3e1280be9e4e1"
 
+SRC_URI += " \
+    file://run-ptest \
+    file://0001-tests-test_utils-utils.py-Adjust-source-code-dir.patch \
+    file://0001-oletools-olevba.py-Fix-deprecation-warnings.patch \
+"
+
 SRC_URI[sha256sum] = "ad452099f4695ffd8855113f453348200d195ee9fa341a09e197d66ee7e0b2c3"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 PYPI_PACKAGE = "oletools"
 PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-olefile \
+    python3-colorclass \
+    python3-pyparsing \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


