Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13113.1620912233322230567
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJe-0004kU-3O; Thu, 13 May 2021 16:23:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-configargparse: Upgrade 1.4 -> 1.4.1
Date: Thu, 13 May 2021 16:23:28 +0300
Message-Id: <20210513132332.3745-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.1:

- add ignore_help_args option to parse_known_args(..) to avoid
  exiting the first time this method is called when -h is
  specified. This can allow all arg definitions to be executed
  before -h is handled, even if these definitions are
  interleaved with calls to parse_known_args(..)
- added tests
- updated setup.py publish commands

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-configargparse_1.4.bb => python3-configargparse_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.4.bb => python3-configargparse_1.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb
index 393f138740..0c851fef30 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "abef9ff44fb0091f0e3bb2ee7e5b26a02b5b62d45408a5272a9bd461f5b59b4b"
+SRC_URI[sha256sum] = "6df537158f28c5ef2e8a8146781833abbc6cb7fca81b1b55d18808ce3439235e"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.17.1

