Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56483.1600074273614270691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPY-0007z1-9B; Mon, 14 Sep 2020 12:04:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-tqdm: Upgrade 4.48.2 -> 4.49.0
Date: Mon, 14 Sep 2020 12:04:17 +0300
Message-Id: <20200914090419.19171-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.49.0:

- CLI: add --tee
- CLI: add --update and --update_to
- CLI: add --null
- CLI: accept - instead of _ in options (e.g. --update-to)
- make update() return True on display to ease efficient use of
  custom callbacks
- fix py>=3 CLI --delim encoding error
- fix py>=3.5 version detection in tqdm.auto
- fix final ETA when using initial
- update documentation
- add & update tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.48.2.bb => python3-tqdm_4.49.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.48.2.bb => python3-tqdm_4.49.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
index 831468095..26eb1073d 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.48.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "d29c836d74d2f2ec6a10d052937f7371"
-SRC_URI[sha256sum] = "564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21"
+SRC_URI[md5sum] = "c2afde3f1d5aa108376fdd0f4b20821d"
+SRC_URI[sha256sum] = "faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

