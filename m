Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3680.1606389755059536105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFM9-0005Yd-Ne; Thu, 26 Nov 2020 13:22:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-ansi2html: Upgrade 1.5.2 -> 1.6.0
Date: Thu, 26 Nov 2020 13:22:12 +0200
Message-Id: <20201126112215.11451-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

Add native setuptools-scm and toml to the dependencies. Upgrade
to release 1.6.0:

- Add support for vt100 box drawing mode and high-intensity
  ansi codes
- Fix undefined behavior with linkify when same url is repeated
  in same line
- Prune CSS classes from output that are not used
- Update style.py
- Give more useful TaskWarrior example
- Fix handling cursor move up with unique and empty lines
- enable python 3 input decoding
- Fix missing color CSS definitions
- Prevent IndexError while handling CursorMoveUp
- added setup.cfg
- fix long lines
- Started to implement LaTeX support
- add option --title for filling in the title
- add empty title element to head section in html output
- added 2 color-schemes (solarized, osx). improved optparse
  handling schemes.
- added support to select a color-scheme. added schemes 'xterm'
  and 'xterm...
- Improve Makefile
- Add and ship AsciiDoc manpage, improve --help, add --version
- Fix README example to not produce unwanted spaces
- Add missing license headers
- Fix line handling
- Add support for previously unhandled ANSI codes, improve
  approach on handling color state
- Fix italic to be font-style (rather than font-weight)
- Stop adding unwanted spaces
- Fix writing to sys.stdout.buffer
- Add convenience Makefile
- Fix some bugs
- add --inline style
- Fix UnicodeDecodeError exception when Unicode characters appear
  in input

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-ansi2html_1.5.2.bb => python3-ansi2html_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.5.2.bb => python3-ansi2html_1.6.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
index 8e586ea3e8..d31448d6a8 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
@@ -5,9 +5,9 @@ LICENSE = "GPLv3"
 
 PYPI_PACKAGE = "ansi2html"
 
-SRC_URI[md5sum] = "52d6085ad1c5970082ea5305a26af981"
-SRC_URI[sha256sum] = "96ae85ae7b26b7da674d87de2870ba4d1964bca733ae4614587080b6358c3ba9"
+SRC_URI[sha256sum] = "0f124ea7efcf3f24f1f9398e527e688c9ae6eab26b0b84e1299ef7f94d92c596"
 
 inherit pypi setuptools3
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 RDEPENDS_${PN} = "${PYTHON_PN}-six"
-- 
2.17.1

