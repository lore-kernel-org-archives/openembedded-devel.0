Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5328.1628584276126161198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53578 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDNAI-0005EL-3n; Tue, 10 Aug 2021 11:31:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-configargparse: Upgrade 1.5.1 -> 1.5.2
Date: Tue, 10 Aug 2021 11:30:56 +0300
Message-Id: <20210810083058.29524-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810083058.29524-1-leon.anavi@konsulko.com>
References: <20210810083058.29524-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- fix: append with nargs > 1 for env vars
- add support for argparse.BooleanOptionalAction
- Docs update

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-configargparse_1.5.1.bb => python3-configargparse_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.5.1.bb => python3-configargparse_1.5.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb
index 32b24f0429..e4b6797182 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "371f46577e76ec71a183b88378f36dd09f4b946f60fe60712f411b020f26b812"
+SRC_URI[sha256sum] = "c39540eb4843883d526beeed912dc80c92481b0c13c9787c91e614a624de3666"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.17.1

