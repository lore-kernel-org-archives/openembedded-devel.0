Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.24368.1605708152547221591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kfO2X-0005MS-GP; Wed, 18 Nov 2020 16:02:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-diskcache: Upgrade 5.0.3 -> 5.1.0
Date: Wed, 18 Nov 2020 16:02:17 +0200
Message-Id: <20201118140220.29364-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.0:

- Support transactions in FanoutCache (probably a bad idea)
- Prevent cache shard attribute access when unsafe

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-diskcache_5.0.3.bb => python3-diskcache_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.3.bb => python3-diskcache_5.1.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
index 7e89fa68a5..9aaf714034 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
 
-SRC_URI[md5sum] = "86fb97b0ff87cc5f1b31654ee0d341a1"
-SRC_URI[sha256sum] = "5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52"
+SRC_URI[md5sum] = "9ce87661369752c9ead63243b07eaf19"
+SRC_URI[sha256sum] = "bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.17.1

