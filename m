Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.115.1614016251840694106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55530 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEFMA-0008OK-17; Mon, 22 Feb 2021 19:50:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-tabulate: Upgrade 0.8.7 -> 0.8.9
Date: Mon, 22 Feb 2021 19:50:40 +0200
Message-Id: <20210222175043.21231-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210222175043.21231-1-leon.anavi@konsulko.com>
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.9:

- Bug fix: Revert support of decimal separators
- Python 3.9 support, 3.10 ready
- New formats: unsafehtml, latex_longtable, fancy_outline
- Support lists of UserDicts as input
- Support hyperlinks in terminal output
- Improve testing on systems with proxies
- Migrate to pytest
- Various bug fixes and improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tabulate_0.8.7.bb => python3-tabulate_0.8.9.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tabulate_0.8.7.bb => python3-tabulate_0.8.9.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
index def35ff441..19261c3d1d 100644
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/astanin/python-tabulate"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7"
 
-SRC_URI[md5sum] = "a766c6eecfe3765821909c4ddf082b3b"
-SRC_URI[sha256sum] = "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
+SRC_URI[sha256sum] = "eb1d13f25760052e8931f2ef80aaf6045a6cceb47514db8beab24cded16f13a7"
 
 inherit pypi setuptools3
-- 
2.17.1

