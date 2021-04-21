Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9100.1618991943532174788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZ7l6-0002oU-WA; Wed, 21 Apr 2021 10:58:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-argcomplete: Upgrade 1.12.2 -> 1.12.3
Date: Wed, 21 Apr 2021 10:58:40 +0300
Message-Id: <20210421075843.17725-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421075843.17725-1-leon.anavi@konsulko.com>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.3:

- Help string support for fish
- Add option to use tempfiles for IPC
- Fix multiple command registration for non-bash shells
- Register auto completion for an arbitrary name using a given
  external script
- Skip completions from active subprocess completer
- Fix warnings regarding invalid escape sequences

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-argcomplete_1.12.2.bb => python3-argcomplete_1.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.2.bb => python3-argcomplete_1.12.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb
index a08f882ab1..3eb4e5c27c 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "de0e1282330940d52ea92a80fea2e4b9e0da1932aaa570f84d268939d1897b04"
+SRC_URI[sha256sum] = "2c7dbffd8c045ea534921e63b0be6fe65e88599990d8dc408ac8c542b72a5445"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.17.1

