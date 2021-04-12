Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.19170.1618236146740860701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx8v-0002MB-2K; Mon, 12 Apr 2021 17:02:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-monotonic: Upgrade 1.5 -> 1.6
Date: Mon, 12 Apr 2021 17:02:08 +0300
Message-Id: <20210412140212.8395-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412140212.8395-1-leon.anavi@konsulko.com>
References: <20210412140212.8395-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6:

- Fix order for converting mach absolute time

Get the source code from the git repository because an archive
is not available in PyPI for this release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-monotonic_1.5.bb => python3-monotonic_1.6.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-monotonic_1.5.bb => python3-monotonic_1.6.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
rename to meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index 94b90524b..080c41e38 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -1,9 +1,13 @@
 SUMMARY = "This module provides a monotonic() function which returns the value (in fractional seconds) of a clock which never goes backwards."
 HOMEPAGE = "https://github.com/atdt/monotonic"
+SECTION = "devel/python"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
-SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
+SRCREV = "80681f6604e136e513550342f977edb98f5fc5ad"
+SRC_URI = "git://github.com/atdt/monotonic.git"
+
+S = "${WORKDIR}/git"
 
-inherit pypi setuptools3
+inherit setuptools3
-- 
2.17.1

