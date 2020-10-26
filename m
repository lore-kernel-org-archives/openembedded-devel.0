Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10189.1603702954556604446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 02:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kWyOf-0003YJ-2A; Mon, 26 Oct 2020 11:02:33 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-tqdm: Upgrade 4.50.2 -> 4.51.0
Date: Mon, 26 Oct 2020 11:02:15 +0200
Message-Id: <20201026090217.21174-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026090217.21174-1-leon.anavi@konsulko.com>
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.51.0:

- add {eta} datetime bar_format argument
- fix py3 CLI --update & --update_to
- replace nosetests with pytest
- add & update tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.50.2.bb => python3-tqdm_4.51.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.50.2.bb => python3-tqdm_4.51.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
index 9c2d06ba94..e4510ad448 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.50.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "2e56a15d28aa1fa06eeb31031c16c1f3"
-SRC_URI[sha256sum] = "69dfa6714dee976e2425a9aab84b622675b7b1742873041e3db8a8e86132a4af"
+SRC_URI[md5sum] = "b188c2dc7802c19b262971e566c265ce"
+SRC_URI[sha256sum] = "ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432"
 
 inherit pypi setuptools3
 
-- 
2.17.1

