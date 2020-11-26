Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8740.1606413844948572148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 10:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54480 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiLcg-0008NL-8Q; Thu, 26 Nov 2020 20:04:03 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitstruct: Upgrade 8.11.0 -> 8.11.1
Date: Thu, 26 Nov 2020 20:03:46 +0200
Message-Id: <20201126180347.13763-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126180347.13763-1-leon.anavi@konsulko.com>
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.11.1:

- Fix memory leak in unpack dict C extension
- Release with python3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-bitstruct_8.11.0.bb => python3-bitstruct_8.11.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.11.0.bb => python3-bitstruct_8.11.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
index a25380418c..49b31971a6 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[md5sum] = "8eaf853c95e10ca4b6bca2fe5ff307c6"
-SRC_URI[sha256sum] = "2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d"
+SRC_URI[sha256sum] = "4e7b8769c0f09fee403d0a5f637f8b575b191a79a92e140811aa109ce7461f0c"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.17.1

