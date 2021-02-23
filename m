Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11134.1614093757820181571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWG-00022z-82; Tue, 23 Feb 2021 17:22:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-txaio: Upgrade 20.12.1 -> 21.2.1
Date: Tue, 23 Feb 2021 17:22:18 +0200
Message-Id: <20210223152219.32129-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.2.1:

- fix: update minimum dependencies (here, and in other crossbar
  packages) in an attempt to tame the new pip dep resolver madness

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-txaio_20.12.1.bb => python3-txaio_21.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_20.12.1.bb => python3-txaio_21.2.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
index f4baeb10fe..53dcb5cc69 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_21.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549"
+SRC_URI[sha256sum] = "7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

