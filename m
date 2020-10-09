Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10637.1602239748122533026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59440 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kQpkY-0007Jc-2r; Fri, 09 Oct 2020 13:35:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-markdown: Upgrade 3.2.2 -> 3.3
Date: Fri,  9 Oct 2020 13:35:34 +0300
Message-Id: <20201009103535.31339-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009103535.31339-1-leon.anavi@konsulko.com>
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 3.3:
- The prefix language- is now prepended to all language classes
  by default on code blocks.
- Attribute Lists are more strict.
- All Pygments' options are now available for syntax highlighting.
- Fenced Code Blocks now work with Attribute Lists when syntax
  highlighting is disabled. Any random HTML attribute can be
  defined and set on the <code> tag of fenced code blocks when the
  attr_list extension is enabled.
- The HTML parser has been completely replaced. The new HTML
  parser is built on Python's html.parser.HTMLParser, which
  alleviates various bugs and simplify maintenance of the code.
- The Markdown in HTML extension has been rebuilt on the new HTML
  Parser, which drastically simplifies it. Note that raw HTML
  elements with a markdown attribute defined are now converted to
  ElementTree Elements and are rendered by the serializer. Various
  bugs have been fixed.
- Link reference parsing, abbreviation reference parsing and
  footnote reference parsing has all been moved from preprocessors
  to blockprocessors, which allows them to be nested within other
  block level elements. Specifically, this change was necessary to
  maintain the current behavior in the rebuilt Markdown in HTML
  extension. A few random edge-case bugs (see the included tests)
  were resolved in the process.
- An alternate function markdown.extensions.headerid.slugify_unicode
  has been included with the Table of Contents extension which
  supports Unicode characters in table of contents slugs. The old
  markdown.extensions.headerid.slugify method which removes
  non-ASCII characters remains the default. Import and pass
  markdown.extensions.headerid.slugify_unicode to the slugify
  configuration option to use the new behavior.
- Support was added for Python 3.9 and dropped for Python 3.5.
- Document how to pass configuration options to Extra.
- Fix HR which follows strong em.
- Support short reference image links.
- Avoid a RecursionError from deeply nested blockquotes.
- Fix issues with complex emphasis.
- Fix unescaping of HTML characters <> in CodeHilite.
- Fix complex scenarios involving lists and admonitions.
- Fix complex scenarios with nested ordered and unordered lists in
  a definition list.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.2.2.bb => python3-markdown_3.3.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.2.2.bb => python3-markdown_3.3.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.bb
index ce5dde63ea..db8311be5d 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "Markdown"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz"
-SRC_URI[md5sum] = "6e8daf1e566bf3572c137ada399fe40b"
-SRC_URI[sha256sum] = "1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17"
+SRC_URI[md5sum] = "76eb34a058bb8b637ccadc4ce384bae4"
+SRC_URI[sha256sum] = "4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

