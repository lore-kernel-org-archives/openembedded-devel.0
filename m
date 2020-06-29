Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.455.1593451155772903090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxR3-0000w7-Tl; Mon, 29 Jun 2020 20:19:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-pyflakes: Upgrade 2.1.1 -> 2.2.0
Date: Mon, 29 Jun 2020 20:18:48 +0300
Message-Id: <20200629171853.18608-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
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

Use LICENSE instead of README.rst for LIC_FILES_CHKSUM. Upgrade to
release 2.2.0:

- Include column information in error messages
- Fix @overload detection with other decorators and in non-global
  scopes
- Fix return-type annotation being a class member
- Fix assignment to _ in doctests with existing _ name
- Namespace attributes which are attached to ast nodes with
  _pyflakes_ to avoid conflicts with other libraries (notably
  bandit)
- Add check for f-strings without placeholders
- Add check for unused/extra/invalid 'string literal'.format(...)
- Add check for unused/extra/invalid 'string literal % ...
- Improve python shebang detection
- Allow type ignore to be followed by a code # type:
  ignore[attr-defined]
- Add support for assignment expressions (PEP 572)
- Support @overload detection from typing_extensions as well
- Fix @overload detection for async functions
- Allow continue inside finally in python 3.8+
- Fix handling of annotations in positional-only arguments
- Make pyflakes more resistant to future syntax additions
- Fix false positives in partially quoted type annotations
- Warn about is comparison to tuples
- Fix Checker usage with async function subtrees
- Add check for if of non-empty tuple
- Switch from optparse to argparse
- Fix false positives in partially quoted type annotations in
  unusual contexts
- Be more cautious when identifying Literal type expressions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyflakes_2.1.1.bb => python3-pyflakes_2.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.1.1.bb => python3-pyflakes_2.2.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
index c13882240..911cf4ec3 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "passive checker of Python programs"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=5127315117a8561a1504343d59620647"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[md5sum] = "a0f71a15724e553c46e03ba5ed56703c"
-SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
+SRC_URI[md5sum] = "48b1c29732ca810a70cba0e6d0531169"
+SRC_URI[sha256sum] = "35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

