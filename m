Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23231.1794814541763045575
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cSnhBZmd;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso9782315e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814540; x=1795419340; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZ35ye9XaljrKzLkEVzUwWlIdx4uIu+/KScYImidvcc=;
        b=cSnhBZmd+zIvejNZfpaWW/7lAGyMspE4+P76Q1UCrpwURt38IbnZ/+DploGIb5xztq
         xtbOYzM6uBhLBEKJCIlOwKGlYbp1SOyJNI6B/CyjgdbNqrIBzSWIagnl+7vQf4xuQqgn
         24fVOyF6xyNnBDsfRrmadpaVAHg/CcKnjIb84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814540; x=1795419340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZ35ye9XaljrKzLkEVzUwWlIdx4uIu+/KScYImidvcc=;
        b=PqJaBcgpNJcyx6vmj4nXefzvkPBJKBwJZYSvQ/+13IKKqU7oXwjfOajGQ5Zi1suzQP
         M3S4o6vpT2xJ7bAxxixYpYJT48Bf42WklKjWvK4F5YLTZ6Wz1k45T6444dGOrD1WQ53U
         vQuEkeAPlenxC7FRvCmlUNU+6vbgBCvcejEEtwoIl0Bw89wO8bB9/jye7K7SRguYR/V4
         SjqnOtuz8T0we6pp00kHq2he8ekAtR12Yqco5IoiMEtyImThlUEDMgzflm0nHkveXBiA
         e+qefTUlECiJk7QgpdIqc0+zh1JuiAqSJwmdv8Cm/DH8+kpVhx+LHalXgpPClv1EjC7f
         Ky2Q==
X-Gm-Message-State: APuU4Z/QFdc4kTEBZlBSdgdeDAXoHRys4byy7URbuKBK81tmHfiJSqiZ
	IFV0FX2iYKpFjrJUsQ2RHgNCc1ekHoZn62VwjtpAcwf/un0KxSO3KWz4tR0NIY7P8uxwVGR5oSR
	4beMn
X-Gm-Gg: AYBFou3dafyVDqf+1Yq2VjYOtuSCdPA9BpXYi1Z9EU0BAlTilM+BEKC0tDrf/WQXVqV
	B2W5c5OFPEIDzz2q/gScI8jmqy1EUrtT1T8hPASQqjJUTHJpUtrzPskuEgyciD2ZHSNXJDXtvGu
	7Gc5ecgpytJg+UXsjqtntUQaGHQmmc/wHKDqhUAroFvTpAgzNDxGiagb4iI2KNhjXC1YaS7UCKh
	uX3Om0cGl1v1FqTzPijDmMfEClZ9758FLxFAmfbq7nniVW/MqJv5KFertMwZTdtXdVvMlsFgWUC
	za9Gwnxtqfgvk7339cXNVJfnfeK4I8fZA1QyDWVUdenO6dUQg6PoefRZ7k8W1fz9EppXKJjBC9K
	NzFAjZvaQgzkdbnDO9S2J2OMfxHjqei5O3Zd632LDANgieyQEAmKJsX/87DuHVfbbUpwZkfGBOP
	cI21AtLlfEDDj34NefoZjpqNgjod7boXvgohDyhRd0auLvzD9kuL8L2e+UKxTuBOopxBnhb756u
	h06m6Y5MhXvbDn13f0d0DD2Fmc/mbyeRtaMO9C27TyBI39zUdgWAKC19oJro/5rv1ybSz1MCsfi
	D8iWpooZnIODjcRD4GendFgPlwzVOBk3/nHLpBfsWIy4FxXv+YaIFw/VO3VUt3ATcmwe23FJllC
	O320YCattcsxR8NAt7SQnJQ849iyzW2TN5OT04tJqUXF3LA99D9VbNw==
X-Received: by 2002:a05:600c:3e1a:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb55a878camr177950795e9.27.1794814539936;
        Sun, 15 Nov 2026 23:35:39 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/24] python3-markdown-it-py: Upgrade 4.2.0 -> 4.3.0
Date: Mon, 16 Nov 2026 09:35:14 +0200
Message-ID: <20261116073532.880420-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132435
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.3.0:

This release fixes two quadratic-time parsing paths that let crafted
input stall rendering for minutes (security), aligns several parsing
rules with CommonMark 0.31.2 and markdown-it 15.0.x, turns parser rules
that never advance into a RuntimeError instead of an infinite loop,
makes rendering linear on PyPy and free-threaded CPython, and adds
support for Python 3.14. Python 3.10 is still supported. If you write
plugins or render rules, or edit SyntaxTreeNode trees, please read the
upgrade notes at the end.

Security:

- Fix quadratic-time inline parsing of long runs of characters
  that start an inline rule without completing one (such as &, <, ~
  or incomplete entities), which let a few hundred kilobytes of
  input stall rendering for seconds to minutes
- Reject unterminated inline HTML (<!--, <?, <!CDATA[, <!X) in
  constant time when html is enabled (as in the default commonmark
  preset), instead of rescanning to the end of the input for every
  opener

New:

- Add --enable-tables to the CLI for file, standard input and
  interactive parsing
- Add support for Python 3.14 in #462

Improved:

- Raise RuntimeError instead of looping forever when a block or
  inline rule reports a match without advancing (or moves
  backwards), or when no block rule matches a line, as markdown-it
  does
- Fix quadratic-time HTML rendering on PyPy, GraalPy and
  free-threaded CPython by joining the rendered fragments once
- Make StateBase.src a plain attribute, for about 4–11% faster
  parsing on CPython
- Build block line markers with one scan per line instead of one
  step per character
- Name the Windows end-of-input keys (Ctrl-Z then Enter) in the
  CLI's interactive prompt and -h text

Fixed:

- Fix HTML blocks of types 1–5 (comments, processing
  instructions, declarations, CDATA, script/pre/style/textarea)
  ending at a blank line inside a list item or blockquote, porting
  markdown-it 14.2.0
- Fix HTML block starts per CommonMark 0.31.2: lowercase
  declarations such as <!doctype html> start a block and interrupt
  a paragraph, and tag names match case-insensitively in ASCII
  only
- Fix code spans rendered as literal backticks after an unclosed
  link or image label, and count only U+0020 spaces (not tabs or
  no-break spaces) when deciding whether to strip a code span's
  padding, porting markdown-it 15.0.1
- Trim and split with the CommonMark whitespace set instead of
  Python's, so U+001C–U+001F and U+0085 are no longer dropped from
  paragraphs, headings, table cells and fence info strings, and
  distinct reference labels no longer match each other
- Preserve IPv6 host brackets (e.g. http://[::1]:8000/) in
  normalized link and image URLs, porting markdown-it 15.0.1
- Fix task-list detection consuming a literal [ ]/[x] at the
  start of an indented code block in a list item
- Fix an IndexError in the html_block and heading rules at the
  end of the input (a table in a blockquote that ends on >)
- Keep backslash escapes and entities in image alt text (!a \* b
  gives alt="a * b"), porting markdown-it 15.0.0
- Keep code span text in image alt text, porting markdown-it
- Keep hard breaks and inline HTML in image alt text
- Keep edits to the children of inline and image nodes in
  SyntaxTreeNode.to_tokens()
  edited tokens are copied, so the token stream the tree was built
  from is left unchanged
- Fix rule chains staying stale after Ruler.enable, disable or
  enableOnly raised on an unknown rule name
- Fix MarkdownIt.enable() and disable() applying a generator of
  rule names only to the core chain
- Fix the CLI's interactive mode joining input lines with an
  extra newline, which split every line into its own paragraph and
  broke hard line breaks
- CLI helpers create a default parser only when none is given

Documentation:

- Add a "Third-party renderers" section (mdformat, mdit_plain,
  MyST-Parser) and document RendererProtocol for writing your own
  renderer
- Document that MarkdownIt passes itself to renderer_cls, unlike
  markdown-it's renderer constructor
- Clarify that the name given to add_render_rule must match a
  token type
- Fix typos and use HTTPS for the CommonMark spec links

Maintenance:

- Publish to PyPI with trusted publishing and attestations,
  uploading distributions built with python -m build and checked on
  every pull request
- Include tests/ in the sdist (next to tox.ini and CHANGELOG.md),
  so packagers can run the test suite from it
- Move coverage and pytest-cov from the testing extra to a new
  coverage extra, and skip the linkify tests when linkify-it-py is
  not installed
- Read the CommonMark spec fixtures as UTF-8, so the tests pass
  on Windows with a non-UTF-8 locale
- Drop the optional dependency on the unmaintained commonmark
  package from the compare extra
- Build the documentation on Python 3.13 and Sphinx 9

Upgrade notes:

- Rules that do not advance now raise. A block or inline rule that
  returns True without moving state.line or state.pos forward now
  raises RuntimeError (block rule didn't increment state.line,
  inline rule didn't increment state.pos), where it used to hang.
  So does a line that no block rule accepts, which is only possible
  with the paragraph rule disabled (none of the block rules
  matched).
- Image children hold joined text tokens. As in markdown-it 15,
  text_join now also joins the text_special tokens among an image
  token's children, so code that reads alt text from them gets
  escaped characters and entities as plain text tokens (a nested
  image's own children are still not joined, as upstream).
- Render rules must return str. The rendered fragments are now
  joined with str.join, so a rule that returns a str subclass (such
  as markupsafe.Markup) gives a plain str from render(), and any
  non-str result (even one that defines __radd__, which 4.2.0 let
  through) raises TypeError when the fragments are joined.
- SyntaxTreeNode.to_tokens() follows the tree. The tree's children
  are the source of truth: a change made directly to a token's
  children list no longer appears in the output, and to_tokens()
  does not modify the token stream the tree was built from.
- Rule names given as a generator to MarkdownIt.enable() or
  disable() are validated like a list, so an unknown name now
  raises ValueError.
- Internals plugins may touch. StateInline.pending is now a
  property backed by a buffer: state.pending += text still works,
  and the new state.append_pending(text) appends in constant time.
  HTML_TAG_RE (markdown_it.common.html_re) and DIGITAL_RE and
  NAMED_RE (markdown_it.rules_inline.entity) no longer start with
  ^, because they are applied with .match(src, pos); code that
  calls .search() on them now matches anywhere in the string. The
  private StateBase._src and _srcCharCode attributes are gone
  (srcCharCode itself is still there, and still deprecated).
- Packaging. The testing extra no longer installs coverage and
  pytest-cov: install .[testing,coverage] to run the tests with
  --cov. The sdist now contains tests/, and no longer contains
  repository files such as .github/, .pre-commit-config.yaml and
  scripts/.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-markdown-it-py_4.2.0.bb => python3-markdown-it-py_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-markdown-it-py_4.2.0.bb => python3-markdown-it-py_4.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-markdown-it-py_4.3.0.bb
index 0bb2b3ca6c..31b6a0573d 100644
--- a/meta-python/recipes-devtools/python/python3-markdown-it-py_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown-it-py_4.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/markdown-it-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
+SRC_URI[sha256sum] = "91a58fa5b72c71a40cf7177250fd767480d7a2bb3ac426ccfb76fb90305fdaaa"
 
 inherit pypi python_flit_core
 
-- 
2.47.3

