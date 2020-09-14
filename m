Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60141.1600089349157600939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKf-0000ED-GC; Mon, 14 Sep 2020 16:15:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-diskcache: Upgrade 5.0.2 -> 5.0.3
Date: Mon, 14 Sep 2020 16:15:27 +0300
Message-Id: <20200914131536.6072-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 5.0.3:

- Add python_requires kwarg to setup

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-diskcache_5.0.2.bb => python3-diskcache_5.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.2.bb => python3-diskcache_5.0.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
index 7eda65fa0..7e89fa68a 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
 
-SRC_URI[md5sum] = "b8061d293045b29b83201cf9a62b1da2"
-SRC_URI[sha256sum] = "6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255"
+SRC_URI[md5sum] = "86fb97b0ff87cc5f1b31654ee0d341a1"
+SRC_URI[sha256sum] = "5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.17.1

