Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18118.1596201789187182826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V07-000741-Fv; Fri, 31 Jul 2020 16:23:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/15] python3-tqdm: Upgrade 4.47.0 -> 4.48.0
Date: Fri, 31 Jul 2020 16:22:30 +0300
Message-Id: <20200731132230.20031-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.0
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

Upgrade to release 4.48.0:

- add tqdm.asyncio
- reduce contrib.discord logging verbosity
- fix potential pandas() modifying **kwargs bug
- update documentation
- add tests
- misc framework updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.47.0.bb => python3-tqdm_4.48.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.47.0.bb => python3-tqdm_4.48.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
index fad758e3f..428bdb59e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.48.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "1594eab5b5aef37ef1fd6d36ce4f8f4c"
-SRC_URI[sha256sum] = "63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7"
+SRC_URI[md5sum] = "89dbe66a10f78900e4e7be729ddd28ca"
+SRC_URI[sha256sum] = "6baa75a88582b1db6d34ce4690da5501d2a1cb65c34664840a456b2c9f794d29"
 
 inherit pypi setuptools3
 
-- 
2.17.1

