Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.31551.1601280086567716016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo69-0001Xq-7h; Mon, 28 Sep 2020 11:01:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-tqdm: Upgrade 4.49.0 -> 4.50.0
Date: Mon, 28 Sep 2020 11:00:56 +0300
Message-Id: <20200928080059.18929-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.50.0:

- add bar colour option
- for notebook as well as std/CLI
- plain text as well as hex (e.g. 'green' or '#00ff00')
- notebook improvements: split bar description into separate
  widget and improve reset() (handle width and colour)
- fix exceptions when file is closed
- add & update tests
- minor documentation updates
- move and configure issue/pr templates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.49.0.bb => python3-tqdm_4.50.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.49.0.bb => python3-tqdm_4.50.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
index 26eb1073de..bf0385410e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "c2afde3f1d5aa108376fdd0f4b20821d"
-SRC_URI[sha256sum] = "faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b"
+SRC_URI[md5sum] = "4352d89e2c6d6b017f40f244baddfc51"
+SRC_URI[sha256sum] = "93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa"
 
 inherit pypi setuptools3
 
-- 
2.17.1

