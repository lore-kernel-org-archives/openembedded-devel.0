Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11557.1611665419947563386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37874 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4NnV-0007hT-4x; Tue, 26 Jan 2021 14:50:18 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-diskcache: Upgrade 5.1.0 -> 5.2.1
Date: Tue, 26 Jan 2021 14:50:01 +0200
Message-Id: <20210126125003.27620-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126125003.27620-1-leon.anavi@konsulko.com>
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.2.1:

- Install libmemcached-dev for release GitHub action

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-diskcache_5.1.0.bb => python3-diskcache_5.2.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.1.0.bb => python3-diskcache_5.2.1.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
index 9aaf71403..4a028d769 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
 HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d"
 
-SRC_URI[md5sum] = "9ce87661369752c9ead63243b07eaf19"
-SRC_URI[sha256sum] = "bc7928df986dbc8a8d6e34c33b0da89d668cfa65e7fcc91298a6959a35076993"
+SRC_URI[sha256sum] = "1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.17.1

