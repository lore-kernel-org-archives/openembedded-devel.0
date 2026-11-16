Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22789.1794814542848876054
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gYlOXbrN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so32942665e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814541; x=1795419341; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THcCep5j+8xU8pdvS/embbBeLxn87vrjY9CmmnvmOVM=;
        b=gYlOXbrNdQfABgExGWDy4/l8KzZhc7vdl9NVkXvOGqKpaSPqMFJLQB7LIYzygvkXm3
         zogZM6yQxI43L8qn1on5Fd+h+zWu9bNDDk1bXN4cdwnDCh2dihBQlVEHfGu+FAqtiD+S
         7yyGvGvCJHCHYcaMkJgwt6RbTVBN169NvxVH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814541; x=1795419341;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THcCep5j+8xU8pdvS/embbBeLxn87vrjY9CmmnvmOVM=;
        b=FufdDPVqvD81QsHL10PMWuKBWEf57EhYfmTFFx+Ds6wTKbtey/FSn7wyDHaTJwbe9j
         5DUMRbTPzt0CtgBZDcAU5DKDriulzokd1kMB9ugD6J5T5Xo2q/hnFrbbVkEcmD2plJiZ
         eDeLURcoSk5y4KVhlyolZfTbcrV40wgNx5f53pm0CCqv9j1DFodRpd8AEPY6pw4O0G9s
         PxwMtzZ+XHJLZwcnxltMfNFBO3Aqrkn+sMDpG5JEWOOCaOHIB13OdnW9WHUWhPPNVGoD
         wTbkTtZbO9T7yc10iyFxRzWO/3gxmiJ/4BLlX/57y6GMxEHJ2rx3yNsaI/8nrSDeSZVL
         ZyvQ==
X-Gm-Message-State: APuU4Z9UfZ1Lyi5w9TZx+mGCOsO0tpph+MvldBqMrqBhH2g+4etY37Bi
	+B3TA/16NZ3/6P3NJ8Vfw1BSArwttQN4LgWBcu2V3rr5kCRHqS8bp9S5o6fmjZEx++OisB2oYAN
	O0AGa
X-Gm-Gg: AYBFou2w0AjmgSzTNvCGBNtCG6RiVBFKyleTRUyghPCzo2z0OdPLxwK2SYdZJhvUr2R
	1FPxheyVJG+bLpIe/mxgmefkDrKHUHtpKL50/3Up71Q0SST9ZFE8B+YRc+8HyrdebZz+V9xX/a4
	7nNNVe3J6i9rkDkp93vQEiYNhY8ZSuPi2Wdk1Om9lfhNKmcUIry3izpMIKgced59trLuScI4QTK
	nNPLkv4U0k8WK2jh4jkUVxnFkQEoEhnfeXHOHbTmorBuFN46y4O+R7qnapWNQ5dElkbEuLuFhwd
	Nag4NLjCKCSSn302auKsZV24rf8BxPCIe6p121Mfa4+gST0k/yCNgdx3OXVMYkcYcho32JE3bPp
	+k8H7EYpkv+xxaUUjdyUU3mjeY97zOxEMGJTyY874VMG1BkzzmlYiQqu25dD7Y3AknjgQdWnCF3
	gx7P74M+yWrpaVGST4TaMhGJWTx8kPIhRpJzarwAh8SCJzw+cFjN9IUVUsDvyuRyfJS8ZSntRq3
	zqfWlnlXBlg3aQptcbWbv3V3IwHf55HteBJ7WNskIDoYTq+DAo9mRIT0TDDD1X7KMdO8i8BJ3yH
	ZZYx3D+cdB5YehzeCXtv5f4DsBwS7//fwF2QKH5scVCmVG6DbabQxYte0wPxJcYHSjimzxkgf6t
	jaQlKfMRuMYhcHPB1+fRykklIVlwK+PkznCVelyi/L+sqbuyMIq7ZiA==
X-Received: by 2002:a05:600c:1547:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb6a5a7a3cmr82830495e9.34.1794814541024;
        Sun, 15 Nov 2026 23:35:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/24] python3-mdit-py-plugins: Upgrade 0.6.1 -> 0.7.0
Date: Mon, 16 Nov 2026 09:35:15 +0200
Message-ID: <20261116073532.880420-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132436
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.7.0:

A security and bug-fix release. Plugin renderers now escape user content
in HTML attribute, label and math positions, attrs drops event-handler
attributes by default and validates URL-valued attributes, and the
regular expressions in texmath  math  blocks and admon headers no longer
backtrack polynomially. It also fixes parser hangs in
gfm_autolink and texmath, and adds the section_ref plugin.
The release requires markdown-it-py >= 3.0 and supports Python 3.10 to
3.14. Several fixes change rendered output: see Upgrade notes below.

Upgrade notes:

- Requires markdown-it-py >= 3.0. The declared floor was
  2.0, but 0.5.0 and later already failed to import subscript with
  markdown-it-py 2.x. section_ref, gfm and gfm_autolink still need
  markdown-it-py >= 4.1 and raise RuntimeError on older versions.
  Python 3.10 to 3.14 are supported.
- attrs_plugin / attrs_block_plugin defaults are stricter.
  With no allowed list, event-handler attributes (any key starting
  with on, in any case) are removed and moved to
  token.meta["insecure_attrs"]; style is kept. Whatever allowed
  says, href, src, action, formaction and xlink:href are removed
  when md.validateLink rejects their value, so
  a{href="javascript:alert(1)"} keeps href="https://x". Text spans
  ([text]{...}) now honour allowed, which they used to bypass. This
  is a baseline, not a sanitiser: for untrusted input, pass an
  explicit list such as allowed=("id", "class").
- Renderers escape their output (#150, #165). The texmath default
  renderer HTML-escapes the math source ($a<b$ now renders
  <eq>a&lt;b</eq>), and the dollarmath equation label, the
  myst_block target label, the colon_fence class name and the
  tasklists label_after label are escaped too. Benign text
  containing &, <, > or " in these positions is now emitted as
  entities.
- anchors_plugin ids can change. An explicit heading id
  (such as {#custom} from attrs_block_plugin) is now kept instead
  of being overwritten, and generated slugs avoid it. The default
  slug function no longer strips whitespace from the title,
  matching MyST-Parser's github_slugify: a title that starts or
  ends with a space next to an image, raw HTML or an entity gets a
  different id (# Foo !img now gives foo-, it was foo). To keep the
  old ids, pass slug_func=lambda title: slugify(title.strip()),
  with slugify from mdit_py_plugins.anchors.index.
- mdit_py_plugins.attrs.parse.parse() raises on an unterminated
  attribute group, instead of succeeding at the end of the string
 . Every plugin call site declines the group, so  a{.a  now
  renders <code>a</code>{.a; it used to drop the {.a.
- The section_ref token shape is public API: see its entry
  below.

Security:

Thanks to @KrisKennawayDD for reporting these issues in #143, and to
@KyleKing for the ReDoS analysis and fixes.

- FIX: Escape plugin renderer output and harden the attrs
  defaults, thanks to @KyleKing for the cross-plugin XSS test
  (#150, folding in #151)

With markdown-it-py's html option off, untrusted Markdown could still
inject HTML or script through: the texmath default renderer (math
source), the dollarmath equation label (id and permalink href), the
myst_block (name)= target label, and attrs / attrs_block event-handler
and javascript: URL attributes. All of these are now escaped or filtered
(see Upgrade notes), and tests/test_xss.py renders injection probes
through each plugin's default renderer.

- FIX: Escape the colon_fence class name and the tasklists
  label_after label

:::a"onmouseover="alert(1) rendered an attribute-breaking
class="block-a"onmouseover="alert(1)", and - [ ] <img src=x
onerror=alert(1)> with label=True, label_after=True rendered a raw
<img>.

- FIX: ReDoS in texmath  math  blocks and admon headers, thanks
  to @KyleKing

The texmath  math  patterns (the gitlab and julia delimiters)
backtracked cubically on a fence followed by a long whitespace run with
no closing fence, and the admon multi-tag title pattern backtracked
quadratically on a header with a long run of spaces or double quotes.
Both now run in linear time and match what they matched before, so
output is unchanged.

New:

- NEW: Add the section reference plugin (section_ref) (#144,
  #168, #169)

The section_ref plugin captures section-sign references, the syntax LLMs
commonly use to point at numbered headings, into dedicated section_ref
tokens, so downstream renderers (e.g. MyST-Parser) can resolve them to
heading cross-references:

A § must be immediately followed by one or more .-separated levels of 1
to 9 ASCII digits, with no spaces. A trailing . is not part of the
reference, and a reference directly followed by an ASCII letter (§1a),
or with a level longer than nine digits, stays literal text. Each
reference is a section_ref leaf token whose content is the text as
written and whose meta["numbers"] lists each level as an int (e.g. [1,
1] for §1.1). The grammar and the token shape are documented in the
plugin docstring and are public API from this release. It renders as
<span class="section-ref">§1.1</span> by default.

Requires markdown-it-py >= 4.1.0.

Fixes:

- FIX: gfm_autolink no longer hangs on autolink-like text in link
  labels, thanks to @AryanRG
- FIX: texmath no longer loops forever on block math opened in a
  blockquote and closed after it, thanks to @acaprino
- FIX: dollarmath: a same-line $$…$$ followed by text no longer
  swallows the following lines, thanks to @KyleKing
- FIX: dollarmath: multi-line $$ blocks in a blockquote no longer
  keep the > prefixes in their content, thanks to
  @BetterAndBetterII
- FIX: front_matter: parse front matter closed by the YAML ...
  document-end marker, thanks to @feiiiiii5

A block closed by ... used to leak into the document as text when the
... was the document's last line or had trailing spaces, and otherwise
kept the ... in token.content. The marker must be at column 0 and may be
followed by spaces only.

- FIX: footnote: reserve an inline footnote's id before parsing
  its content, thanks to @civilwarinfrance

A [^named] reference or a nested ^[...] inside an inline footnote no
longer loses the inner note, duplicates an id, or raises KeyError:
'count'.

- FIX: anchors: keep explicit heading ids, and do not strip slug
  titles, thanks to @muneikh
- FIX: attrs: unterminated groups, class accumulation and
  closing-token merge

An unterminated attribute group no longer swallows the text after it.
Classes from adjacent attribute groups are combined on spans and links
([a]{.x}{.y} gives class="x y"), as they already were on inline code and
images. An attributes block at the end of a container is no longer
merged onto the closing token (> {.a} rendered </blockquote class="a">).

- FIX: myst_role no longer rejects a role at the start of inline
  content when the content ends with a backslash, and  \\{name}x
  (an escaped backslash before a role) now parses the role

Documentation:

- DOCS: Explain front matter extraction and HTML rendering
 , thanks to @Gonghan-Princess
- DOCS: A runnable usage example, the dollarmath rendering
  contract and a "Rendering dollarmath output" guide, and
  Read the Docs builds on Python 3.13

Maintenance:

- Require markdown-it-py >= 3.0, test the floor and Python 3.14
  in CI, and update the classifiers
- Releases are published to PyPI with trusted publishing,
  with attestations, from distributions built with python -m
  build and checked on every pull request
- pre-commit autoupdate (ruff 0.17, mypy 2.4) with a pinned ruff
  base rule set, and a non-blocking Codecov upload

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...dit-py-plugins_0.6.1.bb => python3-mdit-py-plugins_0.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mdit-py-plugins_0.6.1.bb => python3-mdit-py-plugins_0.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.7.0.bb
index 7f1dc9691c..2b9936003c 100644
--- a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
+SRC_URI[sha256sum] = "26d2179227aaf4d1dc7acffe7a738cbd15cade6b5a61cff0a2cbf9fed93efede"
 
 inherit pypi python_flit_core
 
-- 
2.47.3

