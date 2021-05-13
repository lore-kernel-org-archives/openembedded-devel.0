Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.13221.1620912235824378551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJg-0004kU-IQ; Thu, 13 May 2021 16:23:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-click: Upgrade 7.1.2 -> 8.0.0
Date: Thu, 13 May 2021 16:23:29 +0300
Message-Id: <20210513132332.3745-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 8.0.0:

- Drop support for Python 2 and 3.5.
- Colorama is always installed on Windows in order to provide
  style and color support.
- Adds a repr to Command, showing the command name for friendlier
  debugging.
- Add support for distinguishing the source of a command line
  parameter.
- Add an optional parameter to ProgressBar.update to set the
  current_item.
- New class attributes make it easier to use custom core objects
  throughout an entire application.
- Use Context.with_resource() to manage resources that would
  normally be used in a with statement, allowing them to be used
  across subcommands and callbacks, then cleaned up when the
  context ends.
- The result object returned by the test runner’s invoke() method
  has a return_value attribute with the value returned by the
  invoked command.
- Required arguments with the Choice type show the choices in
  curly braces to indicate that one is required ({a|b|c}).
- Redesign the shell completion system.
- Completion correctly parses command line strings with incomplete
  quoting or escape sequences.
- Fix formatting when Command.options_metavar is empty.
- Revert adding space between option help text that wraps.
- When defining a parameter, default is validated with multiple
  and nargs. More validation is done for values being processed
  as well.
- HelpFormatter.write_text uses the full line width when wrapping
  text.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-click_7.1.2.bb => python3-click_8.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click_7.1.2.bb => python3-click_8.0.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb b/meta-python/recipes-devtools/python/python3-click_8.0.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-click_7.1.2.bb
rename to meta-python/recipes-devtools/python/python3-click_8.0.0.bb
index 0b513e7cb9..f7af73d6d5 100644
--- a/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.0.0.bb
@@ -8,8 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[md5sum] = "53692f62cb99a1a10c59248f1776d9c0"
-SRC_URI[sha256sum] = "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
+SRC_URI[sha256sum] = "7d8c289ee437bcb0316820ccee14aefcb056e58d31830ecab8e47eda6540e136"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

