Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22790.1794814543767515436
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PHhTTRxK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19557615e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814542; x=1795419342; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTi7znbt37msWIWhTcHMCDqTqObBGxAKDRPyKaOsZPk=;
        b=PHhTTRxKpIraPiP2Nkb2QNI5EJogdr4jk05xkHNfWWow15BDhw27oqWsFlPuQZRy43
         SPbm8KKgm9B7aeywficfEpdnuX817IQTZa6w59H8EBtRrAx0b4VlWMrXw8SntOw6COWX
         J5sNfwj3jdnqe9UqlWLkh//3GCw9jSPKrNSF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814542; x=1795419342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTi7znbt37msWIWhTcHMCDqTqObBGxAKDRPyKaOsZPk=;
        b=GZFWXACE5+cEwx4YXMY9/JPo6thkfxD+Ds6W6aIWzY/9SQE6YpBpt8eMAfAU+iKjGk
         O/DWcr6THSbWRBZFsjzJ0+w8qqECjia4l9hxqlzfuJErLeJyUYjN3QIgyOMco3FORRcn
         F71cUZH6HAEjMm2x54tnWkmg8fk0B1zmgcMDRIcJ+sw8rUdYbR40iUHvrSMFsfBANaHa
         G+kmzmQH1quZ8HMMP+3kWJoVzRyzkdNHef6USZXFCI9wd5oHygSLH3Z2FvKqxmhy0pNy
         ohzRhV2YXHgVhOM2y5IoOtsN0l4pcujAZzoBFAKWyeXXHzQhD25v8N50x+ZItkQzoXvO
         kA7g==
X-Gm-Message-State: APuU4Z8CdScuXsW2TFXYDMQZweuXcvSwF/oJZatCC9ZUD+9c61M9RIQm
	Nr3GiNCSembd7p/Kl3bHBXTSml/HfE2yphldV+ePnzY1AjIlB5suzfZiWFEeZIGg/URumFxEXxi
	U99Q2
X-Gm-Gg: AYBFou21mFvNCFmDfL43w7RpgEZEkkyHfb3fT6wk3mOgzmbqmNClWz5XY5zOYKWlWwe
	m2a8v/c0aCJokfp3iZHH6hWxhLDfi7a3itxXnbmSEuUF7C/A5qJAfqMW/wnEkQEH3xlebQQMWZ+
	ddhHBTMBXA5pePD2JFKUdS8LpN9qvSrMfiYnewAfmJm1reMwjUE53cTu1T0dTsR2KrqWXgIBokZ
	aFKY5JqGSQs51jGucYNAsb+A4c6vGQf2sv8jYo4QbA3Dkyus4Mu9YCp1yjSAHqNu8LIOuuHxXCL
	5j/yyUlHh1L4dOHKxl7v9EyoTZRLzR06umhjXbKxYwZt7XPVTUFM59WyB6ugSa2I4WXFeojvewt
	3jV3daJeT7ll5DtmlzrK6DfiHqsLvORbI5wpcw1BAof4baGHW+LEcON6EAXuJq3XwtYc0BtvZsj
	qvC8QB7KgQRZ5195rgZ2WgWMpBv2/zp4stIqiwtm/s7WHOuyiqspljXF9UmOFdbsqsnJIYlZi6/
	ZDJhcEjbYo136pFl+nfWla7r8zAoPrH2OQG6Wdl54R5ngY0gr91RbJ5MUpUKnYqqzarD/XkaTaG
	69ZRxGF8SprddDYPIpc6rT77J1K2cBEP/E8WO4yTMEiDg1OG9CM5odE5Fs7NPnbrJ+pY/aShHMa
	TbJhWAg79/hw6Q8m0/oiI24iOFkdAH6kmQyn1sn0xd7FImJ60ClPNZA==
X-Received: by 2002:a05:600c:6212:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb5e65fc18mr174621985e9.0.1794814541951;
        Sun, 15 Nov 2026 23:35:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/24] python3-myst-parser: Upgrade 5.1.0 -> 5.2.0
Date: Mon, 16 Nov 2026 09:35:16 +0200
Message-ID: <20261116073532.880420-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132437
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.2.0:

Heading anchors are now stable and documented: one shared slug
implementation with "github", "gitlab" and "docutils" presets, slugs
emitted as real HTML ids, explicit (target)= ids taking priority, and a
versioned anchor contract. Warnings and other tools now get accurate
source lines (also inside {include}d files), docutils 0.23 is supported,
inputs that used to abort the build now warn instead, and many fixes
land for references, images, front matter, substitutions and directives;
a new section_ref extension links §1.1-style references to numbered
headings.

Nothing is dropped: Python >=3.11, Sphinx >=8,<10 and the markdown-it-py
requirement are unchanged, mdit-py-plugins is raised to ~=0.7 (it was
~=0.6,>=0.6.1), and the docutils range is widened to >=0.20,<0.24. Some
of these changes can still alter the output of a project that built
before, so please read the upgrade notes.

Upgrade notes:

- Heading anchors, see docs:
  - Duplicate heading slugs now get fixed-base suffixes, x, x-1,
    x-2, as on GitHub; the third and later duplicates used to get
    x-1-2, x-1-2-3, ... So a link that uses the old slug of a third
    or later duplicate, such as [](#x-1-2), no longer resolves and
    warns (myst.xref_missing, which fails a -W build): change it to
    [](#x-2). Links to the first two duplicates are unchanged, and
    every HTML id a heading had before is kept.
  - Slugs are also emitted as secondary HTML ids on the rendered
    headings, so #slug links work in the published HTML. The
    docutils id stays the primary (first) id, so existing fragment
    links keep working. Set myst_heading_anchors_html_ids = False
    to emit only the docutils id.
  - An explicit (target)= placed before a heading becomes the
    section's primary id, which tocs, permalinks and objects.inv
    use; the implicit heading id is kept as a secondary anchor.
  - A heading whose slug is empty (a punctuation-only title, or any
    non-Latin title with the "docutils" preset) gets no anchor, and
    an empty fragment, [](#), now warns as unresolved.
  - Links that used to warn now resolve when the anchor exists:
    same-document links to implicit ids (such as headings deeper
    than myst_heading_anchors; under Sphinx only as a last resort),
    and cross-document links to label ids and to the implicit ids
    of headings within the myst_heading_anchors depth.
    [](doc.md#label) takes the target's title as its text.
  - These rules (slug presets, deduplication, empty slugs,
    explicit-id priority and HTML ids) are now a documented
    contract, pinned by a versioned, language-agnostic corpus
    (tests/fixtures/slugs.json).
    myst_parser.mdit_to_docutils.base.default_slugify is deprecated
    in favour of myst_parser.slugs.github_slugify.
- Directive option warnings (#1164): each warning now points at the
  offending option's line, and unknown options are reported one per
  warning, as Unknown option key: 'x' (allowed: [...]), instead of
  one aggregate Unknown option keys: [...]. The
  myst.directive_option subtype is unchanged, so suppress_warnings
  keeps working, but tests that match the old message need
  updating.
- Directive API (#1164): directives now receive the full fenced
  text as block_text, as in reStructuredText, so errors that echo
  it show the whole fence; and content_offset is -1 when the body
  starts on the opening line.
- Source lines (#1164, #1169, #1179): lines in warnings and nodes
  change where they were wrong. Text nodes no longer take the line
  of the most recent directive (so gettext .pot locations change),
  lines inside {include}d files are no longer one late, and the
  body of a directive with options and a trailing blank line is no
  longer one line off.
- Front matter (#1197): options that can only be set globally
  (heading_slug_func, update_mathjax, mathjax_classes,
  suppress_warnings, inventories) now warn (myst.topmatter) and are
  ignored in a document's front matter. This removes the
  undocumented per-document effect of inventories (docutils) and
  update_mathjax (Sphinx).
- Rendered output:
  - parsed-literal keeps each line's indentation, and two trailing
    spaces no longer make a hard line break;
  - $$ math blocks lose the blank lines at the start and end of
    their content, which broke LaTeX output;
  - myst_links_external_new_tab writes rel="noreferrer" (it was
    misspelt noreferer), and no longer overwrites an authored
    target or rel;
  - image alt text keeps backslash escapes and entities, an
    HTML <img> keeps its alt text exactly, and a valueless alt is
    now empty rather than None;
  - link titles are kept on links that go through cross-reference
    resolution;
  - a footnote whose label equals a heading's name is now kept,
    rather than dropped with a warning.
- Packaging: the distributions are now built with python -m
  build, so the sdists hold only the package, pyproject.toml,
  README.md and LICENSE (no longer CHANGELOG.md, tox.ini or
  .github/); the wheels are unaffected.
- mdit-py-plugins 0.7: myst-parser and myst-docutils now
  require mdit-py-plugins>=0.7,<1.

New Features:

- Stable heading anchors: one shared slug module
  (myst_parser.slugs), named presets for myst_heading_slug_func
  ("github", "gitlab"), slugs emitted as HTML ids
  (myst_heading_anchors_html_ids), explicit-id priority, fewer
  false warnings for working links, and myst-anchors --slug-func,
- Add the "docutils" heading slug preset (byte-identical to
  docutils.nodes.make_id) and a versioned anchor contract, see
  docs,
- Add the "section_ref" syntax extension: section-sign references
  such as §1, §1.1 and §2.3.4 link to the correspondingly numbered
  heading of the current document (numbered the same in docutils
  and Sphinx), with a suppressible myst.section_ref warning when no
  heading matches, see docs,

Improvements:

- Report accurate source lines: directive option warnings point
  at their option, unknown options warn per key, first-line
  directive content is no longer one line off, text nodes get their
  own lines, directives receive the full block_text, and an include
  with :literal: gets its true line
- Allow a {table} caption to wrap onto the following lines,
- Make a document's own front matter available to its
  substitutions, as env.metadata[env.docname]

Bug Fixes:

- Warn instead of aborting the build on hostile input (deeply
  nested HTML, malformed or hostile YAML front matter, YAML alias
  bombs), and keep a footnote whose label equals a heading's name,
- Fix small docutils renderer bugs: field bodies get source
  lines, a definition without a term no longer crashes, and linkify
  without linkify-it-py installed is disabled with a myst.linkify
  warning instead of crashing,
- Resolve [](doc.md#label) links to explicit targets in other
  documents without a false myst.xref_missing warning, using the
  target's title as the link text,
- Keep link titles through cross-reference resolution,
- Report exact source lines in {include}d files (also with
  :start-after: and a negative :start-line:)
- Keep validated front matter config values (enable_extensions,
  fence_as_directive, url_schemes), and reject global_only options
  in front matter
- Fix a directive's body offset when its body ends in blank
  lines
- Don't crash on nested YAML dates in front matter
- Fix sorting of mixed manual and auto-numbered footnotes
- Keep backslash escapes and entities in image alt text
- Keep the literal alt text of HTML images (html_image), so a
  newline in an attribute can no longer inject a directive option,
- Preserve line indentation in parsed-literal directives
- Allow substitution keys that are not Jinja2 identifiers, such
  as {{foo-bar}}
- attrs: warn instead of raising on an invalid aliased image
  attribute ({w=…}) or a duplicate heading {#id}, and fix the
  new-tab link attributes
- Strip blank boundary lines from $$ math blocks, which broke
  LaTeX output
- Send a User-Agent when fetching remote inventories, which Read
  the Docs rejected with HTTP 403
- Allow setup_sphinx to run twice, so myst_parser and myst_nb can
  both be listed in extensions

Documentation:

- Document percent-encoding spaces in inventory object names,
- Drop the unsupported \[...\] and \(...\) math delimiters from
  the syntax reference
- Link to auto_mode in sphinx-autodoc2
- Render the docs' syntax examples with sphinx-syntax-example

Internal / Maintenance:

- Publish to PyPI with trusted publishing, from distributions
  built and checked in CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-myst-parser_5.1.0.bb => python3-myst-parser_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-myst-parser_5.1.0.bb => python3-myst-parser_5.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb b/meta-python/recipes-devtools/python/python3-myst-parser_5.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-myst-parser_5.2.0.bb
index 7dc22c5bf8..3aba13fd1c 100644
--- a/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_5.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/MyST-Parser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "ab69322dc6719dcc7f296479dbb70181b66df6ed315064f92dbc85c0e1bf2f02"
+SRC_URI[sha256sum] = "749cc02793f2be6b984b0b59b1fe33b6ed61d77644499b85db436d0d20117fa4"
 
 inherit pypi python_flit_core
 
-- 
2.47.3

