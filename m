Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.447.1593451144171790909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxQq-0000w7-AI; Mon, 29 Jun 2020 20:19:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-tqdm: Upgrade 4.43.0 -> 4.47.0
Date: Mon, 29 Jun 2020 20:18:47 +0300
Message-Id: <20200629171853.18608-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 4.47.0:

- add contrib.discord (similar to contrib.telegram)
- add contrib.bells to auto-enable all extras
- add contrib.utils_worker for common slow tasks (e.g. web I/O)
- fix slow notebook imports
- fix gui TypeError on unknown len()
- misc documentation/error message updates
- misc framework updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.43.0.bb => python3-tqdm_4.47.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.43.0.bb => python3-tqdm_4.47.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
index 642246c00..fad758e3f 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "81454c26572e4e47911596ea065eb1b7"
-SRC_URI[sha256sum] = "f35fb121bafa030bd94e74fcfd44f3c2830039a2ddef7fc87ef1c2d205237b24"
+SRC_URI[md5sum] = "1594eab5b5aef37ef1fd6d36ce4f8f4c"
+SRC_URI[sha256sum] = "63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

