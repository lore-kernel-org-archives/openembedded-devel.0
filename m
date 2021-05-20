Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.11159.1621528966882678437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 09:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58812 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ljlky-0007FW-OY; Thu, 20 May 2021 19:42:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-click: Upgrade 8.0.0 -> 8.0.1
Date: Thu, 20 May 2021 19:42:37 +0300
Message-Id: <20210520164237.31557-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520164237.31557-1-leon.anavi@konsulko.com>
References: <20210520164237.31557-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.0.1:

- Mark top-level names as exported so type checking understand
  imports in user projects.
- Annotate Context.obj as Any so type checking allows all
  operations on the arbitrary object.
- Fix some types that weren’t available in Python 3.6.0.
- Fix type checking for iterating over ProgressBar object.
- The importlib_metadata backport package is installed on Python
  < 3.8.
- Arguments with nargs=-1 only use env var value if no command
  line values are given.
- Flag options guess their type from flag_value if given, like
  regular options do from default.
- Added documentation that custom parameter types may be passed
  already valid values in addition to strings.
- Resolving commands returns the name that was given, not
  command.name, fixing an unintended change to help text and
  default_map lookups. When using patterns like AliasedGroup,
  override resolve_command to change the name that is returned
  if needed.
- If a default value is invalid, it does not prevent showing
  help text.
- Pass windows_expand_args=False when calling the main command to
  disable pattern expansion on Windows. There is no way to escape
  patterns in CMD, so if the program needs to pass them on as-is
  then expansion must be disabled.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-click_8.0.0.bb => python3-click_8.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.0.0.bb => python3-click_8.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.0.0.bb b/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-click_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-click_8.0.1.bb
index f7af73d6d5..22c6c7903c 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "7d8c289ee437bcb0316820ccee14aefcb056e58d31830ecab8e47eda6540e136"
+SRC_URI[sha256sum] = "8c04c11192119b1ef78ea049e0a6f0463e4c48ef00a30160c704337586f3ad7a"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

