Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6811.1609859819062187284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4r-0007qz-4I; Tue, 05 Jan 2021 17:16:53 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-txaio: Upgrade 20.4.1 -> 20.12.1
Date: Tue,  5 Jan 2021 17:16:36 +0200
Message-Id: <20210105151638.15700-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.12.1:

- CI/CD migrated to GitHub Actions
- support Python 3.9 (CI / testing added)
- minimum Python version is now 3.6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-txaio_20.4.1.bb => python3-txaio_20.12.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_20.4.1.bb => python3-txaio_20.12.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
index 75a9395a25..f4baeb10fe 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_20.12.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d"
+SRC_URI[sha256sum] = "1488d31d564a116538cc1265ac3f7979fb6223bb5a9e9f1479436ee2c17d8549"
 
 inherit pypi setuptools3
 
-- 
2.17.1

