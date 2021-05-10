Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.32211.1620655654078380041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZF-000657-SW; Mon, 10 May 2021 17:07:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-pywbemtools: Upgrade 0.8.1 -> 0.9.0
Date: Mon, 10 May 2021 17:07:13 +0300
Message-Id: <20210510140722.27201-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.9.0:

- Modified the --timestats general option from boolean to choice
  with 3 choices for when statistics are displayed (after each
  command or via a command).
- Fixed a ValueError on Windows that was raised when the
  connections file was not on the home drive.
- Limit click package to < 8.0 because of a) incompatibility with
  python 2.7, b) incompatibility between click 8.0 and clicl-repl.
- Limit mock package to lt 4.0.3 to avoid issue issue that causes
  test failure.
- Fix issue caused by mock package version 4.0.3 by creating
  replacements for warnings.warn and warnings.warn_explicit
  functions and removing the use of the patch decorator in
  pywbemcli.py before the definition of the cli function.
- Fixes issue where in pywbemcli the --timeout and --use-pull
  general options were not always correctly included in the new
  object context in interactive mode if they were specified on
  the interactive mode cmd line.
- Fixed issue in tests with use of stdin and inputting the instance
  path for instance get and instance delete. This was a test setup
  issue and not a code issue.
- Mitigated the coveralls HTTP status 422 by pinning
  coveralls-python to <3.0.0.
- Fix issue where documentation index disappeared when we changed
  the documentation theme
- Test: Fixed behavior of 'pdb' test condition, which is supposed
  to stop in the pdb debugger before executing the command
  function, but did immediately leave the debugger again because
  of redirections of the standard streams. The debugger now
  properly comes up when 'pdb' is specified as a condition.
- Test: Fixed restoring of environment variables that are modified
  by testcases, and displaying of PYWBEMCLI environment variables
  during testing in verbose mode.
- Change MOFCompiler.add_mof/remove_mof() to only display
  exceptions received if not MOFCompileError since the MOF
  compiler logs all MOFCompileError exceptions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-pywbemtools_0.8.1.bb => python3-pywbemtools_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.8.1.bb => python3-pywbemtools_0.9.0.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb
index c5cabdb13e..b06fee5500 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "3cbee091f0a4917394814d7e639ab9fe13ad0859e47288deabf2b09a4382c4ae"
+SRC_URI[sha256sum] = "f6f36c96be46c801919fa6cc218a5d051fce381a2d9a0b99c9162d8335e96c36"
 
 inherit pypi setuptools3
 
-- 
2.17.1

