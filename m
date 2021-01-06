Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1052.1609970849680038406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxj-0004lA-5l; Thu, 07 Jan 2021 00:07:27 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-cantools: Upgrade 35.5.0 -> 36.1.0
Date: Thu,  7 Jan 2021 00:07:00 +0200
Message-Id: <20210106220702.10483-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 36.1.0:

- Added sub command plot
- plot test: parse output of cantools decode
- added plot subcommand to readme
- removed unneeded code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_35.5.0.bb => python3-cantools_36.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.5.0.bb => python3-cantools_36.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
index cb70ed3188..b2f3fd6d82 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9"
+SRC_URI[sha256sum] = "3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.17.1

